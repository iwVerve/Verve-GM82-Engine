///trg_move_to(x, y, speed, [relative=false, easing])
var f;

if !global.trigger_making {
    switch argument[0] {
        case "init":
            move_to_x_start = x;
            move_to_y_start = y;
            move_to_x_end = move_to_x;
            move_to_y_end = move_to_y;
            if move_to_relative {
                move_to_x_end += x;
                move_to_y_end += y;
            }
            move_to_duration = point_distance(x, y, move_to_x_end, move_to_y_end) / move_to_speed;
            move_to_time = 0;
            break;
        case "step":
            if move_to_time < move_to_duration {
                move_to_time += 1;
                f = move_to_time / move_to_duration;
                f = ease_value(f, move_to_ease);
                hspeed = lerp(move_to_x_start, move_to_x_end, f) - x;
                vspeed = lerp(move_to_y_start, move_to_y_end, f) - y;
            }
            else {
                hspeed = 0;
                vspeed = 0;
            }
            break;
    }
}
else {
    with(global.trigger_target) {
        move_to_x = argument[0];
        move_to_y = argument[1];
        move_to_speed = argument[2];
        move_to_relative = false;
        move_to_ease = ease_none;
        if argument_count > 3 {
            move_to_relative = argument[3];
        }
        if argument_count > 4 {
            move_to_ease = argument[4];
        }

        ds_list_add(triggers_list, trg_move_to);
    }
}
