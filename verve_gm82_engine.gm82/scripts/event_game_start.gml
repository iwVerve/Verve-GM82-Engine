///event_game_start()

engine_settings();

directory_create(working_directory+"/data");
save_init();
config_init();
input_init();

global.game_started = false;

room_goto_next();
