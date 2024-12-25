///save_save_asap([not_immediate=false], [impossible=false])

// If not_immediate, doesn't save even if the player exists right now -
// intended to be called immediately before a room transition.
var _not_immediate;

if save_get("difficulty") == 3 {
    if argument_count <= 1 {
        exit;
    }
    if !argument[1] {
        exit;
    }
}

_not_immediate = false;
if argument_count > 0 {
    _not_immediate = argument[0];
}

if instance_exists(Player) && !_not_immediate {
    save_save();
}
else {
    global.save_autosave = true;
}
