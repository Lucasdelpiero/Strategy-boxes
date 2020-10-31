//Delete soldier
if room == rm_selection {
    if ( place_meeting(x,y,obj_battle_army_box) and mbLeftPressed) {
        var inst = instance_place(x,y,obj_battle_army_box);
        for(var i = inst.place; i < 20  ; i++ ) {
            obj_battle_gui.army[obj_battle_gui.team, i] = noone;
            if i < 19 {
                obj_battle_gui.army[obj_battle_gui.team, i] = obj_battle_gui.army[obj_battle_gui.team, i + 1];
                if(obj_battle_gui.army[obj_battle_gui.team , i + 1] == noone) {
                    break;                 
                }
            }
        } 
    }
}