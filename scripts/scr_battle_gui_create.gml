//Graphics
sprite = spr_box_selection;
color = c_white;
alpha = 1;
//Army to deploy
created = false;
army[0, 0] = 0;
rows = 10;
lines = 2;
margin = 4;
color = c_white;
alpha = 1;
spriteDefault = spr_box_selection;
sprite = spriteDefault;
grid = 64;
//Armies
xselectionArmy = view_wview[0] * 0.2;
yselectionArmy = view_hview[0] * 0.5;
//Buy troops
buy[0, 0] = obj_box;
buy[1 , 0] = obj_box;
buy[2 , 0] = obj_archer;
buy[3 , 0] = obj_horsemen;
//Buy enemy troops  + 20 cords
//buy[0, 20] = obj_enemy;
//buy[1 , 20] = obj_enemy_archer;
//buy[2 , 20] = obj_enemy_archer;
//buy[3 , 20] = obj_enemy_horsemen;
//Teams
team=0;