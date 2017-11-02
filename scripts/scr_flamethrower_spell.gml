// scr_flamethrower_spell
movement = ATTACK;
var newface = face;
if (face = RIGHT) newface = 4;
var angle = 90;
var p = instance_create(x,y, obj_fireball);
audio_play_sound(snd_fireball,0,false);
var xforce = lengthdir_x(20, newface*angle);
var yforce = lengthdir_y(20, newface*angle);
p.creator = id;
with (p) {
    physics_apply_impulse(x,y,xforce,yforce);
}

var angle = 95
var p = instance_create(x,y, obj_fireball);
audio_play_sound(snd_fireball,0,false);
var xforce = lengthdir_x(20, newface*angle);
var yforce = lengthdir_y(20, newface*angle);
p.creator = id;
with (p) {
    physics_apply_impulse(x,y,xforce,yforce);
}

var angle = 85
var p = instance_create(x,y, obj_fireball);
audio_play_sound(snd_fireball,0,false);
var xforce = lengthdir_x(20, newface*angle);
var yforce = lengthdir_y(20, newface*angle);
p.creator = id;
with (p) {
    physics_apply_impulse(x,y,xforce,yforce);
}
obj_player_stats.flamethrowercd -= 1;
obj_player_stats.globalcd -= 1;



    
