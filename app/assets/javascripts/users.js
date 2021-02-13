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
// contract関係
// contract　新規登録バリデーション
$(function() {
  $('#form').submit(function() {
    // フォーム入力値を代入
    var selectValue = $('.ajax_text').val();
    var textValue = $('.ajax_num').val();
    // フォームのいずれが空の時はエラー表示
    if( selectValue == "" || textValue == ""){
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('空欄がある、もしくは保険証書番号が１０桁以上です。');
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
// post関係
// post complete消す
$(function() {
$(document).on("click", ".close-modal", function () {
    $('#j_post').hide('slow');
    $('.post_form').show('slow');
  });
});
// postバリデーション
$(function() {
  $('.post_form').submit(function() {
    // フォーム入力値を代入
    var text1Value = $('.p_ajax_text1').val();
    var text2Value = $('.p_ajax_text2').val();
    var text3Value = $('.p_ajax_text3').val();
    // フォームのいずれが空の時はエラー表示
    if( text1Value == "" || text2Value == "" || text3Value == "") {
      $("#error-message").removeClass();
      $("#error-message").addClass("error-message");
      $('#error-message').text('空欄、もしくは画像が未登録です');
    } else {
      // 正しく入力された場合はエラー削除
      $('.error-message').text('');
    }
  });
});
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

