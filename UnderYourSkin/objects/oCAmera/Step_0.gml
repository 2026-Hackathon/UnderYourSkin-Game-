// SMOOTH CAMERA (replace Step event above)
if (instance_exists(follow))
{
    // Target position
 
    var target_y = follow.y - half_view_h;
    
    // Smooth lerp
   
    var cam_y = lerp(camera_get_view_y(cam), target_y, 0.1);
    
    camera_set_view_pos(cam, 0, cam_y);
}
