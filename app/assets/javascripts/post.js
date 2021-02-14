// post関係
// post complete消す
$(function() {
$(document).on("click", ".close-modal", function () {
    $('#j_post').hide('slow');
    $('.post_form').show('slow');
  });
});
// postバリデーション
// $(function() {
//   $('.post_form').submit(function() {
//     // フォーム入力値を代入
//     var text1Value = $('.p_ajax_text1').val();
//     var text2Value = $('.p_ajax_text2').val();
//     var text3Value = $('.p_ajax_text3').val();
//     // フォームのいずれが空の時はエラー表示
//     if( text1Value == "" || text2Value == "" || text3Value == "") {
//       $("#error-message").removeClass();
//       $("#error-message").addClass("error-message");
//       $('#error-message').text('空欄、もしくは画像が未登録です');
//     } else {
//       // 正しく入力された場合はエラー削除
//       $('.error-message').text('');
//     }
//   });
// });
// 詳細表示切替 
$(function() {
    // フォームを開く
    // リロードしないと表示されなくなるため、documentを付与
  $(document).on("click", "#e_post", function () {
    const postId = $(this).data('post-id');
    const postArea = $('#post_e-' + postId);
    postArea.toggle('slow');
  });
});