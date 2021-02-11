// モーダル確認
$(function() {
  // モーダル開く
  $("#modal_confirm").click(function () {
      // 入力値を取得
      var patient = $('#patient').val()
      var illness = $('#illness').val()
      var hospitalStay = $('#hospitalStay').val()
      var policyNumber = $('#policyNumber').val()
      var accountNumber = $('#accountNumber').val()
      var destination = $('#destination').val()
      // 画像プレビューのためここだけはclass
      var receiptImg = $('.receiptImg').val()
      // 取得した入力値を挿入
      $('#modalPatient').text(patient)
      $('#modalIllness').text(illness)
      $('#modalHospitalStay').text(hospitalStay)
      $('#modalPolicyNumber').text(policyNumber)
      $('#modalAccountNumber').text(accountNumber)
      $('#modalDestination').text(destination)
      $('#modalReceiptImg').text(receiptImg)
    　
    if(patient != "" && illness != "" && hospitalStay != "" && policyNumber != "" && accountNumber != "" && destination != "" && receiptImg != "") {
      // モーダル 開く
      $(".claim_modal_wrapper").show('slow');
      // 正しく入力された場合はエラー削除
      $('.error-message').text('');
    } else {
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('未入力があります');
    }
    
  });
  // モーダル閉じる
  $('.close-modal').click(function(){
      $('.claim_modal_wrapper').hide('slow');
  });
})
// バリデーション
// $(function() {
//   $('#modal_confir').click(function() {
//     // フォーム入力値を代入
//     var text1Value = $('.ajax_text1').val();
//     var numValue = $('.ajax_num').val();
//     var text2Value = $('.ajax_text2').val();
//     // フォームのいずれが空の時はエラー表示
//     if( text1Value == "" || numValue == "" || text2Value == "") {
//       $("#error-message").removeClass();
//       $("#error-message").addClass("error-message");
//       $('#error-message').text('空欄があります');
//     } else {
//       // 正しく入力された場合はエラー削除
//       $('.error-message').text('');
//     }
//   });
// });