///d3d_bg_grid()

//VARS -------------------------------------------------------------------
var tex = background_get_texture(tex_grid);

if (global.gridType == GridType.ellipse)
{
    var i_max = surf3D_size/( (CURVE + 1)*background_get_width(tex_grid) );
}
else
{
    var i_max = surf3D_size/(background_get_width(tex_grid) );
}
var z_val = 4*fog_depth;
var gapval = surf3D_size/i_max;

if (!DEV_TERMINAL.is_open && !global.unfocused && !global.paused)
{
    grid_z -= (1/8)*(z_val/game_get_speed(gamespeed_fps))*global.speed_manip;
    if (grid_z < -z_val/4 )
    {grid_z = -1/8*z_val;}
}

z0 = -z_val/16 + grid_z; 
z1 = z_val + z0;

var y_dist = ((1-CURVE)*2.5 + 0.25)*(room_height/2);
var x0 = -surf3D_size/2

//LIGHTS -----------------------------------------------------------------
//very messy! make sure to polish this shit
d3d_set_fog(true,background_color,fog_depth/2,2*fog_depth);
d3d_set_lighting(true);
var col = make_colour_hsv(0,0,255);
d3d_light_define_ambient(c_black);
d3d_light_define_point(1,surf3D_size/2,surf3D_size/2,0,100,c_white);
d3d_light_define_direction(2,0.5,0.75,0,col);
d3d_light_enable(1,true);
d3d_light_enable(2,true);

//SWITCH -----------------------------------------------------------------
switch (global.gridType) //gridType controls which grid type is currently active
{
    case GridType.ellipse:
    {
        //ELLIPSE
        d3d_primitive_begin_texture(pr_trianglestrip,tex);
        for (var i=0; i<=4*i_max + 1; i++)
            {;
                var b = room_height/3;          //minor axis
                var a = b*(6 - 5*CURVE);        //major axis
                var t = (i/(4*i_max))*2*pi;         //theta
                
                var xx = surf3D_size/2 + b*cos(t) - a*sin(t)
                var yy = surf3D_size/2 + a*sin(t) + b*cos(t);
                
                d3d_vertex_normal_texture(xx, yy, z0, 0, 1, 0, (i div 2) mod 2,0);
                d3d_vertex_normal_texture(xx, yy, z1, 0, -1, 0, (i div 2) mod 2,1);
                
            }
        d3d_primitive_end();
        break;
    }
        
    case GridType.one_plane:
    {
        // ONE PLANE
        d3d_primitive_begin_texture(pr_trianglestrip,tex);
        for (var i=0; i<=4*i_max; i++)
        {
            xx = x0 + (i div 2) * gapval ;
            yy = surf3D_size/2 + (-1)*(y_dist);
            if (i%2 == 0)
                {d3d_vertex_normal_texture(xx, yy, z0, 0, 1, 0, (i div 2) mod 2,0);}
            else {d3d_vertex_normal_texture(xx, yy, z1, 0, 1, 0, (i div 2) mod 2,1);}
        }
        d3d_primitive_end();
        break;
    }
    
    case GridType.two_planes:
    {
        // TWO PLANES
    
        for (var k = 0; k < 2; k++)
        {
            d3d_primitive_begin_texture(pr_trianglestrip,tex);
            for (var i=0; i<=4*i_max; i++)
            {
                xx = x0 + (i div 2) * gapval ;
                yy = surf3D_size/2 + (-1+2*k)*(y_dist);
        
                if (i%2 == 0)
                    {d3d_vertex_normal_texture(xx, yy, z0, 0, 1, 0, (i div 2) mod 2,0);}
                else {d3d_vertex_normal_texture(xx, yy, z1, 0, 1, 0, (i div 2) mod 2,1);}
            }
            d3d_primitive_end();
        }
        break;
    }
}
