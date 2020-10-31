//UI card battle
//draw_sprite_ext(sprite, 0,x,y ,1,1,90,color,1);
draw_sprite_ext(sprite,0, guiX, guiY, xScale, yScale,270, color, 1);
if cardPreselected and !cardSelected{
        draw_sprite_ext(spr_preSelection,0, guiX, guiY, xScale, yScale,270, c_white, 1);
}
if cardSelected {
        draw_sprite_ext(spr_selection,0, guiX, guiY, xScale, yScale,270, c_white, 1);
}
if group != noone {
    draw_text(guiX, guiY - 100, "Group: " +string(group)) ;
    draw_text(guiX, guiY - 200, "Ordered: " +string(cardOrdered)) ;
}

//draw_text(guiX, guiY - 150, "CardTotal: " +string(array_length_1d(cardOrder))) ;
//draw_text(guiX, guiY - 200, "guiY: " +string(guiY)) ;