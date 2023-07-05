///update_window_caption()

// Sets the window caption to show the deathtime.

var _caption;

_caption = global.game_title;

if is_in_game() {
    _caption += str_cat(
        " - Deaths: ",
        save_get("deaths"),
        " - Time: ",
        get_formatted_time(save_get("time"))
    );
}

room_caption = _caption;
