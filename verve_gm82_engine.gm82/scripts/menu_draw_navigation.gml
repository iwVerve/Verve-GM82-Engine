///menu_draw_navigation(include_options)

// Draws the instructions on how to navigate the main menu.

var include_options, accept_button, back_button, options_button;

accept_button = key_get_name(input_get_key(key_menu_accept));
back_button = key_get_name(input_get_key(key_menu_back));
options_button = key_get_name(input_get_key(key_menu_options));

draw_set_valign(fa_bottom);
draw_set_font(fDefaultSmall);

draw_set_halign(fa_left);
draw_text_outlined(42, 568, str_cat("[", back_button, "] Back"), c_white, c_black);
draw_set_halign(fa_right);
draw_text_outlined(758, 568, str_cat("[", accept_button, "] Accept"), c_white, c_black);

if argument0 {
    draw_set_halign(fa_middle);
    draw_text_outlined(400, 568, str_cat("[", options_button, "] Options"), c_white, c_black);
}
