<?php
print <<<EOF
<!DOCTYPE html>
<html lang="ja">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>インポート用プログラム</title>
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
    <li><a href="place-custom.php">カスタムインポート</a></li>
  </ul>
</body>
</html>
EOF
?>