/// STEP EVENT - WORKING PIXEL-PERFECT COLLISIONS

// 1) DRAG INPUT
if (mouse_check_button_pressed(mb_left))
{
    if (position_meeting(mouse_x, mouse_y, id))
    {
        dragging     = true;
        drag_start_x = mouse_x;
        drag_start_y = mouse_y;
    }
}

if (mouse_check_button_released(mb_left))
{
    if (dragging)
    {
        dragging = false;
        var dx   = drag_start_x - mouse_x;
        var dy   = drag_start_y - mouse_y;
        var dist = point_distance(0, 0, dx, dy);
        dist = clamp(dist, 0, max_power * (1 / power_scale));

        if (dist != 0)
        {
            var dir = point_direction(0, 0, dx, dy);
            var pow = min(dist * power_scale, max_power);
            vx = lengthdir_x(pow, dir);
            vy = lengthdir_y(pow, dir);
        }
    }
}

// 2) PHYSICS
vy += grav;
if (vy > max_fall) vy = max_fall;
vx *= friction;
if (abs(vx) < 0.01) vx = 0;

// 3) VELOCITY LIMIT
if (abs(vx) > maxV) vx = sign(vx) * maxV;
if (abs(vy) > maxV) vy = sign(vy) * maxV;

// 4) DIAGONAL COLLISION WITH TILEMAP (PROPERLY)
var hsp = vx;
var vsp = vy;

// Try diagonal first
if (!place_meeting(x + hsp, y + vsp, tilemap))
{
    x += hsp;
    y += vsp;
}
else
{
    // Horizontal collision
    if (place_meeting(x + hsp, y, tilemap))
    {
        while (!place_meeting(x + sign(hsp), y, tilemap))
        {
            x += sign(hsp);
        }
        vx = -hsp * bounce;
    }
    else
    {
        x += hsp;
    }
    
    // Vertical collision  
    if (place_meeting(x, y + vsp, tilemap))
    {
        while (!place_meeting(x, y + sign(vsp), tilemap))
        {
            y += sign(vsp);
        }
        vy = -vsp * bounce;
    }
    else
    {
        y += vsp;
    }
}
