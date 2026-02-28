// Apply velocity
x += vx;
y += vy;

// Apply friction
vx *= friction;
vy *= friction;

// Stop tiny movement
if (abs(vx) < 0.01) vx = 0;
if (abs(vy) < 0.01) vy = 0;