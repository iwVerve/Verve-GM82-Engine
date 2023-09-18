///render_init()

// The render functions allow for fullscreen smoothing and Draw GUI-like behavior.

global.render_width = window_get_width();
global.render_height = window_get_height();
window_resize_buffer(global.render_width, global.render_height, 1, 0);

application_surface_enable(render_compose);
