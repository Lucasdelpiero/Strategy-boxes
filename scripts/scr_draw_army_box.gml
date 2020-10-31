//
var sprite = spr_box_selection;
if (obj_battle_gui.army[obj_battle_gui.team,place] == noone) {
    sprite = spr_box_selection;
    angle = 0;
    color = c_white;
} else {
    var target = obj_battle_gui.army[obj_battle_gui.team, place];
    switch(target){
        case obj_box : sprite = spr_box_2; break;
        case obj_archer : sprite = spr_archer; break;
        case obj_horsemen : sprite = spr_horsemen; break;
}
    angle = 270;
    if obj_battle_gui.team == 0 {
        color = c_blue;
    } 
    if obj_battle_gui.team == 1 {
        color = c_red;
    }
}
draw_sprite_ext(sprite, 0 ,x ,y, 1, 1, angle , color , 1);