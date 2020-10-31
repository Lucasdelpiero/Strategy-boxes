//Draw control
var outline;
outline = 4;

//draw_self();
draw_set_color(c_white);
if mbLeft {
    //draw_rectangle( x1selection, y1selection, x2selection, y2selection, outline)
}
var text = scr_distance(0 , 0, 100, 100 );
/*
if instance_exists(obj_group_manager){
draw_text(x,y - 64,"Order: " +string(array_length_2d(obj_group_manager.cardGroup, 1)));
draw_text(x,y - 128,"1: " +string(obj_group_manager.cardGroupAmount[1])); 
draw_text(x,y - 156,"2: " +string(obj_group_manager.cardGroupAmount[2])); 
draw_text(x,y - 200,"3: " +string(obj_group_manager.cardGroupAmount[3])); 
} 
*/
draw_text(x,y - 32,"X: " +string(x)); 
draw_text(x,y - 64,"Y: " +string(y)); 



//draw_text(x ,y - 32,"group left : " +string(obj_enemy_general.groupFlankLeftTotal));
//draw_text(x ,y - 64,"TEST : " +string(obj_enemy_general.test));

//draw_text(x ,y - 98,"Angle : " + string(formationAngle + 90));
var i;
/*
if selectedAmount > 0 and groupSelected != 0{
    for(i = 0; i < selectedAmount  ; i++) {
        draw_text(x , y - 32 * i , "Selected[" + string(i) + "]" + " Distance side: " + string(groupSelected[i].distanceSide) +string(groupSelected[i]) );
    }
}
for(i = 0; i < array_length_1d(testArray)  ; i++) {
        draw_text(x , y - 32 * i , "Selected[" + string(i) + "]" + " Distance side: " + string(testArray[i])  );
    }
    */
//draw_text(x ,y - 64,"Priority Group 2 : " +string(priorityGroup[1]) +"  " +string(enemyGroup[priorityGroup[1] , 33 ]));
//draw_text(x ,y - 98,"Priority Group 3 : " +string(priorityGroup[2]) +"  " +string(enemyGroup[priorityGroup[2] , 33 ]));
//draw_text(x ,y - 98 - 32,"Angle Test : "  +string(angleTest));
//draw_text(x ,y - 98 - 64,"Side : " +string(sides));

//   draw_text(obj_enemy_general.groupFlankLeft.x ,obj_enemy_general.groupFlankLeft.y - 32, "Flanco izquierdo: " +string(obj_enemy_general.groupFlankLeft));
//  draw_text(obj_enemy_general.groupFlankRight.x,obj_enemy_general.groupFlankRight.y - 64, "FLanco Derecho: " +string(obj_enemy_general.groupFlankRight));
//draw_text(x ,y - 32, "FlankX: " +string(obj_enemy_general.flankX));
//draw_text(x ,y - 64 , "FlankY: " +string(obj_enemy_general.flankY));
//draw_text(x ,y - 98 - 64, "5: " +string(probando[4]));
//draw_text(x ,y - 98 - 98, "6: " +string(probando[5]));



//draw_self();

//Draw new position
var i, angleDraw, xx, yy,;
angleDraw = point_direction(xFace,yFace,x,y) ;
var distanceToDraw = 60;
if mbRight and distance_to_point(xFace,yFace) > distanceToDraw{
var o, selectedDraw , xDraw, yDraw, selectedBoxVar;
///Drawing the box position
selectedDraw = 0; //Amount of boxes to draw
selectedBoxVar = 0; //The ones that are selected
    for (i = 0; i < instance_number(obj_box); i++){
        group[i] = instance_find(obj_box,i);
        if (group[i].selected = true) {
            selectedBox[selectedBoxVar] = group[i];
            selectedBoxVar++;
            selectedDraw++;
            }       
    }
    for ( o = 0; o < selectedDraw; o++) {
            xDraw = xFace - (distance *((centerTroops -1)/2) * dcos(formationAngle)) + (distance *  o * dcos(formationAngle));
            yDraw = yFace - (distance *((centerTroops -1)/2) * dsin(formationAngle) * (-1)) + (distance  * o * dsin(formationAngle) * (-1)) ;
            draw_sprite_ext(selectedBox[o].sprite, 0, xDraw, yDraw, 1, 1, angleDraw, c_red, 0.6);
            
        }
}

//New draw
/*
if mbRight and distance_to_point(xFace,yFace) > distanceToDraw{
var o, selectedDraw , xDraw, yDraw, selectedBoxVar;
///Drawing the box position
selectedDraw = 0; //Amount of boxes to draw
selectedBoxVar = 0; //The ones that are selected
    for (i = 0; i < instance_number(obj_box); i++){
        group[i] = instance_find(obj_box,i);
        if (group[i].selected = true) {
            selectedBox[selectedBoxVar] = group[i];
            selectedBoxVar++;
            selectedDraw++;
            }       
    }
    for ( o = 0; o < selectedDraw; o++) {
            xDraw = xFace - (distance *((centerTroops -1)/2) * dcos(formationAngle)) + (distance *  o * dcos(formationAngle));
            yDraw = yFace - (distance *((centerTroops -1)/2) * dsin(formationAngle) * (-1)) + (distance  * o * dsin(formationAngle) * (-1)) ;
            draw_sprite_ext(selectedBox[o].sprite, 0, xDraw, yDraw, 1, 1, angleDraw, c_red, 0.6);
            draw_sprite_ext(groupSelected[o].sprite, 0, xDraw, yDraw, 1, 1, angleDraw, c_red, 0.6);
            
        }
}
