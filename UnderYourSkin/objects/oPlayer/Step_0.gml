/// STEP EVENT

// 1) DRAG INPUT ----------------------------------------

// Start drag when left pressed on player
if (mouse_check_button_pressed(mb_left))
{
    if (position_meeting(mouse_x, mouse_y, id))
    {
        dragging     = true;
        drag_start_x = mouse_x;
        drag_start_y = mouse_y;
    }
}

// Release drag and apply fling
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


// 2) PHYSICS (GRAVITY + FRICTION) ----------------------

// Gravity (downwards)
vy += grav;
if (vy > max_fall) vy = max_fall;

// Friction (horizontal only)
vx *= friction;
if (abs(vx) < 0.01) vx = 0;


// 3) DIAGONAL COLLISION + BOUNCE WITH TILEMAP ----------

var hsp = vx;
var vsp = vy;
var bounce = 0.8; // 0–1

if (abs(vx) > maxV)
 {vx = sign(vx) * maxV};
 if (abs(vy) > maxV)
 {vy = sign(vx) * maxV};

// Try full diagonal step first (tilemap instead of oPlatform)
if (!place_meeting(x + hsp, y + vsp, tilemap))
{
    x += hsp;
    y += vsp;
}
else
{
    // Horizontal
    if (!place_meeting(x + hsp, y, tilemap))
    {
        x += hsp;
    }
    else if (hsp != 0)
    {
        while (!place_meeting(x + sign(hsp), y, tilemap))
        {
            x += sign(hsp);
        }
        hsp = -hsp * bounce;
        vx  = hsp;
    }

    // Vertical
    if (!place_meeting(x, y + vsp, tilemap))
    {
        y += vsp;
    }
    else if (vsp != 0)
    {
        while (!place_meeting(x, y + sign(vsp), tilemap))
        {
            y += sign(vsp);
        }
        vsp = -vsp * bounce;
        vy  = vsp;
    }
}



