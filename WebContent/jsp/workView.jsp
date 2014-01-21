<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="org.markdown4j.Markdown4jProcessor"%>
<jsp:useBean id="thisWork" class="com.darakeru.seichi.model.Work" scope="request" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">

<title>作品情報画面</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="../css/offcanvas.css" rel="stylesheet">

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
</head>
<body>
  <header class="navbar navbar-fixed-top navbar-inverse" role="navigation">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="./">たんけんアニメのまち</a>
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
          <h1><jsp:getProperty name="thisWork" property="name" /></h1><!-- 作品名 -->
          <section class="workdesc">
            <%=thisWork.getImg().equals("") ? "" : "<img src=\"" + thisWork.getImg() + "\" id=\"workdesc-img\">"%><!-- 作品の画像 -->
            <%=new Markdown4jProcessor().process(thisWork.getWorkdesc())%><!-- 作品の説明 -->
          </section>
        </section>
        <section>
          <div class="row">
            <div class="col-md-12">
              <h1>関連情報</h1>
              <h2>関連商品</h2>
              <%=thisWork.getProductid1().equals("") ? "" : thisWork.getProductid1() + "<br />"%>
              <%=thisWork.getProductid2().equals("") ? "" : thisWork.getProductid2() + "<br />"%>
              <%=thisWork.getProductid3().equals("") ? "" : thisWork.getProductid3() + "<br />"%>
              <%=thisWork.getProductid4().equals("") ? "" : thisWork.getProductid4() + "<br />"%>
              <%=thisWork.getProductid5().equals("") ? "" : thisWork.getProductid5() + "<br />"%>
              <h2>関連URL</h2>
              <ul class="list-group">
                <%
                    if (!thisWork.getUrl1().equals("") && !thisWork.getUrlname1().equals("")) {
                %>
                <li class="list-group-item"><a href="<jsp:getProperty name="thisWork" property="url1" />"> <jsp:getProperty name="thisWork" property="urlname1" /></a></li>
                <%
                    }
                %>
                <%
                    if (!thisWork.getUrl2().equals("") && !thisWork.getUrlname2().equals("")) {
                %>
                <li class="list-group-item"><a href="<jsp:getProperty name="thisWork" property="url2" />"> <jsp:getProperty name="thisWork" property="urlname2" /></a></li>
                <%
                    }
                %>
                <%
                    if (!thisWork.getUrl3().equals("") && !thisWork.getUrlname3().equals("")) {
                %>
                <li class="list-group-item"><a href="<jsp:getProperty name="thisWork" property="url3" />"> <jsp:getProperty name="thisWork" property="urlname3" /></a></li>
                <%
                    }
                %>
              </ul>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <h1>作品に登場した場所</h1>
              <h2>地図</h2>
              <p>作品に登場した場所の一覧</p>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <h1>作品に登場した場所</h1>
              <h2>地図</h2>
              <p>作品に登場した場所の一覧</p>
            </div>
          </div>
          <section class="row">
            <div class="col-md-12">
              <h2>地点1</h2>
              <p>説明文ああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ</p>
              <p>どんな場所に聖地があるか示した地図なんかも表示したいね</p>
              <ul>
                <li>場面1</li>
                <li>場面2</li>
              </ul>
              <p>
                <a class="btn btn-default" href="#" role="button">View details &raquo;</a>
              </p>
            </div>
            <!--/span-->
          </section>
          <section class="row">
            <div class="col-md-12">
              <h2>地点2</h2>
              <p>説明文</p>
              <ul>
                <li>場面1</li>
                <li>場面2</li>
              </ul>
              <p>
                <a class="btn btn-default" href="#" role="button">View details &raquo;</a>
              </p>
            </div>
            <!--/span-->
          </section>
          <section class="row">
            <div class="col-md-12">
              <h2>地点3</h2>
              <p>説明文</p>
              <ul>
                <li>場面1</li>
                <li>場面2</li>
              </ul>
              <p>
                <a class="btn btn-default" href="#" role="button">View details &raquo;</a>
              </p>
            </div>
            <!--/span-->
          </section>
          <!--/row-->
        </section>
      </article>
      <!--/span-->

      <aside class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
        <h1>アクセス数</h1>
          <p><%=thisWork.getWorkinfo().getAccessnum()%>
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
            </label> <label>登録された日： <br />
              <input type="date" name="fromdate">から <br />
              <input type="date" name="todate">まで
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
  <!--<script src="js/work.js"></script>-->
</body>
</html>