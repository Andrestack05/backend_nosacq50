
if(can_move){
//movimiento horizontal
	var hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));

	if (hor != 0) {
		scrMovement(sign(hor), width);
		action = "Walk";
		if (vspeed == 0 && !audio_is_playing(snd_run)) {
        audio_play_sound(snd_run, 5, true); // bucle mientras camina
    }
		
	} else if (vspeed == 0) {
audio_stop_sound(snd_run);
		action = "Idle";
	}

//salto
	if (keyboard_check_pressed(vk_space)) {
		 audio_play_sound(snd_jump, 10, false);
		scrJump(width);
	}
}

audio_listener_position(x, y, 0);

