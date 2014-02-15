<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="org.markdown4j.Markdown4jProcessor" import="com.darakeru.seichi.model.Place"
  import="com.darakeru.seichi.model.Placework"%>
<jsp:useBean id="thisWork" class="com.darakeru.seichi.model.Work" scope="request" />
<jsp:useBean id="thisJson" class="com.darakeru.seichi.model.PlaceJsonBean" scope="request" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="<jsp:getProperty name="thisWork" property="name" />に関連する聖地の情報一覧．">
<meta name="keyword" content="聖地,聖地巡礼,舞台探訪,アニメ,漫画,マンガ,まんが,ライトノベル,ゲーム,ドラマ,旅行,観光,位置情報">
<meta name="author" content="だらけるこむ（小杉太一郎）">
<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

<title><jsp:getProperty name="thisWork" property="name" /> | たんけんアニメのまち - 作品情報</title>

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
    var mapData = <jsp:getProperty name="thisJson" property="jsonData" />;
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

  <div class="container">

    <div class="row row-offcanvas row-offcanvas-right">
      <p class="pull-right visible-xs">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
      </p>
      <article class="col-xs-12 col-sm-9">
        <section class="jumbotron">
          <%=thisWork.getImg().equals("") ? "" : "<img src=\""
                    + thisWork.getImg() + "\" id=\"workdesc-img\">"%><!-- 作品の画像 -->
          <h1 class="page-header"><jsp:getProperty name="thisWork" property="name" /></h1>
          <!-- 作品名 -->
          <section class="workdesc">
            <%=new Markdown4jProcessor().process(thisWork.getWorkdesc())%><!-- 作品の説明 -->
          </section>
          <p>
            <a href="../placeadd.html?<jsp:getProperty name="thisWork" property="workid" />" class="btn btn-primary btn-lg">聖地情報を登録する</a>
          </p>
        </section>
        <section>
          <div class="row">
            <div class="col-md-6">
              <div class="well">
              <h2 class="page-header">関連商品</h2>
                <script type='text/javascript'>
var amzn_wdgt={widget:'MyFavorites'};
amzn_wdgt.tag='darakeru-22';
amzn_wdgt.columns='1';
amzn_wdgt.rows='2';
amzn_wdgt.title='この作品に関連する商品';
amzn_wdgt.width='320';
amzn_wdgt.ASIN='<%=thisWork.getProductid1().equals("") ? "" : thisWork.getProductid1() + "," %><%=thisWork.getProductid2().equals("") ? "" : thisWork.getProductid2() + ","%><%=thisWork.getProductid3().equals("") ? "" : thisWork.getProductid3() + ","%><%=thisWork.getProductid4().equals("") ? "" : thisWork.getProductid4() + ","%><%=thisWork.getProductid5().equals("") ? "" : thisWork.getProductid5() + ","%>4862552196';
amzn_wdgt.showImage='True';
amzn_wdgt.showPrice='True';
amzn_wdgt.showRating='True';
amzn_wdgt.design='2';
amzn_wdgt.colorTheme='Orange';
amzn_wdgt.headerTextColor='#FFFFFF';
amzn_wdgt.marketPlace='JP';
</script>
                <script type='text/javascript' src='http://wms-fe.amazon-adsystem.com/20070822/JP/js/AmazonWidgets.js'>
