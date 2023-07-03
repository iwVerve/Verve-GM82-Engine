#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i, option;

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

x_margin = 124;
y_step = 48;

y_start = 304 - y_step * (ds_list_size(options_list) - 1) / 2;

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
var v_input, option;

v_input = input_check_pressed(key_menu_down) - input_check_pressed(key_menu_up);

if v_input != 0 {
    current_option = modwrap(current_option + v_input, 0, ds_list_size(options_list));
}

option = ds_list_find_value(options_list, current_option);
script_execute(option, "step");

if input_check_pressed(key_menu_back) {
    room_goto(rMenu);
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i, yy, option, text;

draw_set_font(fDefaultLarge);
draw_set_valign(fa_middle);
yy = y_start;

for(i = 0; i < ds_list_size(options_list); i += 1) {
    option = ds_list_find_value(options_list, i);

    draw_set_halign(fa_left);
    text = script_execute(option, "name");
    draw_text_outlined(x_margin, yy, text, c_white, c_black, 2);

    draw_set_halign(fa_right);
    text = script_execute(option, "value");
    draw_text_outlined(800 - x_margin, yy, text, c_white, c_black, 2);

    yy += y_step;
}

draw_sprite(sprPlayerIdle, animation_timer / 5, x_margin - 16, y_start + y_step * current_option);

menu_draw_navigation(false);
