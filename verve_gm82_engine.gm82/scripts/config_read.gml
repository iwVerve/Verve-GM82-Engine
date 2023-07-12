///config_read()

// Reads the saved game options from disk.

var _file;

if file_exists(global.config_file) {
    _file = file_text_open_read(global.config_file);
    ds_map_read(global.config_map, file_text_read_string(_file));
    file_text_close(_file);

    show_volume_check = false;
}
