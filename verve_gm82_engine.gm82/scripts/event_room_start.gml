///event_room_start()

room_speed = global.game_speed;

if !instance_exists(MusicPlayer) {
    music_play_room_bgm();
}

ds_map_clear(global.trigger_map);

camera_default();
camera_update();
camera_snap();
