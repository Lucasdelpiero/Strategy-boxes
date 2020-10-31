scr_input();
var newX1selection, newX2selection, newY1selection, newY1selection;
space = 64;

spot[0] = noone;
if speedUp {
    room_speed += 30;
}
if speedDown and room_speed > 30{
    room_speed -= 30;
}
//show_debug_overlay(true);
//window_set_fullscreen(true);

//Rout
if mouse_check_button_pressed(mb_middle) {
    if place_meeting(x,y,obj_box) {
      var inst =  instance_place(x, y , obj_box);
      inst.state = scr_routing;
    }
    if place_meeting(x,y,obj_enemy) {
      var inst =  instance_place(x, y , obj_enemy);
      inst.state = scr_routing;
    }
    
}
//Delete soldier
scr_control_battle_gui();

//Selector
scr_control_selector();

//View
scr_view();

///Group selected
scr_select_troops();

//Side Position
/*
This give a position to the boxes by the distance to the center of the
formation and not it´s ID number
*/
scr_side_placing();

//Move Boxes
scr_move_troops();

if !mbRight {
    xFace = x;
    yFace = y;
}
x = mouse_x;
y = mouse_y;
if mbRight {
    if distance_to_point(xFace,yFace) > sensitivityAngleFormation {
            formationAngle = point_direction(xFace, yFace, x, y);
           // selectedAmount = 1 ;  changed to use the array formation new
    }
}
//Cards creation
scr_card_creation();


//Average Position
scr_average_position();
