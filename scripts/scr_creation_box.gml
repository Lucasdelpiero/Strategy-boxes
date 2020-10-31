///Creation
name = obj_box;
type = 0;
cardGroup = noone;
state = scr_box_action;
sprite = sprite_index;
color = c_red;
dirFacing = 90;
angle = 0;
agility = 2 * (30 / room_speed);
spd = 10 * (30 / room_speed);
selected = false;
preSelected = false;
cardSelector = instance_find(obj_card, 0);
//Movement
moving = false;
height = 64  / 2;
width = 128  / 2;
vspd=0;
hspd=0;
orderX = x;
orderY = y - 1;
checkAngle = true;
formationDebug=0;
targetAngle = 90;
distanceSide = 0; //Distance to center of the target formation
//Attacking
attacking = false;
fireAtWill = false;
beingAttacked = false;
charge = false;
chargeEnemy = noone;
targetEnemy = noone;
//Missile
shootFiring = false;
shootReloading = false;
shootWhileMoving = false;
shootRange = 800;
shootMaxAngle = 45;
shootReloadTime = 2; 
shootAmmunition = 0;
shootDamage = 1;
shootFireAtWill = false;
//Sides     Sides where is being attacked
sideFrontOcup = false;
sideBackOcup = false;
sideLeftOcup = false;
sideRightOcup = false;
sideTarget = noone;
//IA Grouping
inGroup = false; 
followingOrder = true;
skirmishX = 0;
skirmishY = 0;
group = 0;
sideX = 0;
sideY = 0;
//Stats
soldiers = 120;
baseMorale = 4;
morale = baseMorale;
energy = 100;
scr_relative_position(dirFacing)
