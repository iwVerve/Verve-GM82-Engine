///event_world_end_step()

with(TriggerManager) {
    event_user(1);
}

if is_in_game() && !global.paused {
    camera_update();
}
