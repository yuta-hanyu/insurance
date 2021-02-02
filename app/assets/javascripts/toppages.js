$(function() {
  
  // メイン画像
  $('#main_visual').fadeIn("slow");
  // 機能概要説明
  $(function(){
      setTimeout(function(){
      $('.output1').fadeIn('slow');
      }, 1000);
      setTimeout(function(){
      $('.output2').fadeIn('slow');
      }, 2000);
      setTimeout(function(){
      $('.output3').fadeIn('slow');
      }, 3000);
      setTimeout(function(){
      $('.output4').fadeIn('slow');
      }, 4000);
  });
  });
// ログイン、ゲストログインmodal  
  $(function() {
      // ログインモーダル開く
    $('.login_show').click(function(){
      $('#login_modal').slideDown('slow');
    });
    // ゲストモーダル開く
    $('.guest_show').click(function(){
      $('#guest_modal').slideDown('slow');
    });  
    // adminモーダル開く
    $('.admin_login_show').click(function(){
      $('#admin_login_modal').slideDown('slow');
    });  
    // モーダル閉じる
    $('.close-modal').click(function(){
      $('#login_modal').slideUp('slow');
      $('#guest_modal').slideUp('slow');
      $('#admin_login_modal').slideUp('slow');
    });
  });
// FAQ
  $(function() {
    $('.faq-list-item').click(function(){
      var $answer = $(this).find('.answer');
      if($answer.hasClass('open')) {
        $answer.removeClass('open');
        $answer.slideUp();
        $(this).find('span').text('+');
        $(this).find('.question').css('background-color','#f4f4f4')
      } else {
        $answer.addClass('open');
        $answer.slideDown();
        $(this).find('span').text('-');
        $(this).find('.question').css('background-color','#ffffbc')
      }
    });
  });
// ナビアイテム
  $(function(){
  $('.navbar-nav li ').hover(
    function(){
      $(this).animate({
        'font-size':'25px'
      },300);
    },
    function(){
      $(this).animate({
        'font-size':'20px'
      },300)
    })
  });
// トップへ戻るボタン（ロゴ）
  $(function(){
    $('.top_btn').click(function(){
      $('html,body').animate({
        'scrollTop':0
      },'slow')
    });
    $('.top_btn').hover(
    function(){
      $(this).animate({
        'font-size':'25px'
      },300);
    },
    function(){
      $(this).animate({
        'font-size':'15px'
      },300)
  });
  // フラッシュMSG
  $(function(){
    setTimeout(function() {
    $('.flash_msg').fadeOut('slow');
    },3000);
  });
  // トップページスラインドイン
  $('.animated').waypoint({
    handler(direction) {
      
      if (direction === 'down') {
        $(this.element).removeClass('fadeOutUp');
        $(this.element).addClass('fadeInUp');
      } else {
        // $(this.element).removeClass('fadeInUp');
        // $(this.element).addClass('fadeOutUp')
      }
    },
    offset: '100%',
  });
　// ローディング
  // 読み込んだらフェードアウト
  $(window).load(function () {
      $('.loading').delay(100).fadeOut(100);
  });
  function stopload(){
      $('.loading').delay(100).fadeOut(100);
  }
  setTimeout('stopload()',10000);
  
  // 画像プレビュー
  $(function(){
  $('#myfile').on('change', (e) => {
    //ファイルオブジェクトを取得する
    var file = e.target.files[0];
    var reader = new FileReader();
    $('#pImg').css('display', 'block');
 
    //画像≠場合はストップ
    if(file.type.indexOf("image") < 0){
      alert("画像ファイルを指定してください。");
      return false;
    }
 
    //アップロードした画像を表示する
    reader.onload = (function(file){
      return (e) => {
        $('#pImg').attr('src', e.target.result);
        $('#pImg').attr('title', file.name);
      };
    })(file);
    reader.readAsDataURL(file);
 
  });
});
// スライドショー
$('.likes').slick({
  arrows: true,
  prevArrow:'<div class="prev"><i class="fas fa-angle-double-left"></i></div>',
  nextArrow:'<div class="next"><i class="fas fa-angle-double-right"></i></div>',
  autoplay: true,
  autoplaySpeed: 700,
  centerMode: true,
  centerPadding: '60px',
  slidesToShow: 3,
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 2
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: false,
        centerMode: true,
        centerPadding: '40px',
        slidesToShow: 1
      }
    }
  ]
});

});

