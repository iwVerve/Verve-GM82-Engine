///config_write()

// Writes the current game options to disk.

file_text_write_all(global.config_file, ds_map_write(global.config_map));
