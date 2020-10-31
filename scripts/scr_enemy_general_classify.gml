//Creation
var grid = 64;
var distance = 200; //distance between troops
if creation = true {
    for(i = 0; i <= instance_number(obj_enemy) - 1 ; i ++) {
        inst = instance_find(obj_enemy, i);
        groupType[inst.type ,typeAmount[inst.type] ] = inst;
        inst.formation = typeAmount[inst.type];
        typeAmount[inst.type]++;
        place[i] =  inst;    
    }
    for(i = 0; i <= instance_number(obj_enemy) - 1 ; i++) {
        with(place[i]) {
            var gen = obj_enemy_general;
            x = gen.x - (distance *(((gen.enemyAmount -1 )/2 )) * dsin(gen.face)) + (distance * formation *  dsin(gen.face));
            y = gen.y + (distance *((gen.enemyAmount - 1)/2) * dcos(gen.face) * (-1)) - (distance * formation * dcos(gen.face) * (-1));
            dirFacing = obj_enemy_general.face;
        }
    } 
      
    creation = false;
}