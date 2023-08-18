#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

target_trigger = 0;
activate = false;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field target_trigger: value
//field activate: bool

with(instance) {
    trigger_make(other.trigger);
    trg_trigger(other.target_trigger, other.activate);
}

instance_destroy();
