///menu_draw_savefile(index, x, y)
var index, xx, yy;

index = argument0;
xx = argument1;
yy = argument2;

draw_sprite(sprFileBackground, 0, xx, yy);

draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(fDefaultLarge);
draw_text(xx + 64, yy, str_cat("Save ", index));
