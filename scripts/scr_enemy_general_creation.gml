///Enemy General creation
test = 0;
inst=0;
place[0, 0] = noone;
place[0, 30] = 0;
place[2, 30] = 0;
place[3, 30] = 0;
lockRange = 1200 ; //Where it locks the angle to the enemy
creation = true;
enemyAmount = 0;
state = scr_enemy_general_attack;
skirmish = true;
spd = 2;
formationAmount = 0; //Boxes in the group formation that follows the general
groupFlankLeftTotal = 0 //Troops in left flank
//Center Position
face = 270;
//Formation
advance = 400;
//Groups by type;
groupType[ 0 ,0] = noone ; // [type, ID ]
typeAmount[0] = 0;
typeAmount[1] = 0;
typeAmount[2] = 0;
typeAmount[3] = 0;
//Groups flank
groupFlankLeft = 0;
groupFlankRight = 0;
flankX = 0;
flankY = 0;

groupFlank[1]= false; 
groupFlank[2]= false; 
groupFlank[3]= false; 
groupFlankAmount[1] = 2;
groupFlankAmount[2] = 2;
groupFlankAmount[3] = 2;
groupFlankAmount[4] = 2;
groupFlankAmount[5] = 2;
//Enemy group sight
enemyGroup1[0, 0] = 0;
enemyPosition[0] = 0;
priorityGroup[0] = 0;


amount[0] = 0;
amount[1] = 0;
amount[2] = 0;
amount[3] = 0;
amount[4] = 0;
amount[5] = 0;
