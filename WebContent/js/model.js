//定数
var DEF_LAT_LNG = [35.698683,139.774219],//緯度経度のデフォルト値は秋葉原駅(なんとなく)
    mapOpt = {
      zoom:17,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      scaleControl: true,
      center: new google.maps.LatLng(DEF_LAT_LNG[0],DEF_LAT_LNG[1]),
      disableDoubleClickZoom: true,
      draggable: true,
      scrollwheel: true
    },
    // Model
    //ユーザーの位置情報
    GeolocationModel = Backbone.Model.extend({
      defaults:{
        'lat':undefined,
        'lng':undefined
      },
      initialize : function initialize() {    // インスタンス生成時に実行される
        _.bindAll(this,'success','failure','setLocation');
      },
      success : function(pos){
        this.set({'lat':pos.coords.latitude,'lng':pos.coords.longitude});
        console.log('Get Current Position');
      },
      failure : function(){
        this.set({'lat':DEF_LAT_LNG[0],'lng':DEF_LAT_LNG[1]});
        console.log('Can not Get Current Position');
      },
      setLocation : function(){
        if (navigator.geolocation) { 
          // 現在の位置情報を取得
          navigator.geolocation.getCurrentPosition(
            // （1）位置情報の取得に成功した場合
            this.success,
            // （2）位置情報の取得に失敗した場合
            this.failure
          );
        } else {
          this.set({'lat':DEF_LAT_LNG[0],'lng':DEF_LAT_LNG[1]});
          console.log('NO LOCATION API');
        }
      },
    }),
    //取得する場所情報
    PlaceModel = Backbone.Model.extend({
      url:'place/',
      defaults:{
        'id':0,
        'name':undefined,
        'latlng':[0,0],
        'photo':undefined,
        'workid':0,
        'workname':undefined,
        'comment':undefined
      },
      initialize : function initialize() {    // インスタンス生成時に実行される
        if (this.id != 0) {
          this.url += this.id;
        }
        console.log(this.get('name'));
      }
    }),
    //Collection
    PlaceCollection = Backbone.Collection.extend({
      model : PlaceModel,    // このCollectionのBackbone.Modelを指定
      url : undefined,//取得するJSONのURL．httpから始まってもOK
      urlRoot : 'data/place1.json?',
      latlngNE:undefined,
      latlngSW:undefined,
      parse : function parse(res) {    // modelにsetする値を指定する
        this.latlngNE = res.latlngNorthEast;
        this.latlngSW = res.latlngSouthWest;
        return res.place;
      }
    });