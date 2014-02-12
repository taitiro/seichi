<?php
require_once dirname ( __FILE__ ) . "\simple_html_dom.php";

$inputURL = "http://legwork.g.hatena.ne.jp/genesis/00000000";

$data = file_get_html ( $inputURL )->find ( 'div.section table', 0 )->find ( 'td a.keyword' );
print <<<EOF
<!doctype html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>「舞台探訪アーカイブ」からのインポート</title>
</head>
<body>
  <h1>「舞台探訪アーカイブ」からのインポート</h1>
  <ul>
EOF;
foreach ( $data as $one ) {
  print "<li><a href=\"work-custom.php?name=" . urlencode ( $one->plaintext ) . "\">" . $one->plaintext . "</a></li>";
}
print <<<EOF
  </ul>
</body>
</html>
EOF;

?>