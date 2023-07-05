///option_sound_volume(type)
var _h_input;

switch(argument0) {

    case "include":
        return true;

    case "in_pause":
        return true;

    case "init":
        volume_option_timer = 0;
        sound_test_timer = 0;
        break;

    case "step":
        _h_input = input_check(key_menu_right) - input_check(key_menu_left);

        if _h_input != 0 {
            if volume_option_timer mod volume_option_period == 0 || volume_option_timer > volume_option_delay {
                config_set("sound_volume", clamp(config_get("sound_volume") + _h_input, 0, 100));
                sound_set_sound_volume(config_get("sound_volume") / 100);
            }
            volume_option_timer += 1;
        }
        else {
            volume_option_timer = 0;
        }

        sound_test_timer += 1;
        if sound_test_timer mod sound_test_delay == 0 {
            sound_play("player_shoot");
        }

        break;

    case "name":
        return "Sound Volume";

    case "value":
        return str_cat(config_get("sound_volume"), "%");

}
