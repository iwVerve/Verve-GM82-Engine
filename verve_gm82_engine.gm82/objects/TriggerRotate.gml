#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

angle = 0;
duration = 0;
relative = false;
easing = ease_none;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field angle: number
//field duration: number
//field relative: bool
//field easing: enum(ease_none, ease_quad_in, ease_quad_out, ease_quad_inout, ease_exp_in, ease_exp_out, ease_exp_inout, ease_back_in, ease_back_out, ease_back_inout, ease_elastic_in, ease_elastic_out, ease_elastic_inout, ease_bounce_in, ease_bounce_out, ease_bounce_inout)

with(instance) {
    trigger_make(other.trigger);
    trg_rotate(other.angle, other.duration, other.relative, other.easing);
}

instance_destroy();
