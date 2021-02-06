$(function() {
  // 住所自動登録API
  $("#zip-code").change(function() {
    let zip = $(this).val();
    $.ajax({
      url: "https://zipcloud.ibsnet.co.jp/api/search",
      type: "GET",
      data: {zipcode: zip},
      dataType: "JSONP"
    })
      .done(function(value) {
        if (value.message == null) {
          let result = value.results[0];
          $(".place").val(result.address1 + result.address2 + result.address3);
        } else {
          $(".place").val(value.message);
          alert("郵便番号が誤っています");
        }
      })
      .fail(function() {
        alert("郵便番号が誤っています");
      });
  });
});
// contractバリデーション
$(function() {
  $('#form').submit(function() {
    // フォーム入力値を代入
    var selectValue = $('.ajax_text').val();
    var textValue = $('.ajax_num').val();
    // フォームのいずれが空の時はエラー表示
    if( selectValue == "" || textValue == ""){
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('空欄があります');
    } else {
      // 正しく入力された場合はエラー削除
      $('#error-message').text('');
    }
  });
});
// commentバリデーション
$(function() {
  $('#contact_form').submit(function() {
    // フォーム入力値を代入
    var selectValue = $('.ajax_text').val();
    // フォームのいずれが空の時はエラー表示
    if( selectValue == ""){
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('返信が入力されてません');
    } else {
      // 正しく入力された場合はエラー削除
      $('.error-message').text('');
    }
  });
// 編集フォーム表示切替 
  $(function() {
      // フォームを開く
    $(document).on("click", "#e_contract", function () {
        $('.e_form').toggle('slow');
    });

  });
  
});