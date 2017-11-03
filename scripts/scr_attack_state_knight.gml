///scr_attack_state_knight
image_speed = .5;
movement = ATTACK;
counter = obj_player_stats.hittimer;
while (counter < 3) {
    var attack_animation = instance_create(x,y ,obj_weapon_animation_parent);
    attack_animation.dir = face*90;
    attack_animation.image_angle = (face*90)+45;
    var xx = 0;
    var yy = 0;
    switch (face) {
        case RIGHT :
            yy=y;
            xx=x+7
            break;
        case LEFT :
            yy=y;
            xx=x-7
            
            break;
        case UP :
            xx=x;
            yy=y-6
            
            break;
        case DOWN :
            xx=x;
            yy=y+12
            break;
        }
        if (counter == 1) {
            //random weapon sound to play
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
        }  
        var damage = instance_create(xx,yy, obj_damage);
        image_index++;
        damage.visible = false;
        damage.creator = id;
        damage.damage = obj_player_stats.attack/3
        counter++;
        }
state = scr_globalcd_state;
