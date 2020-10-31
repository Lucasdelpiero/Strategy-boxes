//Draw sprite
var angleDisplay = dirFacing - 90;
scr_relative_position(dirFacing);
draw_sprite_ext(sprite, 0, x, y, 1, 1, angleDisplay, color, 1);
//draw_sprite_ext(sprite, 0, x + frontX * 2, y, 1, 1, angleDisplay, color, 1);
//Test
var rows = 14;
var columns = 8;
var hSpace = 26;
var vSpace = 16;
var marginWidth = rows * hSpace / 2;
var marginHeigth = columns * vSpace / 2;
if type == 2 {
   draw_text(x,y - 32 ,"Charge: " +string(charge));
   draw_text(x,y - 64 ,"Att: " +string(attacking));
   draw_text(x,y - 96 ,"SF: " +string(shootFiring));
   draw_text(x,y - 128 ,"SR: " +string(shootReloading));
}
/*
//Draw army
for(var i = 0; i <  columns  ; i++) {
    for(var o = 0; o < rows ; o++) {
        //draw_sprite_ext(spr_roman, 0, x + leftX * 112  + rightX * o * 26   + leftY * 64 + rightY * o * 16 , y   , 1, 1, angleDisplay, c_white, 1);  
        var marginX =  leftX * marginWidth + frontX * marginHeigth ;
        var xSoldier = marginX  + rightX * o * hSpace   + leftY * i * vSpace; 
        var marginY = frontY * marginHeigth  + leftY * marginWidth;
        var ySoldier = marginY + backY * i * vSpace  + rightY * o * hSpace;
        draw_sprite_ext(spr_roman, 0, x + xSoldier , y + ySoldier   , 1, 1, angleDisplay, c_white, 1);    
    }
}
*/

//debug
draw_set_color(c_red);
//draw_text(x, y - 64 ,"Dir facing; " +string(dirFacing));
//if (selected) {
if targetEnemy != noone {
//draw_text(x, y - 64, "Charging : " +string(angle_difference(dirFacing, targetEnemy.dirFacing)));
}
//draw_text(x, y - 98, "Ordered: " +string(cardOrdered));
//draw_text(x, y - 130, "Chearge: " +string(charge));
//draw_text(x, y - 150, "hspd: " +string(hspd));
//draw_text(x, y - 170, "shootAmmo: " +string(shootAmmunition));
//}

//Misile range
draw_set_color(c_white);
if ( (selected or preSelected )and type == 2 ) {
    if shootMaxAngle < 180 {    
        //Draw range of the missile troop
        var i, steps, xx, yy, radius;
        steps=20;
        draw_primitive_begin(pr_linestrip);
        draw_vertex(x, y);
        for(i = 0; i <= steps; i += 1)
           {
           draw_vertex(x + lengthdir_x(shootRange, shootMaxAngle * 2  * i / steps + dirFacing - shootMaxAngle), y + lengthdir_y(shootRange, shootMaxAngle * 2 * i / steps + dirFacing - shootMaxAngle) );
           }
        draw_vertex(x, y);
        draw_primitive_end();
        }
}
 
   /*
draw_circle(x + dcos(dirFacing) * 66, y - dsin(dirFacing) * 66, 2, true)
draw_set_color(c_yellow)
var aang = 26;
/*
draw_line(x,y,x +dcos(aang) * 160, y - dsin(aang) * 160);
draw_line(x,y,x -dcos(aang) * 160, y - dsin(aang) * 160);
draw_line(x,y,x +dcos(aang) * 160, y + dsin(aang) * 160);
draw_line(x,y,x -dcos(aang) * 160, y + dsin(aang) * 160);
*/




//Draw selection
if selected {
    draw_sprite_ext(spr_selection, 0, x, y, 1, 1, angleDisplay, c_white, 1);
} else if preSelected{
    draw_sprite_ext(spr_preSelection, 0, x, y, 1, 1, angleDisplay, c_white, 1);
}
/*
var x1,x2,x3x4,y1,y2,y3,y4; // vectors for the square to draw
var width, height; // height and width from the center
var outline = 4;
height = 32;
width = 64;
x1 = - dcos(angleDisplay) * width -  dsin(angleDisplay) * height ;
x2 = dcos(angleDisplay) * width -  dsin(angleDisplay) * height
x3 =  dcos(angleDisplay) * width +  dsin(angleDisplay) * height;
x4 = - dcos(angleDisplay) * width  + dsin(angleDisplay) * height;

y1 =   dsin(angleDisplay) * width - dcos(angleDisplay) * height;
y2 =  - dsin(angleDisplay) * width - dcos(angleDisplay) * height;
y3 =  - dsin(angleDisplay) * width + dcos(angleDisplay) * height;
y4 =   dsin(angleDisplay) * width + dcos(angleDisplay) * height;

if (selected == true) {
        draw_set_color(c_lime);
    } else {
        draw_set_color(c_gray);
    }

if (selected == true)  or (preSelected == true){

    draw_line_width( x + x1 ,y + y1 ,x + x2 ,y + y2, outline);
    draw_line_width( x + x2 ,y + y2 ,x + x3 ,y + y3, outline);
    draw_line_width( x + x3 ,y + y3 ,x + x4 ,y + y4, outline);
    draw_line_width( x + x1 ,y + y1 ,x + x4 ,y + y4, outline);
}
*/
//Draw move
draw_set_color(c_white);
if (!shootFiring) {
    draw_line(x,y, orderX, orderY);
}

//Draw swords
if ( attacking and !shootFiring) {
    draw_sprite(spr_swords, 0, (x + targetEnemy.x) / 2, (y + targetEnemy.y) / 2 );   
}
