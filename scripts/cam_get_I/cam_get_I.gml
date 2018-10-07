///cam_get_I(duration,intensity,timer,type)

var I;
var e = 2.71828;
var d = argument0;
var i = argument1;
var t = argument2;
var type = argument3;

switch(type)
    {
    case camtype.constant:{
        I = i;
        }
    case camtype.linear: {
        I = i*(1-(t/d));
        }
    case camtype.parabolic:{
        I = i*(1-(power(t,2)/power(d,2)));
        }
    case camtype.hyperbolic:{
        I = i/(d*t);
        }
    case camtype.exponential:{
        I = (i/e)*(power(e,(t/d)-1));
        }
    case camtype.logarithmic:{
        I = i*(1+logn(e,t/d));
        }
    case camtype.sinusoidal:{
        I = i*sin(2*pi*t/d);
        }
    case camtype.cosinusoidal:{
        I = i*cos(2*pi*t/d);
        }
    case camtype.negLinear:{
        I = i*((t/d) - 1);
        }
    case camtype.negParabolic:{
        I = i*(power(t,2)/power(d,2));
        }
    }
return(I);
