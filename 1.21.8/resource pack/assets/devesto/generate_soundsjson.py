import os, json, contextlib, wave
try:
    from mutagen import File as MutagenFile
except ModuleNotFoundError:
    MutagenFile = None

TICKS_PER_SEC = 20

def get_sound_length(path: str) -> int:
    """
    Return the duration of an audio file in Minecraft ticks.
    • OGG / MP3 / FLAC / … → Mutagen
    • WAV                  → wave
    Falls back to 0 on any error.
    """
    # ---------- Mutagen branch (OGG, MP3, etc.) ----------
    if MutagenFile is not None:
        try:
            audio = MutagenFile(path)
            if audio is not None and audio.info.length:          # seconds
                return round(audio.info.length * TICKS_PER_SEC)
        except Exception as e:
            print(f"[Mutagen] {e}")

    # ---------- wave branch (uncompressed WAV only) ----------
    try:
        with contextlib.closing(wave.open(path, "rb")) as f:
            seconds = f.getnframes() / f.getframerate()
            return round(seconds * TICKS_PER_SEC)
    except Exception as e:
        print(f"[wave] {e}")

    return 0  # couldn’t read length

# ──────────────────────────────────────────────────────────────────────────
# core: build sounds.json + length dict
# ──────────────────────────────────────────────────────────────────────────
def process_sounds_directory(base_path):
    sounds, lengths = {}, {}
    namespace       = "devesto"
    root_sounds     = os.path.join(base_path, "sounds")

    for root, _, files in os.walk(root_sounds):
        rel_path = os.path.relpath(root, root_sounds)           # e.g. mob/zombie
        dot_key  = rel_path.replace(os.sep, ".")                #     mob.zombie

        numbered = [f for f in files if f.endswith(".ogg") and f[:-4].isdigit()]
        others   = [f for f in files if f.endswith(".ogg") and not f[:-4].isdigit()]

        # ── folders with ONLY numbered files → random + individual ──
        if numbered and not others:
            entry_list, entry_lengths = [], []

            for f in sorted(numbered, key=lambda n: int(n[:-4])):
                stem       = f[:-4]
                file_path  = os.path.join(root, f)
                sound_id   = f"{namespace}:{rel_path}/{stem}"

                entry_list.append({"name": sound_id})
                l = get_sound_length(file_path)
                entry_lengths.append(l)

                indiv_key = f"{dot_key}.{stem}"                 # mob.zombie.0
                sounds[indiv_key]  = {"replace": True, "sounds": [{"name": sound_id}]}
                lengths[indiv_key] = l

            sounds[dot_key]  = {"replace": True, "sounds": entry_list}  # mob.zombie
            lengths[dot_key] = round(sum(entry_lengths) / len(entry_lengths))

        # ── everything else → one key per file ──
        else:
            for f in others:
                stem       = f[:-4]
                file_path  = os.path.join(root, f)
                sound_id   = f"{namespace}:{rel_path}/{stem}"
                key        = f"{dot_key}.{stem}" if rel_path != "." else stem
                sounds[key]  = {"replace": True, "sounds": [{"name": sound_id}]}
                lengths[key] = get_sound_length(file_path)

    return sounds, lengths

# ──────────────────────────────────────────────────────────────────────────
# runner: write sounds.json + sound_lengths.txt
# ──────────────────────────────────────────────────────────────────────────
if __name__ == "__main__":
    here = os.path.dirname(os.path.abspath(__file__))
    data, lens = process_sounds_directory(here)

    # sounds.json
    with open(os.path.join(here, "sounds.json"), "w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)

    # sound_lengths.txt  (sorted alphabetically for convenience)
    with open(os.path.join(here, "sound_lengths.txt"), "w", encoding="utf-8") as f:
        for key in sorted(lens):
            f.write(f"{key}: {lens[key]} ticks\n")

    print("✓ sounds.json and sound_lengths.txt created.")