$(document).on('turbolinks:load', function() {
    $(document).ready(function() {

        var clipboard = new Clipboard('.clipboard-btn');
        $('input.input_text, textarea#textarea2').characterCounter();
        $('.bxslider').bxSlider({
            slideWidth: 700,
            randomStart: false
        });
        M.updateTextFields();

    });
    Pace.on('done', function(){
            $('.wrap').fadeIn();
        });

});

