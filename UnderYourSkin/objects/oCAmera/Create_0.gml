// Camera setup
view_enabled = true;
view_visible[0] = true;

cam = view_camera[0];
follow = oPlayer;

half_view_w = camera_get_view_width(cam) / 2;
half_view_h = camera_get_view_height(cam) / 2;
