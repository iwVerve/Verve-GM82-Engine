///event_game_start()

// The main initialization script.

engine_settings();

directory_create(working_directory + "\" + global.save_folder);

save_init();
config_init();
input_init();
sound_init();
camera_init();
trigger_init();
render_init();

global.grav = 1;
global.close_button_pressed = false;

global.debug_god_mode = false;
global.debug_infinite_jump = false;
global.debug_show_mask = false;
global.debug_overlay = 0;

global.paused = false;

unmuted_music_volume = config_get("music_volume");

set_room_views();
io_set_roomend_clear(false);

room_goto_next();
