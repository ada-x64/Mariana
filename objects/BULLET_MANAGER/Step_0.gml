///update bullets
if instance_number(object_index) > 1 {instance_destroy(self);}
if (DEV_TERMINAL.is_open || global.unfocused or global.paused)
    {exit;}

#region bullet_list
for (var i=0; i< ds_list_size(global.bullet_list); i++)
{
    #region get values
    var arr = ds_list_find_value(global.bullet_list,i);
	arr = bmanager_typeswitch("e",arr);
    var bx,by,bz,spd,dir,curve,type,spawner,lifespan,timer;
    bx          = arr[0];
    by          = arr[1];
    bz			= arr[2];
    spd         = arr[3]; //const
    dir         = arr[4];
	curve		= arr[5];
    type        = arr[6];
	spawner		= arr[7];
    lifespan    = arr[8]; //const
    timer       = arr[9];
    var time_out = false;
	#endregion
    //update position
	bx += lengthdir_x(spd*global.speed_manip,dir) + delta_time/1000000;
	by += lengthdir_y(spd*global.speed_manip,dir) +  delta_time/1000000;
	#region destruction bools
    //collision
		var collision = (point_in_circle(bx,by,objM.x,objM.y,8) and !objM.hp_is_invincible and (objM.mp_state != 1));//!instance_exists(objM_catch));
    //caught
		var xx = objM.x;
		var yy = objM.y;
		var dd = objM.mp_dir;
	    var caught = (objM.mp_state == 1 and point_in_triangle(bx,by,xx+lengthdir_x(8,dd),yy+lengthdir_y(8,dd),xx+lengthdir_x(18,dd+90),yy+lengthdir_y(18,dd+90),xx+lengthdir_x(18,dd-90),yy+lengthdir_y(18,dd-90)))
		if caught and (type == Btype.tendril or type == Btype.stendril)
		{
			caught = false;
			bx += 2*spd*dsin(dir+curve)*global.speed_manip;
			by += 2*spd*dcos(dir+curve)*global.speed_manip;
		}
		else if type == Btype.tendril or type == Btype.stendril {spd = abs(spd)}
    //burst
	    var burst = false;
	    if (instance_exists(objM_burst))
	    {
	        if (point_in_circle(bx,by,objM_burst.x,objM_burst.y,objM_burst.r))
	        {
	            burst = true;
	        }
	    }
    //outside
		var outside = (bx < -8 || bx > room_width+8 || by < -8 || by > room_height + 8);
    //time_out
	    if (lifespan >= 0)
	    {
	        time_out = (timer >= lifespan*fps);
	    }
    #endregion
    #region destruction
    if (time_out || collision || caught || burst || outside)
    {
        if (caught)
        {
            //make the bullet a part of the M-bullet list
			var opp = by-objM.y;
			var adj = bx-objM.x;
			arr[3] = max(sqrt(sqr(objM.x-objM.xprevious)+sqr(objM.y-objM.yprevious)),1); //spd
			dir = -objM.mp_dir;
			/*if instance_exists(objE_bossParent)
			{
				var enemy = instance_nearest(objM.x,objM.y,objE_bossParent);
				dir = lerp(objM.dir,point_direction(bx,by,enemy.x,enemy.y),global.autoaim);
			}
			else if instance_exists(objE_parent)
			{
				var enemy = instance_nearest(objM.x,objM.y,objE_bossParent);
				dir = lerp(objM.dir,point_direction(bx,by,enemy.x,enemy.y),global.autoaim);
			}
			else {dir = objM.dir;}*/
			arr[4] = dir///set new direction
			arr[9] = 0; //timer = 0;
			score += 2;
			ds_list_add(global.bullet_list_M,arr);
			//audio_play_sound(sfx_bumbp,0,0);
        }
        
        if (burst)
        {
			var opp = by-objM.y;
			var adj = bx-objM.x;
			arr[4] = point_direction(bx,by,objM.x,objM.y);//darctan2(opp,adj); //set new direction
			arr[9] = 0; //timer = 0;
			score += 2;
			ds_list_add(global.bullet_list_M,arr);
        }
        
        if (collision)
        {
            //hurt the heart
            with (objM)
            {
                ishurt = true;
				score -= 9;
				switch type
				{
					case Btype.sbomb: case Btype.wbomb: case Btype.bomb:
					{
						hit_amount = 0.4;
						break;
					}
					case Btype.tendril:
					{
						hit_amount = 0.075;
						is_hurt = false;
						break;
					}
					default:
						{
							hit_amount = 0.25;
							break;
						}
				}
            }
        }
        
        if (time_out)
		{
			switch type
			{
				case Btype.bomb: case Btype.burst:
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBullet(bx,by,bz,2,j+dir,curve,Btype.unaimed,spawner,-1);}
					break;
		        }
				case Btype.wbomb:
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBullet(bx,by,bz,2,j+dir,curve,Btype.wavy,spawner,-1);}
					break;
		        }
				case Btype.sbomb:
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBullet(bx,by,bz,2,j+dir,curve,Btype.sine,spawner,-1);}
					break;
		        }
				
			}
		}
        
        //destroy the bullet, don't return it to list
        ds_list_delete(global.bullet_list,i);
        i--;
        continue;
    }
	#endregion
    else
    {
        //return bullet to list
        arr[0] = bx;
		arr[1] = by;
		arr[2] = bz;
		//arr[3] = spd;
		arr[4] = dir;
		arr[5] = curve;
		arr[6] = type;
		arr[7] = spawner;
		//arr[8] = lifespan;
		arr[9] = timer;
        
        ds_list_replace(global.bullet_list,i,arr);
    }
}
#endregion
#region bullet_list_i
for (var i=0; i< ds_list_size(global.bullet_list_i); i++)
{
    #region get values
    var arr = ds_list_find_value(global.bullet_list_i,i);
	arr = bmanager_typeswitch("e",arr);
    var bx,by,bz,spd,dir,curve,type,spawner,lifespan,timer;
    bx          = arr[0];
    by          = arr[1];
    bz			= arr[2];
    spd         = arr[3]; //const
    dir         = arr[4];
	curve		= arr[5];
    type        = arr[6];
	spawner		= arr[7];
    lifespan    = arr[8]; //const
    timer       = arr[9];
	bz = 0;
    var time_out = false;
	#endregion
    //update position
	bx += spd*dcos(dir)*global.speed_manip + delta_time/1000000;
	by -= spd*dsin(dir)*global.speed_manip + delta_time/1000000;
	#region destruction bools
    //collision
		var collision = (point_in_circle(bx,by,objM.x,objM.y,8) and !objM.hp_is_invincible and (objM.mp_state != 1));//!instance_exists(objM_catch));
    //caught
	    var caught = (objM.mp_state == 1 and point_in_circle(bx,by,objM.x,objM.y,15));
		if caught and (type == Btype.tendril or type == Btype.stendril)
		{
			caught = false;
			bx += 2*spd*dsin(dir+curve)*global.speed_manip;
			by += 2*spd*dcos(dir+curve)*global.speed_manip;
		}
		else if type == Btype.tendril or type == Btype.stendril {spd = abs(spd)}
    //burst
	    var burst = false;
	    if (instance_exists(objM_burst))
	    {
	        if (point_in_circle(bx,by,objM_burst.x,objM_burst.y,objM_burst.r))
	        {
	            burst = true;
				var opp = by-objM.y;
				var adj = bx-objM.x;
				arr[4] = darctan2(opp,adj); //set new direction
				arr[9] = 0; //timer = 0;
				score += 2;
	        }
	    }
    //outside
		var outside = (bx < -8 || bx > room_width+8 || by < -8 || by > room_height + 8);
    //time_out
	    if (lifespan >= 0)
	    {
	        time_out = (timer >= lifespan*fps);
	    }
    #endregion
    #region destruction
    if (time_out || collision || outside)
    {
        if (collision)
        {
            //hurt the heart
            with (objM)
            {
                ishurt = true;
				score -= 9;
				switch type
				{
					case Btype.sbomb: case Btype.wbomb: case Btype.bomb:
					{
						hit_amount = 0.4;
						break;
					}
					case Btype.tendril:
					{
						hit_amount = 0.075;
						is_hurt = false;
						break;
					}
					default:
						{
							hit_amount = 0.25;
							break;
						}
				}
            }
        }
        
        if (time_out)
		{
			switch type
			{
				case Btype.bomb: case Btype.burst:
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBullet_i(bx,by,bz,2,j+dir,curve,Btype.unaimed,spawner,-1);}
					break;
		        }
				case Btype.wbomb:
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBullet_i(bx,by,bz,2,j+dir,curve,Btype.wavy,spawner,-1);}
					break;
		        }
				case Btype.sbomb:
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBullet_i(bx,by,bz,2,j+dir,curve,Btype.sine,spawner,-1);}
					break;
		        }
				
			}
		}
        
        //destroy the bullet, don't return it to list
        ds_list_delete(global.bullet_list_i,i);
        i--;
        continue;
    }
	#endregion
    else
    {
        //return bullet to list
        arr[0] = bx;
		arr[1] = by;
		arr[2] = bz;
		//arr[3] = spd;
		arr[4] = dir;
		arr[5] = curve;
		arr[6] = type;
		arr[7] = spawner;
		//arr[8] = lifespan;
		arr[9] = timer;
        
        ds_list_replace(global.bullet_list_i,i,arr);
    }
}
#endregion
#region bullet_list_M
for (var i=0; i< ds_list_size(global.bullet_list_M); i++)
{
    #region get values
    var arr = ds_list_find_value(global.bullet_list_M,i);
    var caught = false;
	caught = (objM.mp_state == 1 and point_in_triangle(bx,by,objM.x+lengthdir_x(8,objM.dir),objM.y+lengthdir_y(8,objM.dir),objM.x+lengthdir_x(16,objM.dir+90),objM.y+lengthdir_y(16,objM.dir+90),objM.x+lengthdir_x(16,objM.dir-90),objM.y+lengthdir_y(16,objM.dir-90)));
	if (!caught) then arr = bmanager_typeswitch("m",arr)
    var bx,by,bz,spd,dir,curve,type,spawner,lifespan,timer;
    bx          = arr[0];
    by          = arr[1];
    bz          = arr[2];
    spd         = arr[3]; //const
    dir         = arr[4];
	curve		= arr[5];
    type        = arr[6];
	spawner		= arr[7];
    lifespan    = arr[8]; //const
    timer       = arr[9];
	var time_out = false;
	#endregion
    //update position
	if caught
	{
		dir = objM.dir;
		spd = max(sqrt(sqr(objM.x-objM.xprevious)+sqr(objM.y-objM.yprevious)),1);
	}
	
	bx += spd*dcos(dir)*global.speed_manip + delta_time/1000000;
	by += spd*dsin(dir)*global.speed_manip + delta_time/1000000;
	
    #region destruction bools
    //collision
    var collision = place_meeting(bx,by,objE_parent) or place_meeting(bx,by,objE_bossParent);
    //burst
    if (instance_exists(objM_burst) )//and !caught)
    {
        if (point_in_circle(bx,by,objM_burst.x,objM_burst.y,objM_burst.r))
        {
			var opp = by-objM.y;
			var adj = bx-objM.x;
			dir = darctan2(opp,adj); //set new direction
        }
    }
	//burst
    var burst = false;
    if (instance_exists(objM_burst))
    {
        if (point_in_circle(bx,by,objM_burst.x,objM_burst.y,objM_burst.r))
        {
            burst = true;
        }
    }
    var Eburst = false;
    if (instance_exists(objE_burst))
    {
        if (point_in_circle(bx,by,objE_burst.x,objE_burst.y,objE_burst.r))
        {
            Eburst = true;
        }
    }
    //outside
	var outside = (bx < -8 || bx > room_width+8 || by < -8 || by > room_height + 8)
    //time_out
    var time_out = false;
    if (lifespan > 0)
    {
        time_out = (timer > lifespan*game_get_speed(gamespeed_fps));
    }
	#endregion destruction bools
    #region destruction
    if (collision or Eburst or outside or time_out)
    {
        if (Eburst) and not burst
        {
            //change dir and charge
			var opp = by-objE_burst.y;
			var adj = bx-objE_burst.x;
			arr[4] = darctan2(opp,adj); //set new direction
			ds_list_add(global.bullet_list,arr);
        }
        if (collision)
        {
            //hurt the enemy
			var ee;
			if instance_exists(objE_bossParent) and instance_exists(objE_parent)
			{
				if point_distance(objE_bossParent.x,objE_bossParent.y,bx,by) < point_distance(objE_parent.x,objE_parent.y,bx,by)
					{ee = objE_bossParent;}
				else ee = objE_parent;
			}
			else if !instance_exists(objE_parent)
				ee = objE_bossParent;
			else ee = objE_parent;
	
			var E = instance_nearest(bx,by,ee)//instance_nearest(bx,by,objE)
            with (E)
            {
				if (is_hurt = false)
				{
					audio_play_sound(sfx_bumbp,0,0);
				    hp --;
				    is_hurt = true;
					if ee = objE_parent
					    hurt_timer = 0.25*fps;
					else hurt_timer = fps;
				   // cam_shake_surface(self,0.1,4,camtype.parabolic);
				}
            }
        }
	    if (time_out)
	    {
	        switch type
			{
				case (Btype.bomb):
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBulletM(bx,by,bz,2,j+dir,curve,Btype.unaimed,spawner,4);}
					break;
		        }
				case (Btype.wbomb):
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBulletM(bx,by,bz,2,j+dir,curve,Btype.wavy,spawner,4);}
					break;
		        }
				case (Btype.sbomb):
		        {
		            for (j=0;j<360;j+=30)
		                {spawnBulletM(bx,by,bz,2,j+dir,curve,Btype.sine,spawner,4);}
					break;
		        }
			}
	    }
        
        //destroy the bullet, don't return it to list
        ds_list_delete(global.bullet_list_M,i);
        i--;
        continue;
    }
	#endregion destruction
    else
    {
        //return bullet to list
		arr[0] = bx;
		arr[1] = by;
		arr[2] = bz;
		//arr[3] = spd;
		arr[4] = dir;
		arr[5] = curve;
		arr[6] = type;
		arr[7] = spawner;
		//arr[8] = lifespan;
		arr[9] = timer;
        
        ds_list_replace(global.bullet_list_M,i,arr);
    }
}
#endregion