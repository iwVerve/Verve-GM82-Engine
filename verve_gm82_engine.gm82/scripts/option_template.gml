///option_template(type)

switch(argument0) {

    case "include":
        // Whether show up in any options menu.
        return true;

    case "in_pause":
        // Whether to show up specifically in the pause options ("include" is still required).
        return true;

    case "init":
        // Runs when the option is selected
        break;

    case "step":
        // Runs every frame the option is selected.
        if input_check_pressed(key_menu_accept) || input_check_pressed(key_menu_left) || input_check_pressed(key_menu_right) {
            // Change the option
            sound_play("player_ground_jump");
        }
        break;

    case "end":
        // Runs when the option is deselected.
        break;

    case "name":
        // The displayed name of the option
        return "Display";

    case "value":
        // The displayed value of the option
        return ternary(true, "On", "Off");

}
