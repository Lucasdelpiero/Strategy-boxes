//Run
//Archer position
if instance_exists(obj_enemy_general){

    var gen = obj_enemy_general;
    var distance = 200;
    var xwanted = gen.x  - (distance  / 1) * dcos(gen.face) + skirmishX ;
    var ywanted = gen.y + (distance  / 1) * dsin(gen.face) + skirmishY ; 
    var near = instance_nearest(xwanted,ywanted,obj_box);
    if gen.skirmish {
        //if (skirmishX != 0 and skirmishY != 0) {
            if scr_distance(xwanted, ywanted, near.x, near.y) < 400 {
                followingOrder = false;
            } else if scr_distance(xwanted, ywanted, near.x, near.y) > 600 {
                followingOrder = true;
            }
        //}
    }

}
if !followingOrder {
    moving = true;
}
