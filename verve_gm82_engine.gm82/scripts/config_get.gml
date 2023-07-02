///config_get(key, [default=0])

// Gets a config value, or a default value if it hasn't been set yet.

var key, default_value, value;

key = argument[0];
default_value = 0;
if argument_count > 1 {
    default_value = argument[1];
}

value = ds_map_get(global.config_map, key);
if is_undefined(value) {
    return default_value;
}

return value;
