$(function () {
  // Model
  //取得する作品情報
  var WorkModel = Backbone.Model.extend({
    url:'work/',
    initialize : function initialize() {    // インスタンス生成時に実行される
      this.url += this.get('id');
      console.log(this.get('name'));
    }
  }),
      //Collection
      WorkCollection = Backbone.Collection.extend({
        model : WorkModel,    // このCollectionのBackbone.Modelを指定
        url : undefined,//取得するJSONのURL．httpから始まってもOK
        //urlRoot : 'http://localhost:8080/seichi/search?',
        urlRoot : 'data/work.json?'
      }),
      //viewのテンプレート作成
      FormView = Backbone.View.extend({
        events : {
          'submit' : 'onSubmit'
        },
        el: '#searchworkform',
        getParam : location.search.substr(1),//GETパラメータを取得．最初の?は元のURLに含まれているので削除
        initialize : function(options) {
          console.log('init Form View');
          _.bindAll(this,'render','onSubmit','sendData');
          this.render();
          this.sendData();
        },
        render : function() {
          console.log('display Form');
          var hash,
              hashes = this.getParam.split('&'); 
          for(var i = 0; i < hashes.length; i++) { 
            hash = hashes[i].split('='); 
            if(hash[1] != ''){
              this.$el.find('input[name="'+hash[0]+'"]').val(hash[1]);
            }
          }
        },
        onSubmit : function(){
          this.getParam = this.$el.serialize();
          this.sendData();
          return false;
        },
        sendData : function(){
          //GETパラメーターを取得URLに追加
          this.collection.url = this.collection.urlRoot + this.getParam;
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
      ListView = Backbone.View.extend({
        el: '#work-list',
        template : undefined,
        initialize : function(options) {
          console.log('initialize List view');
          this.template = _.template($("#work-list-template").text());
          _.bindAll(this,'render');
          this.listenTo(this.collection,'sync', this.render);//collectionがsyncされたらrenderメソッドを呼び出すよう監視
        },
        render : function() {
          this.$el.hide('slow');
          this.$el.html('');
          this.collection.each(function(value){
            var data = {
              "name": value.get('name'),
              "comment":value.get('comment'),
              "id":value.get("id"), 
              "place":value.get("place"), 
            };
            thisListView.$("#work-list-content").append(thisListView.template(data));
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
    thisFormView = new FormView({collection : thisPlaceCollection});
});