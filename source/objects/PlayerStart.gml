#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Create the player only if they don't already exist.

if !instance_exists(Player) {
    instance_create(x + 17, y + 23, Player);
}
