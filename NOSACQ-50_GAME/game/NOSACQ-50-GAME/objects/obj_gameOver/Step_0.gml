// Calcular la posición centrada del botón en el espacio GUI
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

btn_x1 = (gui_w - btn_w) * 0.5;
btn_y1 = (gui_h - btn_h) * 0.5; // centrado vertical y horizontal
btn_x2 = btn_x1 + btn_w;
btn_y2 = btn_y1 + btn_h;

// hoverr
var mx = device_mouse_x_to_gui(0);
var my = device_mouse_y_to_gui(0);

btn_hover = (mx > btn_x1 && mx < btn_x2 && my > btn_y1 && my < btn_y2);

if (mouse_check_button_pressed(mb_left) && btn_hover) {
    room_goto(rm_start);
}