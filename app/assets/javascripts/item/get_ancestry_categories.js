jQuery(document).on('turbolinks:load', function(){

  // -----関数定義-------------------------------------------------------------------------------------------------------
  function ancestry_check (ignited_html_id) {
    if(ignited_html_id == "parent-category-menu") {
      return "child";
    }
    else {
      return "grandchild";
    }
  }

  function categoryHTML(category) {
    let html = `<option value = "${category.id}" >${category.name}</option>`;

    return html;
  };

  function menuHTML(categoriesHTML, ancestry_name) {
    let html = 
      `<div class="sell-form-box__select-wrap" id= "${ancestry_name}-category-menu-wrap"}>
        <i class="fas fa-chevron-down"></i>
        <select class="selector-category" id="${ancestry_name}-category-menu" name="item[category_id]">
          <option value="">---</option>
          ${categoriesHTML}
        </select>
      </div>`

    return html;
  }

  function delete_menu(ancestry_name) {
    $('#grandchild-category-menu-wrap').remove();

    if(ancestry_name == "child") {
      $('#child-category-menu-wrap').remove();
    }
  }

  function add_menu(ancestry_name, category_id) {
    if(category_id != "") {
      $.ajax({
        url: '/items/new',
        type: 'GET',
        data: {category_id},
        dataType: 'json'
      })

      .done(function(categories){
        delete_menu(ancestry_name);

        let categoriesHTML = '';
        categories.forEach(function(category) {
          categoriesHTML += categoryHTML(category);
        });

        insertHTML = menuHTML(categoriesHTML, ancestry_name);

        $('#category-menus').append(insertHTML);
      })

      .fail(function(){
        alert('カテゴリーの取得に失敗しました');
      })

    } else {
      delete_menu(ancestry_name);
    }
  }

  // -----子カテゴリのプルダウンメニュー作成-------------------------------------------------------------------------
  $('#parent-category-menu').on('change', function() {

    add_menu(ancestry_check(this.id), $(this).val());

  });

  // -----孫カテゴリのプルダウンメニュー作成-------------------------------------------------------------------------
  $('#category-menus').on('change', '#child-category-menu', function() {

    add_menu(ancestry_check(this.id), $(this).val());

  });
});
