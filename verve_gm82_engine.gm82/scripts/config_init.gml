///config_init()

// Initializes data holding the game options, here is where you set their default values as well.

global.config_map = ds_map_create();
global.config_file = global.save_folder + "config";

global.options_list = ds_list_create();
option_list();

config_read();

config_default("fullscreen", false);

config_write();
