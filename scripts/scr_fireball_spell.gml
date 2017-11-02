// scr_fireball_spell
movement = ATTACK;
var angle = 90;
if (face = RIGHT) newface = 4;

if (obj_input.w_key and obj_input.d_key) {
    angle = 10;
    }
if (obj_input.w_key and obj_input.a_key) {
    angle = 70;
    }
    
if (obj_input.s_key and obj_input.a_key) {
    angle = 110;
    }
    
if (obj_input.s_key and obj_input.d_key) {
    angle = 80;
    }


var p = instance_create(x,y, obj_fireball);
audio_play_sound(snd_fireball,0,false);
var xforce = lengthdir_x(20, newface*angle);
var yforce = lengthdir_y(20, newface*angle);
p.creator = id;
with (p) {
    physics_apply_impulse(x,y,xforce,yforce);
}
obj_player_stats.fireballcd -= 1;
obj_player_stats.globalcd -= 1;
state = scr_move_state;
