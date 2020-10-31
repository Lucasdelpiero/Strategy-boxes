var  xx1, xx2, yy1, yy2;
scr_input();

//Attack //Here
scr_archer_attack();

//Run
scr_enemy_archer_run();

//Moving
scr_alingn_to_direction();

//Movement
scr_movement();

//Attack when line of movement touch an enemy
//scr_archer_attack();

//Inside selection
scr_box_selection();






/*
var gen = obj_enemy_general;
var distance = 200;
var xwanted = gen.x  - (distance  / 1) * dcos(gen.face) + skirmishX ;
var ywanted = gen.y + (distance  / 1) * dsin(gen.face) + skirmishY ; 
var near = instance_nearest(x,y,obj_box);
if gen.skirmish {
    //if (skirmishX != 0 and skirmishY != 0) {
        if scr_distance(x, y, near.x, near.y) < 400 {
            followingOrder = false;
        } else if scr_distance(x, y, near.x, near.y) > 600 {
            followingOrder = true;
        }
    //}
}
