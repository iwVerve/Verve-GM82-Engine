#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
trigger = 0;
triggered = false;
inst = noone;

triggers_list = ds_list_create();
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Cleanup

event_user(0);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i, _trigger;

global.trigger_making = false;

if !triggered {
    if ds_map_find_value(global.trigger_map, trigger) {
        triggered = true;

        for (i = 0; i < ds_list_size(triggers_list); i += 1) {
            if !instance_exists(inst) {
                break;
            }
            _trigger = ds_list_find_value(triggers_list, i);
            script_execute(_trigger, "init");
        }
    }
}

if triggered {
    if !ds_map_find_value(global.trigger_map, trigger) {
        triggered = false;
    }

    for (i = 0; i < ds_list_size(triggers_list); i += 1) {
        if !instance_exists(inst) {
            break;
        }
        _trigger = ds_list_find_value(triggers_list, i);
        script_execute(_trigger, "step");
    }
}

global.trigger_making = true;
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Cleanup

event_user(0);
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Cleanup

ds_list_destroy(triggers_list);
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Late step

// Called from event_late_step()

if instance_exists(inst) {
    if triggered {
        inst.x = x;
        inst.y = y;
        inst.hspeed = hspeed;
        inst.vspeed = vspeed;
        inst.gravity = gravity;
        inst.gravity_direction = gravity_direction;
    }
    else {
        x = inst.x;
        y = inst.y;
        hspeed = inst.hspeed;
        vspeed = inst.vspeed;
        gravity = inst.gravity;
        gravity_direction = inst.gravity_direction;
    }
}
else {
    instance_destroy();
}
