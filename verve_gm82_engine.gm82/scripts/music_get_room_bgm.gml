///music_get_room_bgm()

switch(room) {
    case rTitle:
    case rMenu:
    case rOptions:
    case rSample:
    case rSampleTriggers:
        return "guy_rock";

    case rSampleBoss:
        return "megaman";

    default:
        return "";
}
