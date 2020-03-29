/// @description Insert description here
// You can write your code in this editor

if(keyboard_check(ord("A"))){
	x += x_spd * -1;
	x_spd = 5;
}

if(keyboard_check(ord("D"))){
	x += x_spd;
	x_spd = 5;
}


if(y_spd < 0){
	sprite_index = spr_playerB_up;
} else {
	sprite_index = spr_playerB;
}

event_inherited();