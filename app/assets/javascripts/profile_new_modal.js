$(document).on('turbolinks:load', function() {	
  if (window.location.href.match(/profiles/) && window.location.href.match(/new/) ){	
    $(".is-modal").fadeIn();

    $(".profile-close-btn,.is-modal").unbind().click(function(){
      $(".is-modal").fadeOut();
    })
  }
});