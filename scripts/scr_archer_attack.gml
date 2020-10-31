//Attack
var PointAngle, enemyToSearch, var ally ;
//Attack 
if (name == obj_box) { //Search for the enemy to attack, depends on if its the player or the ia
    enemyToSearch = obj_enemy; 
    ally = obj_box;
    
} else {
    enemyToSearch = obj_box; 
    ally = obj_enemy;
}



if fireAtWill {
    targetEnemy = instance_nearest(x,y,enemyToSearch);
    if scr_distance(x, y, targetEnemy.x, targetEnemy.y) > shootRange  {
        attacking = false;
        shootFiring = false;
        charge = false;
        moving = true;
    }  else {
        charge = true;
        moving = false;     
    }
}

//Start shooting while in range;
if (charge)  {
    if scr_distance(x, y, targetEnemy.x, targetEnemy.y) <= shootRange {
        shootFiring = true;
        attacking = true;
        charge = false;
        moving = false;
    }   
}   

//Shoot
if (!shootReloading) {
    if (shootFiring)  {       
        var enemDir = point_direction(x, y, targetEnemy.x,targetEnemy.y); 
        targetAngle = enemDir;
        if  (!shootWhileMoving)  {
                    moving = false;
        }
            if  ( abs(angle_difference(dirFacing, enemDir)) <= shootMaxAngle ) {
                var inst = instance_create( x, y, obj_arrows);
                inst.xdir = dcos(enemDir);
                inst.ydir = -dsin(enemDir);
                inst.image_angle = enemDir;
                shootReloading = true;
                alarm[2] = shootReloadTime * room_speed;
                
            }
    }
}
