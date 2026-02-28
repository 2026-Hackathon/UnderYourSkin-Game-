if (dragging)
{
    dragging = false;

    var dx = drag_start_x - mouse_x;
    var dy = drag_start_y - mouse_y;

    var dist = point_distance(0, 0, dx, dy);
    dist = clamp(dist, 0, max_power);

    vx = dx * power_scale;
    vy = dy * power_scale;
}