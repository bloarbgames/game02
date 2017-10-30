///scr_attack_state
image_speed = .5;
movement = ATTACK;

if (animation_hit_frame(2)) {
    var attack_animation = instance_create(x,y ,obj_weapon_animation_parent);
    attack_animation.dir = face*90;
    attack_animation.image_angle = (face*90)+45;
    }


if (animation_hit_frame(3)) {
    var xx = 0;
    var yy = 0;
    switch (face) {
        case RIGHT :
            yy=y;
            xx=x+12
            break;
        case LEFT :
            yy=y;
            xx=x-12
            
            break;
        case UP :
            xx=x;
            yy=y-10
            
            break;
        case DOWN :
            xx=x;
            yy=y+15
            break;
        }
    
    //random sound to play
    //if audio_is_playing(snd_hunter_walk)
    var rndsound = irandom(2);
    switch (rndsound) {
        case 0:
            audio_play_sound(snd_sword_swing,2,false);
            break;
        case 1:
            audio_play_sound(snd_sword_swing2,2,false);
            break;
        case 2:
            audio_play_sound(snd_sword_swing2,2,false);
            break;
        }
        
    
    var damage = instance_create(xx,yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack
    }
