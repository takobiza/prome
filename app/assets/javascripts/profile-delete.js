$(document).on('turbolinks:load', function() {
  $(function(){
    $(".is-modal-profile-icon").on('click', function(){
      $(".is-modal__body_gray").text("");
      $(".is-modal__body_gray").append(`${$(this).data(`name`)}さんのプロフィールを削除してもよろしいでしょうか？`);
      var id = $(this).data('id');
      var template_id = $(this).data('template-id');
      $(".button_to").attr('action', `/templates/${template_id}/profiles/${id}`);

      $(".is-modal").fadeIn();
    })
    $(".cancel-btn,.is-modal").unbind().click(function(){
      $(".is-modal").fadeOut();
    })
  });
});
