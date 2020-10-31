// Position the box by the distance to the target position
for(i = 0; i < instance_number(obj_box) ; i++) {
    var inst = instance_find(obj_box, i);
    with(inst) {
        if inst.selected == true {
            distanceSide = dcos(point_direction(obj_control.xFace, obj_control.yFace, inst.x, inst.y ) - obj_control.formationAngle );// * distance_to_point(obj_control.xFace, obj_control.yFace);
            distanceSide =  - dsin(angle_difference(point_direction(obj_control.xFace, obj_control.yFace, inst.x, inst.y ), obj_control.formationAngle + 90)) * distance_to_point(obj_control.xFace, obj_control.yFace);
        }
    }
}