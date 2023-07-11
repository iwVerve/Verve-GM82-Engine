///trg_string(code);

if !global.trigger_making {
    switch argument[0] {
        case "init":
            execute_string(string_string);
            break;
    }
}
else {
    with(global.trigger_target) {
        string_string = argument[0];

        ds_list_add(triggers_list, trg_string);
    }
}
