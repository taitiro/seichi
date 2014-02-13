$(function() {
    if (mapData.place.length) {
        var i = 0, j = 0, mapObj = undefined, placeInfo = new Array(),
        bounds = new google.maps.LatLngBounds(
                new google.maps.LatLng(mapData.latlngNorthEast[0],
                        mapData.latlngNorthEast[1]), new google.maps.LatLng(
                        mapData.latlngSouthWest[0], mapData.latlngSouthWest[1])), mapOpt = {
            zoom : 15,
            mapTypeId : google.maps.MapTypeId.ROADMAP,
            scaleControl : true,
            center : new google.maps.LatLng(mapData.place[0].latlng[0],
                    mapData.place[0].latlng[1]),
            disableDoubleClickZoom : true,
            draggable : true,
            scrollwheel : true,
        };
        mapObj = new google.maps.Map($('#map')[0], mapOpt);
        // 自動調整
        mapObj.fitBounds(bounds);
        
        for (i = 0; i < mapData.place.length; i++) {
            var aPosition = new google.maps.LatLng(mapData.place[i].latlng[0],
                    mapData.place[i].latlng[1]), marker = new google.maps.Marker(
                    {
                        position : aPosition,
                        map : mapObj,
                        title : mapData.place[i].name,
                    });
            placeInfo
                    .push(new google.maps.InfoWindow(
                            {
                                content : '<div id="map-info">'
                                        + mapData.place[i].name
                                        + '</a></h2><p>'
                                        + mapData.place[i].comment
                                        + '</p></div>',
                                position : aPosition,
                            }));
        }
        placeInfo[0].open(mapObj);
        $('#map-container').show();
        setInterval(function() {
            placeInfo[j].close();
            if (j < (placeInfo.length - 1)) {
                j++;
            } else {
                j = 0;
            }
            mapObj.panTo(placeInfo[j].position);
            placeInfo[j].open(mapObj);
        }, 5000);
    }
});