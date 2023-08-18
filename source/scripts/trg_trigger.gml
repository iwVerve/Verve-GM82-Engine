///trg_trigger(trigger, [activate=false]);

if !global.trigger_making {
    switch argument[0] {
        case "init":
            ds_map_set(global.trigger_map, trigger_trigger, trigger_activate);
            break;
    }
}
else {
    with(global.trigger_target) {
        trigger_trigger = argument[0];
        trigger_activate = false;
        if argument_count > 1 {
            trigger_activate = argument[1];
        }

        ds_list_add(triggers_list, trg_trigger);
    }
}
