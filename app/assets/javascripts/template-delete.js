$(document).on('turbolinks:load', function() {
  $(function(){
    $(".is-modal-icon").on('click', function(){
      $(".is-modal__body_gray").text("");
      [...Array(5)].map((_, i) => $(".is-modal__body_gray").append(`質問${i +1}: ${$(this).data(`question${i +1}`)} <br />`));
      var id = $(this).data('id');
      $(".button_to").attr('action', `/templates/${id}`);
      $(".is-modal").fadeIn();
    })
    $(".cancel-btn,.is-modal").unbind().click(function(){
      $(".is-modal").fadeOut();
    })
  });
});
