$(function () {
  $.getScript("./js/model.js", function(){
    var MapView = Backbone.View.extend({
      el: '#map',
      mapObj : undefined,
      placeInfo : undefined,
      geolocation : undefined,
      initialize : function(options) {
        console.log('initialize');
        this.geolocation = new GeolocationModel();
        _.bindAll(this,'render','setMap','roundMap');
        this.listenTo(this.geolocation,"change", this.render);
        this.geolocation.setLocation();
      },
      render : function() {
        var geoParam = undefined;
        // リソースから取得
        // （collectionのurlにGETリクエストを送信する）
        if(this.geolocation.get("lat")){
          geoParam = 'lat=' + this.geolocation.get("lat") + '&lng=' + this.geolocation.get("lng");
          this.collection.url = this.collection.urlRoot + geoParam;
          console.log('success:getlocation');
        }
        this.collection.fetch({
          success : function success(collection, res, options) {
            // 通信成功時の処理……内容を書く
            thisMapView.setMap();
            thisMapView.roundMap();
            console.log('success');
          },
          error : function error() {
            // 通信失敗時の処理
            console.log('Error');
          }
        });
      },
      
      setMap : function () {
        var bounds = new google.maps.LatLngBounds(
          new google.maps.LatLng(this.collection.latlngNE[0],this.collection.latlngNE[1]),
          new google.maps.LatLng(this.collection.latlngSW[0],this.collection.latlngSW[1])
        ),
            center = new google.maps.LatLng(this.collection.first().get("latlng")[0],this.collection.first().get("latlng")[1]);
        mapOpt.center = center;
        this.mapObj = new google.maps.Map(this.el,mapOpt);
        //自動調整
        this.mapObj.fitBounds(bounds);
        this.placeInfo = new Array();
        this.collection.each(function(value){
          var aPosition = new google.maps.LatLng(value.get("latlng")[0],value.get("latlng")[1]),
              marker = new google.maps.Marker({
                position: aPosition,
                map: thisMapView.mapObj,
                title:value.get("name")
              });
          console.log(thisMapView);
          thisMapView.placeInfo.push( new google.maps.InfoWindow({
            content : '<div id="map_info"><img src="'
            + value.get("img")
            + '" style="float:left;width:100px;height:100px;"><h2><a href="place/'
            + value.get("id")
            + '">'
            + value.get("name")
            + '</a></h2>'
            /*
                + '<p>作品名：<a href="work/'
                + value.get("workid")
                + '">'
                + value.get("workname")
                + '</a></p>'
                */
            +'<p>' 
            + value.get("comment")
            + '</p></div>',
            position : aPosition
          }));
        });
        this.placeInfo[0].open(this.mapObj);
        $('#map-container').show();
        console.log('display map');
      },
      roundMap : function () {
        var i = 0;
        setInterval(function(){
          thisMapView.placeInfo[i].close();
          if(i < (thisMapView.placeInfo.length -1)){
            i++;
          }else{
            i=0;
          }
          thisMapView.mapObj.panTo(thisMapView.placeInfo[i].position)
          thisMapView.placeInfo[i].open(thisMapView.mapObj);
        },5000)
      }
    });
    //viewクラスのインスタンス作成（初期処理）
    thisMapView = new MapView({collection : new PlaceCollection() });
  });
  // その他
  $('#mobamas-ul').ticker({
    controls: false,
    titleText: 'モバマス市況'
  });
});