///save_init()

// Actual save files also include the save file index, e.g. save0.
global.save_file = global.save_folder + "save";
global.save_current_file = "";

// Map holding the current saveable data.
global.save_map = ds_map_create();

// Map holding the current *saved* data. When you load the game, the save_map gets set from this one.
global.save_persistent_map = noone;

// The current save index. Currently, a couple places expect this to be only 0, 1, or 2.
global.save_current = 0;

// A map holding the persistent save maps for each save file, instead of reading them from disk each time.
global.save_file_map = ds_map_create();

// Used when you want to save as soon as the player object exists.
global.save_autosave = false;

save_read();
