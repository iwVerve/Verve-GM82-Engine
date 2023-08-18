///save_read()

// Reads the current save file from disk.

var i, _file, _buffer;

_buffer = buffer_create();

for(i = 0; i < 3; i += 1) {
    save_default(i);
    if file_exists(global.save_current_file) {
        buffer_load(_buffer, global.save_current_file);
        if global.save_encryption_password != "" {
            buffer_rc4(_buffer, global.save_encryption_password);
        }
        ds_map_read(global.save_persistent_map, buffer_read_hex(_buffer, buffer_get_size(_buffer)));
    }
}

buffer_destroy(_buffer);
