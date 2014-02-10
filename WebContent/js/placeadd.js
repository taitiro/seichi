var map, service, infowindow,reference,workid,marker_list = new google.maps.MVCArray(), latlngSW = [
        20.425277, 122.933611 ], latlngNE = [ 45.557777, 153.986388 ], thisBounds = new google.maps.LatLngBounds(
        new google.maps.LatLng(latlngSW[0], latlngSW[1]),
        new google.maps.LatLng(latlngNE[0], latlngNE[1])), thisCenter = new google.maps.LatLng(
        35.698683, 139.774219);

function initialize() {
    if((/^\d+$/).test(location.search.substr(1))){
      workid = location.search.substr(1);
    }else{
      workid = null;
    }
    map = new google.maps.Map(document.getElementById('map'), {
        center : thisCenter,
        zoom : 17
    });
    service = new google.maps.places.PlacesService(map);
    map.fitBounds(thisBounds);
    document.getElementById('search-button').onclick = searchStr;
    document.getElementById('map').className = 'show';
}

function searchStr() {
    var request = {
        bounds : new google.maps.LatLngBounds(new google.maps.LatLng(
                latlngSW[0], latlngSW[1]), new google.maps.LatLng(latlngNE[0],
                latlngNE[1])),
        query : document.getElementById('str').value
    };
    document.getElementById('search-result').innerHTML = '';
    marker_list.forEach(function(marker, idx) {
        marker.setMap(null);
    });
    infowindow = new google.maps.InfoWindow();
    /* console.log('callback:do -> ' + request.query); */
    service.textSearch(request, callback);
}
function callback(results, status) {
    var thisLatlngNE = new Array(2), thisLatlngSW = new Array(
            2);
    /* console.log('callback:get -> ' + results.length); */
    if (status == google.maps.places.PlacesServiceStatus.OK) {
        for (var i = 0; i < results.length; i++) {
            var element = document.createElement('div');
            element.className='search-result-item input-group';
            element.id='detail-' + i;
            var lat = undefined, lng = undefined;
            createMarker(results[i],i);
            lat = results[i].geometry.location.d;
            lng = results[i].geometry.location.e;
            if (thisLatlngSW[0] > lat || i == 0) {
                thisLatlngSW[0] = lat;
            }
            if (thisLatlngNE[0] < lat || i == 0) {
                thisLatlngNE[0] = lat;
            }
            if (thisLatlngSW[1] > lng || i == 0) {
                thisLatlngSW[1] = lng;
            }
            if (thisLatlngNE[1] < lat || i == 0) {
                thisLatlngNE[1] = lng;
            }
            thisBounds = new google.maps.LatLngBounds(new google.maps.LatLng(
                    thisLatlngSW[0], thisLatlngSW[1]), new google.maps.LatLng(
                    thisLatlngNE[0], thisLatlngNE[1]));
            console.log(thisLatlngSW[0] + ' : ' + thisLatlngSW[1] + ' : '
                    + thisLatlngNE[0] + ' : ' + thisLatlngNE[1]);
            element.innerHTML = '<h3 class="page-header">' + results[i].name + '</h3>'
                    +'<form action="confirmplaceadd" method="post">'
                    + '<label>名前<input class="form-control" type="text" name="name" value="'
                    + results[i].name
                    + '"></label>'
                    + '<button type="button" class="btn btn-default btn-xs" data-toggle="collapse" data-target="#detailinfo-'
                    + i
                    + '" id="detail-button-'
                    + i
                    + '" data-detail-number="'
                    + i 
                    +'">詳細</button>'
                    + '<div id="detailinfo-'
                    + i
                    + '" class="collapse">'
                    + '<label>住所：<input class="form-control" type="text" name="address" value="'
                    + results[i].formatted_address.replace('日本, ', '')
                    + '"></label>'
                    + '<label>緯度：<input class="form-control" type="number" step="0.000001" name="lat" value="'
                    + (Math.ceil(lat*1000000))/1000000
                    + '"></label>'
                    + '<label>経度：<input class="form-control" type="number" step="0.000001" name="lng" value="'
                    + (Math.ceil(lng*1000000))/1000000
                    + '"></label>'
                    + '<label>Google Place Reference：<input class="form-control" type="text" name="googleid" value="'
                    + results[i].reference
                    + '"></label>'
                    + '<label>Google Place(Google+)のURL(url1)：<input class="form-control" type="url" name="url1" value="" id="detail-url-'
                    + i + '"></label>'
                    + '<input type="hidden" name="urlname1" value="' + results[i].name + ' - 基本情報 - Google+">'
                    + (workid == null ? '' : ('<input type="hidden" name="workid" value="' + workid + '">' ))
                    + '<input class="btn btn-primary" type="submit" value="送信">'
                    + '</div>' + '</form>';
            document.getElementById('search-result').appendChild(element);
            document.getElementById('detail-button-' + i ).onclick = (function(reference,i){
                return function(){
                    moreDetail(reference,i);
                };
            })(results[i].reference,i);
        }
        map.fitBounds(thisBounds);
        if (map.zoom > 17) {
            map.setZoom(17);
        }
    } else {
        /* console.log('error : ' + status); */
    }
}
function createMarker(place,i) {
    var marker = new google.maps.Marker({
        map : map,
        position : place.geometry.location
    });
    marker_list.push(marker);
    
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent('<a href="#detail-' + i + '">' + place.name + '</a>');
        infowindow.open(map, this);
    });
}
function moreDetail(reference,i) {
    /* console.log('click'); */
    var request = {
        reference : reference
    };
    service.getDetails(request,function(place,status){
        if (status == google.maps.places.PlacesServiceStatus.OK) {
            document.getElementById('detail-url-' + i ).value = place.url;
          }
    });
}

google.maps.event.addDomListener(window, 'load', initialize);