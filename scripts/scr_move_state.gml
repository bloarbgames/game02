/// scr_move_state

if (obj_input.dash_key) {
    var xdir = lengthdir_x(8,face*90);
    var ydir = lengthdir_y(8,face*90);
    var speaker =  instance_place(x+xdir,y+ydir,obj_speaker)
    if (speaker != noone) {
        ///talk to it
        with (speaker) {
            if (!instance_exists(dialog)) {
                dialog = instance_create(x+xoffset, y+yoffset,obj_dialog);
                dialog.text = text;
                }
                else {
                dialog.text_page++;
                dialog.text_count = 0;
                if (dialog.text_page > array_length_1d(dialog.text)-1)
                    with (dialog) {
                        instance_destroy();
                        effect_create_above(ef_explosion,x,y,1,c_gray);
                            with (obj_sign) {
                                instance_destroy();
                                }
                        
                }
            }
        }
    }
    ///dash
    else if (obj_player_stats.stamina > DASH_COST) {
        state = scr_dash_state;
        alarm[0] = room_speed/6;
        obj_player_stats.stamina -= DASH_COST;
        obj_player_stats.alarm[0] = room_speed;
    }

    }
if (obj_input.atk_key1) {
    image_index = 0;
    state = scr_attack_state;
}

// call fireball state
if (obj_input.spell_key and obj_player_stats.fireballcd >=1) {
    state = scr_fireball_state;
}

//call flamethrower state
if (obj_input.spell_key2) {
    state = scr_flamethrower_state;
}


// get the axis
var xaxis = (obj_input.d_key - obj_input.a_key);
var yaxis = (obj_input.s_key - obj_input.w_key);

// get direction
dir = point_direction( 0, 0, xaxis, yaxis);

// get the length
if (xaxis == 0 and yaxis == 0) {
    len = 0;
} else {
    len = spd;
    scr_get_face();
}

// get the horizintal speed and vertical speed
hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

// move
phy_position_x += hspd;
phy_position_y += vspd;

/*if (len != 0) {
    audio_sound_gain(snd_hunter_walk,1,5000);
    if !audio_is_playing(snd_hunter_walk) {
        audio_play_sound(snd_hunter_walk,1,true);
        }
    } else {
    audio_stop_sound(snd_hunter_walk);
    }
*/  

// set class sprites

//control the sprite
image_speed = .15;
if (len == 0) image_index = 0;

switch (face) {
    case RIGHT:
        switch (obj_player_stats.class) {
            case CLASS_NORMAL:
                sprite_index = spr_player_right;
                break;
            case CLASS_RANG:
                sprite_index = spr_rang_right;
                break;
            case CLASS_MAGE:
                sprite_index = spr_mage_right;
                break;
            case CLASS_KNIGHT:
                sprite_index = spr_knight_right;
                break;
                }
        break;
    case LEFT:
        switch (obj_player_stats.class) {
            case CLASS_NORMAL:
                sprite_index = spr_player_left;
                break;
            case CLASS_RANG:
                sprite_index = spr_rang_left;
                break;
            case CLASS_MAGE:
                sprite_index = spr_mage_left;
                break;
            case CLASS_KNIGHT:
                sprite_index = spr_knight_left;
                break;
                }
        break;
    case UP:
        switch (obj_player_stats.class) {
            case CLASS_NORMAL:
                sprite_index = spr_player_up;
                break;
            case CLASS_RANG:
                sprite_index = spr_rang_up;
                break;
            case CLASS_MAGE:
                sprite_index = spr_mage_up;
                break;
            case CLASS_KNIGHT:
                sprite_index = spr_knight_up;
                break;
                }
                break;
    case DOWN:
        switch (obj_player_stats.class) {
            case CLASS_NORMAL:
                sprite_index = spr_player_down;
                break;
            case CLASS_RANG:
                sprite_index = spr_rang_down;
                break;
            case CLASS_MAGE:
                sprite_index = spr_mage_down;
                break;
            case CLASS_KNIGHT:
                sprite_index = spr_knight_down;
                break;
                }
                break;
    }   
   
