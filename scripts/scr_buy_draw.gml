switch(value){
    case obj_box : sprite = spr_box_2; break;
    case obj_archer : sprite = spr_archer; break;
    case obj_horsemen : sprite = spr_horsemen; break;
}

draw_sprite_ext(sprite, 0 ,x ,y, 1, 1, 270 , color , 1);
draw_text(x + 128,y , +string(value));