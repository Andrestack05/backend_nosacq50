function scrJump(width){
	if (collision_rectangle(x-width,y,x+width,y+1,obj_wall,false,false) && vspeed == 0) {
		vspeed = -6;
	}
}