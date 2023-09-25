///sound_init()

// Searches for sound folders in the data\music\ and data\sound\ folders.
// Any file in those folders can be played using just their file name without
// the file extension.

var i, _file, _folders, _folders_count;

global.current_music = "";
global.current_music_instance = noone;

sound_global_volume(global.sound_gain);

// Sounds
_folders[0] = "data\sounds\";
_folders_count = 1;

if !directory_exists(_folders[0]) {
    show_error(
"Sound directory '" + _folders[0] + "' not found!

If you're a maker, make sure you copied the data folder included in the project folder.

If you're a player, make sure you unzipped the game and make sure a data folder was provided with the game.",
     false);
}

for (_file = file_find_first(_folders[0] + "*", fa_directory); _file != ""; _file = file_find_next()) {
    if directory_exists(_folders[0] + _file) && _file != "." && _file != ".." {
        _folders[_folders_count] = _folders[0] + _file;
        _folders_count += 1;
    }
}
file_find_close();

for (i = 0; i < _folders_count; i += 1) {
    sound_add_directory(_folders[i], ".wav", 0, 1);
    sound_add_directory(_folders[i], ".ogg", 3, 2);
    sound_add_directory(_folders[i], ".mp3", 3, 2);
}

// Music
_folders[0] = "data\music\";
_folders_count = 1;

if !directory_exists(_folders[0]) {
    show_error(
"Music directory '" + _folders[0] + "' not found!

If you're a maker, make sure you copied the data folder included in the project folder.

If you're a player, make sure you unzipped the game and make sure a data folder was provided with the game.",
     false);
}

for (_file = file_find_first(_folders[0] + "*", fa_directory); _file != ""; _file = file_find_next()) {
    if directory_exists(_folders[0] + _file) && _file != "." && _file != ".." {
        _folders[_folders_count] = _folders[0] + _file;
        _folders_count += 1;
    }
}
file_find_close();

for (i = 0; i < _folders_count; i += 1) {
    sound_add_directory(_folders[i], ".wav", 1, 1);
    sound_add_directory(_folders[i], ".ogg", 1, 1);
    sound_add_directory(_folders[i], ".mp3", 1, 1);
}

sound_balance();
