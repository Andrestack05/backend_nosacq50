var player = obj_player;
if (instance_exists(player)) {
    var dist = point_distance(x, y, player.x, player.y);
    var max_dist = 300; // distancia máxima de audición
    var vol = clamp(1 - (dist / max_dist), 0, 1);

    // reproducir si no está sonando y el jugador está cerca
    if (vol > 0 && (fire_sound_id == noone || !audio_is_playing(fire_sound_id))) {
        fire_sound_id = audio_play_sound(snd_fire, 1, true);
        audio_sound_gain(fire_sound_id, vol, 0);
    }

    // ajustar volumen si ya suena
    if (fire_sound_id != noone && audio_is_playing(fire_sound_id)) {
        audio_sound_gain(fire_sound_id, vol, 0);
    }

    // detener si se aleja demasiado
    if (vol <= 0 && fire_sound_id != noone) {
        audio_stop_sound(fire_sound_id);
        fire_sound_id = noone;
    }
}

if (instance_exists(player)) {
    // detectar si este fuego está tocando al jugador
    var touching = place_meeting(x, y, player);

    // obtener el fuego más cercano al jugador
    var nearest_fire = instance_nearest(player.x, player.y, obj_fire);

    // ¿Este fuego es el más cercano Y está tocando al jugador?
    if (touching && id == nearest_fire.id) {
        if (burn_sound_id == noone || !audio_is_playing(burn_sound_id)) {
            burn_sound_id = audio_play_sound(snd_burn, 10, true);
        }
    } else {
        // si no es el fuego más cercano, o ya no lo toca, detener el sonido
        if (burn_sound_id != noone) {
            audio_stop_sound(burn_sound_id);
            burn_sound_id = noone;
        }
    }
}