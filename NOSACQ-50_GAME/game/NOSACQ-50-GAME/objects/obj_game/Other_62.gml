/// obj_game - Async HTTP Event
var result = ds_map_find_value(async_load, "result");
var status = ds_map_find_value(async_load, "status");
var response = ds_map_find_value(async_load, "response");

if (status == 200) {
    show_debug_message("✅ Datos enviados correctamente: " + string(response));
} else {
    show_debug_message("⚠️ Error al enviar datos. Status: " + string(status));
    show_debug_message("Respuesta del servidor: " + string(response));
}
