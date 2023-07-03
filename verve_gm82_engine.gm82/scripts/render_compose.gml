///render_compose()
var target_width, target_height;

texture_set_interpolation(config_get("smoothing"));
draw_surface(surface_get("application_surface", 800, 608), 0, 0);
texture_set_interpolation(0);
