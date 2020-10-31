scr_input();

//Get the number pressed
scr_player_group_number();
if number != noone {
    var amount = 0;
    if controlKey  {
        for(var i = 0; i < instance_number(obj_box)  ;  i++) {
            var inst = instance_find(obj_box, i );
            if inst.selected  {
                inst.cardGroup = number;
                cardGroupAmount[number] += 1;
             } else {
                if inst.cardGroup == number  {
                inst.cardGroup = noone;
                }
             }
        }
        
        //Order the groups
        //scr_player_group_order();
        
    } else {
        for(var i = 0; i < instance_number(obj_box)  ;  i++) {
            var inst = instance_find(obj_box, i );
            if inst.cardGroup == number  {
                inst.selected = true;
            } else {
                inst.selected = false;
            }
        }  
    }
//Order the groups
scr_player_group_order();
} else if groupKey { //The " G "
//    if controlKey {
 // Adding new things ???       
//    } else {
        var inGroup = false;
        //Look if one of the selected is in the group 0...9
        for(var i = 1; i < instance_number(obj_box)  ;  i++){
            for(var o = 0; o < instance_number(obj_box)  ;  o++){
                var inst = instance_find(obj_box, o);
                if  inst.selected and inst.cardGroup == i{
                    if !inGroup {
                        number = i;
                        inGroup = true;
                    }
                }
            }
        }
        //Set the group
        getGroup = true;
        for(var i = 1; i < 9  ;  i++){
            if getGroup {
                if inGroup {
                    for(var o = 0; o < instance_number(obj_box)  ;  o++){
                        var inst = instance_find(obj_box, o );
                        if inst.selected {
                            if cardGroupAmount[number] < obj_control.selectedAmount {
                                inst.cardGroup = number; 
                            } else {
                                inst.cardGroup = noone;
                            }
                            getGroup = false; 
                        }
                    }   
                } else {
                    if cardGroupAmount[i] == 0 {
                        for(var o = 0; o < instance_number(obj_box)  ;  o++){
                            var inst = instance_find(obj_box, o );
                            if inst.selected {
                                if cardGroupAmount[i] < obj_control.selectedAmount {
                                    inst.cardGroup = i; 
                                } else {
                                    inst.cardGroup = noone;
                                }
                            }    
                        }
                        getGroup = false;
                    }  
                }
            }
        }
    }
//} used for the control key statement
//Reset amount to 0
for(var i = 0; i < 10  ;  i++) {
    cardGroupAmount[i] = 0;
}
//Set amount
for(var i = 0; i < instance_number(obj_box)  ;  i++) {
    var inst = instance_find(obj_box, i );
    if inst.cardGroup != noone {  
        cardGroupAmount[inst.cardGroup] += 1;
    }
}
//Order when pressed the " G "  
if groupOrderKey { //with the pressed key get bugged;
    scr_player_group_order();  
}



