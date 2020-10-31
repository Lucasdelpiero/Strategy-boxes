//Attack and align to side

var PointAngle, enemyToSearch, var ally;
//Attack 

if (name == obj_box) { //Search for the enemy to attack, depends on if its the player or the ia
    enemyToSearch = obj_enemy; 
    ally = obj_box;
    
} else {
    enemyToSearch = obj_box; 
    ally = obj_enemy
}
//Attack when the side is not occuped
if (position_meeting(x + dcos(dirFacing) * 64, y - dsin(dirFacing) * 64, enemyToSearch)) {
    var angleDif = angle_difference(dirFacing, targetEnemy.dirFacing);
    if abs(angleDif) >= 116 {
        if !(targetEnemy.sideFrontOcup) {
            attacking = true;        
        }
    }
    if abs(angleDif <= 64) {
        if !(targetEnemy.sideBackOcup) {
            attacking = true;        
        }
    }
    if ( abs(angleDif < 116) and abs(angleDif > 64) ) {
        if angleDif > 0 {
            if !(targetEnemy.sideRightOcup) {
                attacking = true;        
            }
        } 
        if angleDif < 0{
            if !(targetEnemy.sideLeftOcup) {
                attacking = true;        
            }
        }
    }
    
    
}
if attacking == false {
    targetEnemy = instance_nearest(x,y, enemyToSearch);   
}

if  attacking == true {
        scr_melee_damage();
        PointAngle = point_direction(x,y,targetEnemy.x ,targetEnemy.y)
        var diag = 26 // +- range to get into a position
        var distanceSide = 64; //Distance to the center of the enemy that will ocuppy is facing
        //Front
        if  abs(PointAngle - targetEnemy.dirFacing) > 118 and abs(PointAngle - targetEnemy.dirFacing) < 246 {  
            sideTarget = 1 ;
            with(targetEnemy) {
                sideFrontOcup = true;
            }
        }
      
        //Back
        if abs(PointAngle - targetEnemy.dirFacing) < 64 or abs(PointAngle - targetEnemy.dirFacing) > 296{ 
            sideTarget = 4 ;
            with(targetEnemy) {
                sideBackOcup = true;
            }
        }
        
        //Sides       
        // adds 90 degrees to the comparation to set them in the same place as the face of the enemy and add margin between the two places
        if dcos(PointAngle + 90) < (dcos(targetEnemy.dirFacing) + dsin(diag) ) and dcos(PointAngle + 90) > (dcos(targetEnemy.dirFacing) - dsin(diag)  ) {
            if dsin(PointAngle + 90) < (dsin(targetEnemy.dirFacing) + dsin(diag) ) and dsin(PointAngle + 90) > (dsin(targetEnemy.dirFacing) - dsin(diag)) {
                    sideTarget = 2; // Left Flank
                    with(targetEnemy) {
                        sideLeftOcup = true;
                    }
                }
            ;
        }
                
        if dcos(PointAngle + 90) < (-dcos(targetEnemy.dirFacing) + dsin(diag) ) and dcos(PointAngle + 90) > (-dcos(targetEnemy.dirFacing) - dsin(diag)  ) {
            if dsin(PointAngle + 90) < (-dsin(targetEnemy.dirFacing) + dsin(diag) ) and dsin(PointAngle + 90) > (-dsin(targetEnemy.dirFacing) - dsin(diag))
                sideTarget = 3; // Right Flank
                with(targetEnemy) {
                    sideRightOcup = true;
                }                
        }
        
// Position once the side had been chosen
        //Front       
        if (sideTarget == 1) { // 1 = front   
                x = lerp(x , targetEnemy.x + dcos(targetEnemy.dirFacing) * distanceSide, 0.1);
                y = lerp(y , targetEnemy.y - dsin(targetEnemy.dirFacing) * distanceSide, 0.1);
        }
        //Left
        if (sideTarget == 2) {
            x = lerp(x , targetEnemy.x - dsin(targetEnemy.dirFacing) * distanceSide * 1.5, 0.1);
            y = lerp(y , targetEnemy.y - dcos(targetEnemy.dirFacing) * distanceSide * 1.5, 0.1);//
        }
        //Right
        if (sideTarget == 3) {
            x = lerp(x , targetEnemy.x + dsin(targetEnemy.dirFacing) * distanceSide * 1.5, 0.1);
            y = lerp(y , targetEnemy.y + dcos(targetEnemy.dirFacing) * distanceSide * 1.5, 0.1);
        }
        //Back
        if (sideTarget == 4) { // 4 = back
        {
            x = lerp(x , targetEnemy.x - dcos(targetEnemy.dirFacing) * distanceSide, 0.1);
            y = lerp(y , targetEnemy.y + dsin(targetEnemy.dirFacing) * distanceSide, 0.1);
            }
        }       
        
        //Angle Facing         
        targetAngle = point_direction(x,y, targetEnemy.x, targetEnemy.y);
        
        
} else {
   // color = c_red;
}
if attacking = true  {
    moving = false;
}