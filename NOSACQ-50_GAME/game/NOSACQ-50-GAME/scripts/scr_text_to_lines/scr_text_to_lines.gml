
/// @function wrap_text_to_lines(_text, _maxw)
/// @param _text
/// @param _maxw
/// Devuelve una ds_list con líneas de texto ajustadas al ancho.
function wrap_text_to_lines(_text, _maxw) {
    var lines = ds_list_create();
    var words = string_split(_text, " ");
    var cur = "";

    for (var i = 0; i < array_length(words); i++) {
        var w = words[i];
        var test = (cur == "") ? w : cur + " " + w;

        if (string_width(test) <= _maxw) {
            cur = test;
        } else {
            ds_list_add(lines, cur);
            cur = w;
        }
    }

    if (cur != "") ds_list_add(lines, cur);
    return lines;
}