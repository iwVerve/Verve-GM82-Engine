///input_check_released(key)

// Checks if an input is currently held - equivalent to keyboard_check_released.
// You can find a list of keys in the project constants window.

var key;

key = input_get_key(argument0);
if is_undefined(key) {
    return false;
}

return keyboard_check_released(key);
