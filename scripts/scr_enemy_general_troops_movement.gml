///Movement
var grid = 64;
var distance = 200; //distance between troops
//Relative positions
var gen = obj_enemy_general;
var frontX = dcos(gen.face) ;
var frontY = -dsin(gen.face);
var backX = -dcos(gen.face) ;
var backY = dsin(gen.face);
var leftX = -dsin(gen.face);
var leftY = -dcos(gen.face);
var rightX = dsin(gen.face);
var rightY = dcos(gen.face);

//Move in formation following the general;
for(i = 0 ; i <= instance_number(obj_enemy) - 1 ; i++) { 
    var o = i;
    with(place[i]) {
        var gen = obj_enemy_general; //General in short words
        if (attacking == false) and (charge== false) {       
            if (group == 0){
                orderX =  gen.x + (distance *(((gen.typeAmount[0] -1 )/2 )) * leftX) + (distance * formation *  rightX);     //X order position
                orderY = gen.y + (distance *((gen.typeAmount[0] - 1)/2) * leftY)  + (distance * formation * rightY) ;    //Y order position
                if moving == false and distance_to_point(orderX, orderY) < spd and (attacking == false) {
                    targetAngle = obj_enemy_general.face;
                }
            }
            //Right Flank
            if (group == 1) {                            
                //Flank X/Y position to start the reposition to defend from flanking
                if (obj_enemy_general.groupFlank[2]== false) {
                    gen.flankX = gen.groupFlankRight.orderX + (distance / 2 )  * backX + grid * rightX;
                    gen.flankY = gen.groupFlankRight.orderY + (distance / 2 )* backY + grid * rightY;
                    gen.groupFlank[2] = true;
                }               
                orderX =  gen.flankX + ( distance * (gen.groupFlankAmount[2]) *  dsin(gen.face - 90));
                orderY = gen.flankY + ( distance * (gen.groupFlankAmount[2]) * dcos(gen.face - 90));
                gen.groupFlankAmount[2] += 1 ;
                if moving == false and distance_to_point(orderX, orderY) < spd and (attacking == false) {
                    if gen.face > 90 {
                        targetAngle =  gen.face - 90 ;
                    } else {
                        targetAngle = 270 + gen.face;
                    }
                }
            }
            //Left Flank
            if (group == -1) {              
                //Flank X/Y position to start the reposition to defend from flanking
                if (obj_enemy_general.groupFlank[1]== false) {
                    gen.flankX = gen.groupFlankLeft.orderX - (distance / 2) * dcos(gen.face) - grid * dsin(gen.face);
                    gen.flankY = gen.groupFlankLeft.orderY + (distance / 2) * dsin(gen.face) - grid * dcos(gen.face);
                    gen.groupFlank[1] = true;
                }
                orderX =  gen.flankX + ( distance * (gen.groupFlankAmount[1]) *  frontX ) + ( distance * ((gen.groupFlankLeftTotal) - 1 )*  backX ) ;   //X order position
                orderY = gen.flankY  + ( distance * (gen.groupFlankAmount[1]) * frontY ) + ( distance * ((gen.groupFlankLeftTotal - 1) ) * backY );  //Y order position
                gen.groupFlankAmount[1] += 1 ;
                if moving == false and distance_to_point(orderX, orderY) < spd and (attacking == false) {
                    if gen.face > 270 {
                        targetAngle = 90 +  gen.face - 360 ;
                    } else {
                        targetAngle = 90 + gen.face;
                    }
                }
            }
            //Back 
            if (group == 4){ 
                gen.flankX = gen.groupFlankLeft.x - (distance / 2) * dcos(gen.face) - grid * dsin(gen.face);
                gen.flankY = gen.groupFlankLeft.y + (distance / 2) * dsin(gen.face) - grid * dcos(gen.face);
                orderX =  gen.flankX + (distance *(((gen.amount[4] )/2 )) * dsin(gen.face)) - (distance * gen.groupFlankAmount[4] *  dsin(gen.face)) - (distance * dcos(gen.face));     //X order position
                orderY = gen.flankY + (distance *((gen.amount[4])/2) * dcos(gen.face))  - (distance * gen.groupFlankAmount[4] * dcos(gen.face)) + (distance * dsin(gen.face)) ;    //Y order position
                if moving == false and distance_to_point(orderX, orderY) < spd and (attacking == false) {
                    targetAngle = obj_enemy_general.face + 180;
                    if (targetAngle > 360) {
                        targetAngle-= 360;
                    }
                }
                gen.groupFlankAmount[4] += 1;
            }
            //Archers
            if (group == 2) {//and !attacking) {
                skirmishX = (distance * 2) * frontX  * gen.skirmish ;
                skirmishY = (distance * 2) * frontY  *  gen.skirmish  ;
                gen.flankX = gen.x  - (distance  / 1) * dcos(gen.face) + skirmishX * followingOrder ;
                gen.flankY = gen.y + (distance  / 1) * dsin(gen.face) + skirmishY  * followingOrder ; 
                orderX =  gen.flankX + (distance *(((gen.typeAmount[2] -1 )/2 )) * leftX) + (distance * formation *  rightX);     //X order position
                orderY = gen.flankY + (distance *((gen.typeAmount[2] - 1)/2) * leftY)  + (distance * formation * rightY) ;    //Y order position
                if moving == false and distance_to_point(orderX, orderY) < spd and (attacking == false) {
                    targetAngle = obj_enemy_general.face;
                }
                gen.groupFlankAmount[2] += 1;
            }  
            //Cavalry right flank
            if (group== 5) {
                    gen.flankX = gen.groupFlankRight.orderX  + (distance  / 1) * rightX  ;
                    gen.flankY =  gen.groupFlankRight.orderY + (distance  / 1) * rightY  ;    
                    orderX =  gen.flankX +  (distance * gen.groupFlankAmount[5] *  rightX);     //X order position
                    orderY = gen.flankY +  (distance * gen.groupFlankAmount[5] * rightY) ;    //Y order position
                    gen.groupFlankAmount[5] += 1;
                    if moving == false and distance_to_point(orderX, orderY) < spd and (attacking == false) {
                        targetAngle = obj_enemy_general.face;
                    }
            } 
            //Cavalry left flank
            if (group== 3) {
                    gen.flankX = gen.groupFlankLeft.orderX  + (distance  / 1) * leftX  ;
                    gen.flankY =  gen.groupFlankLeft.orderY + (distance  / 1) * leftY  ;    
                    orderX =  gen.flankX + (distance *(((gen.groupFlankAmount[3] -1 )/2 )) * leftX) + (distance * formation *  rightX);     //X order position
                    orderY = gen.flankY + (distance *((gen.groupFlankAmount[3] - 1)/2) * leftY)  + (distance * formation * rightY) ;    //Y order position
                    if moving == false and distance_to_point(orderX, orderY) < spd and (attacking == false) {
                        targetAngle = obj_enemy_general.face;
                    }
            }
        }
    }    
}

//Reset the groups
for(i=0; i < 6 ; i++) {
    gen.groupFlankAmount[i] = 0; //Si no era 1 el valor habia un bug
    gen.groupFlank[i]= false;
}
