//Cards creation
if instance_exists(obj_box) {
    if card_creation == true  {    
        for (o = 0; o < instance_number(obj_box); o++){
            var box = instance_find(obj_box, o);
             var spriteCard = instance_find(obj_box, o).sprite_index;
             inst = instance_create(width / 1024 + (width / 1024) * o,100,obj_card);
             inst.card = group[o];
             inst.sprite = spriteCard;
             inst.color = group[o].color;
             inst.place = o;
             box.cardSelector = inst;      
        }
        instance_create(x,y,obj_group_manager);
        card_creation = false;      
    }  
}