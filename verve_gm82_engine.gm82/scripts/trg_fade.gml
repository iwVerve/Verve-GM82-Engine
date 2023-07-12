///trg_fade(in, duration);

if !global.trigger_making {
    switch argument[0] {
        case "init":
            fade_done = false;
            fade_alpha_start = 1;
            if fade_in {
                fade_time = 0;
                inst.mask_index = fade_mask;
            }
            else {
                fade_time = fade_duration;
                fade_alpha_start = inst.image_alpha;
            }
            break;
        case "step":
            if !fade_done {
                fade_time += pick(fade_in, -1, 1);
                image_alpha = fade_time / fade_duration;

                if fade_in && fade_time >= fade_duration {
                    image_alpha = 1;
                    fade_done = true;
                }
                else if !fade_in && fade_time <= 0 {
                    instance_destroy_id(inst);
                }

                inst.image_alpha = fade_alpha_start * image_alpha;
            }
            break;
    }
}
else {
    with(global.trigger_target) {
        fade_in = argument[0];
        fade_duration = argument[1];

        fade_mask = -1;

        ds_list_add(triggers_list, trg_fade);

        if fade_in {
            fade_mask = inst.mask_index;
            inst.mask_index = sprEmpty;
            inst.image_alpha = 0;
        }
    }
}
