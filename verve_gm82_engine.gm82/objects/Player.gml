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
on_vine = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement
var current_max_vspeed;



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
current_max_vspeed = max_vspeed;
if place_meeting(x, y, Water) {
    current_max_vspeed = 2;
    if place_meeting(x, y, WaterRefreshing) {
        air_jumps = max_air_jumps;
    }
}
if global.grav * vspeed > current_max_vspeed {
    vspeed = global.grav * current_max_vspeed;
}

if on_floor {
    if place_free(x, y + global.grav) && !place_meeting(x, y + 2 * global.grav, Platform) {
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
/// Vines
var on_vine_left, on_vine_right;

on_vine_left = place_meeting(x - 1, y, VineLeft);
on_vine_right = place_meeting(x + 1, y, VineRight);

on_vine = on_vine_left || on_vine_right;

if on_vine {
    if on_vine_right {
        x_scale = -1;
    }
    else {
        x_scale = 1;
    }

    vspeed = 2 * global.grav;

    if (on_vine_left && input_check_pressed(key_right)) || (on_vine_right && input_check_pressed(key_left)) {
        if input_check(key_jump) {
            hspeed = 15;
            vspeed = -9 * global.grav;
            sound_play("player_wall_jump");
        }
        else {
            hspeed = 3;
        }

        if on_vine_right {
            hspeed *= -1;
        }
    }
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
/// Platform collision
var feet_y, platform_floor, upwards_platform_vspeed, downwards_platform_vspeed, landed_on_platform, jumped_out, yy, dir;

feet_y = ternary(global.grav == 1, bbox_bottom, bbox_top);

with(Platform) {
    if !place_meeting(x, y - global.grav, Player) {
        continue;
    }

    platform_floor = ternary(global.grav == 1, bbox_top, bbox_bottom);
    upwards_platform_vspeed = global.grav * min(global.grav * vspeed, 0);
    downwards_platform_vspeed = global.grav * max(global.grav * vspeed, 0);

    // Whether the player was above the platform on the previous frame.
    // Since we are touching on this frame, we must have just landed if this is true.
    landed_on_platform = global.grav * (feet_y - other.vspeed - global.grav) <= global.grav * (platform_floor - upwards_platform_vspeed);
    // Whether we are about to jump through the platform from below.
    jumped_out = global.grav * (feet_y + other.vspeed) <= global.grav * (platform_floor + vspeed);

    if landed_on_platform || (jumped_out && snap) {
        with(other) {
            // Target y position to snap to
            yy = platform_floor + y - feet_y - global.grav;

            y = floor(yy);
            if other.hspeed != 0 {
                if !place_free(x + other.hspeed, y) {
                    move_contact_solid(180 * (other.hspeed < 0), abs(other.hspeed));
                }
                else {
                    x += other.hspeed;
                }
            }

            vspeed = downwards_platform_vspeed - gravity;
            on_floor = true;
            air_jumps = max_air_jumps;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Killer collision

if place_meeting(x, y, PlayerKiller) {
    player_kill();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player animation

if on_vine {
    sprite_index = sprPlayerSlide;
    image_speed = 0.5;
}
else if on_floor {
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