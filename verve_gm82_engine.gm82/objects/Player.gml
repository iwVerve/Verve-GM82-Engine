#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Behavior constants
ground_jump_speed = 8.5;
air_jump_speed = 7;
jump_release_multiplier = 0.45;
grav = 0.4;
max_air_jumps = 1;
max_vspeed = 9;
run_speed = 3;

// State
air_jumps = max_air_jumps;
gravity = grav * global.grav;
h_input = 0;
x_scale = 1;
has_bow = (save_get("difficulty") == 0);
on_floor = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

// Horizontal movement
h_input = input_check(key_right);
if h_input == 0 {
    h_input = -input_check(key_left);
}

if h_input != 0 {
    x_scale = h_input;
    hspeed = h_input * run_speed;
}
else {
    hspeed = 0;
}

// Vertical movement
if global.grav * vspeed > max_vspeed {
    vspeed = global.grav * max_vspeed;
}

if on_floor {
    if place_free(x, y + global.grav) {
        on_floor = false;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Actions

if input_check_pressed(key_jump) {
    player_try_jump();
}
if input_check_released(key_jump) {
    player_release_jump();
}
if input_check_pressed(key_shoot) {
    player_shoot();
}
if input_check_pressed(key_suicide) {
    player_kill();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Solid collision
var dist, dir;

// Gravity will be added by the time the player moves, but it hasn't been yet.
// We temporarily add it now to correct for this.
vspeed += gravity;

if !place_free(x + hspeed, y + vspeed) {
    if !place_free(x + hspeed, y) {
        // Horizontal collision
        dist = abs(hspeed);
        dir = 180 * (hspeed < 0);
        
        move_contact_solid(dir, dist);
        hspeed = 0;
    }
    
    if !place_free(x, y + vspeed) {
        // Vertical collision
        dist = abs(vspeed);
        dir = 90 + 180 * (vspeed > 0);
        
        move_contact_solid(dir, dist);
        
        if vspeed < 0 {
            player_hit_ceiling();
        }
        else {
            player_land();
        }
    }
    
    if !place_free(x + hspeed, y + vspeed) {
        // If there is still a collision after the previous checks, the player
        // is moving against a corner.
        hspeed = 0;
    }
}

vspeed -= gravity;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player animation

if on_floor {
    if h_input != 0 {
        sprite_index = sprPlayerRun;
        image_speed = 0.5;
    }
    else {
        sprite_index = sprPlayerIdle;
        image_speed = 0.2;
    }
}
else {
    if vspeed * global.grav < 0 {
        sprite_index = sprPlayerJump;
        image_speed = 0.5;
    }
    else {
        sprite_index = sprPlayerFall;
        image_speed = 0.5;
    }
}
#define Collision_Platform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var feet_y, platform_floor, clamped_platform_vspeed, landed_on_platform, jumped_out, yy, dir;

feet_y = ternary(global.grav == 1, bbox_bottom, bbox_top);
platform_floor = ternary(global.grav == 1, other.bbox_top, other.bbox_bottom);
upwards_platform_vspeed = global.grav * min(global.grav * other.vspeed, 0);
downwards_platform_vspeed = global.grav * max(global.grav * other.vspeed, 0);

// Whether the player was above the platform on the previous frame.
// Since we are touching on this frame, we must have just landed if this is true.
landed_on_platform = global.grav * (feet_y - vspeed - global.grav) <= global.grav * (platform_floor - upwards_platform_vspeed);
// Whether we are about to jump through the platform from below.
jumped_out = global.grav * (feet_y + vspeed) <= global.grav * (platform_floor + other.vspeed);

if landed_on_platform || (jumped_out && other.snap) {
    // Target y position to snap to
    yy = platform_floor + y - feet_y;

    y = floor(yy);
    if other.hspeed != 0 {
        move_contact_solid(180 * (other.hspeed < 0), abs(other.hspeed));
    }

    vspeed = downwards_platform_vspeed;
    on_floor = true;
    air_jumps = max_air_jumps;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if !is_in_game() {
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Prevent some drawing issues
var draw_x, draw_y;

// Round draw coordinates to prevent jitter.
draw_x = floor(x + 0.5);
draw_y = floor(y + 0.5);

// Draw the player
draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, x_scale, image_yscale * global.grav, image_angle, image_blend, image_alpha);

// Draw the bow
if has_bow {
    draw_sprite_ext(sprPlayerBow, image_index, draw_x, draw_y, x_scale, image_yscale * global.grav, image_angle, image_blend, image_alpha);
}
