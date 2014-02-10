$(function() {
  var i = 0, mapObj,service, 
      thisGPosistion = new google.maps.LatLng(thisLat, thisLng),
      mapOpt = {
        zoom : 17,
        mapTypeId : google.maps.MapTypeId.ROADMAP,
        scaleControl : true,
        center : thisGPosistion,
        disableDoubleClickZoom : true,
        draggable : true,
        scrollwheel : true,
      },
      request={
        reference : thisReference
      };
  mapObj = new google.maps.Map($('#map')[0], mapOpt);
  new google.maps.Marker({
    position : thisGPosistion,
    map : mapObj,
    title : thisName,
  });
  $('#map-container').show();
  /* Googleプレイスライブラリから口コミ情報を取得・表示 */
  service = new google.maps.places.PlacesService(map);
  service.getDetails(request, function (place, status) {
    var reviews = new Array(),str,isEmpty =true;
    if (status == google.maps.places.PlacesServiceStatus.OK && place.reviews != null) {
      for(i=0;i<place.reviews.length;i++){
        if(place.reviews[i].text != null && place.reviews[i].text != ''){
          isEmpty = false;
          str = '<div class-"well"><p>' + place.reviews[i].text + ' by ';
          if(place.reviews[i].author_url != null && place.reviews[i].author_url != ''){
            str += ('<a href="' + place.reviews[i].author_url + '">' + place.reviews[i].author_name + '</a>');
          }else{
            str += place.reviews[i].author_name;
          }
          str += '</p></div>';
          $('#google-place').append(str);
        }
      }
      if(isEmpty){
        $('#google-place').append('<div class-"well"><p class="alert alert-danger">Googleプレイスに口コミ情報は登録されていませんでした．</p></div>');
      }
    }else{
        $('#google-place').append('<div><p class="alert alert-danger">Googleプレイスに口コミ情報は登録されていませんでした．</p></div>');
    }
    $('#google-place-wrapper').removeClass('hidden');
  });
});