$(document).on('turbolinks:load', function() {
    $(document).ready(function() {
        var form = $("#example-form");
        form.children("div").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slideLeft",
            onStepChanging: function(event, currentIndex, newIndex) {
                var index = currentIndex + 1
                var text= $(`textarea[name="question${index}"]`).val();
                if (text == ""){
                  sweetAlert("質問は必須入力です");
                  return false;
                }
                console.log(text);
                return true;
            },
            onFinished: function(event, currentIndex) {
                $('#questionsbutton').click();
            }
        });
    });
});
