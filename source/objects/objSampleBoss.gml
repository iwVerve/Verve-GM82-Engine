#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale = 5;
image_yscale = 5;
image_speed = 1/15;

vspeed = choose(-1, 1) * 3;

max_hp = 25;
hp = max_hp;

slow_shot_delay = 50;
fast_shot_delay = 72;

alarm[0] = slow_shot_delay;
alarm[1] = fast_shot_delay;

music_play("megaman", true);
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(Player) {
    with(instance_create(x, y, objSampleBossCherry)) {
        move_towards_point(Player.x, Player.y, 5);
    }

    alarm[0] = slow_shot_delay;
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if instance_exists(Player) {
    with(instance_create(x, y, objSampleBossCherry)) {
        move_towards_point(Player.x, Player.y, 8);
    }

    alarm[1] = fast_shot_delay;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !place_free(x, y + vspeed) {
    vspeed *= -1;
}
#define Collision_Bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy_other();
sound_play("boss_hit");

hp -= 1;
if hp <= 0 {
    sound_play("player_death");
    instance_destroy();
    with(objSampleBossItem) {
        visible = true;
        mask_index = -1;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Draw healthbar

draw_self();

draw_healthbar(0, 0, 799, 15, 100 * hp/max_hp, c_black, c_red, c_red, 0, true, true);
