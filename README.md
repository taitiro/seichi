Tanken anime no machi(seichi) - SNS for Pop-culture tourism
=====
たんけんアニメのまち - 聖地巡礼サービス

##機能
* 聖地の情報を簡単に検索できるWebサービス
    * 聖地とは？
        * 本来「巡礼」とは、宗教において重要な意味を持つ聖地に赴く宗教的な行為のことをいう（本来の巡礼に付いての詳細は巡礼の項を参照）。
ここから転じて、ドラマや映画（実写の映像）、近年では漫画・アニメ・小説（ライトノベル）などの物語の舞台となった場所や、スポーツなどの名勝負の舞台となった場所、登場人物の名前の由来地や同名地など、本人にとって思い入れのある場所を「聖地」と呼び、この「聖地」を実際に訪れ、憧れや興奮に思いを馳せることを、「巡礼」と呼ぶようになった（後述）。
なお、一般には各フィクションの舞台になった場所を探訪することから、「舞台探訪」、あるいは映画などでは「ロケ地巡り」などと呼ばれる。実写の形で公開されるテレビドラマや映画のロケ地が名所となるような事例に比べ、漫画・アニメに端を発する聖地巡礼では、聖地とされている場所（地名）で、そこであると作中において明確に示されているわけではないにもかかわらず、ファンから神聖視されるという点が異なる。
通常の意味で「聖地」とされる場所は、視覚的にもそれ以外の場所から区別されるようになっているのに対し、アニメファンなどが巡礼の対象とする「聖地」は、それまで通りの風景をほとんど変化させることなく、なんらかのいわれを付加するだけで成立している。
…[Wikipediaより](http://ja.wikipedia.org/wiki/%E5%B7%A1%E7%A4%BC_%28%E9%80%9A%E4%BF%97%29)
            * 参照記事
                * [“聖地巡礼”を町おこしにつなげるスマホの可能性--「ガルパン」「あの花」など - CNET Japan](http://japan.cnet.com/sp/mobile_consulting/35039966/)
                * [アニメを旅する若者たち　“聖地巡礼”の舞台裏 - NHK　クローズアップ現代 ](http://www.nhk.or.jp/gendai/kiroku/detail02_3171_1.html)
    * 現在地の近くや，特定の場所の近くにある聖地を簡単に検索できる
    * ある作品に出てきた聖地を簡単に検索できる
* 聖地に関する情報を集める
    * SNSやその他Webサービス(Twitter, facebook, instagram, foursquare, Google+...)からの情報を集めて，一つのページにまとめて提示する
* 聖地に関するコミュニティサイトになる(できれば……)
    * 聖地におとずれてパソコンやスマホを開けば，簡単に自分が聖地に来たことをtwitter，facebook, foursquare, Google+などで伝えられる
    * 聖地についての情報をコメントできる

## 類似サービス
### 聖地情報まとめサイト
結構ある
* [NAVERまとめ - 聖地巡礼](http://matome.naver.jp/topic/1LwYh)
* [舞台探訪アーカイブ（聖地巡礼リポジトリ）](http://legwork.g.hatena.ne.jp/)
* [あにたび～アニメ全国聖地巡礼～](http://anitabi.m38.coreserver.jp/)
* [舞台探訪まとめWiki](http://wiki.livedoor.jp/lsh_er/)

### 聖地巡礼アプリ
公式アプリは「ある一つのアニメだけ」みたいなものが多い．様々なアニメの情報を全てまとめたアプリは **まだ** ない(でも多分時間の問題……)．
* [舞台めぐり](https://play.google.com/store/apps/details?id=jp.linknetwork.anitrip)
* [聖地巡礼マップ](http://comming-soon.net/seichi/)

## プログラム構造
サーバーサイドの中でMVCがあって，Viewにあたるフロントエンドの中にもMVCがあるという無駄に入り組んだ構造．保守が難しいのでこんな入り組んだのは作っちゃダメです．どっちかにまとめましょう．
### サーバーサイド
* Model - com.darakeru.model
    * Place.java
    * Work.java
    * User.java(まだ出来てない)
* Controller - com.darakeru.Controller
    * PlaceSearchServlet.java
    * WorkSearchServlet.java
* view - WebContent

下記参照

### フロントエンド
[このサイト](http://tech-sketch.jp/2013/10/jqmized-backbone-1.html)の図が，こういうAjaxをBackbone.jsで実現するプログラムの構造図としては大変わかり易いです．このプログラムもだいたいこんなかんじです．
* Model - model.js
    * PlaceCollection
        * PlaceModel
    * WorkCollection
        * WorkModel
* Controller & view(MVC構造と言いつつVCが分かれていないのはどーなんでしょうね？)
    * search.js
        * PlaceMapView
        * PlaceListView
        * PlaceFormView
    * searchwork.js
        * WorkListView
        * WorkFormView

## Copyright(著作権について)
This software is released under the MIT License, see LICENSE.txt.

このソフトウェアに同梱されているそれぞれのライブラリの著作権は，ライブラリの作成者にあります．それぞれのライブラリの
著作権表記は，ライブラリのソースコード冒頭にあります．
それ以外の部分はMITライセンスで公開されています．詳細はLICENSE.txtをごらんください．

##使用ライブラリ・フレームワーク
それぞれの著作権はそれぞれのライブラリの作者に帰属しています．

[bootstrap](http://getbootstrap.com/)
: Twitter謹製のWebデザインフレームワーク．JavaScriptとCSSでできています

### Java
[Java EE 7](http://www.oracle.com/technetwork/jp/java/javaee/overview/index.html)
: Javaの機能セット．以下の機能もだいたいJava EE 7に含まれる技術？

Java Persistence API
: Java Persistence API（JPA）とは、関係データベースのデータを扱う Java SE および Java EE のアプリケーションを開発するためのJava用フレームワークである(wikipediaより)。まあ要するにORマッピングです

[Hibernate](http://hibernate.org/)
: JPAのエンジン

[JSR 353 - Java API for JSON Processing](https://jsonp.java.net/)
: Java公式ののJSONライブラリ．すんげー使いにくいので普通にgsonとかjacksonとか使ったほうがいいと思います

###JavaScript
[jQuery](http://jquery.com/)
:  おなじみJavaScriptフレームワーク

[Underscore.js](http://underscorejs.org/)
:  テンプレートエンジンや配列管理などの機能があるライブラリ

[Backbone.js](http://backbonejs.org/)
: JavaScriptでMVC構造を実現するフレームワーク．Ajax機能などに便利

###PHP(インポートに使うだけ)
[PHP Simple HTML DOM Parser](http://sourceforge.net/projects/simplehtmldom/files/)
: PHPでできたシンプルなHTMLパーサー．使用方法は[PHP Simple HTML DOM Parserの使用方法 - Webスクレイピング ライブラリ](http://www.crystal-creation.com/web-appli/technical-information/programming/php/library/simplehtmldom/)がまとまっています

##今後のToDo
* 聖地個別ページと作品個別ページをJSPで作る(JSFは……勉強するのがめんどうさそうなので今回はいいや)
    * 聖地個別ページではSNSから拾ってきた口コミ情報を．作品個別ページでは画像検索の結果を表示したい
        * 画像検索はBingの画像検索APIか，devianArtのAPIを使いたい
* ユーザー管理機能
    * 完全にTwitterかfacebookのoAuthに頼りたい(自分でパスワードもつの面倒くさい)
    * できるだけ他のWebサービスに規制したいね(画像保存機能とかもなくてflickerやinstagram，photo.twitter.comとかから取ってくるとか)
        *でもそうなると今度は著作権の問題ががが