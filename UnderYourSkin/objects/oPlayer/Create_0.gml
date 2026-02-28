// Movement
vx = 0;
vy = 0;
maxV = 10;
bouncecount = 0

// Fling settings
friction    = 0.90;
power_scale = 0.2;
max_power   = 25;

// Gravity
grav     = 0.5;
max_fall = 10;

// Bounce
bounce = 0.8;

// Dragging
dragging     = false;
drag_start_x = 0;
drag_start_y = 0;

// **AIR DRAG SYSTEM** - ADD THESE LINES
max_air_drags = 2;
air_drags     = 2;
was_on_ground = true;

// Get tilemap ID from collision layer
var lay_id = layer_get_id("Collisions");
tilemap    = layer_tilemap_get_id(lay_id);
