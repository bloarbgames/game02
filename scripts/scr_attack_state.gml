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
    var damage = instance_create(xx,yy, obj_damage);
    damage.creator = id;
    damage.damage = obj_player_stats.attack
    attacked = true;
    }
