///input_check_pressed(key)

// Checks if an input is currently held - equivalent to keyboard_check_pressed.
// You can find a list of keys in the project constants window.

var key;

key = ds_map_get(global.input_keyboard_map, argument0);
if is_undefined(key) {
    return false;
}

return keyboard_check_pressed(key);
