///music_get_room_bgm()

switch(room) {
    case rTitle:
    case rMenu:
    case rOptions:
    case rSample:
        return "guy_rock";

    case rSample02:
        return "megaman";

    default:
        return "";
}
