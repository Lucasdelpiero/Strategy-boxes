scr_input();
if !created {
    for(var i = 0; i< 4; i++) {
        for (var o = 0; o < 20; o++)
            army[i , o] = noone;
    }
}

//Creating the boxes of the army
if !created {
    for( var i = 0; i < lines ; i++) {
        for(var o = 0 ; o < rows ; o++) {
            var xpos = (grid * o + margin * o);
            var ypos =(grid * 2 * i + margin * i);
            var inst = instance_create(xselectionArmy + xpos, yselectionArmy + ypos, obj_battle_army_box);
            inst.place = 10 * i + o;
        }
        
    }
}
//Buy army
if !created {
    for(var i = 0; i < array_height_2d(buy) ; i++){
        for(var o = 0; o < array_length_2d(buy , o) ; o++) {
            var inst = instance_create(100, 100 + grid * i * 2 + i * margin, obj_battle_buy);
            switch(i) {
            case 0: inst.value = obj_box ; sprite = spr_box_2; break;
            case 1: inst.value = obj_box; sprite = spr_box_2; break;           
            case 2: inst.value = obj_archer; sprite = spr_archer; break;
            case 3: inst.value = obj_horsemen; sprite = spr_horsemen; break;
            }

        }
    }
}

//Teams
if !created {
    for(var i = 0; i < 2 ; i++){
        var inst = instance_create( xselectionArmy + grid * i * 2, yselectionArmy - 256, obj_battle_teams) {
        inst.place = i;
        }
    }
}

if place_meeting(x,y,obj_control) and mbLeftPressed {
    room_goto_next();
}
if (room != rm_selection) {
    var row = 0;
    for(var o = 0 ; o < 2 ; o++) {
        for(var i = 0; i < 20 ; i++) {
            if( i == 10 ){
                row = 1;
            }
            if army[o, i] != noone {
                var troop;
                if o > 0 {
                    //var look = army[o, i];
                    switch(army[o, i]) {
                        case obj_box: troop = obj_enemy; break;
                        case obj_archer: troop = obj_enemy_archer; break;
                        case obj_horsemen : troop = obj_enemy_horsemen; break;
                    }    
                } else {
                    troop = army[o, i] ;
                }
                instance_create(50 + grid*2*(i - row * 10) ,200 + 64* row - 400 * o,troop);
            } 
        }
        row = 0;
    }
    instance_create( 50 , -400, obj_enemy_general);
    instance_destroy();
}
/*
if (room != rm_selection) {
    var row = 0;
    for(var i = 0; i < 20 ; i++) {
        if( i == 10 ){
            row = 1;
        }
        if army[0, i] != noone {
            instance_create(50 + grid*2*(i - row * 10),200 + 64* row,army[0, i]);
        } 
    }
    instance_destroy();
}
*/
//instance_create(100, 100 + grid * i, buy[i,o]);


created = true;