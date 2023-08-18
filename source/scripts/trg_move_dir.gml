///trg_move_dir(speed, direction, [relative=false]);

if !global.trigger_making {
    switch argument[0] {
        case "init":
            if move_dir_relative {
                hspeed += lengthdir_x(move_dir_speed, move_dir_direction);
                vspeed += lengthdir_y(move_dir_speed, move_dir_direction);
            }
            else {
                hspeed = lengthdir_x(move_dir_speed, move_dir_direction);
                vspeed = lengthdir_y(move_dir_speed, move_dir_direction);
            }
            break;
    }
}
else {
    with(global.trigger_target) {
        move_dir_speed = argument[0];
        move_dir_direction = argument[1];
        move_dir_relative = false;
        if argument_count > 2 {
            move_dir_relative = argument[2];
        }

        ds_list_add(triggers_list, trg_move_dir);
    }
}
