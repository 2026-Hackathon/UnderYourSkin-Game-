if (dragging)
{
    dragging = false;
	sc = 7.5
    
    // Calculate drag distance
    var dx = drag_start_x - mouse_x;
    var dy = drag_start_y - mouse_y;
    
    var dist = point_distance(0, 0, dx, dy);
    
    // Clamp maximum power
    dist = clamp(dist, 0, max_power * (1/power_scale));
    
    // Apply velocity
    vx = dx * power_scale;
    vy = dy * power_scale;
	
	if (vx > 2*sc){vx = 2*sc}
	if (vx <-2*sc){vx = -2*sc}
	if (vy > sc){vy = sc}
	if (vy < -sc){vy = -sc}
	
}