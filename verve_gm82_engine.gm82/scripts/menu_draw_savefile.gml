///menu_draw_savefile(index, x, y)

// Draws a savefile on the file select screen.
// Must be called by the Menu object.

var i, index, xx, yy, selected, top_text;

index = argument0;
xx = argument1;
yy = argument2;
selected = (current_file == index);

save_select(index);

draw_sprite(sprFileBackground, 0, xx, yy);

draw_set_halign(fa_middle);
draw_set_valign(fa_top);
draw_set_color(c_black);
draw_set_font(fDefaultLarge);
draw_text(xx + 64, yy, str_cat("Save ", index + 1));

draw_set_font(fDefaultSmall);

if !selected || state == state_not_selected {
    if save_get("exists") {
        top_text = global.difficulty_names[save_get("difficulty") + 1];

        draw_set_halign(fa_left);
        draw_text(xx + 10, yy + 70, str_cat("Deaths: ", save_get("deaths")));
        draw_text(xx + 10, yy + 90, str_cat("Time: ", save_get("time")));
    }
    else {
        top_text = "No Data";
    }
}
else {
    if state == state_difficulty {
        top_text = str_cat("< ", global.difficulty_names[current_difficulty + 1], " >");
    }
    else if state == state_overwrite {
        top_text = ternary(current_overwrite == 1, "< Yes >", "< No >");
    }
}
draw_set_halign(fa_middle);
draw_text(xx + 64, yy + 49, top_text);

if selected {
    // Draw selection "cursor".
    for(i = 0; i < 7; i += 1) {
        if i == 3 {
            continue;
        }
        draw_sprite(sprCherry, animation_timer / 15, xx + 5 + 20 * i, yy + 310);
    }
    draw_sprite(sprPlayerIdle, animation_timer / 5, xx + 66, yy + 312);
}
