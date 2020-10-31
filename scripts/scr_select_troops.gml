///Group selected
var i,o,s, formation , inst;
selectedAmount = 0;
for (i = 0; i < instance_number(obj_box); i++){
    group[i] = instance_find(obj_box,i);
    if (group[i].selected == true) {
        selectedAmount++;
    }
}
var sel = 0;
for (i = 0; i < instance_number(obj_box); i++){
    if (group[i].selected == true){
        groupSelected[sel] = group[i];
        sel++;
    }
}
//Order the array of the selected troops so they choose the closest position in the formation
for(i = 0; i < array_length_1d(groupSelected) - 1 ; i++) {
    if( groupSelected[i].distanceSide > groupSelected[i + 1].distanceSide ) {
        var up = groupSelected[i + 1];
        var down = groupSelected[i];
        groupSelected[i] = up;
        groupSelected[i + 1] = down;
        i = -1;
    }
}
centerTroops = selectedAmount; // Used to put the get the formation right when one choose the angle formation
if distance_to_point(xFace , yFace) > 20 {
    centerTroops = 1;
}