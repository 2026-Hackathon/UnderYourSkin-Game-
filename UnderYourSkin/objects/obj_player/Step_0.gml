// Apply gravity
vy += gravity;

// Apply air friction
vx *= friction;
vy *= friction;

// ======================
// HORIZONTAL MOVEMENT
// ======================
x += vx;

if (place_meeting(x, y, oPlatform))
{
    // Move back out of collision
    while (place_meeting(x, y, oPlatform))
    {
        x -= sign(vx);
    }
    
    vx *= -bounce;
}

// ======================
// VERTICAL MOVEMENT
// ======================
y += vy;

if (place_meeting(x, y, oPlatform))
{
    // Move player OUT of platform completely
    while (place_meeting(x, y, oPlatform))
    {
        y -= sign(vy);
    }

    // Only bounce if impact was strong
    if (abs(vy) > 4)
    {
        vy *= -bounce;
    }
    else
    {
        // Soft landing — stop vertical motion
        vy = 0;
    }
}