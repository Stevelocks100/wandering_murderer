#!/usr/bin/env python3
# ------------------------------------------------------------
# Minecraft Motion[1] generator (single-line output, double literals)
# Computes initial upward Motion[1] to reach each height value.
# Output looks like:
# {1:0.471093d,2:0.671473d,3:0.832079d,...}
# ------------------------------------------------------------

# --- Adjustable variables ---
min_height = 1      # starting height (in blocks)
max_height = 50     # ending height (in blocks)
step = 1            # increment between heights
max_ticks = 999      # maximum ticks to search for a peak
a = 0.98            # vertical drag
g = 0.08
b = -g * a          # effective constant term

# ------------------------------------------------------------

def v_at_tick(v0, t):
    """Velocity after t ticks."""
    return (a**t) * v0 + b * (1 - a**t) / (1 - a)

def v0_for_height(H):
    """Find the initial velocity that reaches height H."""
    for k in range(1, max_ticks + 1):
        part = (1 - a**k) / (1 - a)
        term_b = b / (1 - a) * (k - part)
        v0 = (H - term_b) * (1 - a) / (1 - a**k)
        if v_at_tick(v0, k - 1) > 0 and v_at_tick(v0, k) <= 0:
            return round(v0, 6)
    return None

entries = []
for H in range(min_height, max_height + 1, step):
    v0 = v0_for_height(H)
    if v0 is not None:
        entries.append(f"{H}: {v0}d")

print("{" + ", ".join(entries) + "}")