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
if(y_spd > 0){
	if(place_meeting(x, y, obj_platform)){
		y_spd = jump_spd;
	}
}






/*
//collision with bush
var new_y;
//collide only if player is going down
if(y_spd > 0){ //if the player is moving down vertically (positive)
	for(var dist_moved = 0; dist_moved < y_spd; dist_moved++){ //creating a for loop; dist_moved
		new_y = y+dist_moved; //move 1 pixel at a time
		var collidewith = instance_place(x, new_y, obj_platform); //colliding with the platform at those coordinates
		if(collidewith != noone){ //if the player collided with something! (bush)
			//only bounce on the bush if not currently overlapping
			if(place_meeting(x, y, collidewith) == false){ //if we collide with a bush
				//we collide then!
				y_spd = jump_spd; //player jumps 
				
				
				//if(collidewith.object_index == obj_platform){ //if player collides with this object (cloud)
					//tell the platform to delete itself in 15 frames
					//if(collidewith.delete_me_in == 0){ //if countdown hit 0
					//	collidewith.delete_me_in = 15; //set the timer back to 15
						//audio_play_sound(snd_bounce, 1, 0);
					//}
					//alarm[0] = 30;
				//}
				break; //stop moving down
			}
		}
	}
}
else { // else player can't collide with cloud because we're not moving downwards so
	//just move y the normal way
	new_y = y + y_spd;
}

//set the new player y to a new y position
y = new_y;
*/


