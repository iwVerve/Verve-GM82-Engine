///render_compose()
var target_width, target_height;

texture_set_interpolation(config_get("smoothing"));
draw_surface_ext(surface_get("application_surface", 800, 608), 0, 0, 1, 1, 0, c_white, 1);
texture_set_interpolation(0);
