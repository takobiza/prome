$(document).on('turbolinks:load', function() {	
  $(document).ready(function() {
    var flipbook= $("#flipbook");
    if( flipbook.length == 1 ){
      $("#flipbook").turn({
        width: 1400,
        height: 386,
        autoCenter: true,
        gradients: true
      });
    }
});
});
