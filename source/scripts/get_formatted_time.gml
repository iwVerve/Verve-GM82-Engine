///get_formatted_time(seconds, [format=0])
var _total_seconds, _format, _hours, _minutes, _seconds;

_total_seconds = argument[0];
_format = 0;
if argument_count > 1 {
    _format = argument[1];
}

//hh:mm:ss
if _format == 0 {
    _total_seconds = floor(_total_seconds);

    _hours = string(floor(_total_seconds / 3600));
    if string_length(_hours) < 2 {
        _hours = "0" + _hours;
    }

    _minutes = string(floor((_total_seconds mod 3600) / 60));
    if string_length(_minutes) < 2 {
        _minutes = "0" + _minutes;
    }

    _seconds = string(floor(_total_seconds mod 60));
    if string_length(_seconds) < 2 {
        _seconds = "0" + _seconds;
    }

    return str_cat(_hours, ":", _minutes, ":", _seconds);
}
