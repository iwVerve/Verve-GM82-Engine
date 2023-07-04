///player_kill()

with(Player) {
    save_set_persistent("deaths", save_get("deaths") + 1);
    instance_create(x, y, BloodEmitter);
    sound_play("player_death");

    instance_destroy();
}
