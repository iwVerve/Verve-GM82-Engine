#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
file_count = 3;
file_first_x = 96;
file_x_separation = 240;
file_y = 160;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var i;

for(i = 0; i < file_count; i += 1) {
    menu_draw_savefile(i, file_first_x + i * file_x_separation, file_y);
}
