///menu_draw_navigation(include_options)

// Draws the instructions on how to navigate the main menu.

var _accept_button, _back_button, _options_button;

_accept_button = key_get_name(input_get_key(key_menu_accept));
_back_button = key_get_name(input_get_key(key_menu_back));
_options_button = key_get_name(input_get_key(key_menu_options));

draw_set_valign(fa_bottom);
draw_set_font(fDefaultSmall);

draw_set_halign(fa_left);
draw_text_outlined(42, global.game_height - 40, str_cat("[", _back_button, "] Back"), c_white, c_black);
draw_set_halign(fa_right);
draw_text_outlined(global.game_width - 42, global.game_height - 40, str_cat("[", _accept_button, "] Accept"), c_white, c_black);

if argument0 {
    draw_set_halign(fa_middle);
    draw_text_outlined(global.game_width / 2, global.game_height - 40, str_cat("[", _options_button, "] Options"), c_white, c_black);
}
