///trg_path(path, speed, [absolute=false, action=path_action_stop, position=0])

if !global.trigger_making {
    switch argument[0] {
        case "init":
            path_start(path_path, path_spd, path_action, path_absolute);
            path_position = path_pos;
            break;
    }
}
else {
    with(global.trigger_target) {
        path_path = argument[0];
        path_spd = argument[1];
        path_absolute = false;
        path_action = path_action_stop;
        path_pos = 0;
        if argument_count > 2 {
            path_absolute = argument[2];
        }
        if argument_count > 3 {
            path_action = argument[3];
        }
        if argument_count > 4 {
            path_pos = argument[4];
        }

        ds_list_add(triggers_list, trg_path);
    }
}
