/// @description Insert description here
// You can write your code in this editor

//player controls
if(keyboard_check(vk_left)){
	x -= x_spd;
	x_spd = 5;
} else if(keyboard_check(vk_right)){
	x += x_spd;
	x_spd = 5;
} else {
	x_spd = 0;
}




//collision with other player ; this should only be on the sides not on top of players
if(place_meeting(x, y, obj_pB)){
	//one player should ricochet off the other player in the opposite direction
	//while the other player should plummet to bottom of the screen
}


//animations
if(y_spd < 0){
	sprite_index = spr_playerA_up;
} else if(y_spd > 0){
	sprite_index = spr_playerA_down;
} else {
	sprite_index = spr_playerA;
}

event_inherited();