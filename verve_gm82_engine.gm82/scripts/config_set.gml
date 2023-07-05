///config_set(key, value)

// Sets a config value.

var _key, _value;

_key = argument0;
_value = argument1;

ds_map_set(global.config_map, _key, _value);
