#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

hspeed = 0;
vspeed = 0;
relative = false;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field hspeed: number
//field vspeed: number
//field relative: bool

with(instance) {
    trigger_make(other.trigger);
    trg_move(other.hspeed, other.vspeed, other.relative);
}

instance_destroy();
