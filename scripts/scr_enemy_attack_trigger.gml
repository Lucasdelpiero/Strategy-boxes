///scr_enemy_attack_trigger
var i;
aggro = 8;
for(i = 1; i < aggro  ; i++ ){
    if place_meeting(x + (dcos(dirFacing) * (32 * i)), y - (dsin(dirFacing) * (32 * i)), obj_box) {
        targetEnemy = instance_place(x + (dcos(dirFacing) * (32 * i)), y - (dsin(dirFacing) * (32 * i)), obj_box);
        charge = true;
        if (moving) {
            scr_enemy_choose_side()
        }
        i = aggro + 1;
    }
    if (group != 0) {
        targetEnemy = instance_nearest(x, y , obj_box);
        if distance_to_object(targetEnemy) < 32 * i {
            charge = true;
            if (moving) {
                scr_enemy_choose_side()
            }
            i = aggro + 1;
        }
    }
}



if (charge == true) {
    if scr_distance(x, y, targetEnemy.x + sideX, targetEnemy.y + sideY) < spd * 2   {
        sideX = 0;
        sideY = 0;
    }
    orderX = targetEnemy.x + sideX;
    orderY = targetEnemy.y + sideY;
    moving = true;
}

if position_meeting(x + (dcos(dirFacing) * 4), y - (dsin(dirFacing) * 4), obj_box) {
    attacking = true;
    moving = false;
    charge = false;
} /*else {  //por desactivar esto los flanqueos se ven raro
    attacking = false;
    moving = true;
    charge = false;
}
