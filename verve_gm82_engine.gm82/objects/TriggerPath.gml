#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

path = 0;
speed = 0
absolute = false;
action = path_action_stop;
position = 0;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();
//field path: path
//field speed: number
//field absolute: bool
//field action: enum(path_action_stop, path_action_restart, path_action_reverse, path_action_continue)
//field position: number

var maker;
maker = id;

with(instance) {
    trigger_make(maker.trigger);
    trg_path(maker.path, maker.speed, maker.absolute, maker.action, maker.position);
}

instance_destroy();
