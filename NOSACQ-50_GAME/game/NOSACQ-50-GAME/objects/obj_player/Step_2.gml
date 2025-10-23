#region Colision plataforma
	scrCheckPlatformCollision(width);
#endregion

#region Gravedad
	scrCheckGravity(width);

	if (vspeed > 0) {
		scrCheckGroundCollision(width);
	} else if (vspeed < 0) {
		scrCheckCeilingCollision(width, height);
	}
#endregion

#region Cambiar Sprite
	scrUpdateSprite();
#endregion
// 🔥 Cambiar sprite si está tocando el fuego
if (place_meeting(x, y, obj_fire)) {
    sprite_index = sprNWBurn;
    image_speed = 1;
}