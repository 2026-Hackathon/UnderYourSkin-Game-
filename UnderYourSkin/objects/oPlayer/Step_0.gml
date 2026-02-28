/// 1) APPLY GRAVITY (no friction on vy)
vy += grav;
if (vy > max_fall) vy = max_fall;

/// 2) APPLY FRICTION ONLY TO HORIZONTAL
vx *= friction;
if (abs(vx) < 0.01) vx = 0;

/// 3) COLLISION MOVEMENT

// Horizontal
var new_x = x + vx;
if (!place_meeting(new_x, y, oPlatform))
{
    x = new_x;
}
else
{
    while (!place_meeting(x + sign(vx), y, oPlatform))
    {
        x += sign(vx);
    }
    vx = 0;
}

// Vertical
var new_y = y + vy;
if (!place_meeting(x, new_y, oPlatform))
{
    y = new_y;
}
else
{
    while (!place_meeting(x, y + sign(vy), oPlatform))
    {
        y += sign(vy);
    }
    // Hit floor/ceiling, stop vertical speed
    vy = 0;
}
