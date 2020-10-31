///scr_group_enemy
/*Creates groups for the IA to see the main army of the player
Every group will have some weight, the heaviest will be the main group
The IA will focus on the main IA */
var i , o  , g;
var group = 0;
var target = noone;
//Set the group
for(i = 0; i < instance_number(obj_box) + 1; i++) {
    if i < instance_number(obj_box) {
        enemyGroup[group , i ] = instance_find(obj_box, i); //S
        enemyGroup[group , i ].inGroup = false;  //Set it to false to reset the algoritm 
    }
    enemyGroup[i , 30 ] = 0 ; // Amount of troops in group  
    enemyGroup[i , 31 ] = 0; // Sum of X
    enemyGroup[i , 32 ] = 0; // Sum of Y
    enemyGroup[i , 33 ] = 0; // Average X
    enemyGroup[i , 34 ] = 0; // Avegage Y
    priorityGroup[i] = 0;
    
}
//target = instance_find(obj_box, 0 );
for(g = 1 ; g < instance_number(obj_box) + 1; g++) { //Groups
    target = instance_find(obj_box, g - 1 )
    if (target.inGroup == false) { //The starter of the group 
                target.inGroup = true;
                target.group = g ;
    }
    for(i = 0; i < instance_number(obj_box)  ; i++) {          
        target = instance_find(obj_box, i ); //This will compare his position with EVERYONE            
        //Compares the distance between the 2 boxes 
        for(o = 0; o < instance_number(obj_box)  ; o++) {
        var comparation = instance_find(obj_box, o);  //This are ALL the ones that be comparing              
            if scr_distance(target.x, target.y , comparation.x , comparation.y ) < 400   {
                if (target != comparation) and (target.inGroup == true) and (comparation.inGroup == false) {
                        comparation.inGroup = true; 
                         comparation.group = g ;
                        if (o == 0) {
                           // target.inGroup = true;
                        }
                }                     
            }                 
        }
    }
}

//Set the weight of the groups and sum x and y
for(i = 1; i < instance_number(obj_box) + 1  ; i++) {
    group = instance_find(obj_box, i - 1).group;
    enemyGroup[group , 30 ] +=  1;
    enemyGroup[group , 31 ] += instance_find(obj_box, i - 1).x;
    enemyGroup[group , 32 ] += instance_find(obj_box, i - 1).y;
}
//Set Average Position
for(i = 1; i < instance_number(obj_box) + 1 ; i++) {
    group = instance_find(obj_box, i - 1).group;
    enemyGroup[group , 33 ] = (enemyGroup[group , 31 ] / enemyGroup[group , 30 ]); // Average X final
    enemyGroup[group , 34 ] = (enemyGroup[group , 32 ] / enemyGroup[group , 30 ]); // Average Y final
}



//Sort array
for(i = 0; i < instance_number(obj_box) + 1  ; i++) {
    if enemyGroup[i , 30] > enemyGroup[priorityGroup[0] , 30 ]  {
        priorityGroup[2] = priorityGroup[1];
        priorityGroup[1] = priorityGroup[0];
        priorityGroup[0] = i;
    } else {
        if enemyGroup[i , 30] > enemyGroup[priorityGroup[1] , 30 ]  {
            priorityGroup[2] = priorityGroup[1];
            priorityGroup[1] = i;
        } else {
            if enemyGroup[i , 30] > enemyGroup[priorityGroup[2] , 30 ] {            
            priorityGroup[2] = i;                            
            } 
        }
    }           
}

averageX = enemyGroup[ priorityGroup[0], 33 ];
averageY =  enemyGroup[ priorityGroup[0], 34];