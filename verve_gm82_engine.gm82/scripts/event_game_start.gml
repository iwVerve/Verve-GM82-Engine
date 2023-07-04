///event_game_start()

// The main initialization script.

engine_settings();

directory_create(working_directory + "\" + global.save_folder);

save_init();

config_init();

input_init();

sound_init();

render_init();

set_room_views();

global.game_started = false;
global.close_button_pressed = false;

room_goto_next();
