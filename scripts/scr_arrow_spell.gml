// scr_arrow_spell
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
