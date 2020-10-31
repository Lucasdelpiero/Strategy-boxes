//Align troop to the direction they are watching
var difAngle, angleMoving, rotationSpeed;
if scr_distance(x, y,orderX,orderY) > spd and attacking == false {
    angle = point_direction(x, y, orderX, orderY);
} else {
    angle = targetAngle ;
    if targetAngle > 360 { //Kepp the angles between 0 and 360 degrees
        targetAngle -= 360;
    }
}


difAngle = angle_difference(dirFacing, angle);
angleMoving = 30;

if abs(difAngle) > 120 {
    dirFacing += 180;
    if (dirFacing > 360) {
        dirFacing -= 360;
    }
}
if abs(difAngle) > agility { //Will rotate using the agility stat
    rotationSpeed = agility;
} else {
    rotationSpeed = .1;
}
//Face towards direction of movement
if abs(difAngle) < 180  {
    if difAngle < 0 {
        dirFacing+= rotationSpeed;
    } 
    if difAngle > 0 {
        dirFacing-= rotationSpeed;
    }
} else {
    if difAngle < 0 {
        dirFacing-= rotationSpeed;
    } 
    if difAngle > 0 {
        dirFacing+= rotationSpeed;
    }
}
if abs(difAngle) < 2 {
    dirFacing = angle;
}

if angle > 360 {
    angle-= 360;
}

// Keep angle between 0 and 360
if dirFacing < 0 {
    dirFacing+= 360;   
}
if dirFacing > 360 {
    dirFacing-= 360;
}


//Only move when angle to objective is small

if (attacking = false ) {
    if abs(difAngle) < angleMoving or abs(difAngle) > (360 - angleMoving) {
        moving = true; 
    } else {
        moving = false;
    }
}
//Move mask to direction
image_angle = dirFacing - 90;