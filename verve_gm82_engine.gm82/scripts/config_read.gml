///config_read()

// Reads the current game options from disk.

var file;

if file_exists(global.config_file) {
    file = file_text_open_read(global.config_file);
    ds_map_read(global.config_map, file_text_read_string(file));
    file_text_close(file);

    window_set_fullscreen(config_get("fullscreen"));
}
