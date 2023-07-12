#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ratio = config_get("music_volume") / config_get("sound_volume");
shoot_delay = 50;
increment_delay = 10;

increment_timer = 0;
alarm[0] = shoot_delay;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_play("player_shoot");
alarm[0] = shoot_delay;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _h_input_pressed, _h_input, _increment;

_h_input_pressed = input_check_pressed(key_menu_right) - input_check_pressed(key_menu_left);
_h_input = input_check(key_menu_right) - input_check(key_menu_left);

_increment = 0;
if _h_input_pressed != 0 {
    _increment = _h_input_pressed;
}
if _h_input != 0 {
    increment_timer += 1;
    if increment_timer >= increment_delay {
        _increment = _h_input;
    }
}
else {
    increment_timer = 0;
}

if _increment != 0 {
    config_set("sound_volume", clamp(config_get("sound_volume") + _increment, 0, 100));
    config_set("music_volume", clamp(round_unbiased(ratio * config_get("sound_volume")), 0, 100));
    sound_set_music_volume(config_get("music_volume") / 100);
    sound_set_sound_volume(config_get("sound_volume") / 100);
}

if input_check_pressed(key_menu_accept) {
    room_goto(rTitle);
    config_write();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _left_key, _right_key, _accept_key;

_left_key = key_get_name(input_get_key(key_menu_left));
_right_key = key_get_name(input_get_key(key_menu_right));
_accept_key = key_get_name(input_get_key(key_menu_accept));

draw_healthbar(
    128,
    global.game_height / 2 - 8,
    global.game_width - 129,
    global.game_height / 2 + 7,
    config_get("sound_volume"), c_black, c_white, c_white, 0, true, false);

draw_set_color(c_white);
draw_rectangle(
    128,
    global.game_height / 2 - 8,
    global.game_width - 129,
    global.game_height / 2 + 7,
    true
);

draw_set_font(fDefaultMedium);
draw_set_valign(fa_bottom);
draw_set_halign(fa_middle);
draw_text(400, global.game_height / 2 - 16, str_cat("Volume check"));

draw_set_valign(fa_middle);
draw_set_halign(fa_left);
draw_text(global.game_width - 119, global.game_height / 2, str_cat(config_get("sound_volume"), "%"));

draw_set_font(fDefaultSmall);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text(128, global.game_height / 2 + 16, str_cat("[", _left_key, "/", _right_key, "] Adjust volume"));

draw_set_halign(fa_right);
draw_text(global.game_width - 129, global.game_height / 2 + 16, str_cat("[", _accept_key, "] Accept"));
