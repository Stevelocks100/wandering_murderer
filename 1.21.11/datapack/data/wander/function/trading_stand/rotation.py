import math

for i in range(0, 360):
    angle = math.radians(i)
    half = angle / 2.0

    print(
        "execute if score quaternion wander.temp matches "
        + str(i)
        + " run return run data merge entity @s {transformation:{right_rotation:[0d,"
        + str(math.sin(half))
        + "d,0d,"
        + str(math.cos(half))
        + "d]},interpolation_duration:2,start_interpolation:0}"
    )