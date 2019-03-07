
$(document).on('turbolinks:load', function() {
$(document).ready(function(){

  var clipboard = new Clipboard('.clipboard-btn');
  $('input.input_text, textarea#textarea2').characterCounter();
  $('.bxslider').bxSlider({
    auto: true,
    speed: 2000,
    moveSlides: 1,
    pause: 10000,
    maxSlides: 2,
    slideWidth: 700,
    randomStart: false,
    autoHover: true
  });
  M.updateTextFields();
});
});


