/// @description Insert description here
// You can write your code in this editor

//player controls
if(keyboard_check(vk_left) and !player_collide){
	x -= x_spd;
	x_spd = 5;
} else if(keyboard_check(vk_right) and !player_collide){
	x += x_spd;
	x_spd = 5;
} else {
	x_spd = 0;
}



//collision with other player ; this should only be on the sides not on top of players
	//one player should ricochet off the other player in the opposite direction
	//while the other player should plummet to bottom of the screen

//when collision happens set x speed, y speed to bounce. enter knockout mode
if(place_meeting(x, y, obj_pB)){
	y_spd = -10;
	x_spd = -sign(x_spd) * 10;
	player_collide = true;
}

//during knockout, increment x speed, y speed until they = 0; then exit knockout mode
if(player_collide){
	x += x_spd; //when keyboard controls are not running set x position, we need to make sure we are setting it here
	if(y_spd < 0){
		y_spd += 1;
	} else {
		y_spd += grav;
	}
	if(abs(x_spd) > 0){
		x_spd -= sign(x_spd);
	} else {
		player_collide = false; // at this moment x_spd = 0
		show_debug_message("exiting knockout");
	}
}



//animations
if(y_spd < 0 and !punching){
	sprite_index = spr_playerA_up;
//} else if(y_spd > 0){
	//sprite_index = spr_playerA_down;
}
if(y_spd < 0 and keyboard_check(vk_space)){
	punching = true;
	sprite_index = spr_playerA_punch1;
	punching = false;
}

event_inherited();