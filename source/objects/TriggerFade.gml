#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

in = false;
duration = 0;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field in: bool
//field duration: number

with(instance) {
    trigger_make(other.trigger);
    trg_fade(other.in, other.duration);
}

instance_destroy();
