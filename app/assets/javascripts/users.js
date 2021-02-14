

// contact関係
// contact complete消す
$(function() {
    $('.close-modal').click(function(){
      $('#j_contact').hide('slow');
      $('#ajax_contact_table').show('slow');
      $(".ajax_text1, .ajax_num, .ajax_text2").val('');
    });
});
// contactバリデーション
$(function() {
  $('#contact_form').submit(function() {
    // フォーム入力値を代入
    var text1Value = $('.ajax_text1').val();
    var text2Value = $('.ajax_text2').val();
    // フォームのいずれが空の時はエラー表示
    if( text1Value == "" || text2Value == "") {
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('空欄があります');
    } else {
      // 正しく入力された場合はエラー削除
      $('.error-message').text('');
    }
  });
});
// comment関係
// commentバリデーション
$(function() {
  $('#comment_form').submit(function() {
    // フォーム入力値を代入
    var textValue = $('.ajax_text').val();
    // フォームのいずれが空の時はエラー表示
    if( textValue == ""){
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('返信が入力されてません');
    } else {
      // 正しく入力された場合はエラー削除
      $('.error-message').text('');
    }
  });
});
// // 編集フォーム表示切替 
$(document).on("click", "#e_user", function () {
  $("#e_us_form").toggle('slow');
});


