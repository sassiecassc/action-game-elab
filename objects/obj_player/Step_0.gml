/// @description Insert description here
// You can write your code in this editor

image_xscale = 3;
image_yscale = 3;

//change x pos of player using spd variable
//x += x_spd;
y += y_spd;

//accelerate from gravity; player can fall down
y_spd += grav;



//collision with cloud
var new_y;
//collide only if player is going down
if(y_spd > 0){ //if the player is moving down vertically (positive)
	for(var dist_moved = 0; dist_moved < y_spd; dist_moved++){ //creating a for loop; dist_moved
		new_y = y+dist_moved; //move 1 pixel at a time
		var collidewith = instance_place(x, new_y, obj_platform); //colliding with the platform at those coordinates
		if(collidewith != noone){ //if the player collided with something! (cloud)
			//only bounce on the cloud if not currently overlapping
			if(place_meeting(x, y, collidewith) == false){ //if we collide with a cloud
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
