/// @description free surfaces
show_debug_message("objM destroyed!");
surface_free(surf3D);
surface_free(surface_mp);
surface_free(surface);
part_system_destroy(ps);
part_type_destroy(pt);