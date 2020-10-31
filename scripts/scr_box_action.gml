var  xx1, xx2, yy1, yy2;
scr_input();

//Attack //Here
scr_attack_infantry();

//Moving
scr_alingn_to_direction();

//Movement
scr_movement();

//Attack when line of movement touch an enemy
scr_attack_infantry();

//Inside selection
scr_box_selection();


