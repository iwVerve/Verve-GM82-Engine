///config_default(key, value)

// Writes a value to the config map, but only if it hasn't been set previously.
// This allows new config options to be added to save files from older versions.
// The actual default values are set in config_init().

var key, value;

key = argument0;
value = argument1;

if is_undefined(ds_map_find_value(global.config_map, key)) {
    ds_map_set(global.config_map, key, value);
}
