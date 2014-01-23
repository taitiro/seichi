$(function() {
    var i = 0, mapObj = undefined, 
        thisGPosistion = new google.maps.LatLng(thisLat, thisLng),
        mapOpt = {
            zoom : 17,
            mapTypeId : google.maps.MapTypeId.ROADMAP,
            scaleControl : true,
            center : thisGPosistion,
            disableDoubleClickZoom : true,
            draggable : true,
            scrollwheel : true,
        };
    mapObj = new google.maps.Map($('#map')[0], mapOpt);
    new google.maps.Marker({
        position : thisGPosistion,
        map : mapObj,
        title : thisName,
    });
    $('#map-container').show();
});