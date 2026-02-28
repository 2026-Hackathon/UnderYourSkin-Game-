// Movement
vx = 0;
vy = 0;

// Fling settings
friction    = 0.90;   // Horizontal slowdown
power_scale = 0.2;
max_power   = 25;

// Gravity
grav     = 0.5;
max_fall = 20;

// Bounce
bounce = 0.8; // 0 = no bounce, 1 = perfect bounce

// Dragging
dragging     = false;
drag_start_x = 0;
drag_start_y = 0;

// Get tilemap ID from collision layer
var lay_id = layer_get_id("Collisions"); // <- change name if needed
tilemap    = layer_tilemap_get_id(lay_id);
