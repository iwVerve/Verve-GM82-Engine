#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
can_save = true;
max_difficulty = 1;
grav = 1;
init = false;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Allow saving again

can_save = true;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !init {
    if save_get("difficulty") > max_difficulty {
        instance_destroy();
    }
    init = true;
}

if place_meeting(x, y, Bullet) {
    event_user(0);
}

if input_check_pressed(key_shoot) {
    if place_meeting(x, y, Player) if !Player.frozen {
        event_user(0);
    }
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed = 0;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Try to save

if can_save && instance_exists(Player) && global.grav == grav {
    with(Player) {
        if place_meeting(x, y, PlayerKiller) {
            //exit;
        }
    }

    can_save = false;

    image_index = 1;
    alarm[0] = 30;
    image_speed = 1/60;

    save_save();
}
