///is_in_game([room])
var _room;

_room = room;
if argument_count > 0 {
    _room = argument[0];
}

switch(_room) {
    case rInit:
    case rTitle:
    case rMenu:
    case rOptions:
        return false;

    default:
        return true;
}
