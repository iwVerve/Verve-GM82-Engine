///save_read()

// Reads the current save file from disk.

var i, _file;

for(i = 0; i < 3; i += 1) {
    save_default(i);
    if file_exists(global.save_current_file) {
        _file = file_text_open_read(global.save_current_file);
        ds_map_read(global.save_persistent_map, file_text_read_string(_file));
        file_text_close(_file);
    }
}
