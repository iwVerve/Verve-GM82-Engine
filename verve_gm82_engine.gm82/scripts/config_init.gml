///config_init()

// Initializes data holding the game options, here is where you set their default values as well.

global.config_map = ds_map_create();
global.config_file = global.save_folder + "config";

global.options_list = ds_list_create();
option_list();

config_read();

config_default("music_volume", 25);
config_default("sound_volume", 25);
config_default("fullscreen", false);
config_default("smoothing", false);

window_set_fullscreen(config_get("fullscreen"));
sound_set_music_volume(config_get("music_volume") / 100);
sound_set_sound_volume(config_get("sound_volume") / 100);

config_write();
