//create paths
/*
path_sin        = path_add();
path_cos        = path_add();
path_circle_cw  = path_add();
path_circle_ccw = path_add();
path_bounce     = path_add();
path_idle       = path_add();

//set points
for (i=0;i<2*pi;i+=pi/8)
{
    path_add_point(path_sin,i,-sin(i)+1,100);
    path_add_point(path_cos,i,-cos(i),100);
    path_add_point(path_circle_ccw,cos(i),-sin(i),100);
    path_add_point(path_circle_cw,-cos(i),sin(i),100);
    path_add_point(path_bounce,0,-sin(i),100 - 50*sin(i));
    path_add_point(path_idle,0,-sin(i),100 - 50*abs(sin(i)));
}

//assign global variables
global.path_sin         = path_sin;
global.path_cos         = path_cos;
global.path_circle_ccw  = path_circle_ccw;
global.path_circle_cw   = path_circle_cw;
global.path_bounce      = path_bounce;
global.path_idle        = path_idle;
