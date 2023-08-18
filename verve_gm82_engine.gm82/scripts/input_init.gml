///input_init()

// Sets up all the data necessary to allow for rebinds.
// This script also holds all the default values.
// The key constants are defined in the project's Used-Defined Constants window.

global.input_keyboard_file = global.save_folder + "keyboard";

// Stores the current keybinds.
global.input_keyboard_map = ds_map_create();

// Stores the original keybinds so the player can reset to default.
global.input_keyboard_default_map = ds_map_create();

// Stores the name of each input to be shown on the rebind screen.
global.input_name_map = ds_map_create();

// Stores which inputs are rebindable.
global.input_rebindable_list = ds_list_create();

input_read();

// Rebindable inputs
input_define(key_left,    "Left Button",    vk_left,  true);
input_define(key_right,   "Right Button",   vk_right, true);
input_define(key_up,      "Up Button",      vk_up,    true);
input_define(key_down,    "Down Button",    vk_down,  true);
input_define(key_jump,    "Jump Button",    vk_shift, true);
input_define(key_shoot,   "Shoot Button",   ord("Z"), true);
input_define(key_restart, "Restart Button", ord("R"), true);
input_define(key_skip,    "Skip Button",    ord("S"), true);
input_define(key_suicide, "Suicide Button", ord("Q"), true);
input_define(key_pause,   "Pause Button",   ord("P"), true);

// Unbindable inputs, hence no need for a name.
input_define(key_menu_left,    "", vk_left,  false);
input_define(key_menu_right,   "", vk_right, false);
input_define(key_menu_up,      "", vk_up,    false);
input_define(key_menu_down,    "", vk_down,  false);
input_define(key_menu_accept,  "", vk_shift, false);
input_define(key_menu_back,    "", ord("Z"), false);
input_define(key_menu_options, "", vk_enter, false);
