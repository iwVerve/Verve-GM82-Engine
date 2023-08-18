///save_save_asap([impossible=false])

if save_get("difficulty") == 3 {
    if argument_count == 0 {
        exit;
    }
    if !argument[0] {
        exit;
    }
}

if instance_exists(Player) {
    save_save();
}
else {
    global.save_autosave = true;
}
