///scr_shield_boost_spell

//global variables
movement = ATTACK;
angle = 22.5;

//private variables
counter = 0;

//cooldown
cd = 10;

//creating the spawn points of the shields (4)
while (counter < 16) {
var p = instance_create(x,y, obj_shield_boost_effect);
var xforce = lengthdir_x(20, counter*angle);
var yforce = lengthdir_y(20, counter*angle);
with (p) {
    physics_apply_impulse(x,y,xforce,yforce);
    }
counter++;
}
obj_player_stats.defrating++;
state = scr_cooldown;
