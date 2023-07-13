#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited();

hspd = 0;
vspd = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var _top, _bottom;

_top = bbox_top - max(global.grav, 0);
_bottom = bbox_bottom - min(global.grav, 0);

if speed == 0 && collision_rectangle(bbox_left, _top, bbox_right, _bottom, Player, false, false) {
    hspeed = hspd;
    vspeed = vspd;
}

event_inherited();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//field hspd: number
//field vspd: number
