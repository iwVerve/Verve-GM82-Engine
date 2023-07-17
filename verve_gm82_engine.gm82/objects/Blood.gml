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
grav = random_range(0.1, 0.3) * global.grav;
gravity = grav;

sticked = false;
inst = noone;
offset_dist = 0;
offset_angle = 0;

stick_to_count = 3;
stick_to[0] = Block;
stick_to[1] = PlayerKiller;
stick_to[2] = Platform;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;

if !sticked {
    for(i = 0; i < stick_to_count; i += 1) {
        inst = instance_place(x, y, stick_to[i]);
        if inst != noone {
            sticked = true;
            offset_dist = point_distance(inst.x, inst.y, x, y);
            offset_angle = point_direction(inst.x, inst.y, x, y) - inst.image_angle;
            speed = 0;
            gravity = 0;
            break;
        }
    }
}
else {
    if instance_exists(inst) {
        if !place_meeting(x, y, inst) {
            sticked = false;
        }
        x = inst.x + lengthdir_x(offset_dist, offset_angle + inst.image_angle);
        y = inst.y + lengthdir_y(offset_dist, offset_angle + inst.image_angle);
    }
    else {
        sticked = false;
    }

    if !sticked {
        inst = noone;
        gravity = grav;
    }
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
