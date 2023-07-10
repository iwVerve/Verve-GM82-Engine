///trg_move(hspeed, vspeed, [relative=false])

if !global.trigger_making {
    switch argument[0] {
        case "init":
            if move_relative {
                hspeed += move_hspeed;
                vspeed += move_vspeed;
            }
            else {
                hspeed = move_hspeed;
                vspeed = move_vspeed;
            }
            break;
    }
}
else {
    with(global.trigger_target) {
        move_hspeed = argument[0];
        move_vspeed = argument[1];
        move_relative = false;
        if argument_count > 2 {
            move_relative = argument[2];
        }

        ds_list_add(triggers_list, trg_move);
    }
}
