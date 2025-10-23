audio_play_sound(snd_coin, 10, false);
if (!global.show_question) {
    // siguiente pregunta
    global.current_question += 1;

    //limite de preguntas 
    if (global.current_question >= array_length(global.questions)) {
        global.current_question = array_length(global.questions) - 1;
    }

    global.show_question = true;

    // pausar mov del jugador
    with (other) can_move = false;
	
	audio_stop_sound(snd_run);
	 instance_destroy();
}
