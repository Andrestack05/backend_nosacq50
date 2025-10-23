function scrCheckPlatformCollision(width){
	var platform = collision_rectangle(x-width,y,x+width,y+1,obj_movingPlatform,true,true);
	if (platform && vspeed == 0) {
		x += platform.hspeed;
		y = platform.y;
	}
}