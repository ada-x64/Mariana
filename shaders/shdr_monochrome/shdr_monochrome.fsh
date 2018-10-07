//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 new_colour = vec4(v_vColour.r, 0.0, 0.0, v_vColour.a);
    gl_FragColor = new_colour * texture2D( gm_BaseTexture, v_vTexcoord );
}

