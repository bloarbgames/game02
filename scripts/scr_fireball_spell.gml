// scr_fireball_spell
var p = instance_create(x,y, obj_fireball);
audio_play_sound(snd_fireball,0,false);
var xforce = lengthdir_x(20, face*90);
var yforce = lengthdir_y(20, face*90);
p.creator = id;
with (p) {
    physics_apply_impulse(x,y,xforce,yforce);
}
obj_player_stats.fireballcd -= 1;

