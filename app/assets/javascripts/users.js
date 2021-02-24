// ログイン、ゲスト、アドミン、新規登録modal  
  $(function() {
      // ログインモーダル開く
    $('.login_show').click(function(){
      $('#login_modal').show('slow');
    });
    // ゲストモーダル開く
    $('.guest_show').click(function(){
      $('#guest_modal').show('slow');
    });  
    // adminモーダル開く
    $('.admin_login_show').click(function(){
      $('#admin_login_modal').show('slow');
    });  
    // 新規登録モーダル開く
    $('.new_show').click(function(){
      $('#new_modal').show('slow');
    }); 
    // モーダル閉じる
    $('.close-modal').click(function(){
      $('#login_modal').hide('slow');
      $('#guest_modal').hide('slow');
      $('#admin_login_modal').hide('slow');
      $('#new_modal').hide('slow');
      // モーダルのエラーmsg削除
      $('#errors_new').html('').removeClass();
      $('#errors_login').html('').removeClass();
    });
  });
// <!--登録者数確認-->
$(function() {
  // フォームを開く
$(document).on("click", "#hide_btn", function () {
  $(".hidearea").toggle('slow');
});
});