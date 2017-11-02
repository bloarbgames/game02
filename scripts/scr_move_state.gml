/// scr_move_state
movement = MOVE;
if (obj_input.interact_key) {
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
                 }
            }
        }
    }
}


// Spells for  Ranger - this spells can only be used when class = CLASS_RANG
if (obj_player_stats.class = CLASS_RANG) {

///dash   
    if ( obj_input.spell_key and obj_player_stats.stamina > DASH_COST) {
        state = scr_dash_state;
        alarm[0] = room_speed/6;
        obj_player_stats.stamina -= DASH_COST;
        obj_player_stats.alarm[0] = room_speed;
    }
    if (obj_input.spell_key2) {
        script_execute(scr_arrow_spell);
    }
}

// sword attack with no class picked
if (obj_player_stats.class = CLASS_NORMAL) {
    if (obj_input.atk_key1) {
        image_index = 0;
        state = scr_attack_state;
    }
}


// spellls for the knight - this spells can only be used when class = CLASS_KNIGHT
if (obj_player_stats.class = CLASS_KNIGHT) {
    if (obj_input.spell_key and obj_player_stats.globalcd >= 1) {
        state = scr_attack_state_knight;
        alarm[0] = room_speed/6;
        obj_player_stats.globalcd -= 1;
    }
}



// Spells for  Mages - this spells can only be used when class = CLASS_MAGE
if (obj_player_stats.class = CLASS_MAGE) {
// call fireball spell
    if (obj_input.spell_key and obj_player_stats.fireballcd >=1 and obj_player_stats.class = CLASS_MAGE) {
        script_execute(scr_fireball_spell);
    }

//call flamethrower state
    if (obj_input.spell_key2 and obj_player_stats.flamethrowercd >= 1 and obj_player_stats.class = CLASS_MAGE) {
        script_execute(scr_flamethrower_spell);
    }
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
    scr_get_face(dir);
}

// get the horizintal speed and vertical speed
hspd = lengthdir_x(len,dir);
vspd = lengthdir_y(len,dir);

// move
if (obj_player_stats.globalcd >= 1) {
phy_position_x += hspd;
phy_position_y += vspd;
}


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
if (len == 0 ) image_index = 0;
   
