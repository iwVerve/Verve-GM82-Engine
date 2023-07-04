///get_formatted_time(seconds, [format=0])
var total_seconds, format, str, hours, minutes, seconds;

total_seconds = argument[0];
format = 0;
if argument_count > 1 {
    format = argument[1];
}

//hh:mm:ss
if format == 0 {
    total_seconds = floor(total_seconds);

    hours = string(floor(total_seconds / 3600));
    if string_length(hours) < 2 {
        hours = "0" + hours;
    }

    minutes = string(floor((total_seconds mod 3600) / 60));
    if string_length(minutes) < 2 {
        minutes = "0" + minutes;
    }

    seconds = string(floor(total_seconds mod 60));
    if string_length(seconds) < 2 {
        seconds = "0" + seconds;
    }

    return str_cat(hours, ":", minutes, ":", seconds);
}
