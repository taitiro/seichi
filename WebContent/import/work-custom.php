<?php
require_once dirname ( __FILE__ ) . "\simple_html_dom.php";

$name = "";
$input = NULL;
$input ["name"] = "";
$input ["workdesc"] = " ";
$input ["img"] = "";
$input ["productid1"] = "";
$productid1name="";
$input ["productid2"] = "";
$productid2name="";
$input ["productid3"] = "";
$productid3name="";
$input ["productid4"] = "";
$productid4name="";
$input ["productid5"] = "";
$productid5name="";
$input ["url1"] = "";
$input ["urlname1"] = "";
$input ["url2"] = "";
$input ["urlname2"] = "";
$input ["url3"] = "";
$input ["urlname3"] = "";
$input ["wikipedia"] = "";


if (isset ( $_GET ["name"] )) {
  $name = $_GET ["name"];
  $wikipediaXml = simplexml_load_file ( "http://ja.wikipedia.org/w/api.php?action=opensearch&limit=1&format=xml&search=" . urlencode ( $name ) );
  if (isset ( $wikipediaXml->Section->Item )) {
    $input ["wikipedia"] = $wikipediaXml->Section->Item->Url;
    $input ["workdesc"] = $wikipediaXml->Section->Item->Description . " （[wikipedia](" . $input ["wikipedia"] . ")より）";
  } else {
    $input ["wikipedia"] = "だめでした";
    $input ["workdesc"] = "だめでした";
  }
  $amazonXml = simplexml_load_file ( "http://ecs.amazonaws.jp/onca/xml?AWSAccessKeyId=AKIAJ7Z6KUTRWG2IDXVQ"
       . "&AssociateTag=darakeru-22"
       . "&Keywords=%E3%81%91%E3%81%84%E3%81%8A%E3%82%93"
       . "&Operation=ItemSearch&SearchIndex=All&Service=AWSECommerceService&Version=2013-01-04&"
       . "");//←どーすれば取得できるんだろ．タイムスタンプと署名
  if (isset ( $amazonXml )) {
    $input ["productid1"] = $amazonXml->Items->Item[0]->ASIN;
  } else {
    $input ["productid1"] = "だめでした";
  }
  if (isset ( $amazonXml->Section->Items->Item[1] )) {
    $input ["productid2"] = $amazonXml->Section->Items->Item[1]->ASIN;
  } else {
    $input ["productid2"] = "だめでした";
  }
  if (isset ( $amazonXml->Section->Items->Item[2] )) {
    $input ["productid3"] = $amazonXml->Section->Items->Item[2]->ASIN;
  } else {
    $input ["productid3"] = "だめでした";
  }
  if (isset ( $amazonXml->Section->Items->Item[3] )) {
    $input ["productid4"] = $amazonXml->Section->Items->Item[3]->ASIN;
  } else {
    $input ["productid4"] = "だめでした";
  }
  if (isset ( $amazonXml->Section->Items->Item[4] )) {
    $input ["productid5"] = $amazonXml->Section->Items->Item[4]->ASIN;
  } else {
    $input ["productid5"] = "だめでした";
  }
}

if (isset ( $_GET )) {
  foreach ( $_GET as $key => $value ) {
    $input [$key] = $value;
  }
}

print <<<EOF
<!doctype html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>作品カスタムインポート</title>
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
  <h1>作品カスタムインポート</h1>
  <form action="http://localhost:8080/seichi/addwork" method="POST">
    <label>作品名<input type="text" name="name" value="{$input["name"]}"></label>
    <label>作品の説明<textarea name="workdesc">{$input["workdesc"]}</textarea></label>
    <label>WikipediaのURL<input type="text" name="workdesc" value="{$input["wikipedia"]}"></label>
    <label>関連商品ID1（ASIN）<input type="text" name="productid1" value="{$input["productid1"]}"></label>
    <label>関連商品ID2（ASIN）<input type="text" name="productid2" value="{$input["productid2"]}"></label>
    <label>関連商品ID3（ASIN）<input type="text" name="productid3" value="{$input["productid3"]}"></label>
    <label>関連商品ID4（ASIN）<input type="text" name="productid4" value="{$input["productid4"]}"></label>
    <label>関連商品ID5（ASIN）<input type="text" name="productid5" value="{$input["productid5"]}"></label>
    <label><input type="submit" value="送信"></label>
  </form>
</body>
</html>
EOF;

?>