/// @description Insert description here
// You can write your code in this editor

//player controls
if(keyboard_check(vk_left) and !player_collide){
	x += x_spd * -1;
	x_spd = 5;
} else if(keyboard_check(vk_right) and !player_collide){
	x += x_spd;
	x_spd = 5;
} else {
	x_spd = 0;
}

//reference to the other player so i can knock them away
var otherplayer = obj_pA; //get first instance of player A in the scene
if(object_index == obj_pA){ //im player A
	otherplayer = obj_pB; //then player B is other player
}

//collision with other player ; this should only be on the sides not on top of players
//one player should ricochet off the other player in the opposite direction
//while the other player should plummet to bottom of the screen
if(place_meeting(x, y, obj_pB)){
	player_collide = true;
	if(player_collide == true){

	} else {
		player_collide = false;
	}
}

//if other player has been collided with and punched then knocked_out is true
if(knocked_out == true){
	//this would plummet the other character
	otherplayer.y_spd = 6;
	//other player cannot move side to side
	otherplayer.x_spd = 0;
}


//player can punch at any time buT if they are pressing down punch key AND colliding then a punch will count.

if(keyboard_check(vk_space)){
	sprite_index = spr_playerA_punch1; //switch to punching sprite
	punching = true;
} else if(y_spd < 0){ //if not pressing space key and is moving up then 
	//sprite should be up animation
	sprite_index = spr_playerA_up;
} else {
	//sprite is still
	sprite_index = spr_playerA;
}


//ready to do something with this punching variable and the player collide variable
if(punching == true) and (player_collide){
	//if im punching AND touching the other player, then
	//knock the palyers away from each other by changing their speeds
	if(x > otherplayer.x){ //if im to the right of the other player when we collide
		//then ricochet to the right
		x_spd = 5;
		otherplayer.x_spd = -7; // other player ricochets faster to the left
	} else { //else i must be to the left of the other player
		x_spd = -5; //ricochet to the left
		otherplayer.x_spd = 7; //other player ricochets faster to the right
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