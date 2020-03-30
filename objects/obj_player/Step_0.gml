/// @description Insert description here
// You can write your code in this editor

image_xscale = 3.25;
image_yscale = 3.25;


//change x pos of player using spd variable
//x += x_spd;
y += y_spd;

//accelerate from gravity; player can fall down
y_spd += grav;


//slow down player a little every frame to make it easier to control
x_spd = x_spd * 0.9;



//wall collision (screen borders)
if(x < 20){ //left wall
x = 20; //put them on the left wall
x_spd = -1 * x_spd;
}

//wall collision (screen borders)
if(x > room_width-40){ //right wall
x = room_width-40 //put them on the right wall
x_spd = -1 * x_spd;
}


//collision with bushes
if(y_spd > 0){ //if player is moving down
	if(place_meeting(x, y, obj_platform) and !knocked_out and !respawn){ //and if it overlaps the bush and the player hasn't been knocked out
		//then have the player bounce back up
		y_spd = jump_spd;
	} 
}

//collision with floor after being knocked out; respawn player
//bool respawn pertains to after player is knocked out so it should include being shot back up but not the timer?


if(respawn == true){
	y_spd = jump_spd * 1.5; //this is condition of respawn = true;
}

if(place_meeting(x, y, obj_floor)){
	y_spd = 0;
	if(respawn_timer > 0){
		respawn_timer -= 1;
	}
	if(respawn_timer <= 0){
		respawn = true;
		respawn_timer = 60;
		y -= 20;
	}
}

	//when should respawn become false? this will lead to working player controls and regular bush collisions and have grav
	if(y < 420) and (respawn == true){
		respawn = false;
		knocked_out = false;
	}

