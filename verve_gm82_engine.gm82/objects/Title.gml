#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if input_check_pressed(key_menu_accept) {
    room_goto(rMenu);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _key_name;

draw_set_halign(fa_middle);
draw_set_valign(fa_middle);
draw_set_font(fTitle);
draw_text_outlined(global.game_width / 2, global.game_height / 2 - 24, global.game_title, c_white, c_black, 2);

draw_set_font(fTitleSmall);
_key_name = key_get_name(input_get_key(key_menu_accept));
draw_text_outlined(global.game_width / 2, global.game_height / 2 + 40, str_cat("Press ", _key_name, " to Start"), c_white, c_black, 2);

if global.debug {
    draw_set_font(fDefaultBig);
    draw_set_halign(fa_right);
    draw_set_valign(fa_top);
    draw_text_outlined(global.game_width - 36, 32, "Debug Mode", c_red, c_black);

    draw_set_font(fDefaultSmall);
    draw_text_outlined(global.game_width - 36, 68, str_cat("Hold ", key_get_name(global.debug_key), " to use debug keys"), c_red, c_black);
}
