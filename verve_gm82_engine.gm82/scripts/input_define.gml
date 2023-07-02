///input_define(input, name, key, rebindable)

// Writes a value to the keybind list, but only if it hasn't been set previously.
// This allows new binds to be added to save files from older versions.
// The actual default values are set in input_init().

var input, name, key, rebindable;

input = argument0;
name = argument1;
key = argument2;
rebindable = argument3;

// Store the input name.
ds_map_set(global.input_name_map, input, name);

// Store the keybind so the player can reset to default controls.
ds_map_set(global.input_keyboard_default_map, input, key);

// Store the keybind, unless it's been loaded from a config file.
if is_undefined(ds_map_get(global.input_keyboard_map, input)) {
    ds_map_set(global.input_keyboard_map, input, key);
}

// Keep a list of only the rebindable inputs, to know what to show on the rebind screen.
if rebindable {
    ds_list_add(global.input_rebindable_list, input);
}
