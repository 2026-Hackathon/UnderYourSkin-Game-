/// STEP EVENT - DRAG ANYWHERE + SCREEN LINE

// 1) SIMPLE AIR DRAG SYSTEM ---------------------------
if (place_meeting(x, y + 1, tilemap))
{
    air_drags = 2;  // REFILL when touching ground
}
if air_drags > 0
{if (mouse_check_button_pressed(mb_left))
{
    dragging = true;
    drag_start_x = mouse_x;
    drag_start_y = mouse_y;
}}

if (mouse_check_button_released(mb_left))
{

	if (bouncecount > 1)
	{
		audio_play_sound(slopsnd,1,0)
	}
	else {
		audio_play_sound(wooshsnd,1,0)
	}
	
	
		bouncecount = 0
		
    if (dragging)
    {
        dragging = false;
        air_drags = max(0, air_drags - 1);  // ALWAYS DECREASE
        
        var dx = drag_start_x - mouse_x;
        var dy = drag_start_y - mouse_y;
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

// 4) COLLISION + ANGLE BOUNCE --------------------------
var move_x = x + hsp;
var move_y = y + vsp;

if place_meeting(x, y + 1, tilemap)
{ if bouncecount <= 5
	audio_play_sound(slapsnd,1,0)
	bouncecount = bouncecount + 1
	}


if (!place_meeting(move_x, move_y, tilemap))
{
    x = move_x;
    y = move_y;
	
}
else
{
	
    var surface_angle = 0;
    if (place_meeting(move_x, y, tilemap)) surface_angle = 0;
    else if (place_meeting(x, move_y, tilemap)) surface_angle = 90;
    else surface_angle = 45 * sign(hsp);
    
    var normal_x = cos(degtorad(surface_angle));
    var normal_y = sin(degtorad(surface_angle));
    var dot = vx * normal_x + vy * normal_y;
    vx = (vx - 2 * dot * normal_x) * bounce;
    vy = (vy - 2 * dot * normal_y) * bounce;
    
    if (!place_meeting(move_x, y, tilemap)) x = move_x;
    else while (!place_meeting(x + sign(hsp), y, tilemap)) x += sign(hsp);
    
    if (!place_meeting(x, move_y, tilemap)) y = move_y;
    else while (!place_meeting(x, y + sign(vsp), tilemap)) y += sign(vsp);
}

// 5) SLOPE + VIEWPORT ----------------------------------
if (abs(hsp) > 0.5 && place_meeting(x, y + 1, tilemap))
{
    if (!place_meeting(x + sign(hsp), y - 1, tilemap) && 
        place_meeting(x + sign(hsp), y + 1, tilemap))
    {
        x += sign(hsp);
        y -= 1;
    }
}

if (x+0.5 > 21*16){ vx=0; x = 21*16; }
if (x-0.5 < 0){ vx = 0; x = 0.5; }

if (y > 720){
room_restart()
}