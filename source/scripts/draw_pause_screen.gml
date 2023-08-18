///draw_pause_screen()

d3d_set_projection_ortho(0, 0, global.game_width, global.game_height, 0);

_pause_surf = surface_get("pause_surf", global.game_width, global.game_height);
draw_surface(_pause_surf, 0, 0);

draw_set_color(c_black);
draw_set_alpha(0.5);
    draw_rectangle(0, 0, global.game_width, global.game_height, false);
draw_set_alpha(1);

if !instance_exists(Options) {
    draw_set_halign(fa_middle);
    draw_set_valign(fa_middle);
    draw_set_font(fDefaultLarge);

    draw_text_outlined(global.game_width / 2, global.game_height / 2, "PAUSE", c_white, c_black, 2);

    draw_set_font(fDefaultSmall);
    draw_text_outlined(400, 556, str_cat("[", key_get_name(input_get_key(key_menu_options)), "] Options"), c_white, c_black);

    draw_set_font(fDefaultMedium);
    draw_set_halign(fa_left);

    draw_text_outlined(20, 541, str_cat("Deaths: ", save_get("deaths")), c_white, c_black);
    draw_text_outlined(20, 566, str_cat("Time: ", get_formatted_time(save_get("time"))), c_white, c_black);
}
else with(Options) {
    event_perform(ev_draw, 0);
}

d3d_set_projection_default();
