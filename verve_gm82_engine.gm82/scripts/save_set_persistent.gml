///save_set(key, value)

// Sets a saved value. It will stay saved even if the game doesn't get saved.

save_set(argument0, argument1);
ds_map_set(global.save_persistent_map, argument0, argument1);
