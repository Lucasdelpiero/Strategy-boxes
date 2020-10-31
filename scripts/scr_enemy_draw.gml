//Draw sprite
var angleDisplay = dirFacing - 90;
draw_sprite_ext(sprite, 0, x, y, 1, 1, angleDisplay, color, 1);
//draw_text(x,y - 128 ,"Formation: " +string(formation));
if type == 2 {
 //  draw_text(x,y - 32 ,"Charge: " +string(charge));
   draw_text(x,y - 172 ,"Att: " +string(attacking));
   draw_text(x,y - 96 ,"SF: " +string(shootFiring));
   draw_text(x,y - 128 ,"SR: " +string(shootReloading));
   draw_text(x,y - 156 ,"SRT: " +string(shootReloadTime));
   draw_text(x,y - 64 ,"Moving: " +string(moving));
   draw_text(x,y - 32 ,"FO: " +string(followingOrder));
   
}


//draw_text(x,y - 230 ,"Back: " +string(sideBackOcup));
if !(attacking and moving) {
    draw_circle(orderX , orderY , 4, false);
    draw_line(x, y, orderX, orderY);
}
