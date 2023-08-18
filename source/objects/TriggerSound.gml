#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

sound = 0;
volume = 1;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field sound: value
//field volume: number

with(instance) {
    trigger_make(other.trigger);
    trg_sound(other.sound, other.volume);
}

instance_destroy();
