///render_compose()

// This script draws the application surface to the game window.

// Draw GUI equivalent, unlike Studio its actually drawn to the application surface.
surface_set_target(application_surface);
with(all) {
    event_perform(ev_trigger, ev_draw_gui);
}

// Bump application surface alpha to 1.
draw_set_color(c_black);
draw_set_blend_mode(bm_add);
    draw_rectangle(0, 0, global.game_width, global.game_height, false);
draw_set_blend_mode(bm_normal);

// Setup for drawing the application surface to the game window
surface_reset_target();
d3d_set_depth(0);
d3d_set_projection_ortho(0, 0, application_surface_get_width(), application_surface_get_height(), 0);

// Draw the application surface
texture_set_interpolation(config_get("smoothing"));
draw_surface(surface_get("application_surface", global.game_width, global.game_height), 0, 0);
texture_set_interpolation(0);
