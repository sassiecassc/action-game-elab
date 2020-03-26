/// @description Insert description here
// You can write your code in this editor

image_xscale = 3;
image_yscale = 3;

//slow player down every frame
x_vel *= 0.9;

//gravity accelerates player downwards
y_vel += grav;

//respawn
if(respawn_timer>0){
	respawn_timer -= 1;
	if(respawn_timer == 0){
		//respawn player
		//pick random point at the bottom of the screen in the middle
		x = round(random_range(room_width*0.25, room_width*0.75));
		y = room_height;
		
		x_vel = (x-room_width*0.5) * random_range(0.1, 0.2);
		y_vel = respawn_vel;
		
		rx = 0;
		ry = 0;
	}
}

rx += x_vel;
ry += y_vel;