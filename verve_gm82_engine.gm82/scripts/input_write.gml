///input_write()

// Writes the current binds to disk.

file_text_write_all(global.input_keyboard_file, ds_map_write(global.input_keyboard_map));
