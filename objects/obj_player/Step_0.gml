/// @description Insert description here
// You can write your code in this editor

image_xscale = 3;
image_yscale = 3;

//slow player down every frame
x_vel *= 0.9;

//gravity accelerates player downwards
y_vel += grav;

if(player_reenter == true){
	y_spd = respawn_vel;
	
	if(respawn_timer > 0){
		respawn_timer -= 1;
	}
	
	if(respawn_timer <= 0){
		y_spd = 0;
		player_reenter = false;
	}
}

if(player_reenter == false){
	y_spd += grav;
}