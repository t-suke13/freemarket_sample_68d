$(document).on('turbolinks:load', function(){
  $(function(){

    function buildHTML(count) {
      var html = `<div class="preview-box" id="preview-box__${count}">
                    <div class="upper-box">
                      <img src="" alt="preview">
                    </div>
                    <div class="lower-box">
                      <div class="update-box">
                        <span class="edit_btn">編集</span>
                      </div>
                      <div class="delete-box" id="delete_btn_${count}">
                        <span>削除</span>
                      </div>
                    </div>
                  </div>`
      return html;
    }

    // 投稿編集時
    if (window.location.href.match(/\/items\/\d+\/edit/)){
      var prevContent = $('.label-content').prev();
      labelWidth = (620 - $(prevContent).css('width').replace(/[^0-9]/g, ''));
      $('.label-content').css('width', labelWidth);
      $('.preview-box').each(function(index, box){
        $(box).attr('id', `preview-box__${index}`);
      })
      $('.delete-box').each(function(index, box){
        $(box).attr('id', `delete_btn_${index}`);
      })
      var count = $('.preview-box').length;
      if (count == 10) {
        $('.label-content').hide();
      }
    }
    //=============================================================================

    // ラベルのwidth操作
    function setLabel() {

      var count = $('.preview-box').length;
      if (count == 0) {
        $('.label-content').css('width', 620)
      }
      if (count == 1) {
        $('.label-content').css('width', 496 )
      }
      if (count == 2) {
        $('.label-content').css('width', 372 )
      }
      if (count == 3) {
        $('.label-content').css('width', 248 )
      }
      if (count == 4) {
        $('.label-content').css('width', 124)
      }
      if (count == 5) {
        $('.label-content').css('width', 620)
      }
      if (count == 6) {
        $('.label-content').css('width', 496)
      }
      if (count == 7) {
        $('.label-content').css('width', 372 )
      }
      if (count == 8) {
        $('.label-content').css('width', 248 )
      }
      if (count == 9) {
        $('.label-content').css('width', 124)
      }
    }
    

    $(document).on('change', '.hidden-field', function() {
      setLabel();
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
      var file = this.files[0];
      var reader = new FileReader();
      reader.readAsDataURL(file);
      reader.onload = function() {
        var image = this.result;
        if ($(`#preview-box__${id}`).length == 0) {
          var count = $('.preview-box').length;
          var html = buildHTML(id);
          $('.label-content').before(html);
        }
        $(`#preview-box__${id} img`).attr('src', `${image}`);
        var count = $('.preview-box').length;
        if (count == 10) { 
          $('.label-content').hide();
        }

        if ($(`#item_images_attributes_${id}__destroy`)){
          $(`#item_images_attributes_${id}__destroy`).prop('checked',false);
        } 
        //=============================================================================

        setLabel();
        if(count < 10){
          $('.label-box').attr({id: `label-box--${count}`,for: `item_images_attributes_${count}_image`});
        }
      }
    });

    $(document).on('click', '.delete-box', function() {
      var count = $('.preview-box').length;
      setLabel(count);
      var id = $(this).attr('id').replace(/[^0-9]/g, '');
      $(`#preview-box__${id}`).remove();

      //新規登録時と編集時の場合分け==========================================================

      //新規投稿時
      if ($(`#item_images_attributes_${id}__destroy`).length == 0) {
        $(`#item_images_attributes_${id}_image`).val("");
        var count = $('.preview-box').length;
        if (count == 9) {
          $('.label-content').show();
        }
        setLabel(count);
        if(id < 10){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});

        }
      } else {

        //投稿編集時
        $(`#item_images_attributes_${id}__destroy`).prop('checked',true);
        if (count == 10) {
          $('.label-content').show();
        }

        setLabel();
        if(id < 10){
          $('.label-box').attr({id: `label-box--${id}`,for: `item_images_attributes_${id}_image`});
        }
      }
      //=============================================================================
    });
  });
});