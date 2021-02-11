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
      $('#error-message').text('未入力があります。入力内容をご確認ください。');
    }
  });
  // モーダル閉じる
  $('.close-modal').click(function(){
      $('.claim_modal_wrapper').hide('slow');
      $('#j_claim').hide('slow');
      $(".claim_form").show('slow');
  });
});
// 詳細表示切替 
$(function() {
    // フォームを開く
    // リロードしないと表示されなくなるため、documentを付与
  $(document).on("click", "#e_claim", function () {
    const claimId = $(this).data('claim-id');
    const claimArea = $('#claim_e-' + claimId);
    claimArea.toggle('slow');
  });
});