
/*check if touching ground*/
if canjump {
	canjump = false
/*get vector from mouse*/
/*get x vector*/
xDifference = x - display_mouse_get_x();
/*get y vector*/
yDifference = y - display_mouse_get_y();

/*multiply mouse vector by launch constant to find acceleration*/
xAccel = xDifference * launchConstant;
yAccel = yDifference * launchConstant;

}