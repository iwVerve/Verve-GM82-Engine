///trg_rotate(angle, duration, [relative=false, easing]);
var f;

if !global.trigger_making {
    switch argument[0] {
        case "init":
            rotate_time = 0;
            rotate_done = false;

            rotate_angle_start = inst.image_angle;
            rotate_angle_end = rotate_angle;
            if rotate_relative {
                rotate_angle_end += inst.image_angle;
            }
            break;
        case "step":
            if !rotate_done {
                rotate_time += 1;
                f = rotate_time / rotate_duration;
                f = ease_value(f, rotate_ease);
                inst.image_angle = lerp(rotate_angle_start, rotate_angle_end, f);
                if rotate_time >= rotate_duration {
                    rotate_done = 0;
                }
            }
            break;
    }
}
else {
    with(global.trigger_target) {
        rotate_angle = argument[0];
        rotate_duration = argument[1];
        rotate_relative = false;
        rotate_ease = ease_none;
        if argument_count > 2 {
            rotate_relative = argument[2];
        }
        if argument_count > 3 {
            rotate_ease = argument[3];
        }

        ds_list_add(triggers_list, trg_rotate);
    }
}
