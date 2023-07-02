///save_load()

ds_map_copy(global.save_map, global.save_persistent_map);

room_goto(save_get("room"));

save_save(false);
