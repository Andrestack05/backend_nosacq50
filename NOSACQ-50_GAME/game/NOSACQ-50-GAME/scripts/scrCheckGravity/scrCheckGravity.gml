function scrCheckGravity(width){
	if (!collision_rectangle(x-width,floor(y),x+width,ceil(y),obj_wall,true,true) || vspeed != 0) {
		gravity = 0.3;
		action = "Jump";
	}
}