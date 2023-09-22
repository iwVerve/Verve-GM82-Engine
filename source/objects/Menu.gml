#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
file_count = 3;
file_first_x = 96;
file_x_separation = 240;
file_y = 160;

current_file = 0;
current_difficulty = 0;
current_overwrite = 0;

state_not_selected = 0;
state_difficulty = 1;
state_overwrite = 2;
state = state_not_selected;

animation_timer = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _h_input;

save_select(current_file);
_h_input = input_check_pressed(key_menu_right) - input_check_pressed(key_menu_left);

// Selecting a save file
if state == state_not_selected {
    if _h_input != 0 {
        current_file = modwrap(current_file + _h_input, 0, file_count);
        sound_play("player_ground_jump");
    }
    save_select(current_file);

    if input_check_pressed(key_menu_accept) {
        state = state_difficulty;
        if save_get("exists") {
            current_difficulty = -1;
        }
        else {
            current_difficulty = 0;
        }
    }
    else if input_check_pressed(key_menu_back) {
        room_goto(rTitle);
    }
}

// Selecting a difficulty
else if state == state_difficulty {
    current_difficulty = modwrap(current_difficulty + _h_input, ternary(save_get("exists"), -1, 0), global.difficulty_count);

    if input_check_pressed(key_menu_accept) {
        if current_difficulty == -1 {
            save_load();
        }
        else {
            if save_get("exists") {
                current_overwrite = 1;
                state = state_overwrite;
            }
            else {
                save_new_game(current_difficulty);
            }
        }
    }
    else if input_check_pressed(key_menu_back) {
        state = state_not_selected;
    }
}

// Confirming overwrite
else if state == state_overwrite {
    current_overwrite = modwrap(current_overwrite + _h_input, 0, 2);

    if input_check_pressed(key_menu_accept) {
        if current_overwrite == 0 {
            state = state_difficulty;
        }
        else {
            save_new_game(current_difficulty);
        }
    }
    else if input_check_pressed(key_menu_back) {
        state = state_difficulty;
    }
}

if input_check_pressed(key_menu_options) {
    room_goto(rOptions);
}

animation_timer += 1;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;

for(i = 0; i < file_count; i += 1) {
    menu_draw_savefile(i, file_first_x + i * file_x_separation, file_y);
}

menu_draw_navigation(true);
