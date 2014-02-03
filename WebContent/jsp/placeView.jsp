<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
  import="org.markdown4j.Markdown4jProcessor"
  import="com.darakeru.seichi.model.Place"
  import="com.darakeru.seichi.model.Placework"
  import="com.darakeru.seichi.model.Work" %>
<jsp:useBean id="thisPlace" class="com.darakeru.seichi.model.Place" scope="request" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

<title>聖地情報画面</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/offcanvas.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->

<script type="text/javascript">
var thisName = "<jsp:getProperty name="thisPlace" property="name" />",
    thisLat = <jsp:getProperty name="thisPlace" property="lat" />,
    thisLng = <jsp:getProperty name="thisPlace" property="lng" />;
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
        <li class="active"><a href="../">トップページ</a></li>
        <li><a href="../search.html?geolocation=on">現在地の周辺情報へのリンク</a></li>
      </ul>
      <form class="btn-group navbar-form pull-right">
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
      </form>
    </div>
    <!-- /.nav-collapse -->
  </header>
  <!-- /.navbar -->

  <div class="container">

    <div class="row row-offcanvas row-offcanvas-right">
      <p class="pull-right visible-xs">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
      </p>
      <article class="col-xs-12 col-sm-9">
        <section class="jumbotron">
            <%=thisPlace.getImg().equals("") ? "" : "<img src=\""
                    + thisPlace.getImg() + "\" id=\"placedesc-img\">"%><!-- 作品の画像 -->
          <h1><jsp:getProperty name="thisPlace" property="name" /></h1>
          <!-- 作品名 -->
          <section class="placedesc">
            <%=new Markdown4jProcessor().process(thisPlace.getPlacedesc())%><!-- 作品の説明 -->
          </section>
          <p>住所：<address><jsp:getProperty name="thisPlace" property="address" /></address></p>
        </section>
        <section>
          <div class="row">
            <div class="col-md-4">
              <h2>関連商品</h2>
            </div>
            <div class="col-md-4">
              <h2>関連URL</h2>
            </div>
            <div class="col-md-4">
              <h2>アクセス数</h2>
              <p><%=thisPlace.getPlaceinfo().getAccessnum()%>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <div id="map-container">
                <div id="map"></div>
              </div>
            </div>
          </div>
          <% 
          for(Placework onePlacework : thisPlace.getPlaceworks() ){
              Work thisWork = onePlacework.getWork();
          %>
          <section class="row">
            <div class="col-md-12">
              <h2><%= thisWork.getName() %></h2>
              <section>
                <%=thisWork.getImg().equals("") ? "" : "<img src=\""
                    + thisWork.getImg() + "\" id=\"placedesc-img\">"%>
                <%= new Markdown4jProcessor().process(thisWork.getWorkdesc()) %>
              </section>
              <p>
                <a class="btn btn-default" href="../work/<%= thisWork.getWorkid() %>" role="button">View details &raquo;</a>
              </p>
            </div>
            <!--/span-->
          </section>
          <% } %>
          <!--/row-->
        </section>
      </article>
      <!--/span-->

      <aside class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
        <h1>聖地検索</h1>
        <form action="../search.html" method="get" id="searchform">
          <label>場所：<input type="text" name="place"></label> <label>作品名：<input type="text" name="work"></label>
          <button type="button" class="btn btn-default  btn-xs" data-toggle="collapse" data-target="#detailinfo">詳細検索</button>
          <div id="detailinfo" class="collapse">
            <label> 検索件数：<input type="number" name="num" value="10">
            </label> <label> ソート順 <select name="sort">
                <option value="smart" selected>スマート</option>
                <option value="visitnum">訪問者数</option>
                <option value="lastvisit">最終訪問日が早い順</option>
                <option value="add">登録日が早い順</option>
                <option value="geoloc">現在地に近い順</option>
                <option value="place">検索した場所に近い順</option>
            </select>
            </label> <label>登録された日： <br /> <input type="date" name="fromdate">から <br /> <input type="date" name="todate">まで
            </label> <label>現在地付近から検索：<input type="checkbox" name="geolocation" value="on"></label>
            <fieldset>
              検索方法： <label>全ての条件に合致(AND検索)<input type="radio" name="method" value="and" checked></label> <label>いずれかの条件に合致(OR検索)<input type="radio" name="method" value="or"></label>
            </fieldset>
          </div>
          <p>
            <input class="btn btn-primary btn-xs pull-right" type="submit" value="送信">
          </p>
        </form>
        <h1>作品検索</h1>
        <form action="../searchwork.html" method="get" id="searchworkform">
          <label>検索文字：<input type="text" name="name"></label>
          <p>
            <input class="btn btn-primary btn-xs pull-right" type="submit" value="送信">
          </p>
        </form>
        <h1>広告</h1>
        <p>ここに広告置きたい</p>
        <h1>暫定リンク</h1>
        <ul>
          <li><a href="../search.html">検索画面</a>（HTMLで，パラメータをwindow.locationで取得し，XMLHTTPRequestで可変部分の情報をJSONで取得）</li>
          <li><a href="../searchwork.html">作品検索画面</a>（HTMLで，パラメータをwindow.locationで取得し，XMLHTTPRequestで可変部分の情報をJSONで取得）</li>
          <li><a href="../place.html">聖地情報画面</a>（それぞれの場所で個別にJSPでページ出力）</li>
          <li><a href="../user.html">ユーザー情報画面</a>（それぞれのユーザーで個別にJSPでページ出力）</li>
          <li><a href="../work.html">作品情報画面</a>（それぞれの作品で個別にJSPでページ出力）</li>
        </ul>
      </aside>
      <!--/span-->

    </div>
    <!--/row-->
    <hr>
    <footer class="container">
      <ul>
        <li>運営している人紹介（連絡先など）</li>
        <li>利用規約</li>
        <li>注意書き</li>
        <li>著作権表記</li>
      </ul>
    </footer>

  </div>
  <!--/.container-->
  <!-- Bootstrap core JavaScript
================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <!-- Load project's js -->
  <script src="../js/offcanvas.js"></script>
  <!-- Load page's js -->
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
  <script src="../js/place.js"></script>

</body>
</html>