///config_init()

// Initializes data holding the game options, here is where you set their default values as well.

global.config_map = ds_map_create();
global.config_file = "data/config";

config_read();

config_default("fullscreen", false);
