<?php
print <<<EOF
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>インポート用プログラム</title>
  <style>
  label {
    display:block;
  }
  input{
    width:600px;
  }
  textarea{
    width:600px;
    height:5em;
  }
  </style>
</head>
<body>
  <h1>インポート用プログラム</h1>
  <h2>作品情報インポート</h2>
  <ul>
    <li><a href="work-butai.php">「舞台探訪アーカイブ」の情報を利用</a></li>
    <li><a href="work-custom.php">手作業インポート</a></li>
  </ul>
  <h2>場所情報インポート</h2>
  <ul>
    <li><a href="place-work.php">作品別インポート(マップから登録)</a></li>
    <li>カスタムインポート
    <form action="place-custom.php" method="get">
    <label>作品ID<input type="number" name="workid" value=""></label>
    <label>名前<input type="text" name="name" value=""></label>
    <label>住所<input type="text" name="address" value=""></label>
    <label><input type="submit" value="送信"></label>
    </form>
    </li>
  </ul>
</body>
</html>
EOF
?>