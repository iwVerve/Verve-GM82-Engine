#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

code = ""
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field code: string

with(instance) {
    trigger_make(other.trigger);
    trg_string(other.code);
}

instance_destroy();
