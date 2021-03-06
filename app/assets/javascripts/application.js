// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require_tree .
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
// 文字数制限 contact comment post 共通利用
$(function() {
    //入力時のイベント    
    $(document).on("input", "#t_count", function () {
        //文字数を取得
        var count = $(this).val().length;
        //現在の文字数を表示
        $('.now_count').text(count);
    });
    // リロード時に初期文字列が入っていた時の対策
    $('#t_count').trigger('input');
});