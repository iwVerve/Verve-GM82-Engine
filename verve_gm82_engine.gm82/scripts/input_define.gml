///input_define(input, name, key, rebindable)

// Writes a value to the keybind list, but only if it hasn't been set previously.
// This allows new binds to be added to save files from older versions.
// The actual default values are set in input_init().

var _input, _name, _key, _rebindable;

_input = argument0;
_name = argument1;
_key = argument2;
_rebindable = argument3;

// Store the input name.
ds_map_set(global.input_name_map, _input, _name);

// Store the keybind so the player can reset to default controls.
ds_map_set(global.input_keyboard_default_map, _input, _key);

// Store the keybind, unless it's been loaded from a config file.
if is_undefined(ds_map_get(global.input_keyboard_map, _input)) {
    ds_map_set(global.input_keyboard_map, _input, _key);
}

// Keep a list of only the rebindable inputs, to know what to show on the rebind screen.
if _rebindable {
    ds_list_add(global.input_rebindable_list, _input);
}
