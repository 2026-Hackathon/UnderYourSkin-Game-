
/*check if touching ground*/
if place_meeting(x,y-1,poPlatform) and yVelocity = 0{
/*get vector from mouse*/
/*get x vector*/
xDifference = x - display_mouse_get_x();
/*get y vector*/
yDifference = y - display_mouse_get_y();

/*multiply mouse vector by launch constant to find acceleration*/
xVelocity = xdifference * launchconstant;
yVelocity = ydifference * launchconstant;

}