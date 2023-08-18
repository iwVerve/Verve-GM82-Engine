///save_write()

// Writes the current save file to disk.

var _buffer;

_buffer = buffer_create();
buffer_write_hex(_buffer, ds_map_write(global.save_persistent_map));
if global.save_encryption_password != "" {
    buffer_rc4(_buffer, global.save_encryption_password);
}
buffer_save(_buffer, global.save_current_file);
buffer_destroy(_buffer);
