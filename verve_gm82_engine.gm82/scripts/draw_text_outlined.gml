///draw_text_outlined(x, y, string, text_color, outline_color, [outline_width=1], [detail=8])
var i, xx, yy, str, text_color, outline_color, outline_width, detail, angle, x_off, y_off;

xx = argument[0];
yy = argument[1];
str = argument[2];
text_color = argument[3];
outline_color = argument[4];
outline_width = 1;
if argument_count > 5 {
    outline_width = argument[5];
}
detail = 8;
if argument_count > 6 {
    detail = argument[6];
}

draw_set_color(outline_color);

for(i = 0; i < detail; i += 1) {
    angle = i/detail * 360;
    draw_text(
        xx + lengthdir_x(outline_width, angle),
        yy + lengthdir_y(outline_width, angle),
        str
    );
}

draw_set_color(text_color);
draw_text(xx, yy, str);
