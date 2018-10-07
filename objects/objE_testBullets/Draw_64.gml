draw_set_font(fnt_debug);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);

draw_text(0,0,"<Q/A> type = "+string(type)+": "+global.btype[type]);
draw_text(0,8,"<W/S> spd = "+string(spd));
draw_text(0,16,"<E/D> dir = "+string(dir));
draw_text(0,24,"<R/F> curve = "+string(curve));
draw_text(0,32,"<T/G> lifespan = "+string(lifespan));
draw_text(0,40,"<Y/H> freq = "+string(freq));
draw_text(0,48,"<space> immune = "+string(immune));