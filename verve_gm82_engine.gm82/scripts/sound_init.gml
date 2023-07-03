///sound_init()

// Searches for sound folders in the data\music\ and data\sound\ folders.
// Any file in those folders can be played using just their file name without
// the file extension.

var i, file, folders, folders_count;

sound_global_volume(global.sound_gain);

// Sounds
folders[0] = "data\sounds\";
folders_count = 1;

for (file = file_find_first(folders[0] + "*", fa_directory); file != ""; file = file_find_next()) {
    if directory_exists(folders[0] + file) && file != "." && file != ".." {
        folders[folders_count] = folders[0] + file;
        folders_count += 1;
    }
}
file_find_close();

for (i = 0; i < folders_count; i += 1) {
    sound_add_directory(folders[i], ".wav", 0, 1);
    sound_add_directory(folders[i], ".ogg", 3, 2);
    sound_add_directory(folders[i], ".mp3", 3, 2);
}

// Music
folders[0] = "data\music\";
folders_count = 1;

for (file = file_find_first(folders[0] + "*", fa_directory); file != ""; file = file_find_next()) {
    if directory_exists(folders[0] + file) && file != "." && file != ".." {
        folders[folders_count] = folders[0] + file;
        folders_count += 1;
    }
}
file_find_close();

for (i = 0; i < folders_count; i += 1) {
    sound_add_directory(folders[i], ".wav", 1, 1);
    sound_add_directory(folders[i], ".ogg", 1, 1);
    sound_add_directory(folders[i], ".mp3", 1, 1);
}
