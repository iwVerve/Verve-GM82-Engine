#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Make sure only 1 World instance exists

// Other World create code goes to event_world_game_start() instead.

if (instance_number(object_index) > 1) {
    instance_destroy();
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///event_world_step()

// Code moved to script to allow multiple code windows open.
event_world_step();
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///event_game_start()

// Code moved to script to allow multiple code windows open.
event_game_start();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///event_room_start()

// Code moved to script to allow multiple code windows open.
event_room_start();
