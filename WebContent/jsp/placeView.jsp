<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="org.markdown4j.Markdown4jProcessor" import="com.darakeru.seichi.model.Place"
  import="com.darakeru.seichi.model.Placework" import="com.darakeru.seichi.model.Work" import="com.darakeru.apiClient.instagram.LocationMediaBean" import="com.darakeru.apiClient.instagram.OneMedia"
  import="com.darakeru.apiClient.foursquare.VenueBean" import="com.darakeru.apiClient.foursquare.OneTips" import="com.darakeru.apiClient.twitter.GeoTweetBean"
  import="com.darakeru.apiClient.twitter.OneTweet"%>
<jsp:useBean id="thisPlace" class="com.darakeru.seichi.model.Place" scope="request" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="<jsp:getProperty name="thisPlace" property="name" />についての情報．SNSでの口コミや投稿写真なども">
<meta name="keyword" content="聖地,聖地巡礼,舞台探訪,アニメ,漫画,マンガ,まんが,ライトノベル,ゲーム,ドラマ,旅行,観光,位置情報">
<meta name="author" content="だらけるこむ（小杉太一郎）">
<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

<title><jsp:getProperty name="thisPlace" property="name" /> | たんけんアニメのまち - 聖地情報</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/style.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
    var thisName = "<jsp:getProperty name="thisPlace" property="name" />", thisLat = <jsp:getProperty name="thisPlace" property="lat" />, thisLng = <jsp:getProperty name="thisPlace" property="lng" />, thisReference = '<jsp:getProperty name="thisPlace" property="googleid" />';
