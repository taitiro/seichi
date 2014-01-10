$(function () {
  //検索文字列取得
  $.getScript("./js/model.js", function(){
    //Collectionのインスタンス作成
    var thisPlaceCollection = new PlaceCollection(),
        //viewのテンプレート作成
        FormView = Backbone.View.extend({
          events : {
            'submit' : 'onSubmit'
          },
          el: '#searchform',
          geolocation : new GeolocationModel(),
          getParam : location.search.substr(1),//GETパラメータを取得．最初の?は元のURLに含まれているので削除
          geoParam : '',
          geoFlag : false,
          initialize : function(options) {
            console.log('init Form View');
            _.bindAll(this,'render','initGeoLoc','onSubmit','sendData');
            this.render();
            if(this.getParam.indexOf('geolocation=on') != -1){
              this.listenTo(this.geolocation,"change", this.initGeoLoc);//geolocatonがchangeされたらinitDataを呼び出すよう監視
              this.geolocation.setLocation();
            }else{
              this.sendData();
            }
          },
          render : function() {
            console.log('display Form');
            var i,
                hash,
                vars = [],
                hashes = this.getParam.split('&'); 
            for(var i = 0; i < hashes.length; i++) { 
              hash = hashes[i].split('='); 
              if(hash[1] != ''){
                this.$el.find('input[name="'+hash[0]+'"]').val(hash[1]);
              }
            }
          },
          initGeoLoc : function() {
            this.stopListening(this.geolocation);//listenを解除
            if(this.geolocation.get("lat") && this.geolocation.get("lng")){
              this.geoParam = 'lat=' + this.geolocation.get("lat") + '&lng=' + this.geolocation.get("lng");
            }
            this.sendData();
          },
          onSubmit : function(){
            this.getParam = this.$el.serialize();
            if((this.getParam.indexOf('geolocation=on') != -1) && this.geoParam == '' ){
              this.listenTo(this.geolocation,"change", this.initGeoLoc);//geolocatonがchangeされたらinitDataを呼び出すよう監視
              this.geolocation.setLocation();
            }else{
              if (this.getParam.indexOf('geolocation=on') == -1){
                this.geoParam = ''
              }
              this.sendData();
            }
            return false;
          },
          sendData : function(){
            //GETパラメーターを取得URLに追加
            this.collection.url = this.collection.urlRoot + this.getParam + this.geoParam;
            // （collectionのurlにGETリクエストを送信する）
            this.collection.fetch({
              success : function success(collection, res, options) {
                // 通信成功時の処理……内容を書く
                console.log('success');
              },
              error : function error() {
                // 通信失敗時の処理
                console.log('Error');
              }
            });
          }
        }),
        MapView = Backbone.View.extend({
          el: '#map',
          mapObj : undefined,
          placeInfo : undefined,
          round : undefined,
          initialize : function(options) {
            console.log('initialize Map View');
            _.bindAll(this,'render','setMap','roundMap');
            this.listenTo(this.collection,"sync", this.render);//collectionがsyncされたらrenderメソッドを呼び出すよう監視
          },
          render : function() {
            if(this.round){
              clearInterval(this.round);
            }
            this.setMap();
            this.roundMap();
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
                + value.get("photo")
                + '" style="float:left;width:100px;height:100px;"><h2><a href="place/'
                + value.get("id")
                + '">'
                + value.get("name")
                + '</a></h2><p>作品名：<a href="work/'
                + value.get("workid")
                + '">'
                + value.get("workname")
                + '</a></p><p>' 
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
            this.round = setInterval(function(){
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
        }),
        ListView = Backbone.View.extend({
          el: '#place-list',
          placeInfo : undefined,
          initialize : function(options) {
            console.log('initialize List view');
            _.bindAll(this,'render');
            this.listenTo(this.collection,'sync', this.render);//collectionがsyncされたらrenderメソッドを呼び出すよう監視
          },
          render : function() {
            this.$el.hide('slow');
            this.collection.each(function(value){
              thisListView.$el.append('<section class="row"><div class="col-md-12"><h2>'
                                      + value.get('name')
                                      + '</h2><p>'
                                      + value.get('comment')
                                      + '</p><ul><li>アクセス数</li><li>訪問者数</li><li>言及数</li></ul><p><a class="btn btn-default" href="place/'
                                      + value.get("id")
                                      + '" role="button">View details &raquo;</a></p></div></section>');
            });
            
            this.$el.show('slow');
            console.log('display List');
          }
        }),
        thisFormView = undefined,
        thisMapView = undefined,
        thisListView = undefined;
    //viewクラスのインスタンス作成（初期処理）
    thisListView = new ListView({collection : thisPlaceCollection});
    thisMapView = new MapView({collection : thisPlaceCollection});
    thisFormView = new FormView({collection : thisPlaceCollection});
  });
  // その他
});