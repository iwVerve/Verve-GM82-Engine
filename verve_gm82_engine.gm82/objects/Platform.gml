#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
snap = true;
bounce = true;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if speed != 0 {
    if bounce {
        if !place_free(x + hspeed, y) {
            hspeed *= -1;
        }
        if !place_free(x, y + vspeed) {
            vspeed *= -1;
        }
    }

    if global.grav * vspeed > 0 {
//        if place_meeting(x, y - global.grav, Player) {
            with(Player) {
                if !place_meeting(x, y, other) if place_meeting(x, y + 2 * global.grav, other) {
                    move_contact_solid(90 + 180 * (global.grav == 1), abs(other.vspeed));
                }
            }
//        }
    }
}
