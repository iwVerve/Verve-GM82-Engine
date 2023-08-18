///save_default([index])

// Sets the default state of a save file, used when starting a new game.

if argument_count > 0 {
    save_select(argument[0]);
}

ds_map_clear(global.save_map);
ds_map_clear(global.save_persistent_map);

save_set_persistent("exists", false);
save_set_persistent("saved", false);

save_set_persistent("time", 0);
save_set_persistent("deaths", 0);
save_set_persistent("room", global.first_room);
save_set_persistent("grav", 1);
