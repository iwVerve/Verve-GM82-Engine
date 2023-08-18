///save_get(key, [default=0])

// Gets a saved value. If it hasn't been set previously, default is returned.

if ds_map_exists(global.save_map, argument[0]) {
    return ds_map_get(global.save_map, argument[0]);
}
if argument_count > 1 {
    return argument[1];
}
return 0;
