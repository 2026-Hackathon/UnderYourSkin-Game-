// BOUNDED LAGGING CAMERA (NO TOP LIMIT)
if (instance_exists(follow))
{
    // Room boundaries (NO TOP LIMIT)
    var room_left   = 0;
    var room_right  = room_width;
    var room_top    = -9999;  // No top limit (can go way above room)
    var room_bottom = room_height;
    
    // Target position
    var target_x = follow.x - half_view_w;
    var target_y = follow.y - half_view_h;
    
    // LERP lag
    var cam_x = lerp(camera_get_view_x(cam), target_x, 0.08);
    var cam_y = lerp(camera_get_view_y(cam), target_y, 0.08);
    
    // Clamp (top is unlimited)
    cam_x = clamp(cam_x, room_left, room_right - camera_get_view_width(cam));
    cam_y = clamp(cam_y, room_top, room_bottom - camera_get_view_height(cam));
    
    camera_set_view_pos(cam, cam_x, cam_y);
}
