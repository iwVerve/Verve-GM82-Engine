///trg_stretch(xscale, yscale, duration, [easing]);
var f;

if !global.trigger_making {
    switch argument[0] {
        case "init":
            stretch_time = 0;
            stretch_done = false;

            stretch_xscale_start = inst.image_xscale;
            stretch_yscale_start = inst.image_yscale;
            break;
        case "step":
            if !stretch_done {
                stretch_time += 1;
                f = stretch_time / stretch_duration;
                f = ease_value(f, stretch_ease);
                inst.image_xscale = lerp(stretch_xscale_start, stretch_xscale, f);
                inst.image_yscale = lerp(stretch_yscale_start, stretch_yscale, f);

                if stretch_time >= stretch_duration {
                    stretch_done = true;
                }
            }
            break;
    }
}
else {
    with(global.trigger_target) {
        stretch_xscale = argument[0];
        stretch_yscale = argument[1];
        stretch_duration = argument[2];
        stretch_ease = ease_none;
        if argument_count > 3 {
            stretch_ease = argument[3];
        }

        ds_list_add(triggers_list, trg_stretch);
    }
}
