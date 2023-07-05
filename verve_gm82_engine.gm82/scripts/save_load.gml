///save_load()

// Loads the game.

with(Player) {
    instance_destroy();
}

ds_map_copy(global.save_map, global.save_persistent_map);

if save_get("saved") {
    global.grav = save_get("grav", 1);
    with(instance_create(save_get("x"), save_get("y"), Player)) {
        x_scale = save_get("x_scale", 1);
    }
}

room_goto(save_get("room"));
