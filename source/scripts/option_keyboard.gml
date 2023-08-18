///option_keyboard(type)

switch(argument0) {

    case "include":
        return true;

    case "in_pause":
        return true;

    case "step":
        if input_check_pressed(key_menu_accept) || input_check_pressed(key_menu_left) || input_check_pressed(key_menu_right) {
            state = state_keyboard_controls;
            current_key = 0;
            sound_play("player_ground_jump");
        }
        break;

    case "name":
        return "Keyboard Controls";

    case "value":
        return "";

}
