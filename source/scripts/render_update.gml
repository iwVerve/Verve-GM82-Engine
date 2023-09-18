///render_update()

// Appropriately resizes the window buffer, allowing for smoothing.

var _target_width, _target_height;

if config_get("smoothing") {
    _target_width = window_get_width();
    _target_height = window_get_height();
}
else {
    _target_width = global.game_width;
    _target_height = global.game_height;
}

if global.render_width != _target_width || global.render_height != _target_height {
    global.render_width = _target_width;
    global.render_height = _target_height;
    window_resize_buffer(global.render_width, global.render_height, 1, 0);
}
