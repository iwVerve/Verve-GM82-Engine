///restart_game()

instance_activate_all();
global.paused = false;
save_write();

room_goto(rTitle);
