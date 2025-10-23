// Parámetros UI
gui_margin = 20;
box_w = 560;            
box_x = (display_get_gui_width() - box_w) / 2;
box_y = 40;
line_spacing = 18;       
option_line_h = 30;    

checkbox_size = 14;

// Adaptación responsive
screen_w = display_get_gui_width();
screen_h = display_get_gui_height();

// Dimensiones proporcionales
box_w = screen_w * 0.85;   // 85% del ancho de la pantalla
box_h_max = screen_h * 0.75; // Altura máxima 75% del alto
box_x = (screen_w - box_w) / 2;
box_y = (screen_h - box_h_max) / 2;

// Márgenes adaptativos
gui_margin = max(20, screen_w * 0.03);
line_spacing = clamp(screen_h * 0.025, 18, 26);
option_line_h = line_spacing * 1.4;

// Textos 
if (!variable_global_exists("questions")) {
    global.questions = ["Ejemplo pregunta 1", "Ejemplo 2"];
}
if (!variable_global_exists("answers")) {
    global.answers = array_create(array_length(global.questions), 0);
}
if (!variable_global_exists("current_question")) global.current_question = -1;
if (!variable_global_exists("show_question")) global.show_question = false;

// Opciones de respoesta
options_text = [
    "1 - Muy en desacuerdo",
    "2 - En desacuerdo",
    "3 - De acuerdo",
    "4 - Muy de acuerdo"
];

// Estado del form
hovered = -1;
selected_option = 0;

// animación de hover por opción (valor entre 0 y 1)
hover_values = array_create(array_length(options_text), 0);
hover_fade_speed = 0.18; // cuánto tarda en aparecer/desaparecer (ajusta si quieres más rápido)

// Fuente
font_modal = fnt_modal; 
