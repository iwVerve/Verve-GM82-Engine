#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Make sure only 1 World instance exists

// Other World create code goes to event_world_game_start() instead.

if (instance_number(object_index) > 1) {
    instance_destroy();
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///event_world_step()

// Code moved to script to allow multiple code windows open.
event_world_step();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///event_world_end_step()

// Code moved to script to allow multiple code windows open.
event_world_end_step();
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///event_game_start()

// Code moved to script to allow multiple code windows open.
event_game_start();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///event_room_start()

// Code moved to script to allow multiple code windows open.
event_room_start();
#define Other_30
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.close_button_pressed = true;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw pause screen

if global.paused {
    draw_pause_screen();
}
#define Trigger_Draw GUI
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw debug overlay
var _text, _player_x, _player_y, _player_align;

if is_in_game() && global.debug_overlay > 0 {
    _text = "";

    _player_x = "-";
    _player_y = "-";
    _player_align = "-";
    if instance_exists(Player) {
        _player_x = Player.x;
        _player_y = Player.y;
        _player_align = Player.x mod 3;
    }

    _text += str_cat("X: ", _player_x, " [", _player_align , "]", lf);
    _text += str_cat("Y: ", _player_y, lf);
    _text += str_cat("Room: ", room_get_name(room), " (", room, ")", lf);
    _text += str_cat("FPS: ", fps, lf);
    _text += lf;

    if global.debug_overlay == 1 {
        _text += "Toggle again to show debug keys.";
    }
    else {
        _text += str_cat("Hold ", key_get_name(global.debug_key), " to use debug keys", lf);
        _text += "[Home] - God mode" + lf;
        _text += "[End] - Infinite jump" + lf;
        _text += "[Insert] - Save" + lf;
        _text += "[PageUp] - Next room" + lf;
        _text += "[PageDown] - Previous room" + lf;
        _text += "[Delete] - Show mask" + lf;
        _text += "[Tab] - Warp to cursor" + lf;
        _text += "[W] - Warp to room by name" + lf;
        _text += "[G] - Flip gravity" + lf;
        _text += "[I] - Show invisible objects" + lf;
    }

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(fDefaultSmall);
    draw_text_outlined(16, 16, _text, c_white, c_black);
}
