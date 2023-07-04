///event_game_start()

// The main initialization script.

engine_settings();

directory_create(working_directory + "\" + global.save_folder);

save_init();

config_init();

input_init();

sound_init();

render_init();

global.grav = 1;
global.close_button_pressed = false;

set_room_views();
io_set_roomend_clear(false);

room_goto_next();
