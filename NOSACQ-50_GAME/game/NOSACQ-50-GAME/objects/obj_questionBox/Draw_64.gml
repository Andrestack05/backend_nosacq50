
if (!global.show_question) exit;
if (global.current_question < 0 || global.current_question >= array_length(global.questions)) exit;

// fuente y alineación
if (font_modal != -1) draw_set_font(font_modal);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// colores base
var color_bg = make_color_rgb(25, 45, 75);
var color_panel = make_color_rgb(180, 210, 255);
var color_highlight = make_color_rgb(70, 150, 255);
var color_select = make_color_rgb(70, 200, 120);

// dimensiones dinámicas
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var inner_margin = gui_margin * 1.5;
var text_w = box_w - inner_margin * 2;

var qnum = global.current_question;
var qtext = global.questions[qnum];

// envolver texto
var lines = wrap_text_to_lines(qtext, text_w);
var base_spacing = line_spacing;
if (ds_list_size(lines) > 3) base_spacing = line_spacing + 2;
if (ds_list_size(lines) > 6) base_spacing = line_spacing + 4;

// altura total
var question_block_h = ds_list_size(lines) * base_spacing + 40;
var options_block_h = option_line_h * array_length(options_text);
var box_h = min(question_block_h + options_block_h + inner_margin * 2 + 20, box_h_max);
var box_yc = (screen_h - box_h) / 2;

// --- Fondo semitransparente ---
draw_set_alpha(0.6);
draw_set_color(color_bg);
draw_rectangle(0, 0, screen_w, screen_h, false);
draw_set_alpha(1);

// --- Panel principal ---
draw_set_color(color_panel);
draw_set_alpha(0.9);
draw_roundrect_ext(box_x, box_yc, box_x + box_w, box_yc + box_h, 20, 20, true);
draw_set_alpha(1);

// --- Borde elegante ---
draw_set_color(color_highlight);
draw_roundrect_ext(box_x, box_yc, box_x + box_w, box_yc + box_h, 20, 20, false);

// --- Texto de pregunta ---
draw_set_color(c_black);
var text_x = box_x + inner_margin;
var text_y = box_yc + inner_margin;

draw_set_font(font_modal);
draw_text(text_x, text_y - 10, "Pregunta " + string(qnum + 1) + ":");

// Espacio entre título y cuerpo
var text_start_y = text_y + 20;
for (var i = 0; i < ds_list_size(lines); i++) {
    var lineText = lines[| i];
    draw_text(text_x, text_start_y + i * base_spacing, lineText);
}
ds_list_destroy(lines);

// --- Opciones ---
var start_y = box_yc + inner_margin + question_block_h + 20;
for (var i = 0; i < array_length(options_text); i++) {
    var oy = start_y + i * option_line_h;
    var cbx = box_x + inner_margin;
    var cby = oy;

    // 🔹 Hover suave animado
    var hval = hover_values[i]; // entre 0 y 1
    if (i == hovered) {
        // sube rápido el valor para que el color se vea bien
        hval = lerp(hval, 1, 0.4);
    } else {
        hval = lerp(hval, 0, 0.3);
    }
    hover_values[i] = hval;

    if (hval > 0.05) {
        draw_set_alpha(0.35 * hval); // intensidad visible
        draw_set_color(make_color_rgb(100, 180, 255)); // azul suave
        draw_roundrect_ext(
            cbx - 5,
            cby - option_line_h / 2,
            box_x + box_w - inner_margin + 5,
            cby + option_line_h / 2,
            10,
            10,
            true
        );
        draw_set_alpha(1);
    }

    // 🔸 opción seleccionada
    if (global.answers[qnum] == i + 1) {
        draw_set_color(make_color_rgb(70, 200, 120));
        draw_rectangle(
            cbx + 2,
            cby - checkbox_size / 2 + 2,
            cbx + checkbox_size - 2,
            cby + checkbox_size / 2 - 2,
            true
        );
    }

    // 🔸 texto de opción
    draw_set_color(c_black);
    draw_text(cbx + checkbox_size + 20, cby - 10, options_text[i]);
}
