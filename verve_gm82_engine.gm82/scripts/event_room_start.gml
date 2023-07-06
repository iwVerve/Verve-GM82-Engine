///event_room_start()

room_speed = global.game_speed;

if !instance_exists(MusicPlayer) {
    music_play_room_bgm();
}

camera_update();
camera_snap();
