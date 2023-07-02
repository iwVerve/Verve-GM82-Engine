///save_init()

global.save_file = "data/save";
global.save_current_file = "";

global.save_map = ds_map_create();
global.save_persistent_map = noone;
global.save_current = 0;
global.save_file_map = ds_map_create();
global.save_autosave = false;

save_read();
