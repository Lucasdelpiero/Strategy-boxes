//Select
if place_meeting(x,y,obj_control) {
    preSelected = true;
    if instance_exists(cardSelector)  {
        cardSelector.cardPreselected = true;
    }
} else {
    if instance_exists(cardSelector)  {
        if (  device_mouse_y_to_gui(0) < display_get_gui_height() - 200)  {
            preSelected = false;      
        } 
    } else if  !place_meeting(x,y,obj_control) {
        preSelected = false;
    }   
}

if (mbLeftPressed)  {
    if (!controlKey) {
        if (place_meeting(x,y,obj_control) or (preSelected)) {// ¿?
                selected = true; 
            }       
      else  if (!place_meeting(x,y,obj_control)  and !preSelected) { //If click at nothing, deselect everything
            selected = false;
            preSelected = false; //bug?
        }  
      else  if (preSelected == false and !place_meeting(x,y,obj_control)) { // ???
            selected = false;
        } 
    }
    if (controlKey) and place_meeting(x,y,obj_control) {  
        if (selected) {
            selected = false;
        }else {
            selected = true;
        }      
    }
}

if mbLeft {
    if place_meeting(x,y,obj_selector) {
        preSelected = false;
        selected = true;
    } else {
        if instance_exists(cardSelector) {
            if !cardSelector.cardSelected and !place_meeting(x,y,obj_control) and !controlKey {
                selected = false;
            } 
        }
    }
}


//Pass to card
if instance_exists(cardSelector) and device_mouse_y_to_gui(0) < display_get_gui_height() - 200  {
    if mbLeft {
        if (!place_meeting(x,y,obj_selector) and !place_meeting(x,y,obj_control) and !controlKey ) {
            selected = false;
        }    
    }
    cardSelector.cardPreselected = preSelected;
}

