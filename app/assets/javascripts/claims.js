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
    //   // モーダル 開く
      $(".claim_modal_wrapper").show('slow');
      $("#new_msg").html('');
  });
  // モーダル閉じる
  $('.close-modal').click(function(){
      $('.claim_modal_wrapper').hide('slow');
      $('#j_claim').hide('slow');
      $(".claim_form").show('slow');
  });
});
// userの詳細表示切替 
$(function() {
    // フォームを開く
    // リロードしないと表示されなくなるため、documentを付与
  $(document).on("click", "#e_claim", function () {
    const claimId = $(this).data('claim-id');
    const claimArea = $('#claim_e-' + claimId);
    claimArea.toggle('slow');
  });
});
// adminの詳細表示切替 
$(function() {
    // フォームを開く
    // リロードしないと表示されなくなるため、documentを付与
  $(document).on("click", "#ad_claim", function () {
    const adClaimId = $(this).data('claim-id');
    const adClaimArea = $('#ad_claim_e-' + adClaimId);
    adClaimArea.toggle('slow');
  });
});