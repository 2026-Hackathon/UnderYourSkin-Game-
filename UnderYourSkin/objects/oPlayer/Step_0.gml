/// oPlayer STEP EVENT - FULL (ANGLE-BASED BOUNCE + SLOPES)


// 1) DRAG INPUT ----------------------------------------
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

// 2) PHYSICS -------------------------------------------
vy += grav;
if (vy > max_fall) vy = max_fall;
vx *= friction;
if (abs(vx) < 0.01) vx = 0;

// 3) VELOCITY LIMIT ------------------------------------
if (abs(vx) > maxV) vx = sign(vx) * maxV;
if (abs(vy) > maxV) vy = sign(vy) * maxV;

var hsp = vx;
var vsp = vy;

// 4) COLLISION + ANGLE-BASED BOUNCE --------------------
var move_x = x + hsp;
var move_y = y + vsp;

// Try diagonal movement first
if (!place_meeting(move_x, move_y, tilemap))
{
    x = move_x;
    y = move_y;
}
else
{
    // Detect surface normal angle by testing collision directions
    var surface_angle = 0;
    
    // Check horizontal collision first
    if (place_meeting(move_x, y, tilemap))
    {
        surface_angle = 0; // Horizontal surface (floor/wall)
    }
    // Check vertical collision
    else if (place_meeting(x, move_y, tilemap))
    {
        surface_angle = 90; // Vertical surface
    }
    // Diagonal surface approximation
    else
    {
        surface_angle = 45 * sign(hsp); // 45° or -45° slope
    }
    
    // Vector reflection based on surface normal
    var normal_x = cos(degtorad(surface_angle));
    var normal_y = sin(degtorad(surface_angle));
    var dot = vx * normal_x + vy * normal_y;
    vx = (vx - 2 * dot * normal_x) * bounce;
    vy = (vy - 2 * dot * normal_y) * bounce;
    
    // Move as close as possible to surface
    if (!place_meeting(move_x, y, tilemap))
    {
        x = move_x;
    }
    else
    {
        while (!place_meeting(x + sign(hsp), y, tilemap))
        {
            x += sign(hsp);
        }
    }
    
    if (!place_meeting(x, move_y, tilemap))
    {
        y = move_y;
    }
    else
    {
        while (!place_meeting(x, y + sign(vsp), tilemap))
        {
            y += sign(vsp);
        }
    }
}

// 5) SLOPE CLIMB (only during fast horizontal movement) 
if (abs(hsp) > 0.5 && place_meeting(x, y + 1, tilemap))
{
    if (!place_meeting(x + sign(hsp), y - 1, tilemap) && 
        place_meeting(x + sign(hsp), y + 1, tilemap))
    {
        x += sign(hsp);
        y -= 1;
    }
}

// Viewport Collision
if (x+0.5 > 21*16){
	vx=0;
	x = 21*16;	
} 
if (x-0.5 < 0){
vx = 0;
x = 0.5;
}