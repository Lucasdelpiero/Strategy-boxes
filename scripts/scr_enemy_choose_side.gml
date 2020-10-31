var difAngle = angle_difference( dirFacing , targetEnemy.dirFacing ); //Cuando gira se cambia
//var difAngle = angle_difference( dirFacing , point_direction(x, y, targetEnemy.x, targetEnemy.y ) );
var distance = 200;

//Get side distance
flankDistance[0] = scr_distance(x, y, targetEnemy.x + -dsin(targetEnemy.dirFacing) * distance , targetEnemy.y + -dcos(targetEnemy.dirFacing) * distance); // R
flankDistance[1] = scr_distance(x, y, targetEnemy.x + dsin(targetEnemy.dirFacing) * distance, targetEnemy.y + dcos(targetEnemy.dirFacing) * distance); // L
//Front
if difAngle >= 116 or difAngle <=  - 116 {
    if !(targetEnemy.sideFrontOcup) and !(attacking) {
        color = c_purple;
        sideX = 0;
        sideY = 0;
    } else if !(flanking){
        color = c_aqua;
        flanking = true;
        //Right side
        if flankDistance[1] <= flankDistance[0] {
            sideX = dsin(targetEnemy.dirFacing) * distance;
            sideY = dcos(targetEnemy.dirFacing) * distance;
        } else { //Left side
            sideX =  -dsin(targetEnemy.dirFacing) * distance;
            sideY = -dcos(targetEnemy.dirFacing) * distance;
        }
        
    }
} 
//Sides
//Right side
if (difAngle > 62 )and  (difAngle < 116)  {
    if !(targetEnemy.sideRightOcup) and !(attacking) and !(flanking) {
        sideX = dsin(targetEnemy.dirFacing) * distance;
        sideY = dcos(targetEnemy.dirFacing) * distance;   
        color = c_aqua;
        flanking = true;
    } else if (flanking) and (targetEnemy.sideRightOcup) {
        color = c_aqua;
        sideX = -dcos(targetEnemy.dirFacing) * (distance / 2 );
        sideY = dsin(targetEnemy.dirFacing) * (distance / 2 ); 
    }
}
//Left side
if (difAngle < -62) and (difAngle > -116) {
    if !(targetEnemy.sideLeftOcup) and !(attacking) and !(flanking) {
        color = c_lime; 
        sideX =  -dsin(targetEnemy.dirFacing) * distance;
        sideY = -dcos(targetEnemy.dirFacing) * distance;
        flanking = true;
    } else if (flanking) and (targetEnemy.sideLeftOcup) {
        sideX = -dcos(targetEnemy.dirFacing) * (distance / 2 );
        sideY = dsin(targetEnemy.dirFacing) * (distance / 2 );
    } 
}
//Back
/*
if (difAngle < 54 and difAngle > - 54) {
    color = c_gray;
    sideX = 0;
    sideY = 0;
}