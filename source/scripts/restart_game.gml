///restart_game()

// Restarts the game without calling game_restart().

instance_activate_all();
sound_stop_all();
global.paused = false;
save_write();

room_goto(rTitle);
