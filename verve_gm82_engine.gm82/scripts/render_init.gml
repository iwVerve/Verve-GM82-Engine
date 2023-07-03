///render_init()

global.render_width = window_get_width();
global.render_height = window_get_height();
window_resize_buffer(global.render_width, global.render_height);

application_surface_enable(render_compose);
