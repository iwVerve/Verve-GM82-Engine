///save_new_game(difficulty)

// Starts a new game on the current save file.

save_default();
save_set_persistent("difficulty", argument0);
save_set_persistent("exists", true);

save_load();
