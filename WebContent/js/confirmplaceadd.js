$(document).ready(function(){
  var defworkid = true;
  
  $('#select-workid').select2();
  
  $('#confirm-form').submit(function(){
    /*名前未入力*/
    if( $('#input-name').val() == '' ){
      alert('名前が入力されていません');
      return false;
    }
    /*関連作品未入力*/
    if( $('#select-workid').val() == '' ){
      alert('関連作品が入力されていません');
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
  
  $('#select-workid').change(function(){
    if( defworkid && $('#select-workid').val() != '' ){
      $('#select-workid-wrapper').removeClass("has-error");
      $('#select-workid-wrapper').addClass("has-success");
      defworkid = false;
    }
    
  $('#textarea-placedesc').change(function(){
    if( $('#textarea-placedesc').val() != '' ){
      $('#textarea-placedesc-wrapper').removeClass("has-error");
      $('#textarea-placedesc-wrapper').addClass("has-success");
    }else{
      $('#textarea-placedesc-wrapper').removeClass("has-success");
      $('#textarea-placedesc-wrapper').addClass("has-error");
    }
  });
  });
});