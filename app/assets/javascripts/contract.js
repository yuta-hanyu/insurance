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