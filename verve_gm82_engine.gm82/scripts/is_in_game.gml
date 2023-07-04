///is_in_game()

switch(room) {
    case rInit:
    case rTitle:
    case rMenu:
    case rOptions:
        return false;

    default:
        return true;
}
