 ///Scr group Defece
var target = priorityGroup[2];
var generalAngle = obj_enemy_general.face;
var diag = 26; // +- of the sides to make smaller angles than the front and back
var i = 0;
//Reset to the 0 group
enemyAmount = 0;
for(i = 0; i < instance_number(obj_enemy); i++ ) {
    inst  = instance_find(obj_enemy, i );
    if (inst.type != 2 and inst.type != 3)  {
        inst.group = 0;          
    }    
    //inst.color = c_blue;  
    amount[i] = 0;
          
}

//Getting the side
for(i = 1; i < instance_number(obj_box) + 1 ; i++) { 
    var inst = instance_find(obj_box, i - 1);
    if !inst.attacking and !inst.beingAttacked {
        var pointAngle = point_direction(obj_enemy_general.x, obj_enemy_general.y , inst.x, inst.y);
        //Front
        if abs(pointAngle - generalAngle) < 64 or abs(pointAngle - generalAngle) > 296{
            sides = 5;
        }
        //Back
        if abs(pointAngle - generalAngle) > 118 and abs(pointAngle - generalAngle) < 246 { 
            sides = 4;
            amount[4] +=  1;
        }
        //Sides    
        if dcos(pointAngle + 90) < (dcos(generalAngle) + dsin(diag) ) and dcos(pointAngle + 90) > (dcos(generalAngle) - dsin(diag)  ) {
            if dsin(pointAngle + 90) < (dsin(generalAngle) + dsin(diag) ) and dsin(pointAngle + 90) > (dsin(generalAngle) - dsin(diag)) {   //Right Flank
                sides = 1; 
                amount[2] +=  1;
            }
        }
        
        if dcos(pointAngle + 90) < (-dcos(generalAngle) + dsin(diag) ) and dcos(pointAngle + 90) > (-dcos(generalAngle) - dsin(diag)  ) {   //Left Flank
            if dsin(pointAngle + 90) < (-dsin(generalAngle) + dsin(diag) ) and dsin(pointAngle + 90) > (-dsin(generalAngle) - dsin(diag)) {
                sides = -1;
                amount[1] +=  1;
            }                
        }
    }      
}
//Getting amount of flanks
if amount[4] > 0 {
    if sides = 4 {
       /* if( enemyGroup[priorityGroup[i] , 30] > amount[4]) {  
            amount[4] = enemyGroup[priorityGroup[i] , 30] ;
        }
        /* else {*/
           // amount[4] += 1;
        //}
        
    }
}
//Insert boxes into groups
var o = 0;
var inst;
//Right Flank
for(o = 0; o < amount[2]  ; o++ ) {
        inst = groupType[0 , typeAmount[0] - 1 - o  ];
        //if inst != instance_find(obj_enemy, ceil(instance_number(obj_enemy) / 2 ) - 1) {
        if inst != groupType[0, ceil(typeAmount[0] / 2 ) - 1 ]  {
            inst.group = 1;
           // inst.color = c_white;
        }
}

//Left Flank
for(o = 0; o < amount[1]  ; o++ ) { 
    if instance_exists(groupType[0 , o  ]) { //amount[4]
        inst = groupType[0 , o  ];
        //if inst != instance_find(obj_enemy, ceil(instance_number(obj_enemy) + amount[4] / 2) - 1) {
        if (inst != (typeAmount[0] + amount[4] / 2) - 1) { 
            inst.group = -1; 
           // inst.color = c_white;
        }
    }
}
//Back
if amount[4] > 0 {
    for(o = 0; o < amount[4] ; o++ ) {
        if array_length_2d(groupType, 0) > o {
            inst = groupType[0 , o ];
            //if inst != instance_find(obj_enemy, ceil(instance_number(obj_enemy) / 2) - 1) {
            if inst != groupType[0, ceil(typeAmount[0] / 2) - 1 ]  {
                inst.group = 4;
               // inst.color = c_maroon;
            }
        }
    }
} 
//Archers
/*
for(var i = 0; i< obj_enemy_archer ; i++){
    var inst = instance_find(obj_enemy_archer, i);
    inst.group = 2;
}
*/

angleTest = pointAngle;
//Choosing amount of troops to protect the flanks
var inst;
// enemyGroup[priorityGroup[1] , 30]

//Getting the Flanks
//Right Flank Reference
for(i = 0; i < typeAmount[0] ; i++) {
    var inst = groupType[0 , i];
    with(inst) {
        if (group == 0) {
            obj_enemy_general.groupFlankRight =   instance_find(obj_enemy, i);        
        } 
    }
}
//Left Flank Reference
for(i = 0; i < typeAmount[0] ; i++) {
    //var inst = instance_find(obj_enemy, instance_number(obj_enemy) - 1 - i);
    var inst = groupType[0 , typeAmount[0] - 1 - i];
    with(inst) {
        if (group == 0) {
            obj_enemy_general.groupFlankLeft =  obj_enemy_general.groupType[0 , obj_enemy_general.typeAmount[0] - 1 - i];        
        }
    }
}
//Flank left amount
groupFlankLeftTotal = 0;
for(var i = 0 ; i <= instance_number(obj_enemy) - 1 ; i++) { 
    with(place[i]) {
        if(group == -1) {
            obj_enemy_general.groupFlankLeftTotal += 1;
        }
    }
}
//Cavalry group
for(i = 0; i < floor(typeAmount[3] / 2); i++) {
    var inst = groupType[3 , i];
    inst.group = 3;
    groupFlankAmount[3]  = typeAmount[3] - floor(typeAmount[3] / 2);
}
