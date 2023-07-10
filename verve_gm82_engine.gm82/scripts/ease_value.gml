///ease_value(value, easing)
var v;

v = clamp(argument0, 0, 1);

switch(argument1) {
    case ease_none:
        return v;
    case ease_quad_in:
        return v * v;
    case ease_quad_out:
        return 1 - (1 - v) * (1 - v);
    case ease_quad_inout:
        if v < 0.5 {
            return ease_value(2 * v, ease_quad_in) / 2;
        }
        else {
            return ease_value(2 * (v - 0.5), ease_quad_out) / 2 + 0.5;
        }
}
