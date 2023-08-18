///debug_hotkeys()
var _target_room_name, _target_room;

if !global.debug || !is_in_game() {
    exit;
}

if global.debug_key != noone if !keyboard_check(global.debug_key) {
    exit;
}


if keyboard_check_pressed(vk_home) {
    global.debug_god_mode = !global.debug_god_mode;
}

if keyboard_check_pressed(vk_end) {
    global.debug_infinite_jump = !global.debug_infinite_jump;
}

if keyboard_check_pressed(vk_delete) {
    global.debug_show_mask = !global.debug_show_mask;
}

if keyboard_check_pressed(vk_backspace) {
    global.debug_overlay = modwrap(global.debug_overlay + 1, 0, 3);
}

if keyboard_check_pressed(vk_insert) {
    save_save(true);
}

_target_room = noone;
if keyboard_check_pressed(vk_pageup) {
    _target_room = room_next(room);
}

if keyboard_check_pressed(vk_pagedown) {
    _target_room = room_previous(room);
}

if keyboard_check_pressed(ord("W")) {
    _target_room_name = get_string("Enter target room name", "");
    _target_room = room_first;
    while(room_exists(_target_room)) {
        if _target_room_name == room_get_name(_target_room) {
            break;
        }
        _target_room = room_next(_target_room);
    }
}

if room_exists(_target_room) && is_in_game(_target_room) {
    instance_destroy_id(Player);
    room_goto(_target_room);
}

if keyboard_check(vk_tab) {
    with(Player) {
        x = mouse_x;
        y = mouse_y;
    }
    global.camera_skip_update = true;
}

if keyboard_check_pressed(ord("G")) {
    player_flip();
}

if keyboard_check_pressed(ord("I")) {
    with(all) {
        visible = true;
    }
}
