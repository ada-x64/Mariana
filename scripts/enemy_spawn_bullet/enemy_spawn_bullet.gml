///@function enemy_spawn_bullet
///@param bullet_array
if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
	{exit;}

var arr = argument0;

var btype		= arr[0];
var bspd		= arr[1];
var bdir		= arr[2];
var bcurve		= arr[3];
var bfreq		= arr[4];
var blifespan	= arr[5];
var bx			= arr[6];
var by			= arr[7];
var btimer		= arr[8];
var btimer2		= arr[9];
var bimmune		= arr[10];

//update things
btimer += global.speed_manip;
bx = x+sprite_get_bbox_left(mask_index)+(sprite_get_bbox_right(mask_index)-sprite_get_bbox_left(mask_index))/2
by = y+sprite_get_bbox_bottom(mask_index);

#region main
if ((btimer >= bfreq*fps) or bfreq == 0) and !is_hurt
{
    switch (btype)
    {
        #region Burst
        case (Btype.burst3):
        case (Btype.burst5):
        case (Btype.burst7):
        case (Btype.burst9):
        {
            btimer2 += global.speed_manip;
            if round(btimer2)%5 = 0
            {
				if !bimmune
					spawnBullet(bx,by,0,bspd,bdir,bcurve,Btype.unaimed,self,blifespan)
				else
					spawnBullet_i(bx,by,0,bspd,bdir,bcurve,Btype.unaimed,self,blifespan);
            }
            if ( btimer2 > 5*2*(1+btype-Btype.burst3)+5 )
                {
                btimer2 = 0;
                btimer = 0;
                }
            break;
        }
		//wburst
        case (Btype.wburst3):
        case (Btype.wburst5):
        case (Btype.wburst7):
        case (Btype.wburst9):
        {
            btimer2 += global.speed_manip;
            if round(btimer2)%5 = 0
            {
				if !bimmune
					spawnBullet(bx,by,0,bspd,bdir,bcurve,Btype.wavy,self,blifespan)
				else
					spawnBullet_i(bx,by,0,bspd,bdir,bcurve,Btype.wavy,self,blifespan);
            }
            if ( btimer2 > 5*2*(1+btype-Btype.wburst3)+5 )
                {
                btimer2 = 0;
                btimer = 0;
                }
            break;
        }
		//sburst
        case (Btype.sburst3):
        case (Btype.sburst5):
        case (Btype.sburst7):
        case (Btype.sburst9):
        {
            btimer2 += global.speed_manip;
            if round(btimer2)%5 = 0
            {
				if !bimmune
					spawnBullet(bx,by,0,bspd,bdir,bcurve,Btype.sine,self,blifespan)
				else
					spawnBullet_i(bx,by,0,bspd,bdir,bcurve,Btype.sine,self,blifespan);
            }
            if ( btimer2 > 5*2*(1+btype-Btype.sburst3)+5 )
                {
                btimer2 = 0;
                btimer = 0;
                }
            break;
        }
		//aburst
        case (Btype.aburst3):
        case (Btype.aburst5):
        case (Btype.aburst7):
        case (Btype.aburst9):
        {
            btimer2 += global.speed_manip;
            if round(btimer2)%5 = 0
            {
				if !bimmune
					spawnBullet(bx,by,0,bspd,bdir,bcurve,Btype.aimed,self,blifespan)
				else
					spawnBullet_i(bx,by,0,bspd,bdir,bcurve,Btype.aimed,self,blifespan);
            }
            if ( btimer2 > 5*2*(1+btype-Btype.aburst3)+5 )
                {
                btimer2 = 0;
                btimer = 0;
                }
            break;
        }
		//tburst
        case (Btype.tburst3):
        case (Btype.tburst5):
        case (Btype.tburst7):
        case (Btype.tburst9):
        {
            btimer2 += global.speed_manip;
            if round(btimer2)%5 = 0
            {
				if !bimmune
					spawnBullet(bx,by,0,bspd,bdir,bcurve,Btype.tracking,self,blifespan)
				else
					spawnBullet_i(bx,by,0,bspd,bdir,bcurve,Btype.tracking,self,blifespan);
            }
            if ( btimer2 > 5*2*(1+btype-Btype.tburst3)+5 )
                {
                btimer2 = 0;
                btimer = 0;
                }
            break;
        }
		//turret
		case (Btype.turret):
        {
            btimer2 += global.speed_manip;
            if round(btimer2)%5 = 0
            {
				if !bimmune
					spawnBullet(bx,by,0,bspd,bdir,bcurve,Btype.unaimed,self,blifespan)
				else
					spawnBullet_i(bx,by,0,bspd,bdir,bcurve,Btype.unaimed,self,blifespan);
            }
            break;
        }
		//sturret
		case (Btype.sturret):
        {
            btimer2 += global.speed_manip;
            if round(btimer2)%5 = 0
            {
				if !bimmune
					spawnBullet(bx,by,0,bspd,bdir,bcurve,Btype.sine,self,blifespan)
				else
					spawnBullet_i(bx,by,0,bspd,bdir,bcurve,Btype.sine,self,blifespan);
            }
            break;
        }
		
		#endregion Burst
        #region Spiral
        case (Btype.spiral):
		case (Btype.sspiral):
		case (Btype.wspiral):
        {
			var spiral_time = (1-bcurve)*fps*(global.bps)*(global.T/60) //+ (delta_time/1000000);
			
			if bfreq == 0
			{
				if round(btimer) mod 2 == 0
				{
					if (btype == Btype.spiral)
						{spawnBullet(x,y,0,bspd,(btimer/spiral_time)*360 + bdir,bcurve,Btype.unaimed,self,-1);}
					else if (btype == Btype.sspiral)
						{spawnBullet(x,y,0,bspd,(btimer/spiral_time)*360 + bdir,bcurve,Btype.sine,self,-1);}
					else if (btype == Btype.wspiral)
						{spawnBullet(x,y,0,bspd,(btimer/spiral_time)*360 + bdir,bcurve,Btype.wavy,self,-1);}
				}
				break;
			}
            //timer and shooting
            btimer2 += global.speed_manip;
            if (btimer2 >= spiral_time)
                {
                btimer2 = 0;
                btimer = 0;
                }
			if round(btimer2) mod 2 == 0
			{
				if (btype == Btype.spiral)
					{spawnBullet(x,y,0,bspd,(btimer2/spiral_time)*360 + bdir,bcurve,Btype.unaimed,self,-1);}
				else if (btype == Btype.sspiral)
					{spawnBullet(x,y,0,bspd,(btimer2/spiral_time)*360 + bdir,bcurve,Btype.sine,self,-1);}
				else if (btype == Btype.wspiral)
					{spawnBullet(x,y,0,bspd,(btimer2/spiral_time)*360 + bdir,bcurve,Btype.wavy,self,-1);}
			}
			break;
		}
		#endregion Spiral
		case (Btype.laser):
		{
			var e = instance_create_layer(x,y,layer,objE_laser);
			with e
			{
				dir = bdir;
				lifespan = blifespan;
				width = bcurve;
			}
			btimer = 0;
			break;
		}
		case (Btype.bomb): case (Btype.sbomb): case (Btype.wbomb): case(Btype.rings): case(Btype.sbbomb): case(Btype.wbbomb):
		{
			if blifespan > 1
				blifespan = 1;
			if !bimmune
				spawnBullet(bx,by,0,bspd,bdir,bcurve,btype,self,blifespan);
			else {spawnBullet_i(bx,by,0,bspd,bdir,bcurve,btype,self,blifespan);}
            btimer = 0;
            break;
		}
        default:
        {
			if !bimmune
				spawnBullet(bx,by,0,bspd,bdir,bcurve,btype,self,blifespan);
			else {spawnBullet_i(bx,by,0,bspd,bdir,bcurve,btype,self,blifespan);}
            btimer = 0;
            break;
        }
    }
}
#endregion main
arr[0] = btype
arr[1] = bspd
arr[2] = bdir
arr[3] = bcurve
arr[4] = bfreq
arr[5] = blifespan
arr[6] = bx
arr[7] = by
arr[8] = btimer
arr[9] = btimer2
arr[10] = bimmune;

return arr;