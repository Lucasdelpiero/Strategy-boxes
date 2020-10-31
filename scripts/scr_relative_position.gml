/// scr_relative_position(angle)
//Relative positions
var relative = argument0 ;
frontX = dcos(relative) ;
frontY = -dsin(relative);
backX = -dcos(relative) ;
backY = dsin(relative);
leftX = -dsin(relative);
leftY = -dcos(relative);
rightX = dsin(relative);
rightY = dcos(relative);
