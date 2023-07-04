#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i, option;

// State
state_options = 0;
state_keyboard_controls = 1;
state = state_options;

// Options state
options_list = ds_list_create();
current_option = 0;

for(i = 0; i < ds_list_size(global.options_list); i += 1) {
    option = ds_list_find_value(global.options_list, i);

    if !script_execute(option, "include") {
        continue;
    }

    if global.game_started && !script_execute(option, "in_pause") {
        continue;
    }

    ds_list_add(options_list, option);
}

volume_option_timer = 0;
volume_option_period = 10;
volume_option_delay = 10;

sound_test_timer = 0;
sound_test_delay = 25;

// Keyboard state
current_key = 0;
is_rebinding = false;

// Visuals
options_x_margin = 124;
options_y_step = 48;
options_font = fDefaultLarge;
options_y_start = global.game_height / 2 - options_y_step * (ds_list_size(options_list) - 1) / 2;

keyboard_x_margin = 120;
keyboard_y_step = 40;
keyboard_font = fDefaultBig;
keyboard_y_start = global.game_height / 2 - keyboard_y_step * (ds_list_size(global.input_rebindable_list)) / 2;

animation_timer = 0;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Cleanup

event_user(0);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var v_input, option, key;

v_input = input_check_pressed(key_menu_down) - input_check_pressed(key_menu_up);

if state == state_options {
    if v_input != 0 {
        current_option = modwrap(current_option + v_input, 0, ds_list_size(options_list));
        option = ds_list_find_value(options_list, current_option);
        script_execute(option, "init");
        sound_play("player_ground_jump");
    }

    option = ds_list_find_value(options_list, current_option);
    script_execute(option, "step");

    if input_check_pressed(key_menu_back) {
        room_goto(rMenu);
    }
}
else if state == state_keyboard_controls {
    if !is_rebinding {
        if v_input != 0 {
            current_key = modwrap(current_key + v_input, 0, ds_list_size(global.input_rebindable_list) + 1);
            sound_play("player_ground_jump");
        }

        if input_check_pressed(key_menu_accept) {
            if current_key < ds_list_size(global.input_rebindable_list) {
                // Start rebind
                is_rebinding = true;
            }
            else {
                // Reset controls
                input_reset_keys();
            }
        }

        if input_check_pressed(key_menu_back) {
            state = state_options;
        }
    }
    else {
        // Wait for new bind
        if keyboard_check_pressed(vk_anykey) {
            key = keyboard_key;

            if key == 160 || key == 161 {
                key = vk_shift;
            }

            ds_map_set(global.input_keyboard_map, ds_list_find_value(global.input_rebindable_list, current_key), key);
            //input_set_key(ds_map_get(global.input_rebindable_list, current_key), key);
            is_rebinding = false;
        }
    }
}

animation_timer += 1;
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Cleanup

event_user(0);
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_list_destroy(options_list);

config_write();
input_write();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i, yy, option, text, input, reset_row, row_name, row_value;

draw_set_font(fDefaultLarge);
draw_set_valign(fa_middle);

if state == state_options {
    yy = options_y_start;
    draw_set_font(options_font);

    for(i = 0; i < ds_list_size(options_list); i += 1) {
        option = ds_list_find_value(options_list, i);

        row_name = script_execute(option, "name");
        row_value = script_execute(option, "value");

        draw_set_halign(fa_left);
        draw_text_outlined(options_x_margin, yy, row_name, c_white, c_black, 2);
        draw_set_halign(fa_right);
        draw_text_outlined(global.game_width - options_x_margin, yy, row_value, c_white, c_black, 2);

        yy += options_y_step;
    }

    draw_sprite(sprPlayerIdle, animation_timer / 5, options_x_margin - 16, options_y_start + options_y_step * current_option + 2);
}
else if state == state_keyboard_controls {
    yy = keyboard_y_start;
    draw_set_font(keyboard_font);

    for(i = 0; i < ds_list_size(global.input_rebindable_list) + 1; i += 1) {
        if i < ds_list_size(global.input_rebindable_list) {
            input = ds_list_find_value(global.input_rebindable_list, i);
            row_name = input_get_name(input);

            if !is_rebinding || i != current_key {
                row_value = key_get_name(input_get_key(input));
            }
            else {
                row_value = "Press new key";
            }
        }
        else {
            row_name = "Reset Controls";
            row_value = "";
        }

        draw_set_halign(fa_left);
        draw_text_outlined(keyboard_x_margin, yy, row_name, c_white, c_black, 2);
        draw_set_halign(fa_right);
        draw_text_outlined(global.game_width - keyboard_x_margin, yy, row_value, c_white, c_black, 2);

        yy += keyboard_y_step;
    }

    draw_sprite(sprPlayerIdle, animation_timer / 5, keyboard_x_margin - 16, keyboard_y_start + keyboard_y_step * current_key + 2);
}

menu_draw_navigation(false);
