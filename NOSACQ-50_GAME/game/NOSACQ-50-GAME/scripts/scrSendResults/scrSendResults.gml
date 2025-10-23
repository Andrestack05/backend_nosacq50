/// scrSendResults()

// Asegurarse de que exista el array
if (!variable_global_exists("answers")) {
    show_debug_message("⚠️ El array de respuestas no existe.");
    exit;
}

// Crear un identificador único para el jugador
var playerTag = "Jugador_" + string(global.player_id);


// Construir el JSON manualmente
var json_payload = "{\"player_id\":\"" + playerTag + "\",\"responses\":[";

for (var i = 0; i < array_length(global.answers); i++) {
    json_payload += "{\"question_number\":" + string(i + 1) + ",\"value\":" + string(global.answers[i]) + "}";
    if (i < array_length(global.answers) - 1) json_payload += ",";
}

json_payload += "]}";

// Mostrar JSON para depurar
show_debug_message("JSON enviado: " + json_payload);

// Configurar encabezados
var headers = ds_map_create();
ds_map_add(headers, "Content-Type", "application/json");

// Enviar al servidor FastAPI
var url = "https://backend-nosacq50.onrender.com/submit";
global.http_request_id = http_request(url, "POST", headers, json_payload);

// Limpiar
ds_map_destroy(headers);

