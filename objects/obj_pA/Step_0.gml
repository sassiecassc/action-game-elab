/// @description Insert description here
// You can write your code in this editor


//player controls
if(keyboard_check(vk_left) and controls_enabled and knocked_out == false){ //if the player is pressing left and controls_enabled is true
	//then subtracting x_spd and move left
	x_spd -= 0.4;
} else if(keyboard_check(vk_right) and controls_enabled and knocked_out == false){ //if the player is pressing right and controls_enabled is true
	x += x_spd; //then add x_spd and move right
	x_spd += 0.4;
} else { //else slow down a bit
	x_spd *= 0.95;
}
//use speed to set position
x += x_spd;
	
	
//as long as the stun_timer is still going (greater than 0) then 
//players should not be able to move left or right
//if(controls_enabled == false){ //player should not be able to use controls
	
//}
	
//reference to the other player so i can knock them away
var otherplayer = obj_pA; //get first instance of player A in the scene
if(object_index == obj_pA){ //im player A
	otherplayer = obj_pB; //then player B is other player
}

//collision with other player = small bounce away from each other in opposite directions
if(place_meeting(x, y, otherplayer)){
	player_collide = true;
}


//setting what happens when two players collide
if(player_collide == true){ 
	if(stun_timer > 0){ //if stun timer is greater than 0 then start the timer
		stun_timer -= 1;
		controls_enabled = false;
		
		if(stun_timer <= 0){ //if timer hits 0 then
			stun_timer = 10; //set timer back to 10
			controls_enabled = true;
			player_collide = false;
		}
	}
	
	
	if(x > otherplayer.x){ //to the right of other player and moving left
		x_spd = 8; //move right
		y_spd = -8; //shoot player up
		otherplayer.x_spd = -8; //move left
		otherplayer.y_spd = -8; //shoot player up
	} else if(x < otherplayer.x){ //to the left of the other player and moving right
		x_spd = -8; //move left
		y_spd = -8; //shoot player up
		otherplayer.x_spd = 8; //move left
		otherplayer.y_spd = -8; //shoot player up
	}
}



//player can punch at any time buT if they are pressing down punch key AND colliding then a punch will count.
if(keyboard_check(vk_down) == false){
	punching = false;
}
if(keyboard_check(vk_down)){
	sprite_index = spr_playerA_punch1; //switch to punching sprite
	punching = true;
} else if(y_spd < 0){ //if not pressing space key and is moving up then 
	//sprite should be up animation
	sprite_index = spr_playerA_up;
} else {
	//sprite is still
	sprite_index = spr_playerA;
}


//if other player has been collided with and punched then knocked_out is true
/*
if(otherplayer.knocked_out == true){
	if(stun_timer > 0){
		stun_timer -= 1;
		//other player cannot move side to side
		if(keyboard_check(ord("A")) or (keyboard_check(ord("D")))){
			otherplayer.x += otherplayer.x_spd;
			otherplayer.x_spd = 0;
		}
	}
	//this would plummet the other character
	otherplayer.y_spd = 8;
}
*/


//ready to do something with this punching variable and the player collide variable
if(punching == true) and (player_collide){
	show_debug_message("punching and colliding");
	//if im punching AND touching the other player, then
	//knock the palyers away from each other by changing their speeds
	if(x > otherplayer.x){ //if im to the right of the other player when we collide
		//then ricochet to the right
		x_spd = 15;
		//otherplayer.x_spd = -7; // other player ricochets faster to the left
	} else { //else i must be to the left of the other player
		x_spd = -15; //ricochet to the left
		//otherplayer.x_spd = 7; //other player ricochets faster to the right
	}
	
	if(otherplayer.knocked_out == false){ //only add score once
		score_A += 1;
	}
	
	//tell the other player to be knocked out
	otherplayer.knocked_out = true;
}



//animations
//if(y_spd < 0 and !punching){
//	sprite_index = spr_playerA_up;
//} else if(y_spd > 0){
	//sprite_index = spr_playerA_down;
//}

event_inherited();