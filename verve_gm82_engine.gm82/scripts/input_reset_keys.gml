///input_reset_keys()

// Resets keybinds to their defaults, set in input_init.

var i, input, key;

for (i = 0; i < ds_list_size(global.input_rebindable_list); i += 1) {
    input = ds_list_find_value(global.input_rebindable_list, i);
    key = ds_map_find_value(global.input_keyboard_default_map, i);
    input_set_key(input, key);
}
