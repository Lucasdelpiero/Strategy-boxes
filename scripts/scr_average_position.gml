var i , avX , avY, avCalculated; // Position of boxes to look for the average
avX = 0;
avY = 0;
avCalculated = 0;

//Average position for enemies
var avXenemy, avYenemy;
avX = 0;
avY = 0;
avCalculated = 0;

for (i = 0; i < instance_number(obj_enemy); i++){
    if instance_find(obj_enemy, i).attacking == false { // if not attacking will calculate
        avX+= instance_find(obj_enemy, i).x;            // his average position
        avY+= instance_find(obj_enemy, i).y;
        avCalculated += 1;
    }
}
if avCalculated > 0 {
    averageXenemy = avX / avCalculated;
    averageYenemy = avY / avCalculated;
}