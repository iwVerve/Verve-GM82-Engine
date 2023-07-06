///camera_snap()

if !is_in_game() || !global.camera_enabled {
    exit;
}

global.camera_x = global.camera_target_x;
global.camera_y = global.camera_target_y;

view_xview = round_unbiased(global.camera_x);
view_yview = round_unbiased(global.camera_y);
