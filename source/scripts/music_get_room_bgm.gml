///music_get_room_bgm()

switch(room) {
    case rTitle:
    case rMenu:
    case rOptions:
    case rSample:
    case rSampleTriggers:
        return "guy_rock";

    case rSampleBoss:
        // objSampleBoss starts the room music. We don't want it stopped here.
        return music_no_change;

    default:
        return music_none;
}
