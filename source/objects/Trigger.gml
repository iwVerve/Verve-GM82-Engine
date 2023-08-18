#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
trigger = 0;
key = undefined;
sound = "";
volume = 1;
destroy = true;
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ds_map_find_value(global.trigger_map, trigger) {
    exit;
}

if !is_undefined(key) if !ds_map_find_value(global.trigger_map, key) {
    exit;
}

if sound != "" {
    sound_play_ex(sound, volume);
}

ds_map_set(global.trigger_map, trigger, true);
if destroy {
    instance_destroy();
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field trigger: value
//field key: value
//field sound: string
//field volume: number(0, 1)
//field destroy: bool
