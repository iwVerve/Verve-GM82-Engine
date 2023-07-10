///trg_move_to(x, y, speed, [relative=false, easing])
var f;

if !global.trigger_making {
    switch argument[0] {
        case "init":
            move_to_x_start = x;
            move_to_y_start = y;
            if move_to_relative {
                move_to_x += x;
                move_to_y += y;
            }
            move_to_duration = point_direction(x, y, move_to_x, move_to_y) / move_to_speed;
            move_to_time = 0;
            break;
        case "step":
            if move_to_time < move_to_duration {
                move_to_time += 1;
                f = move_to_time / move_to_duration;
                f = ease_value(f, move_to_ease);
                hspeed = lerp(move_to_x_start, move_to_x, f) - x;
                vspeed = lerp(move_to_y_start, move_to_y, f) - y;
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
        if argument_count > 3 {
            move_to_relative = argument[3];
        }
        move_to_ease = ease_none;
        if argument_count > 4 {
            move_to_ease = argument[4];
        }

        ds_list_add(triggers_list, trg_move_to);
    }
}
