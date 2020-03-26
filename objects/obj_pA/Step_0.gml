/// @description Insert description here
// You can write your code in this editor

event_inherited();

x_spd = 3;

if(keyboard_check(vk_left)){
	x -= x_spd;
}

if(keyboard_check(vk_right)){
	x += x_spd;
}