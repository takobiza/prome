$(document).on('turbolinks:load', function() {
    $(document).ready(function() {
        var form = $("#example-form");
        form.children("div").steps({
            headerTag: "h3",
            bodyTag: "section",
            transitionEffect: "slideLeft",
            onStepChanging: function(event, currentIndex, newIndex) {
                if (currentIndex < newIndex){
                    var index = currentIndex + 1
                    var text= $(`textarea[name="question${index}"]`).val();
                    if (text == ""){
                      sweetAlert("質問は必須入力です");
                      return false;
                    }else if(text.length >= 30){
                      sweetAlert("30文字以上は登録出来ません");
                      return false;
                    }
                }
                return true;
            },
            onFinished: function(event, currentIndex) {
                $('#questionsbutton').click();
            }
        });
    });
});
