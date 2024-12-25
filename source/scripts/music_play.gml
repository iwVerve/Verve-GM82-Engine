///music_play(music, loop)
var _music, _loop;

_music = argument0;
_loop = argument1;

if _music == music_none {
    music_stop();
}
else if _music == music_no_change {
    // Do nothing
}
else if global.current_music != _music {
    if _music != "" {
        if _loop {
            global.current_music_instance = sound_loop(_music);
        }
        else {
            global.current_music_instance = sound_play(_music);
        }
    }
    global.current_music = _music;
}
