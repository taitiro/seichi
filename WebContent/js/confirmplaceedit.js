$(document).ready(function(){
  $('#confirm-form').submit(function(){
    /*名前未入力*/
    if( $('#input-name').val() == '' ){
      alert('名前が入力されていません');
      return false;
    }
    /*住所未入力*/
    if( $('#input-address').val() == '' ){
      alert('住所が入力されていません');
      return false;
    }
    /*説明文未入力*/
    if( $('#textarea-placedesc').val() == '' ){
      alert('説明文が入力されていません');
      return false;
    }
    
    return true;
  });
  
  $('#textarea-placedesc').change(function(){
    if( $('#textarea-placedesc').val() != '' ){
      $('#textarea-placedesc-wrapper').removeClass("has-error");
      $('#textarea-placedesc-wrapper').addClass("has-success");
    }else{
      $('#textarea-placedesc-wrapper').removeClass("has-success");
      $('#textarea-placedesc-wrapper').addClass("has-error");
    }
  });

  $('#input-captcha').change(function(){
    if( $('#input-captcha').val() != '' ){
      $('#input-captcha-wrapper').removeClass("has-error");
      $('#input-captcha-wrapper').addClass("has-success");
    }
  });

  $('#input-captcha-refresh').click(function(){
	  var now = new Date().getTime();
	  $('#input-captcha-img').attr('src', '../jcaptcha.jpg?' + now);
  });
});