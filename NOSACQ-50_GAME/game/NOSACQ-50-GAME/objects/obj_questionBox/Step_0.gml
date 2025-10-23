// Step Event corregido - copia y pega todo este bloque

if (!global.show_question) { hovered = -1; exit; }
if (global.current_question < 0 || global.current_question >= array_length(global.questions)) {
    global.show_question = false;
    with (obj_player) can_move = true;
    exit;
}

// usamos la misma fuente que en el draw (por si wrap_text depende de la fuente)
if (font_modal != -1) draw_set_font(font_modal);

// --- Recalcular posiciones EXACTAMENTE IGUAL que en Draw GUI ---
var screen_w = display_get_gui_width();
var screen_h = display_get_gui_height();
var inner_margin = gui_margin * 1.5;
var text_w = box_w - inner_margin * 2;

var qtext = global.questions[global.current_question];
var lines = wrap_text_to_lines(qtext, text_w);

var base_spacing = line_spacing;
if (ds_list_size(lines) > 3) base_spacing = line_spacing + 2;
if (ds_list_size(lines) > 6) base_spacing = line_spacing + 4;

// <-- aquí usamos +40 para que coincida con el Draw GUI
var question_block_h = ds_list_size(lines) * base_spacing + 40; 
var options_block_h = option_line_h * array_length(options_text);
var box_h = min(question_block_h + options_block_h + inner_margin * 2 + 20, box_h_max);

// <-- mismo cálculo vertical centrado que en Draw GUI
var box_yc = (screen_h - box_h) / 2;

// --- start_y idéntico
var start_y = box_yc + inner_margin + question_block_h + 20;

ds_list_destroy(lines);

// --- Hover detection corregido ---
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

if (mx < box_x || mx > box_x + box_w || my < box_yc || my > box_yc + box_h) {
    hovered = -1;
} else {
    hovered = -1;
    for (var i = 0; i < array_length(options_text); i++) {
        var oy = start_y + i * option_line_h;

        // mismos márgenes que en el draw
        var rx1 = box_x + inner_margin + checkbox_size + 8;
        var rx2 = box_x + box_w - inner_margin;
        var ry1 = oy - option_line_h / 2 + 4;
        var ry2 = oy + option_line_h / 2 - 4;

        if (mx > rx1 && mx < rx2 && my > ry1 && my < ry2) {
            hovered = i;
            break;
        }
    }
}

// Actualizar animación de hover (lerp hacia 1 para la opción hover, hacia 0 para las demás)
for (var i = 0; i < array_length(hover_values); i++) {
    var target = (i == hovered) ? 1 : 0;
    hover_values[i] = lerp(hover_values[i], target, hover_fade_speed);
}

// --- Clic ---
if (mouse_check_button_pressed(mb_left) && hovered >= 0) {
    var choice = hovered + 1;
    global.answers[global.current_question] = choice;
    global.show_question = false;
    with (obj_player) can_move = true;
    show_debug_message("Pregunta " + string(global.current_question+1) + " -> " + string(choice));

    // si última pregunta
    if (global.current_question >= array_length(global.questions) - 1) {
        scrSendResults();
        room_goto(rm_gameOver);
    }
}

