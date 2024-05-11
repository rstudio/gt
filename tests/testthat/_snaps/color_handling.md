# The various color utility functions work correctly

    Code
      html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a, NA_character_))
    Condition
      Error in `html_color()`:
      ! `colors` should not contain any `NA` values.

---

    Code
      html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, c_s_hex_a, "blau"))
    Condition
      Error in `check_named_colors()`:
      ! An invalid color name was used (`"blau"`).
      * Only R/X11 color names and CSS 3.0 color names can be used.

---

    Code
      html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, "#FF04JJ"))
    Condition
      Error in `check_named_colors()`:
      ! An invalid color name was used (`"#ff04jj"`).
      * Only R/X11 color names and CSS 3.0 color names can be used.

---

    Code
      html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, "#FF0033100"))
    Condition
      Error in `check_named_colors()`:
      ! An invalid color name was used (`"#ff0033100"`).
      * Only R/X11 color names and CSS 3.0 color names can be used.

---

    Code
      html_color(colors = c(c_name, c_hex, c_hex_a, c_s_hex, "FF04E2"))
    Condition
      Error in `check_named_colors()`:
      ! An invalid color name was used (`"ff04e2"`).
      * Only R/X11 color names and CSS 3.0 color names can be used.

---

    Code
      normalize_colors(colors = c(c_name, c_hex, c_hex_a, "rgba(210,215,33,0.5)"),
      alpha = NULL)
    Condition
      Error in `grDevices::col2rgb()`:
      ! invalid color name 'rgba(210,215,33,0.5)'

---

    Code
      ideal_fgnd_color(bgnd_color = c(c_hex, c_hex_a, c_s_hex, "#FF04JJ"))
    Condition
      Error in `check_named_colors()`:
      ! An invalid color name was used (`"#ff04jj"`).
      * Only R/X11 color names and CSS 3.0 color names can be used.

---

    Code
      ideal_fgnd_color(bgnd_color = c(c_hex, c_hex_a, c_s_hex, "#FF0033100"))
    Condition
      Error in `check_named_colors()`:
      ! An invalid color name was used (`"#ff0033100"`).
      * Only R/X11 color names and CSS 3.0 color names can be used.

---

    Code
      adjust_luminance(colors = c_hex, steps = -2.1)
    Condition
      Error in `adjust_luminance()`:
      ! The value provided for `steps` (`-2.1`) must be between `-2.0` and `+2.0`.

---

    Code
      adjust_luminance(colors = c_hex, steps = +2.1)
    Condition
      Error in `adjust_luminance()`:
      ! The value provided for `steps` (`2.1`) must be between `-2.0` and `+2.0`.

