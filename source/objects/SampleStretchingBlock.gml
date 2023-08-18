#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

time = 0;
scale_min = 1;
scale_max = 3;
stretch_duration = 100;

xstart = x + sprite_width / 2;
ystart = y + sprite_height / 2;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var f;

f = dsin(360 / stretch_duration * time) / 2 + 0.5;

image_xscale = lerp(scale_min, scale_max, f);
image_yscale = image_xscale;

x = xstart - sprite_width / 2;
y = ystart - sprite_height / 2;

time += 1;
