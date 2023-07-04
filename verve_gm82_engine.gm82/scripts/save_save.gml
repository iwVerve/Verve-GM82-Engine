///save_save()

// Saves the game.
// The argument chooses between a proper save, and a light save that only updates deathtime.

if !instance_exists(Player) {
    exit;
}

save_set("saved", true);

save_set("x", Player.x);
save_set("y", Player.y);
save_set("x_scale", Player.x_scale);

ds_map_copy(global.save_persistent_map, global.save_map);

save_write();
