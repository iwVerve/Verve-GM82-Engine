///save_select(index)

// Selects a different save file.

var map;

global.save_current = argument0;
global.save_current_file = str_cat(global.save_file, global.save_current);
map = ds_map_get(global.save_file_map, global.save_current);

if !is_undefined(map) {
    global.save_persistent_map = map;
}
else {
    global.save_persistent_map = ds_map_create();
    ds_map_set(global.save_file_map, global.save_current, global.save_persistent_map);
}

ds_map_copy(global.save_map, global.save_persistent_map);
