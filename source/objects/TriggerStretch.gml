#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

xscale = 0;
yscale = 0;
duration = 0;
easing = ease_none;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field xscale: number
//field yscale: number
//field duration: number
//field easing: enum(ease_none, ease_quad_in, ease_quad_out, ease_quad_inout, ease_exp_in, ease_exp_out, ease_exp_inout, ease_back_in, ease_back_out, ease_back_inout, ease_elastic_in, ease_elastic_out, ease_elastic_inout, ease_bounce_in, ease_bounce_out, ease_bounce_inout)

with(instance) {
    trigger_make(other.trigger);
    trg_stretch(other.xscale, other.yscale, other.duration, other.easing);
}

instance_destroy();
