///player_shoot()
var bullet;

if instance_number(Bullet) < 4 {
    bullet = instance_create(x, y - 3 * global.grav, Bullet);
    if x_scale < 0 {
        bullet.direction = 180;
    }
    sound_play("player_shoot");
}
