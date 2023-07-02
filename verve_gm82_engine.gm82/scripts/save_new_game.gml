///save_new_game(difficulty)

save_default();
save_set_persistent("difficulty", argument0);
save_set_persistent("exists", true);

save_load();
