var amount = 0;
//Putting cards in groups 
//For each group
for(var i = 0  ; i < instance_number(obj_card) ; i++) {
    //For each card
    for(var o = 0 ; o < instance_number(obj_card) ; o++) {
        var inst = instance_find(obj_card, o);
        if inst.group == i {
            inst.place = amount;
            amount++;
        }    
    }
    //For unasigned group
    if (i == instance_number(obj_card) - 1) {
        for(var o = 0 ; amount < instance_number(obj_card) ; o++) {
            var inst = instance_find(obj_card, o); 
            if inst.group == noone {
                inst.place = amount;
                amount++;
            }
        }    
    }
}