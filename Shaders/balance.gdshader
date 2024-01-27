shader_type canvas_item;

uniform int direction_move;
uniform float time_multiplicator_v= 1.0;
uniform float scale_multiplicator_v = 2.0;
uniform float time_multiplicator_h= 1.0;
uniform float scale_multiplicator_h = 2.0;

void vertex() {
	if (direction_move == 1){
		VERTEX.y += sin(TIME*time_multiplicator_v)*scale_multiplicator_v;	
	}
}
