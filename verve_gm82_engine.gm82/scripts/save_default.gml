///save_default([index])

if argument_count > 0 {
    save_select(argument[0]);
}

save_set_persistent("exists", false);
save_set_persistent("saved", false);

save_set_persistent("time", 0);
save_set_persistent("deaths", 0);
save_set_persistent("room", global.first_room);
