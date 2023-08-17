#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

gravity = 0;
gravity_direction = 270;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field gravity: number
//field gravity_direction: angle

with(instance) {
    trigger_make(other.trigger);
    trg_gravity(other.gravity, other.gravity_direction);
}

instance_destroy();
