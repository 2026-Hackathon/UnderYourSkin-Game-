//collsions
/*if collides above then boune back with less velocity*/
if place_meeting(x,y+1,poPlatform){
	yVelocity = -yVelocity * ceilingBounceConstant;
}
/*if collides with wall then boune back with less velocity*/
if place_meeting(x+1,y,poPlatform) or place_meeting(x-1,y,poPlatform){
	xVelocity = -xVelocity * wallBounceConstant;
}
/*if collides with floor, reduce y velocity by frictinal coefficient and flip, if below frictionstop then stop*/
if place_meeting(x,y-1,poPlatform){
	yVelocity = -yVelocity * frictionCoefficient;
	if yVelocity<frictionStop {
		yVelocity = 0;
	}
	if xVelocity < frictionStop{
		xVelocity = 0;
	}

}
if Not place_meeting(x,y-1,poPlatform){
/*Remove velocity by gravity and airresistance*/
yVelocity -= grav
xVelocity = xVelocity * airResistance
}