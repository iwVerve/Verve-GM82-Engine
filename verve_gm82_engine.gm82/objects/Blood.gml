#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index = irandom(image_number - 1);
image_speed = 0;

direction = irandom(35) * 10;
speed = random(6);
gravity = random_range(0.1, 0.3) * global.grav;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if speed > 0 {
    if !place_free(x, y) {
        speed = 0;
        gravity = 0;
    }
}
