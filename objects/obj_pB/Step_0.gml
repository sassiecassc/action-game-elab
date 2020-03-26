/// @description Insert description here
// You can write your code in this editor


x_spd = 3;

if(keyboard_check(ord("A"))){
	x -= x_spd;
}

if(keyboard_check(ord("D"))){
	x += x_spd;
}

//collision with other player
if(x_spd > 0){
	if(place_meeting(x, y, obj_pA)){
		x_spd *= -1;
	}
}


if(y_spd < 0){
	sprite_index = spr_playerB_up;
} else {
	sprite_index = spr_playerB;
}

event_inherited();