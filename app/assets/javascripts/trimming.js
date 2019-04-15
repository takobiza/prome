$(function() {

    var cropper;
    var croppable = false;

    function initIconCrop() {
        cropper = new Cropper(crop_img, {
            dragMode: 'move',
            aspectRatio: 1,
            restore: false,
            guides: false,
            center: false,
            highlight: false,
            cropBoxMovable: false,
            cropBoxResizable: false,
            minCropBoxWidth: 280,
            minCropBoxHeight: 280,
            ready: function() {
                croppable = true;
            }
        });
    }

    var croppedCanvas;

    function iconCropping() {
        if (!croppable) {
            alert('トリミングする画像が設定されていません。');
            return false;
        }
        croppedCanvas = cropper.getCroppedCanvas({
            width: 280,
            height: 280,
        });
        var croppedImage = document.createElement('img');
        croppedImage.src = croppedCanvas.toDataURL();
        img_field.innerHTML = '';
        img_field.appendChild(croppedImage);
    };

    var blob;

    function blobing() {
      var formElement = document.querySelector("form");
      var formData = new FormData(formElement);
        if (croppedCanvas && croppedCanvas.toBlob) {
            croppedCanvas.toBlob(function(b) {
                blob = b;
                formData.append('image', b);
                sending(formData);
            });
        } else if (croppedCanvas && croppedCanvas.msToBlob) {
            blob = croppedCanvas.msToBlob();
            formData.append('image', blob);
            sending(formData);
        } else {
            blob = null;
            sending(formData);
        };

    };

    function messageBuildHTML(errormessage) {
        var messageHTML = `<div class="flash flash__alert">
            ${errormessage}
        </div>`;
        return messageHTML;
    };

    function sending(formData) {
      $.ajaxPrefilter(function(options, originalOptions, jqXHR){
      var token;
      if (!options.crossDomain){
        token = $('meta[name="csrf-token"]').attr('content');

        if (token){
          return jqXHR.setRequestHeader('X-CSRF-Token', token);
        };
      };
    });
        $.ajax({
                type: 'POST',
                url: '.',
                data: formData,
                processData: false,
                contentType: false,
                dataType: 'json',
            }).done(function(datas) {
                 if (datas.success[0] == "成功"){
                    location.href = datas.url;
                 }else {
                    $('.error').empty();
                    var html = messageBuildHTML(datas.errormessage);
                    $('.error').append(html);
                    window.scrollTo(0,50);
                    sweetAlert("名前は必須入力です");
                 }
                }).fail(function() {
                  alert('失敗');
                });
    };

    $('#upicon').on('change', function(e) {
        file = e.target.files[0];
        reader = new FileReader();

        if (file.type.indexOf('image') < 0) {
            return false;
        };

        reader.onload = (function(e) {
            $('.overlay').fadeIn();
            $('.crop_modal').append($('<img>').attr({
                src: e.target.result,
                height: "100%",
                class: "preview",
                id: "crop_img",
                title: file.name
            }));
            initIconCrop();
        });
        reader.readAsDataURL(file);
    });

    $('.select_icon_btn').on('click', function() {
        iconCropping();
        $('.overlay').fadeOut();
        $('#crop_img').remove();
        $('.cropper-container').remove();
    });

    $('.close_btn').on('click', function() {
        $('.overlay').fadeOut();
        $('#crop_img').remove();
        document.getElementById("upicon").value = '';
        $('.cropper-container').remove();
    });



    $('.button3').on('click', function(){

      blobing();
    });

});
