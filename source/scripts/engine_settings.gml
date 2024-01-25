///engine_settings()

// You can edit these values to specify the behavior of your game.

// Enable dev keys
// Debug keybinds are listed in the debug overlay activated with backspace.
global.debug = true;
// Set to noone to use no debug key, e.g. yoyoyo engine behavior.
global.debug_key = vk_control;

// Game properties
    // The title of your game, used in the window bar and the default title screen.
    global.game_title = "Verve GM8.2 Engine";
    // The room you get loaded in on a new save file.
    global.first_room = rSample;
    // Size of the game window.
    global.game_width = 800;
    global.game_height = 608;
    // The framerate the game runs at.
    global.game_speed = 50;
    // Modifies the volume of everything. Recommended to keep below 0.7.
    global.sound_gain = 0.7;
    // Makes time increment when the player is dead.
    global.time_when_dead = false;
    // Makes time increment when the save is considered cleared.
    global.time_when_clear = false;
    // Makes collected items and boss items save immediately.
    global.autosave_items = false;
    // The location of all save data files.
    global.save_folder = "save\";
    // The password used to encrypt save files. "" means no encryption.
    global.save_encryption_password = "verve";
    //
    global.optimize_solids = 2;

// Player behavior
    // Makes the player die once they entirely leave the room.
    global.killer_room_border = true;
    // Makes platforms push the player into a ceiling instead of making them fall through.
    global.strong_platforms = true;
    // Makes moving platforms/blocks crush the player.
    global.solids_crush = true;
    // Stops whatever keys the player was holding on certain transitions.
    // Useful in e.g. very cramped needle where running into a warp can easily result in death.
    global.clear_input_on_warp = false;
    global.clear_input_on_restart = false;

// Difficulties
    global.difficulty_count = 4;
    global.difficulty_names[0] = "Load Game";
    global.difficulty_names[1] = "Medium";
    global.difficulty_names[2] = "Hard";
    global.difficulty_names[3] = "Very Hard";
    global.difficulty_names[4] = "Impossible";

// Default camera
    // Whether the camera is active - you might want to disable it in e.g. a cutscene.
    global.camera_enabled_default = true;
    // The default size of the camera, a smaller size zooms in.
    global.camera_width_default = global.game_width;
    global.camera_height_default = global.game_height;
    // The lerp value used to smooth the camera movement. 1 means no smoothing.
    global.camera_lerp_default = 0.25;
    // Whether the camera is allowed to move outside the room.
    global.camera_leave_room_default = false;
    // Whether the camera is locked to a screen grid instead of following the player.
    global.camera_screen_lock_default = true;
    global.camera_target_default = Player;
