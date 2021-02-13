// contract関係
// contract　新規登録バリデーション
$(function() {
  $('#form').submit(function() {
    // フォーム入力値を代入
    var selectValue = $('.ajax_text').val();
    var numValue = $('.ajax_num').val();
    // フォームのいずれが空の時はエラー表示
    if( selectValue == "" || numValue == "" ){
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('空欄があります');
    } else if ( numValue.length > 10 ) {
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('保険証書番号が10桁以上です');
    } else {
      // 正しく入力された場合はエラー削除
      $('#error-message').text('');
    }
  });
});
// contract　変更バリデーション
$(function() {
  $('#ctr_e_form').submit(function() {
    // フォーム入力値を代入
    var selectValue = $('.e_ajax_text').val();
    var numValue = $('.e_ajax_num').val();
    // フォームのいずれが空の時はエラー表示
    if( selectValue == "" || numValue == "" ){
      $("#e_error-message").removeClass();
      $("#e_error-message").addClass("error-message");
      $('#e_error-message').text('空欄があります');
    } else if ( numValue.length > 10 ) {
      $("#e_error-message").removeClass();
      $("#e_error-message").addClass("e_error-message");
      $('#e_error-message').text('保険証書番号が10桁以上です');
    } else {
      // 正しく入力された場合はエラー削除
      $('#error-message').text('');
    }
  });
});
// 編集フォーム表示切替 
$(function() {
  // フォームを開く
  // リロードしないと表示されなくなるため、documentを付与
$(document).on("click", "#e_contract", function () {
  const contractId = $(this).data('contract-id');
  const contractTextArea = $('#contract_e-' + contractId);
  contractTextArea.toggle('slow');
});
});