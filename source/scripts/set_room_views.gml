///set_room_views()

// Sets up the same view for each room.

var r, _width, _height;

_width = global.game_width;
_height = global.game_height;

for (r = room_first; r != -1; r = room_next(r)) {
    room_set_view_enabled(r, true);
    room_set_view(r, 0, true, 0, 0, _width, _height, 0, 0, _width, _height, 0, 0, 0, 0, noone);
}
