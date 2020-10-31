//
scr_input();
if (place_meeting(x, y, obj_control)  and mbLeftPressed) {
    for(var i = 0; i < array_length_1d(obj_battle_gui.army); i++)
    if (obj_battle_gui.army[obj_battle_gui.team , i] == noone) {
        obj_battle_gui.army[obj_battle_gui.team ,i] = value;
        color = c_blue;
        break;
    }
}

/*
if value == obj_archer {
    sprite = spr_archer;
}