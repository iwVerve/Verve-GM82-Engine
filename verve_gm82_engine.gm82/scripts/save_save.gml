///save_save(save_position)

if argument0 {
    save_set("saved", true);
    ds_map_copy(global.save_persistent_map, global.save_map);
}

save_set_persistent("deaths", save_get("deaths"));
save_set_persistent("time", save_get("time"));

save_write();
