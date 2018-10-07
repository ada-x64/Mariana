///@param btype
///@param arr
var btype = argument0;
var arr = argument1;
var bx,by,bz,spd,dir,curve,type,spawner,lifespan,timer;
bx          = arr[0];
by          = arr[1];
bz          = arr[2];
spd         = arr[3]; //const
dir         = arr[4];
curve		= arr[5];
type        = arr[6]; //const
spawner		= arr[7]
lifespan    = arr[8]; //const
timer       = arr[9];
//update timer
timer += (global.bps)*(global.T/60) + (delta_time) / 1000000;

switch (type)
    {
        default: {break;}
		case (Btype.aimed):
		{
			dir = point_direction(bx,by,objM.x,objM.y) //point_direction(bx,by,objM.x,objM.y)//darctan2(by-objM.y, bx-objM.x);
			dir += random_range(-7.5,7.5);
			type = Btype.unaimed;
			break;
		}
		case (Btype.tendril):
        case (Btype.tracking):
        {
            if (instance_exists(objM)) and (btype == "e" or btype == "E" or btype == "enemy")
            {
                dir = point_direction(bx,objM.y,objM.x,by) //darctan2(by-objM.y, bx-objM.x);
            }
            break;
        }
		case (Btype.stracking):
		case (Btype.stendril):
        {
            if (instance_exists(objM)) and (btype == "e" or btype == "E" or btype == "enemy")
            {
                dir = point_direction(bx,by,objM.x,objM.y) //darctan2(by-objM.y, bx-objM.x);
            }
			curve = 45*sin(pi/2 + spd*timer/6);
			
            break;
        }
		case (Btype.radial): case (Btype.sradial): case (Btype.wradial):
		{
			var T = Btype.unaimed;
			if type = Btype.sradial {T = Btype.sine;}
			if type = Btype.wradial {T = Btype.wavy;}
			if curve == 0
			{
				curve = 30;
			}
			for (var i = 0; i < 360; i += curve)
			{
				spawnBullet(bx,by,bz,spd,i+dir,0,T,spawner,lifespan);
			}
			type = Btype.unaimed;
			break;
		}
		#region bombs
		//bombs
        case (Btype.bomb):
		case (Btype.wbomb):
		case (Btype.sbomb):
        {
            spd = (1-(timer/(lifespan*fps)));
            break;
        }
		case (Btype.rings): //"bomb-bomb"
		{
	        for (j=0;j<360;j+=30)
	            {spawnBullet(bx,by,bz,spd,j,curve,Btype.bomb,spawner,1);}
			lifespan = 0;
			break;
		}
		#endregion
		#region wavy
		case (Btype.wavy):
		{
			spd = 1+abs(cos(pi*current_time/1000))
			break;
		}
		case (Btype.wbbomb):
		{
	        for (j=0;j<360;j+=30)
	            {spawnBullet(bx,by,bz,spd,j,curve,Btype.wbomb,spawner,1);}
			lifespan = 0;
			break;
		}
		#endregion wavy
		#region sine
		case (Btype.sine):
		{
			curve = 45*sin(pi/2 + spd*timer/6);
			break;
		}
		case (Btype.sbbomb):
		{
	        for (j=0;j<360;j+=30)
	            {spawnBullet(bx,by,bz,spd,j,curve,Btype.sbomb,spawner,1);}
			lifespan = 0;
			break;
		}
		#endregion sine
		#region advanced / danmaku
		case (Btype.burst):
		{
			instance_create_layer(bx,by,global.bullet_layer,objE_burst);
			time_out = true;
			break;
		}
		case (Btype.spear):
		{
			if (round(timer)) % 5 == 0
			{
	            for (j=0;j<360;j+=30)
	                {spawnBullet(bx,by,bz,spd,j,curve,Btype.unaimed,spawner,lifespan);}
			}
			break;
		}
		#endregion danmaku
    }
	
arr[0] = bx;
arr[1] = by;
arr[2] = bz;
arr[3] = spd;
arr[4] = dir;
arr[5] = curve;
arr[6] = type;
arr[7] = spawner;
arr[8] = lifespan;
arr[9] = timer;
	
return arr;