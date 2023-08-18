///event_world_end_step()

// Called from the World object.

with(TriggerManager) {
    event_user(1);
}

if is_in_game() && !global.paused {
    camera_update();
}
