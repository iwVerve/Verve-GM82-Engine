///save_write()

// Writes the save data to disk.

file_text_write_all(global.save_current_file, ds_map_write(global.save_persistent_map));
