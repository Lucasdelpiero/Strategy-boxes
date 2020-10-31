//View
scr_input();
var angle = (view_angle);
var spd = height / 96; //Camera speed
var hspd = spd * 4 ;
var zoomSpd = 64; //16 originally
var hZoomSpd = zoomSpd * 4;
var vZoomSpd = zoomSpd * 3;
var minHeight = 768;

var frontX = dcos(angle) ;
var frontY = -dsin(angle);
var backX = -dcos(angle) ;
var backY = dsin(angle);
var leftX = -dsin(angle);
var leftY = -dcos(angle);
var rightX = dsin(angle);
var rightY = dcos(angle);

var xx = right - left;
var yy = down - up;

x+= dcos(angle) * spd * xx + -dsin(angle) * spd * yy;
view_xview+= dcos(angle) * spd * xx + -dsin(angle) * spd * yy;
y+= dcos(angle) * spd * yy + dsin(angle) * spd * xx;
view_yview+= dcos(angle) * spd * yy + dsin(angle) * spd * xx;


if wheelDown  {
    width += hZoomSpd;
    height += vZoomSpd;
    view_xview -= hZoomSpd / 2;
    view_yview -= vZoomSpd / 2;
}
if wheelUp and height > minHeight {
    width -= hZoomSpd;
    height -= vZoomSpd;
    view_xview += hZoomSpd / 2;
    view_yview += vZoomSpd / 2;

}
if cameraLeft {
    view_angle += 3;
}
if cameraRight {
    view_angle -= 3;
}


view_wview[0] = width;
view_hview[0] = height;