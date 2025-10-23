// Calcular progreso actual
var answered = 0;
for (var i = 0; i < total_questions; i++) {
    if (global.answers[i] > 0) answered++;
}

// Porcentaje
var progress = answered / total_questions;

draw_set_color(bar_bg_color);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

// Relleno
draw_set_color(bar_fill_color);
draw_rectangle(bar_x, bar_y, bar_x + (bar_w * progress), bar_y + bar_h, true);

// Borde
draw_set_color(bar_border_color);
draw_rectangle(bar_x, bar_y, bar_x + bar_w, bar_y + bar_h, false);

// Texto (contador)
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(bar_x + bar_w / 2, bar_y - 18, "Pregunta " + string(answered) + " / " + string(total_questions));


// En Draw GUI:
display_progress = lerp(display_progress, progress, 0.1);
draw_rectangle(bar_x, bar_y, bar_x + (bar_w * display_progress), bar_y + bar_h, true);