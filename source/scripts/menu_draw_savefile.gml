///menu_draw_savefile(index, x, y)

// Draws a savefile on the file select screen.
// Must be called by the Menu object.

var i, _index, xx, yy, _selected, _top_text;

_index = argument0;
xx = argument1;
yy = argument2;
_selected = (current_file == _index);

save_select(_index);

draw_sprite(sprFileBackground, 0, xx, yy);

draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(fDefaultLarge);
draw_text(xx + 64, yy, str_cat("Save ", _index + 1));

draw_set_font(fDefaultSmall);

if !_selected || state == state_not_selected {
    if save_get("exists") {
        _top_text = global.difficulty_names[save_get("difficulty") + 1];

        draw_set_halign(fa_left);
        draw_text(xx + 8, yy + 70, str_cat("Deaths: ", save_get("deaths")));
        draw_text(xx + 8, yy + 90, str_cat("Time: ", get_formatted_time(save_get("time"))));
    }
    else {
        _top_text = "No Data";
    }
}
else {
    if state == state_difficulty {
        _top_text = str_cat("< ", global.difficulty_names[current_difficulty + 1], " >");
    }
    else if state == state_overwrite {
        draw_text(xx + 64, yy - 100, "Are you sure" + lf + "you want to" + lf + "overwrite this save?");
        _top_text = ternary(current_overwrite == 1, "< Yes >", "< No >");
    }
}
draw_set_halign(fa_middle);
draw_text(xx + 64, yy + 49, _top_text);

for(i = 0; i < 4; i += 1) {
    if save_get(str_cat("item", i)) {
        draw_sprite(sprItem, 0, xx + 32 * i, yy + 128);
    }
    if save_get(str_cat("boss_item", i)) {
        draw_sprite(sprBossItem, 0, xx + 32 * i, yy + 160);
    }
}

if save_get("clear") {
    draw_set_font(fDefaultBig);
    draw_text(xx + 65, yy + 215, "Clear!");
}

if _selected {
    // Draw selection "cursor".
    for(i = 0; i < 7; i += 1) {
        if i == 3 {
            continue;
        }
        draw_sprite(sprCherry, animation_timer / 15, xx + 5 + 20 * i, yy + 310);
    }
    draw_sprite(sprPlayerIdle, animation_timer / 5, xx + 66, yy + 312);
}