</script>
              </div>
            </div>
            <div class="col-md-6">

              <div class="well">
                <h2 class="page-header">関連URL</h2>
                <ul class="list-group">
                  <%
                    if (!thisWork.getUrl1().equals("")
                            && !thisWork.getUrlname1().equals("")) {
                %>
                  <li class="list-group-item"><a href="<jsp:getProperty name="thisWork" property="url1" />"> <jsp:getProperty name="thisWork" property="urlname1" /></a></li>
                  <%
                    }
                %>
                  <%
                    if (!thisWork.getUrl2().equals("")
                            && !thisWork.getUrlname2().equals("")) {
                %>
                  <li class="list-group-item"><a href="<jsp:getProperty name="thisWork" property="url2" />"> <jsp:getProperty name="thisWork" property="urlname2" /></a></li>
                  <%
                    }
                %>
                  <%
                    if (!thisWork.getUrl3().equals("")
                            && !thisWork.getUrlname3().equals("")) {
                %>
                  <li class="list-group-item"><a href="<jsp:getProperty name="thisWork" property="url3" />"> <jsp:getProperty name="thisWork" property="urlname3" /></a></li>
                  <%
                    }
                %>
                </ul>
                
                <%
                  if (!thisWork.getWikipedia().equals("")) {
              %>
                <h2 class="page-header">Wikipediaへのリンク</h2>
                <a href="<jsp:getProperty name="thisWork" property="wikipedia" />">Wikipediaの記事</a>
                <%
                  }
              %>
                <h2 class="page-header">アクセス数</h2>
                <p><%=thisWork.getWorkinfo().getAccessnum()%></p>
              </div>
            </div>
          </div>
          <h2 class="page-header">作品に関連する聖地一覧</h2>
          <div class="row">
            <div class="col-md-12">
                <div id="map-container">
                  <div id="map"></div>
                  <section id="mapdesc">
                  <!-- ここなにか入れるべきだろうか -->
                  </section>
                </div>
            </div>
          </div>
          <%
              if (thisWork.getPlaceworks().size() == 0) {
          %>
          <!-- 生地情報が登録されていない場合 -->
          <section class="row">
            <div class="col-md-12">
              <p class="alert alert-danger">聖地情報はまだ登録されていません</p>
            </div>
          </section>
          <%
              }
              for (Placework onePlacework : thisWork.getPlaceworks()) {
                  Place thisPlace = onePlacework.getPlace();
          %>
          <section class="row">
            <div class="col-md-12">

              <div class="well">
                <h3 class="page-header"><%=thisPlace.getName()%></h3>
                <section>
                  <%=thisPlace.getImg().equals("") ? "" : "<img src=\""
                        + thisPlace.getImg() + "\" id=\"placedesc-img\">"%>
                  <%=new Markdown4jProcessor().process(thisPlace.getPlacedesc())%>
                </section>
                <p>
                  <a class="btn btn-default" href="../place/<%=thisPlace.getPlaceid()%>" role="button">View details &raquo;</a>
                </p>
              </div>
            </div>
            <!--/span-->
          </section>
          <%
              }
          %>
          <!--/row-->
        </section>
      </article>
      <!--/span-->

      <aside class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">

          <h2 class="page-header">聖地検索</h2>
          <form action="../search.html" method="get" id="searchform">
            <label>場所名など：<input type="text" name="place" placeholder="住所・地名・スポット名などを入力" required></label>
            <label>現在地付近から検索：<input type="checkbox" name="geolocation" value="on"></label>
            <!-- <label>作品名：<input type="text" name="work"></label>
            <button type="button" class="btn btn-default  btn-xs" data-toggle="collapse" data-target="#detailinfo">詳細検索</button>
            <div id="detailinfo" class="collapse">
              <label> 検索件数：<input type="number" name="num" id="search-num" value="10" step="5">
              </label> <label> ソート順 <select name="sort">
                  <option value="smart" selected>スマート</option>
                  <option value="visitnum">訪問者数</option>
                  <option value="lastvisit">最終訪問日が早い順</option>
                  <option value="add">登録日が早い順</option>
                  <option value="geoloc">現在地に近い順</option>
                  <option value="place">検索した場所に近い順</option>
              </select>
              </label> <label>登録された日： <br />
                <input type="date" name="fromdate" id="fromdate">から <br />
                <input type="date" name="todate" id="todate">まで
              </label>
              <fieldset>
                検索方法： <label>全ての条件に合致(AND検索)<input type="radio" name="method" value="and" checked></label> <label>いずれかの条件に合致(OR検索)<input type="radio" name="method" value="or"></label>
              </fieldset>
            </div> -->
            <p>
              <input class="btn btn-primary btn-xs pull-right" type="submit" value="送信">
            </p>
          </form>
          <h2 class="page-header">作品検索</h2>
          <form action="../searchwork.html" method="get" id="searchworkform">
            <label>検索文字：<input type="text" name="name" placeholder="作品名などを入力" required></label>
            <p>
              <input class="btn btn-primary btn-xs pull-right" type="submit" value="送信">
            </p>
          </form>
          <h2 class="page-header">広告</h2>
          <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
          <!-- たんけんアニメのまちサイドバー2 -->
          <ins class="adsbygoogle"
               style="display:inline-block;width:160px;height:600px"
               data-ad-client="ca-pub-8270952955770553"
               data-ad-slot="6693688964"></ins>
          <script>
          (adsbygoogle = window.adsbygoogle || []).push({});
          </script>
      </aside>
      <!--/span-->

    </div>
    <!--/row-->
    <hr>
      <footer class="container text-center list-group">
            <a class="list-group-item" href="http://www.darakeru.com/profile1">運営者について</a>
            <a class="list-group-item" href="terms.html">利用規約</a>
            <a class="list-group-item" href="copyright.html">著作権について</a>
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
  <script src="../js/work.js"></script>

</body>
</html>