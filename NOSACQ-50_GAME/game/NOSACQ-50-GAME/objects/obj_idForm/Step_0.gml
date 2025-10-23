if (!global.show_id_form) exit;

// tecla espacio
if (keyboard_check_pressed(vk_backspace)) {
    if (string_length(codigo) > 0) {
        codigo = string_delete(codigo, string_length(codigo), 1);
    }
}

// numpad y fila de numeros 
for (var i = 0; i < 10; i++) {
    if (string_length(codigo) < 10) {
        if (keyboard_check_pressed(ord("0") + i) || keyboard_check_pressed(vk_numpad0 + i)) {
            codigo += string(i);
        }
    }
}

// click en el button
if (mouse_check_button_pressed(mb_left)) {
    var mx = device_mouse_x_to_gui(0);
    var my = device_mouse_y_to_gui(0);

    if (mx > button_x1 && mx < button_x2 && my > button_y1 && my < button_y2) {
        if (string_length(codigo) > 0) {
            global.player_id = string(codigo);
            global.show_id_form = false;
            room_goto(rm_game);
			audio_stop_all()
        }
    }
}