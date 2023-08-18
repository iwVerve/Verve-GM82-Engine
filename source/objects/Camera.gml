#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enabled = true;
width = global.game_width;
height = global.game_height;
lerp_amount = global.camera_lerp;
leave_room = global.camera_leave_room;
screen_lock = global.camera_screen_lock;

init = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !init {
    global.camera_enabled = enabled;
    global.camera_width = width;
    global.camera_height = height;
    global.camera_lerp = lerp_amount;
    global.camera_leave_room = leave_room;
    global.camera_screen_lock = screen_lock;

    camera_update();
    camera_snap();

    init = true;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Sets camera settings for the current room. Any unset value
will default to the value set in engine_settings().
*/
//field enabled: bool
//field width: number
//field height: number
//field lerp_amount: number(0, 1)
//field leave_room: bool
//field screen_lock: bool
