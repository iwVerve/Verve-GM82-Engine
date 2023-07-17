///save_init()

// Initializes the save module.

/*doc
# Save module
The save module takes care of the save game data - this does not include game
options, handled by the config module.

Save data is stored in the save maps. The regular `global.save_map` holds all
the current values which get saved, while `global.save_persistent_map` holds
the actual saved information which can get loaded.

`save_set(key, value)` and `save_get(key)` are used to access saveable data.
Example keys include "x", "deaths", or "item1".

Values don't need to be initialized anywhere - if you try to get a value that hasn't
been set previously, the `default` argument is returned instead, or 0 by default.

`save_set_persistent(key, value)` saves a value to the persistent map as well,
autosaving that specific value even if you load the game immediately.

`save_save()` and `save_load()` save and load the current file.
`save_save_asap()` either saves if the player exists, or sets the ausotsave global
to save as soon as the player exists. This can be for example useful for cutscenes.

`save_write()` and `save_read()` handle storing to and reading from disk.
`save_write` runs every time you save, meaning no matter how the game closes
you can't lose much progress. `save_read` only runs once at game start.

The save functions all operate on the current savefile. `save_select()` selects
what the current savefile is.
*/

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
