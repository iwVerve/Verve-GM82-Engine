#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
respawn_delay = 100;
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible = true;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_yscale = global.grav * abs(image_yscale);
#define Collision_Player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if visible {
    with(Player) {
        air_jumps += 1;
        air_jumps = min(air_jumps, max_air_jumps);
    }

    visible = false;
    alarm[0] = respawn_delay;
}
