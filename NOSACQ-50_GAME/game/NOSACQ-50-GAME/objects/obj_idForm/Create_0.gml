//inicializar variables
global.player_id = "";
global.show_id_form = true;
audio_stop_all();
codigo = "";
campo_activo = true; 

// Dimensiones
box_w = 400;
box_h = 220;
box_x = (display_get_gui_width() - box_w) / 2;
box_y = (display_get_gui_height() - box_h) / 2;

// boton de iniciar
button_x1 = box_x + 100;
button_y1 = box_y + 160;
button_x2 = box_x + 300;
button_y2 = box_y + 195;

audio_play_sound(snd_musicLobby, 1, true);