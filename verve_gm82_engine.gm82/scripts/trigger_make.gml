///trigger_make(trigger)
var manager;

manager = noone;
with(TriggerManager) {
    if trigger == argument0 && inst == other.id {
        manager = id;
    }
}

if manager == noone {
    manager = instance_create(x, y, TriggerManager);
    manager.trigger = argument0;
    manager.inst = id;
}

global.trigger_target = manager;
