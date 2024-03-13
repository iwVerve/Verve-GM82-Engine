///input_reset_keys()

// Resets keybinds to their defaults, set in input_init.

var i, _input, _key;

for (i = 0; i < ds_list_size(global.input_rebindable_list); i += 1) {
    _input = ds_list_find_value(global.input_rebindable_list, i);
    _key = ds_map_find_value(global.input_keyboard_default_map, _input);
    input_set_key(_input, _key);
}
