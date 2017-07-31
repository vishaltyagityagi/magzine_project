$(document).ready(function () {
    var count = 1;

    $("#c_text_box").click(function () {
        count++;
        console.log("count-------"+count);

        var id = 'text_box_'+($('#form_create .form-group input[type="text"]').length + 1).toString();
        $('#form_create #append_elements').append('<div class="form-group"><label class="" for="" id="label_' + id + '">Create Textbox</label><input class="form-control" id="' + id + '" name="textboxes[]" placeholder="Textbox Label" size="15" type="text"><input type="hidden" name="textboxes_id[]" value="' + id + '"></div>');
    });

    $("#c_text_area").click(function () {
        count++;
        console.log("count-------"+count);

        var id = 'text_area_'+($('#form_create .form-group textarea').length + 1).toString();
        $('#form_create #append_elements').append('<div class="form-group"><label class="" for="" id="label_' + id + '">Create Textarea</label><input class="form-control" id="' + id + '" name="textareas[]" placeholder="TextArea Label" size="15" type="text"><input type="hidden" name="textareas_id[]" value="' + id + '"></div>');
    });
});