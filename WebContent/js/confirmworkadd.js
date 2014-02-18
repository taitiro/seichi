$(document).ready(function(){
    
  $('#confirm-form').submit(function(){
    /*名前未入力*/
    if( $('#input-name').val() == '' ){
      alert('名前が入力されていません');
      return false;
    }
    /*説明文未入力*/
    if( $('#textarea-workdesc').val() == '' ){
      alert('説明文が入力されていません');
      return false;
    }
    
    return true;
  });
  
  $('#textarea-workdesc').change(function(){
    if( $('#textarea-workdesc').val() != '' ){
      $('#textarea-workdesc-wrapper').removeClass("has-error");
      $('#textarea-workdesc-wrapper').addClass("has-success");
    }else{
      $('#textarea-workdesc-wrapper').removeClass("has-success");
      $('#textarea-workdesc-wrapper').addClass("has-error");
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
	  $('#input-captcha-img').attr('src', 'jcaptcha.jpg?' + now);
  });
});