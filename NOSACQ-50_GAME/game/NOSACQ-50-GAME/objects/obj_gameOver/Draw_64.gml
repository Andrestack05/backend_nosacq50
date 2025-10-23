/// obj_gameOver - Draw GUI

// Dibujar botón
var col_btn = btn_hover ? make_color_rgb(90,150,255) : make_color_rgb(70,120,255);
draw_set_color(col_btn);
draw_roundrect_ext(btn_x1, btn_y1, btn_x2, btn_y2, 8, 8, false);

// Texto del botón
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text((btn_x1 + btn_x2) * 0.5, (btn_y1 + btn_y2) * 0.5, "Nuevo juego");

// Restaurar alineaciones
draw_set_halign(fa_left);
draw_set_valign(fa_top);