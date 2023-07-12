///config_init()

// Initializes data holding the game options, here is where you set their default values as well.

// Stores the config data.
global.config_map = ds_map_create();
global.config_file = global.save_folder + "config";

// Stores every option, initialized in the following script.
global.options_list = ds_list_create();
option_list();

show_volume_check = true;
config_read();

// Default option values. Not strictly necessary for options that start at 0/false.
config_default("music_volume", 15);
config_default("sound_volume", 25);
config_default("fullscreen", false);
config_default("smoothing", false);

// Apply the saved options.
window_set_fullscreen(config_get("fullscreen"));
sound_set_music_volume(config_get("music_volume") / 100);
sound_set_sound_volume(config_get("sound_volume") / 100);
