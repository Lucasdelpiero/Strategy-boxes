//Move boxes
distFormation = 20; //Get the angle for the formation
formation = 0; //Creates a row of the boxes in the objective to move

if mbRightReleased and !place_meeting(x,y,obj_enemy) {
    for (s = 0; s < selectedAmount ; s++) {   
        if (groupSelected[s].selected) {
            groupSelected[s].orderX = xFace - (distance *((centerTroops-1)/2) * dcos(formationAngle)) + (distance * formation *  dcos(formationAngle)); //X Ord
            groupSelected[s].orderY = yFace - (distance *((centerTroops-1)/2) * dsin(formationAngle) * (-1)) + (distance * formation * dsin(formationAngle) * (-1)); //Y Ord

            if distance_to_point(xFace,yFace) > sensitivityAngleFormation {
                groupSelected[s].targetAngle = formationAngle + 90;
                groupSelected[s].attacking = false;
                groupSelected[s].shootFiring = false;
            } else {
                //groupSelected[s].targetAngle = point_direction(group[s].x,group[s].y, group[s].orderX, group[s].orderY); 
                groupSelected[s].attacking = false;
                groupSelected[s].shootFiring = false;
                groupSelected[s].targetAngle = point_direction(groupSelected[s].x,groupSelected[s].y,groupSelected[s].orderX,groupSelected[s].orderY);  
            }
            formation++;
        }
    }
}
//groupSelected = 0;

if mbRightReleased and place_meeting(x,y,obj_enemy) {
var setChargeEnemy = instance_place(x,y,obj_enemy);
    for (s = 0; s < instance_number(obj_box); s = s) {
        if (group[s].selected = true) {
          group[s].orderX = setChargeEnemy.x;
          group[s].orderY = setChargeEnemy.y;
          group[s].charge = true;
          group[s].chargeEnemy = setChargeEnemy;
          group[s].shootFiring = false;
          group[s].attacking = false;
          //if (group[s].type == 2) {
            //group[s].charge = false;
            //group[s].attacking = true;
            //group[s].shootFiring = true;
            group[s].targetEnemy = setChargeEnemy;
            //}
        }

        s++
    }
}
