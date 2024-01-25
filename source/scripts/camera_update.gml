///camera_update()

if global.camera_skip_update {
    global.camera_skip_update = false;
    exit;
}

if !is_in_game() || !global.camera_enabled {
    exit;
}

with(global.camera_target) {
    global.camera_target_x = x - global.camera_width / 2;
    global.camera_target_y = y - global.camera_height / 2;
}

if !global.camera_leave_room {
    global.camera_target_x = clamp(global.camera_target_x, 0, room_width - global.camera_width);
    global.camera_target_y = clamp(global.camera_target_y, 0, room_height - global.camera_height);
}

if global.camera_screen_lock {
    global.camera_target_x = roundto_unbiased(global.camera_target_x, global.camera_width);
    global.camera_target_y = roundto_unbiased(global.camera_target_y, global.camera_height);
}

global.camera_x = lerp(global.camera_x, global.camera_target_x, global.camera_lerp);
global.camera_y = lerp(global.camera_y, global.camera_target_y, global.camera_lerp);

view_wview = global.camera_width;
view_hview = global.camera_height;
view_xview = round_unbiased(global.camera_x);
view_yview = round_unbiased(global.camera_y);
