#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
music = "";
loop = true;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/*desc
Sets the music for the current room. Takes priority over
music_get_room_bgm(), which can be used as well.
*/
//field music: string
//field loop: bool

music_play(music, loop);
