#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_to = noone;
x_to = noone;
y_to = noone;

type_normal = 0;
type_outside = 1;
type_wrap_around = 2;
type = type_normal;

x_offset = 0;
y_offset = 0;
autosave = false;
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if type == type_normal {
    event_user(0);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field room_to: room
//field x_to: number
//field y_to: number
//field type: enum(type_normal,type_outside,type_wrap_around)
//field x_offset: number
//field y_offset: number
//field autosave: bool
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Warp

if type == type_wrap_around {
    if x < 0 {
        Player.x += room_width;
    }
    else if x >= room_width {
        Player.x -= room_width;
    }
    else if y < 0 {
        Player.y += room_height;
    }
    else if y >= room_height {
        Player.y -= room_height;
    }

    Player.x += x_offset;
    Player.y += y_offset;
}
else if x_to != noone || y_to != noone {
    with(Player) {
        x = other.x_to;
        y = other.y_to;
    }
}
else {
    instance_destroy_id(Player);
}

if room_exists(room_to) {
    if global.clear_input_on_warp {
        io_set_roomend_clear(true);
    }
    room_goto(room_to);

    if autosave {
        save_save_asap(true);
    }
}
