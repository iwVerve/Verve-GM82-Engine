///engine_settings()

// You can edit these values to specify the behavior of your game.

// Enables dev keys
global.debug = true;

// The title of your game, used in the window bar and the default title screen.
global.game_title = "Verve GM8.2 Engine";
// The room you get loaded in on a new save file.
global.first_room = rSample;
// Size of the game window
global.game_width = 800;
global.game_height = 608;

// The location of all save data files.
global.save_folder = "save\";
// Modifies the volume of everything. Recommended to keep below 0.7.
global.sound_gain = 0.7;

global.difficulty_count = 4;
global.difficulty_names[0] = "Load Game";
global.difficulty_names[1] = "Medium";
global.difficulty_names[2] = "Hard";
global.difficulty_names[3] = "Very Hard";
global.difficulty_names[4] = "Impossible";
