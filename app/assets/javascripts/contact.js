// contact関係
// contact complete消す
$(function() {
  $('.close-modal').click(function(){
    $('#j_contact').hide('slow');
    $('#ajax_contact_table').show('slow');
    $(".ajax_text1, .ajax_num, .ajax_text2").val('');
  });
});
// // 編集フォーム表示切替 
$(document).on("click", "#e_user", function () {
  $("#e_us_form").toggle('slow');
});