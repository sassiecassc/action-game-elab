/// @description Insert description here
// You can write your code in this editor

event_inherited();

x_spd = 3;

if(keyboard_check(ord("A"))){
	x -= x_spd;
}

if(keyboard_check(ord("D"))){
	x += x_spd;
}