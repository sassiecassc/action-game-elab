/// @description Insert description here
// You can write your code in this editor

image_xscale = 3;
image_yscale = 3;

//change x pos of player using spd variable
//x += x_spd;
y += y_spd;

//accelerate from gravity; player can fall down
y_spd += grav;

if(place_meeting(x, y, obj_platform)){
	y_spd = 0;
}