///draw_text_outlined(x, y, string, text_color, outline_color, [outline_width=1], [detail=8])
var i, xx, yy, _text, _text_color, _outline_color, _outline_width, _detail, _angle;

xx = argument[0];
yy = argument[1];
_text = argument[2];
_text_color = argument[3];
_outline_color = argument[4];
_outline_width = 1;
if argument_count > 5 {
    _outline_width = argument[5];
}
_detail = 8;
if argument_count > 6 {
    _detail = argument[6];
}

draw_set_color(_outline_color);

for(i = 0; i < _detail; i += 1) {
    _angle = i/_detail * 360;
    draw_text(
        xx + lengthdir_x(_outline_width, _angle),
        yy + lengthdir_y(_outline_width, _angle),
        _text
    );
}

draw_set_color(_text_color);
draw_text(xx, yy, _text);
