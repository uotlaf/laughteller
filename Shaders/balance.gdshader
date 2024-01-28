shader_type canvas_item;

uniform int direction_move;
uniform float time_multiplicator_v= 2.0;
uniform float scale_multiplicator_v = 4.0;
uniform float time_multiplicator_h= 2.0;
uniform float scale_multiplicator_h = 2.0;
uniform float height = 3.0;
void vertex() {
	VERTEX.y += height+ sin(TIME*time_multiplicator_v)*scale_multiplicator_v;
	VERTEX.x += cos(TIME*time_multiplicator_h)*scale_multiplicator_h;
}
