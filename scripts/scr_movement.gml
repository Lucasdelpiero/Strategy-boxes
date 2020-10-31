if (distance_to_point(orderX, orderY) > spd and moving = true) {
    hspd = dcos(angle) * spd;
    vspd = dsin(angle) * spd * (-1);
    
}  else {
    hspd=0;
    vspd=0;
    moving = false;
}


if (distance_to_point(orderX + sideX, orderY + sideY) <= spd) and attacking = false{
    x = lerp(x, orderX, .1);
    y = lerp(y, orderY, .1);
    hspd = 0;
    vspd = 0;
    moving = false;
}

//move towards order
x+= hspd;
y+= vspd;