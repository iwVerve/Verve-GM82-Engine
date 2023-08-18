///trg_gravity(gravity, [gravity_direction=270]);

if !global.trigger_making {
    switch argument[0] {
        case "init":
            gravity = gravity_gravity;
            gravity_direction = gravity_gravity_direction;
            break;
    }
}
else {
    with(global.trigger_target) {
        gravity_gravity = argument[0];
        gravity_gravity_direction = 270;
        if argument_count > 1 {
            gravity_gravity_direction = argument[1];
        }

        ds_list_add(triggers_list, trg_gravity);
    }
}
