///save_read()

// Reads the current save file from disk.

var i, file;

for(i = 0; i < 3; i += 1) {
    save_default(i);
    if file_exists(global.save_current_file) {
        file = file_text_open_read(global.save_current_file);
        ds_map_read(global.save_persistent_map, file_text_read_string(file));
        file_text_close(file);
    }
}
