<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.Map"%>
<jsp:useBean id="thisWork" class="com.darakeru.seichi.model.ConfirmWorkBean" scope="request" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="author" content="だらけるこむ（小杉太一郎）">
<link rel="shortcut icon" href="../../docs-assets/ico/favicon.png">
<meta name="robots" content="noindex,noarchive,follow">

<title>たんけんアニメのまち - 作品情報追加の確認</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Select2 CSS -->
<link href="css/select2.css" rel="stylesheet">
<link href="css/select2-bootstrap.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">

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
      <a class="navbar-brand" href="http://www.darakeru.com/seichi">たんけんアニメのまち</a>
    </div>
    <div class="collapse navbar-collapse container">
      <ul class="nav navbar-nav">
        <li><a href="search.html?geolocation=on">現在地周辺の聖地</a></li>
        <li><a href="placeadd.html">聖地の追加</a></li>
        <li><a href="workadd.html">作品の追加</a></li>
      </ul>
      <!--         <form class="btn-group navbar-form pull-right">
          <button type="button" class="btn btn-default btn-sm">ログイン</button>
          <button type="button" class="btn btn-default btn-sm dropdown-toggle" data-toggle="dropdown">
            <span class="caret"></span> <span class="sr-only">Toggle Dropdown</span>
          </button>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#">twitterIDでログイン</a></li>
            <li><a href="#">facebookIDでログイン</a></li>
          </ul>
        </form> -->
    </div>
    <!-- /.nav-collapse -->
  </header>
  <!-- /.navbar -->

  <div class="container">


    <article class="container">
      <h1 class="page-header">確認・修正画面</h1>
      <p>以下の内容を確認し，赤くなっている項目を選択・修正した上で「送信」をクリックしてください</p>
      <form class="form-horizontal" role="form" id="confirm-form" action="work" method="post">
        <div class="form-group">
          <label for="input-name" class="col-md-3 control-label">名前（必須）</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-name" name="name" value="<jsp:getProperty name="thisWork" property="name" />" required>
          </div>
        </div>
        <div class="form-group" id="textarea-workdesc-wrapper">
          <label for="textarea-workdesc" class="col-md-3 control-label">説明文（必須）</label>
          <div class="col-md-9">
            <textarea class="form-control" id="textarea-workdesc" name="workdesc" workholder="説明文を入力してください（Markdown記法可）" required><jsp:getProperty name="thisWork" property="workdesc" /></textarea>
             <span class="help-block">Markdown記法が使用できます</span>
          </div>
        </div>
        <div class="form-group">
          <label for="input-wikipedia" class="col-md-3 control-label">WikipediaのURL</label>
          <div class="col-md-9">
            <input type="url" class="form-control" id="input-wikipedia" name="wikipedia" value="<jsp:getProperty name="thisWork" property="wikipedia" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-url1" class="col-md-3 control-label">関連URL1</label>
          <div class="col-md-9">
            <input type="url" class="form-control" id="input-address" name="url1" value="<jsp:getProperty name="thisWork" property="url1" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-urlname1" class="col-md-3 control-label">関連URL1の名前</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-urlname1" name="urlname1" value="<jsp:getProperty name="thisWork" property="urlname1" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-url2" class="col-md-3 control-label">関連URL2</label>
          <div class="col-md-9">
            <input type="url" class="form-control" id="input-address" name="url2" value="<jsp:getProperty name="thisWork" property="url2" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-urlname2" class="col-md-3 control-label">関連URL2の名前</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-urlname2" name="urlname2" value="<jsp:getProperty name="thisWork" property="urlname2" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-url3" class="col-md-3 control-label">関連URL3</label>
          <div class="col-md-9">
            <input type="url" class="form-control" id="input-address" name="url3" value="<jsp:getProperty name="thisWork" property="url3" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-urlname3" class="col-md-3 control-label">関連URL3の名前</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-urlname1" name="urlname3" value="<jsp:getProperty name="thisWork" property="urlname3" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-productid1" class="col-md-3 control-label">関連商品のASIN（1）</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-productid1" name="productid1" value="<jsp:getProperty name="thisWork" property="productid1" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-productid2" class="col-md-3 control-label">関連商品のASIN（2）</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-productid2" name="productid2" value="<jsp:getProperty name="thisWork" property="productid3" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-productid3" class="col-md-3 control-label">関連商品のASIN（3）</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-productid3" name="productid3" value="<jsp:getProperty name="thisWork" property="productid3" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-productid4" class="col-md-3 control-label">関連商品のASIN（4）</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-productid4" name="productid4" value="<jsp:getProperty name="thisWork" property="productid4" />">
          </div>
        </div>
        <div class="form-group">
          <label for="input-productid5" class="col-md-3 control-label">関連商品のASIN（5）</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="input-productid5" name="productid5" value="<jsp:getProperty name="thisWork" property="productid5" />">
          </div>
        </div>
        <div class="form-group" id="input-captcha-wrapper">
          <label for="input-captcha" class="col-md-3 control-label">
          	<img src="jcaptcha.jpg" id="input-captcha-img" />
          	<button type="button" class="btn btn-default btn-xs" id="input-captcha-refresh" >
              <span class="glyphicon glyphicon-refresh"></span>
            </button>
            <br />（必須）
          </label>
          <div class="col-md-9">
            <input class="form-control" id="input-captcha" type="text" name="jcaptcha" value="" required/>
            <span class="help-block">左側の画像に表示されている文字を入力してください</span>
          </div>
        </div>
        <!-- 既にインプットされている項目 -->
        <input type="hidden" name="img" value="">
        <div class="form-group">
          <div class="col-md-offset-3 col-md-9">
            <input type="submit" class="btn btn-default" value="送信">
          </div>
        </div>
      </form>
    </article>
    <!--/span-->

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
  <!-- Workd at the end of the document so the pages load faster -->
  <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <!-- Load Backbone.js-->
  <script src="js/underscore-min.js"></script>
  <script src="js/json2.js"></script>
  <script src="js/backbone-min.js"></script>
  <!-- Load project's js -->
  <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-48085492-1', 'darakeru.com');
  ga('send', 'pageview');

</script>
  <!-- Load page's js -->
  <!-- <script src="js/confirmworkadd.js"></script> -->
</body>
</html>