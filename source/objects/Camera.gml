#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
enabled = true;
width = global.camera_width_default;
height = global.camera_height_default
lerp_amount = global.camera_lerp_default;
leave_room = global.camera_leave_room_default;
screen_lock = global.camera_screen_lock_default;
target = global.camera_target_default;

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
    global.camera_target = target;

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
//field target: instance
