///input_read()

// Reads the current binds from disk.

var _file;

if file_exists(global.input_keyboard_file) {
    _file = file_text_open_read(global.input_keyboard_file);
    ds_map_read(global.input_keyboard_map, file_text_read_string(_file));
    file_text_close(_file);
}
