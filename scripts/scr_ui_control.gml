//Scr battle
scr_input();
guiX = 100 + 100 * place;
guiY = display_get_gui_height() - 100;

var xLeft = guiX - grid * xScale;
var xRight = guiX + grid * xScale;
var yUp = guiY - grid  * 2 * yScale;
var yDown = guiY + grid * 2 * yScale;
//Select cards
cardSelected = card.selected;
if device_mouse_y_to_gui(0) > yUp {
card.preSelected = false;
if device_mouse_x_to_gui(0) > xLeft  and device_mouse_x_to_gui(0) < xRight {
    if device_mouse_y_to_gui(0) > yUp  and device_mouse_y_to_gui(0) < yDown {
        cardPreselected = true;
        card.preSelected = cardPreselected;
        if (mbLeftPressed) {
        cardSelected = true;
            with(card) { //Select or deselect by pressing left mouse          
                if !(controlKey) {
                        selected = true;  
                   }
                if (controlKey) { 
                    if (selected) {
                        selected = false;
                    } else {
                        selected = true;
                    }
                }
                
            } 
        } else  {
            with(card) {  //Show that you can select it
                preSelected = true;
            }        
        } 
    }
} else {
    with(card) {
        if !place_meeting(x,y,obj_control) {
            cardSelector.cardPreselected = false;
        }
    } 
}
}

group = card.cardGroup;

//Center UI actualization
xCenter = view_xview +  (obj_control.width / 12);
yCenter = view_yview + obj_control.height - (obj_control.height / 8); 
x = xCenter + (obj_control.width / 12) * place ;
y = yCenter;
image_blend = color ;
image_xscale = obj_control.width / 1024;
image_yscale = obj_control.width / 1024;