

    // Get input 
	kLeft = -keyboard_check(vk_left); kRight = keyboard_check(vk_right); 
	kJump = keyboard_check_pressed(vk_up);

    // Use input ç
	move = kLeft + kRight; 
	xSpd = xSpd + (move * moveSpeed)*tFriction ; 
	if (vsp < 10) { vsp += grav; };

    if (place_meeting(x, y + 1, poPlatform)) { ySpd = kJump * -jumpSpeed }

    // H Collisions 
	if (place_meeting(x + hsp, y, poPlatform))
	{ 
		while (!place_meeting(x + sign(hsp), y, poPlatform)) 
		{ 
			x += sign(hsp); } 
		hsp = 0; 
		} 
	x += hsp;

    // v Collisions 
	if (place_meeting(x, y + ySpd, poPlatform)) 
	{ 
		while (!place_meeting(x, y + sign(ySpd), poPlatform)) 
		{ y += sign(vsp);
			xSpd = xSpd * tFriction
			} 
	ySpd = 0; 
	} 
	y += ySpd;
