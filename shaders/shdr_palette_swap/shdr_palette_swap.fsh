//vars ************************************************************************
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform sampler2D samp2D_pal;
uniform float offset;
const float NUM_OF_COLORS = 3.0;

void main()
{
    vec4 orig_tex = texture2D(gm_BaseTexture,v_vTexcoord);
    float lum = (0.2126*orig_tex.r + 0.7152*orig_tex.g + 0.0722*orig_tex.b);
        //gets luminosity of the color
    float value = floor(lum*NUM_OF_COLORS)/NUM_OF_COLORS;
        //rounds the luminosity (RED) value to precise value useful for palette
        //e.g. 0.2 -> floor(0.2*3.0)/3.0 = floor(0.6)/3.0 = 0/3.0 = 0;
        //e.g. 0.67 -> floor(0.67*3.0)/3.0 = floor(2.01)/3.0 = 2.0/3.0 = 0.67
        //e.g. r(0.01, 0.04) = 0
    vec2 uv = vec2(value, offset);
    vec4 newcolor = texture2D(samp2D_pal,uv);
    gl_FragColor = newcolor*vec4(1.0,1.0,1.0,orig_tex.a);
    //gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

