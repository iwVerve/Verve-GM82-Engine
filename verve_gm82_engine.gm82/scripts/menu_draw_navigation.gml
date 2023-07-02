///menu_draw_navigation(include_options)
var include_options, accept_button, back_button, options_button;

accept_button = key_get_name(input_get_key(key_menu_accept));
back_button = key_get_name(input_get_key(key_menu_back));
options_button = key_get_name(input_get_key(key_menu_options));

draw_set_valign(fa_bottom);
draw_set_font(fDefaultSmall);

draw_set_halign(fa_left);
draw_text(42, 568, str_cat("[", back_button, "] Back"));
draw_set_halign(fa_right);
draw_text(758, 568, str_cat("[", accept_button, "] Accept"));

if argument0 {
    draw_set_halign(fa_middle);
    draw_text(400, 568, str_cat("[", options_button, "] Options"));
}
