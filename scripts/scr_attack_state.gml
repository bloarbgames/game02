///scr_attack_state
image_speed = .5;

switch (sprite_index) {
    case spr_player_right :
        sprite_index = spr_player_attack_right
        break;
    case spr_player_left :
        sprite_index = spr_player_attack_left
        break;
    case spr_player_up :
        sprite_index = spr_player_attack_up
        break;
    case spr_player_down :
        sprite_index = spr_player_attack_down
        break;
    }

if (image_index >= 3 and attacked ==false) {
    switch (sprite_index) {
        case spr_player_attack_right :
            yy=y;
            xx=x+12
            break;
        case spr_player_attack_left :
            yy=y;
            xx=x-12
            
            break;
        case spr_player_attack_up :
            xx=x;
            yy=y-10
            
            break;
        case spr_player_attack_down :
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
    attacked = true;
    }
