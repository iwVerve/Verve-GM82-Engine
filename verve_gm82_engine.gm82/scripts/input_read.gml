///input_read()

// Reads the current binds from disk.

var file;

if file_exists(global.input_keyboard_file) {
    file = file_text_open_read(global.input_keyboard_file);
    ds_map_read(global.input_keyboard_map, file_text_read_string(file));
    file_text_close(file);
}
