#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_to = noone;
x_to = noone;
y_to = noone;
outside = false;
wrap_around = false;
x_offset = 0;
y_offset = 0;
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !outside && !wrap_around {
    event_user(0);
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Warp

if wrap_around {
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
    room_goto(room_to);
}
