///render_update()

// Appropriately resizes the window buffer, allowing for smoothing.

if config_get("smoothing") {
    target_width = window_get_width();
    target_height = window_get_height();
}
else {
    target_width = global.game_width;
    target_height = global.game_height;
}

if  global.render_width != target_width || global.render_height != target_height {
    global.render_width = target_width;
    global.render_height = target_height;
    window_resize_buffer(global.render_width, global.render_height);
}
