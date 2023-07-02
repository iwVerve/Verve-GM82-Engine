///config_set(key, value)

// Sets a config value.

var key, value;

key = argument0;
value = argument1;

ds_map_set(global.config_map, key, value);
