/// @description Insert description here
// You can write your code in this editor


x_spd = 3;

if(keyboard_check(vk_left)){
	x -= x_spd;
}

if(keyboard_check(vk_right)){
	x += x_spd;
}

//collision with other player
if(place_meeting(x, y, obj_pB)){
	show_debug_message("i am colliding")
	//x_spd *= -1;
	x_spd = 0;
}


if(y_spd < 0){
	sprite_index = spr_playerA_up;
} else if(y_spd > 0){
	sprite_index = spr_playerA_down;
} else {
	sprite_index = spr_playerA;
}

event_inherited();