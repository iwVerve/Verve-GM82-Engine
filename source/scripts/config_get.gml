///config_get(key, [default=0])

// Gets a config value, or a default value if it hasn't been set yet.

var _key, _default_value, _value;

_key = argument[0];
_default_value = 0;
if argument_count > 1 {
    _default_value = argument[1];
}

_value = ds_map_get(global.config_map, _key);
if is_undefined(_value) {
    return _default_value;
}

return _value;
