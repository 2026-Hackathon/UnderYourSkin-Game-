/*Initialise constants*/
xVelocity = 0
yVelocity = 0
launchConstant = 2
grav = 5
airResistance = 1

/*get vector from mouse*/
/*get x vector*/
xDifference = x - display_mouse_get_x()
/*get y vector*/
yDifference = y - display_mouse_get_y()

/*multiply mouse vector by launch constant to find acceleration*/
xVelocity = xdifference * launchconstant
yVelocity = ydifference * launchconstant

/*subtract velocities by friction*/
y -= grav
x -= airResistance

/*put new velocities into player*/
x += xVelocity
y += yVelocity
