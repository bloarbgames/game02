// scr_arrow_spell
var angle = 90;
//if (face = RIGHT) face = 4;
/*
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
*/

var p = instance_create(x,y, obj_player_arrow);

if (face = RIGHT or face = LEFT) { 
    p.phy_rotation = (face*90)-45;
    }
    else if (face = UP or face = DOWN) {
        p.phy_rotation = (face*90)+135;
    }
    //audio_play_sound(snd_fireball,0,false);
var xforce = lengthdir_x(20, face*90);
var yforce = lengthdir_y(20, face*90);
p.creator = id;
with (p) {
    physics_apply_impulse(x,y,xforce,yforce);
}
