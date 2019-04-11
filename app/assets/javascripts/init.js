$(document).on('turbolinks:load', function() {
    $(document).ready(function() {

        var clipboard = new Clipboard('.clipboard-btn');
        $('input.input_text, textarea#textarea2').characterCounter();
        M.updateTextFields();

    });
    Pace.on('done', function(){
            $('.wrap').fadeIn();
        });

});

