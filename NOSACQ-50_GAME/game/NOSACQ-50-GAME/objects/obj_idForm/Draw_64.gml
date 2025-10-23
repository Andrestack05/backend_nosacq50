 /// Dibujar el formulario ID
if (!global.show_id_form) exit;

// Fondo translúcido
draw_set_alpha(0.92);
draw_set_color(make_color_rgb(25,35,45));
draw_roundrect_ext(box_x, box_y, box_x + box_w, box_y + box_h, 12, 12, false);
draw_set_alpha(1);

// Texto principal (con tildes y wrap para no salir del recuadro)
draw_set_color(c_white);
var title_full = "Ingrese su codigo o ID para iniciar la evaluacion:";

// Mantén tu offset original, pero calcula ancho disponible para wrap
var title_x = box_x + 60;
var title_y = box_y + 40;
var max_title_w = box_x + box_w - title_x - 20; // margen derecho de 20 para no tocar el borde

// Usa draw_text_ext para wrap si es necesario
draw_text_ext(title_x, title_y, title_full, 20, max_title_w);

// Campo de texto
draw_set_color(make_color_rgb(60,80,120));
draw_roundrect_ext(box_x + 80, box_y + 90, box_x + 320, box_y + 120, 4, 4, false);

// Texto escrito
draw_set_color(c_white);
draw_text(box_x + 90, box_y + 95, codigo);

// Borde activo
draw_set_color(make_color_rgb(80,150,255));
draw_set_alpha(0.3);
draw_roundrect_ext(box_x + 78, box_y + 88, box_x + 322, box_y + 122, 4, 4, false);
draw_set_alpha(1);

// Botón “Iniciar evaluación” (centrado y recortado si no cabe)
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

var hover = (mx > button_x1 && mx < button_x2 && my > button_y1 && my < button_y2);

if (hover)
    draw_set_color(make_color_rgb(90,150,255));
else
    draw_set_color(make_color_rgb(70,120,255));

draw_roundrect_ext(button_x1, button_y1, button_x2, button_y2, 6, 6, false);

// Texto del botón centrado
draw_set_color(c_white);
var btn_text = "Iniciar evaluacion";
var btn_text_w = string_width(btn_text);
var btn_center_x = button_x1 + (button_x2 - button_x1) * 0.5;
var btn_text_x = btn_center_x - btn_text_w * 0.5;

// Si no cabe, recorta con "..."
var max_btn_w = button_x2 - button_x1 - 20; // margen interno
if (btn_text_w > max_btn_w) {
    btn_text = string_copy(btn_text, 1, string_length(btn_text) - 3) + "...";
    btn_text_w = string_width(btn_text);
    btn_text_x = btn_center_x - btn_text_w * 0.5;
}

draw_text(btn_text_x, button_y1 + 10, btn_text);