</script>
</head>
<body>
  <header class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="../">たんけんアニメのまち</a>
    </div>
    <div class="collapse navbar-collapse container">
      <ul class="nav navbar-nav">
        <li><a href="../">トップページ</a></li>
        <li><a href="../search.html?geolocation=on">現在地の周辺情報へのリンク</a></li>
        <li><a href="../placeadd.html">聖地情報の追加</a></li>
      </ul>

      <form class="navbar-form navbar-right" role="search" action="../search.html" method="get">
        <div class="form-group">
          <input type="text" name="place" class="form-control" placeholder="住所などを入力">
        </div>
        <input type="submit" class="btn btn-default" value="聖地検索">
      </form>
      <form class="navbar-form navbar-right" role="search" action="../searchwork.html" method="get">
        <div class="form-group">
          <input type="text" name="name" class="form-control" placeholder="作品名などを入力">
        </div>
        <input type="submit" class="btn btn-default" value="作品検索">
      </form>
      <!--       <form class="btn-group navbar-form pull-right">
        <button type="button" class="btn btn-default btn-sm">ログイン</button>
        <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
          <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">twitterIDでログイン</a></li>
          <li><a href="#">facebookIDでログイン</a></li>
          <li class="divider"></li>
          <li><a href="#">新規登録</a></li>
        </ul>
      </form> -->
    </div>
    <!-- /.nav-collapse -->
  </header>
  <!-- /.navbar -->

  <article class="container">

    <section class="jumbotron">
      <%=thisPlace.getImg().equals("") ? "" : "<img src=\""
                    + thisPlace.getImg() + "\" id=\"placedesc-img\">"%><!-- 作品の画像 -->
      <h1 class="page-header"><jsp:getProperty name="thisPlace" property="name" /><small><address><jsp:getProperty name="thisPlace" property="address" /></address></small>
      </h1>
      <!-- 作品名 -->
      <h2 class="page-header">説明</h2>
      <section id="placedesc">
        <%=new Markdown4jProcessor().process(thisPlace.getPlacedesc())%><!-- 作品の説明 -->
      </section>
      <div class="row">
        <div class="col-md-5">
          <h3 class="page-header">関連商品</h3>
          <script type='text/javascript'>
              var amzn_wdgt={widget:'MyFavorites'};
              amzn_wdgt.tag='darakeru-22';
              amzn_wdgt.columns='3';
              amzn_wdgt.rows='1';
              amzn_wdgt.title='この聖地に関連する商品';
              amzn_wdgt.width='320';
              amzn_wdgt.ASIN='<%=thisPlace.getProductid1().equals("") ? "" : thisPlace.getProductid1() + ","%><%=thisPlace.getProductid2().equals("") ? "" : thisPlace.getProductid2() + ","%><%=thisPlace.getProductid3().equals("") ? "" : thisPlace.getProductid3() + ","%><%=thisPlace.getProductid4().equals("") ? "" : thisPlace.getProductid4() + ","%><%=thisPlace.getProductid5().equals("") ? "" : thisPlace.getProductid5() + ","%>4862552196';
              amzn_wdgt.showImage = 'True';
              amzn_wdgt.showPrice = 'True';
              amzn_wdgt.showRating = 'True';
              amzn_wdgt.design = '2';
              amzn_wdgt.colorTheme = 'Orange';
              amzn_wdgt.headerTextColor = '#FFFFFF';
              amzn_wdgt.marketPlace = 'JP';
            </script>
          <script type='text/javascript' src='http://wms-fe.amazon-adsystem.com/20070822/JP/js/AmazonWidgets.js'></script>
        </div>

        <div class="col-md-5">
          <h3 class="page-header">関連URL</h3>
          <ul class="list-group">
            <%
                if (!thisPlace.getUrl1().equals("")
                              && !thisPlace.getUrlname1().equals("")) {
            %>
            <li class="list-group-item"><a href="<jsp:getProperty name="thisPlace" property="url1" />"> <jsp:getProperty name="thisPlace" property="urlname1" /></a></li>
            <%
                }
            %>
            <%
                if (!thisPlace.getUrl2().equals("")
                              && !thisPlace.getUrlname2().equals("")) {
            %>
            <li class="list-group-item"><a href="<jsp:getProperty name="thisPlace" property="url2" />"> <jsp:getProperty name="thisPlace" property="urlname2" /></a></li>
            <%
                }
            %>
            <%
                if (!thisPlace.getUrl3().equals("")
                              && !thisPlace.getUrlname3().equals("")) {
            %>
            <li class="list-group-item"><a href="<jsp:getProperty name="thisPlace" property="url3" />"> <jsp:getProperty name="thisPlace" property="urlname3" /></a></li>
            <%
                }
            %>

            <li class="list-group-item"><a href="https://www.facebook.com/<jsp:getProperty name="thisPlace" property="facebookid" />">facebookページ</a></li>
          </ul>
        </div>
        <div class="col-md-2">
          <h3 class="page-header">アクセス数</h3>
          <p><%=thisPlace.getPlaceinfo().getAccessnum()%></p>
        </div>
      </div>
    </section>
    <section>
      <!-- Instagramの写真表示 -->
      <div class="row">
        <div class="col-md-12">
          <h2 class="page-header">Instagramからの情報</h2>
          <div class="thumbnails">
            <%
                for (OneMedia thisMedia : ((LocationMediaBean) application.getAttribute("instagram_"
                                                                    + String.valueOf(thisPlace.getPlaceid()))).getMediaArray()) {
            %>
            <div class="thumbnail well instagram-thumb">
              <a href="<%=thisMedia.getUrl()%>"><img src="<%=thisMedia.getImage()%>"></a>
              <div class="caption">
                <%=thisMedia.getComment()%>
                by
                <%=thisMedia.getName()%>
              </div>
            </div>
            <%
                }
            %>

          </div>
        </div>
      </div>    
      <div class="row">
        <!-- foursquareの写真表示 -->
        <div class="col-md-4">

          <div class="well">
            <h2 class="page-header"><a href="<%=((VenueBean) application.getAttribute("foursquare_"
                        + String.valueOf(thisPlace.getPlaceid()))).getUrlStr()%>">foursquareからの情報</a></h2>
            <%
                for (OneTips thisTips : ((VenueBean) application.getAttribute("foursquare_"
                        + String.valueOf(thisPlace.getPlaceid()))).getTipsArray()) {
            %>
            <blockquote>
              <%
              if (!thisTips.getImage().equals("")) {
              %>
                <img src="<%=thisTips.getImage()%>" class="foursquare-img img-circle">
              <% } %>
              <p><%=thisTips.getComment()%></p>
              <footer>
                <a href="<%=thisTips.getUrl()%>"> <%=thisTips.getName()%></a>
              </footer>
            </blockquote>
            <%
                }
            %>
          </div>
        </div>
        <!-- Twitterのtweet表示 -->
        <div class="col-md-4">

          <div class="well">
            <h2 class="page-header">Twitterからの情報</h2>
              <div class="list-group">
              <%
                  for (OneTweet thisTweet : ((GeoTweetBean) application.getAttribute("twitter_"
                          + String.valueOf(thisPlace.getPlaceid()))).getTweetArray()) {
              %>
              <a class="list-group-item" href="<%=thisTweet.getUrl()%>">
                  <span class="tweet-header">
                    <%=thisTweet.getName()%><span class="tweet-screen-name">@<%=thisTweet.getScreenName()%></span>
                    <time class="pull-right"><%=thisTweet.getDate()%></time>
                  </span>
                  <span class="tweet-body"><%=thisTweet.getComment()%></span>
              </a>
              <%
                  }
              %>
            </div>
          </div>
        </div>
        <!-- Googleの口コミ表示 -->
        <div class="col-md-4">
          <div class="well" id="google-place-wrapper">
            <div id="google-place">
              <h2 class="page-header" id="google-place-title">Googleからの情報</h2>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
            <div id="map-container">
              <div id="map"></div>
            </div>
        </div>
      </div>
      <section class="row">
        <div class="col-md-12">
          <div class="well">

            <h2 class="page-header">関連作品</h2>
            <%
                for (Placework onePlacework : thisPlace.getPlaceworks()) {
                    Work thisWork = onePlacework.getWork();
            %>

            <h3><%=thisWork.getName()%></h3>
            <section>
              <%=thisWork.getImg().equals("") ? "" : "<img src=\""
                        + thisWork.getImg() + "\" id=\"placedesc-img\">"%>
              <%=new Markdown4jProcessor().process(thisWork.getWorkdesc())%>
            </section>
            <p>
              <a class="btn btn-default" href="../work/<%=thisWork.getWorkid()%>" role="button">View details &raquo;</a>
            </p>
            <%
                }
            %>
          </div>
        </div>
        <!--/span-->
      </section>
      <!--/row-->
    </section>
    <!--/span-->
  </article>
  <!--/row-->
  <hr>
      <footer class="container text-center list-group">
            <a class="list-group-item" href="http://www.darakeru.com/profile1">運営者について</a>
            <a class="list-group-item" href="terms.html">利用規約</a>
            <a class="list-group-item" href="copyright.html">著作権について</a>
      </footer>
  <!--/.container-->
  <!-- Bootstrap core JavaScript
================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <!-- Load project's js -->
  <script src="../js/offcanvas.js"></script>
  <!-- Load page's js -->
  <script src="../js/masonry.pkgd.min.js"></script>
  <script src="../js/imagesloaded.pkgd.min.js"></script>
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&libraries=places"></script>
  <script src="../js/place.js"></script>

</body>
</html>