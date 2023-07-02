///save_get(key, [default=0])

if ds_map_exists(global.save_map, argument[0]) {
    return ds_map_get(global.save_map, argument[0]);
}
if argument_count > 1 {
    return argument[1];
}
return 0;
