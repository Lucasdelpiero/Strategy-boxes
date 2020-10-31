//Set position into the general
formationAmount = 0;

//Classify by type and positioning
scr_enemy_general_classify();

//Grouping IA target
scr_group_enemy();

//General movement
scr_enemy_general_position();


//Grouping to defend the flanks
scr_group_defense();

//Direction of the general
if instance_exists(obj_box) {
    var inst = instance_nearest(x,y,obj_box);
    if distance_to_object(inst) > lockRange {
        face = point_direction(x, y, enemyGroup[priorityGroup[0] , 33], enemyGroup[priorityGroup[0] , 34] ) ;
    }
}

//Troops movement and formation
scr_enemy_general_troops_movement();

//State machine
scr_enemy_general_state_management();
