/// @description Insert description here
// You can write your code in this editor

if(bush_hp <= 0){ 
	hp_timer -= 1;
	if(hp_timer <= 180){
		x = 1000;
	}
	
	if(start_animation == false){ //if we havent started the animation then start the animation
		start_animation = true;
		sprite_index = spr_platform_disappear;
	}
}

if(hp_timer <= 0){
	start_animation = false;
	x = og_xpos;
	y = og_ypos;
	bush_hp = 5;
	hp_timer = 200;
	sprite_index = spr_platform;
}