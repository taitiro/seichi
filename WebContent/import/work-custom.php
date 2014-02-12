<?php
require_once dirname ( __FILE__ ) . "\parameter.php";

$wikipediaPreReplace = array (
    "！",
    "？" 
); // wikipediaが推奨していない文字
$wikipediaReplace = array (
    "!",
    "?" 
); // wikipediaが推奨している文字

$name = "";
$input = NULL;
$input ["name"] = "";
$input ["workdesc"] = " ";
$input ["img"] = "";
$input ["productid1"] = "";
$productid1name = "";
$input ["productid2"] = "";
$productid2name = "";
$input ["productid3"] = "";
$productid3name = "";
$input ["productid4"] = "";
$productid4name = "";
$input ["productid5"] = "";
$productid5name = "";
$input ["url1"] = "";
$input ["urlname1"] = "";
$input ["url2"] = "";
$input ["urlname2"] = "";
$input ["url3"] = "";
$input ["urlname3"] = "";
$input ["wikipedia"] = "";

if (isset ( $_GET ["name"] )) {
  $name = $_GET ["name"];
  $wikipediaXml = simplexml_load_file ( "http://ja.wikipedia.org/w/api.php?action=opensearch&limit=1&format=xml&search=" . rawurlencode ( str_replace ( $wikipediaPreReplace, $wikipediaReplace, $name ) ) );
  if (isset ( $wikipediaXml->Section->Item )) {
    $input ["wikipedia"] = $wikipediaXml->Section->Item->Url;
    $input ["workdesc"] = $wikipediaXml->Section->Item->Description . " （[wikipedia](" . $input ["wikipedia"] . ")より）";
  } else {
    $input ["wikipedia"] = "";
    $input ["workdesc"] = " （[wikipedia](" . $input ["wikipedia"] . ")より）";
  }
  $amazonUrlHeader = "GET\n" . "ecs.amazonaws.jp\n" . "/onca/xml\n";
  $amazonUrlStr = "AWSAccessKeyId=" . $AMAZON_API_KEY . "&AssociateTag=darakeru-22" . "&Keywords=" . rawurlencode ( $name ) . "&Operation=ItemSearch" . "&SearchIndex=All" . "&Service=AWSECommerceService" . "&Timestamp=" . urlencode ( gmdate ( "Y-m-d\TH:i:s" ) ) . ".000Z" . "&Version=2014-01-16";
  $amazonApiSig = urlencode ( base64_encode ( hash_hmac ( "sha256", $amazonUrlHeader . $amazonUrlStr, $AMAZON_API_SECRET_KEY, true ) ) );
  $amazonUrl = "http://ecs.amazonaws.jp/onca/xml?" . $amazonUrlStr . "&Signature=" . $amazonApiSig;
  
  $amazonXml = simplexml_load_file ( $amazonUrl );
  if (isset ( $amazonXml->Items->Item [0]->ASIN )) {
    $input ["productid1"] = $amazonXml->Items->Item [0]->ASIN;
  } else {
    $input ["productid1"] = "";
  }
  if (isset ( $amazonXml->Items->Item [1]->ASIN )) {
    $input ["productid2"] = $amazonXml->Items->Item [1]->ASIN;
  } else {
    $input ["productid2"] = "";
  }
  if (isset ( $amazonXml->Items->Item [2]->ASIN )) {
    $input ["productid3"] = $amazonXml->Items->Item [2]->ASIN;
  } else {
    $input ["productid3"] = "";
  }
  if (isset ( $amazonXml->Items->Item [3]->ASIN )) {
    $input ["productid4"] = $amazonXml->Items->Item [3]->ASIN;
  } else {
    $input ["productid4"] = "";
  }
  if (isset ( $amazonXml->Items->Item [4]->ASIN )) {
    $input ["productid5"] = $amazonXml->Items->Item [4]->ASIN;
  } else {
    $input ["productid5"] = "";
  }
  
  $yahooXml = simplexml_load_file ( "http://dir.yahooapis.jp/Category/V1/directorySearch?" . "appid=" . $YAHOO_API_KEY .   // 転用する時は自分でアプリケーションID取ってきてねー
  "&type=2&results=3&query=" . urlencode ( $name ) );
  
  if (isset ( $yahooXml->SiteSearchResults->Item [0] )) {
    $input ["url1"] = $yahooXml->SiteSearchResults->Item [0]->Url;
    $input ["urlname1"] = $yahooXml->SiteSearchResults->Item [0]->Title;
  } else {
    $input ["url1"] = "";
    $input ["urlname1"] = "";
  }
  if ((isset ( $yahooXml->SiteSearchResults->Item [1] )) && (strcmp ( $yahooXml->SiteSearchResults->Item [1]->Url, $input ["url1"] ) != 0)) {
    $input ["url2"] = $yahooXml->SiteSearchResults->Item [1]->Url;
    $input ["urlname2"] = $yahooXml->SiteSearchResults->Item [1]->Title;
  } else {
    $input ["url2"] = "";
    $input ["urlname2"] = "";
  }
  if ((isset ( $yahooXml->SiteSearchResults->Item [2] )) && (strcmp ( $yahooXml->SiteSearchResults->Item [2]->Url, $input ["url1"] ) != 0) && (strcmp ( $yahooXml->SiteSearchResults->Item [2]->Url, $input ["url2"] ) != 0)) {
    $input ["url3"] = $yahooXml->SiteSearchResults->Item [2]->Url;
    $input ["urlname3"] = $yahooXml->SiteSearchResults->Item [2]->Title;
  } else {
    $input ["url3"] = "";
    $input ["urlname3"] = "";
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
  <form action="http://localhost:8080/seichi/work" method="POST">
    <label>作品名<input type="text" name="name" value="{$input["name"]}"></label>
    <label>作品の説明<textarea name="workdesc">{$input["workdesc"]}</textarea></label>
    <label>作品の画像URL<input type="text" name="img" value="{$input["img"]}"></label>
    <label>WikipediaのURL（<a href="{$input["wikipedia"]}">確認</a>）<input type="text" name="wikipedia" value="{$input["wikipedia"]}"></label>
    <label>関連商品ID1（ASIN）<input type="text" name="productid1" value="{$input["productid1"]}"></label>
    <label>関連商品ID2（ASIN）<input type="text" name="productid2" value="{$input["productid2"]}"></label>
    <label>関連商品ID3（ASIN）<input type="text" name="productid3" value="{$input["productid3"]}"></label>
    <label>関連商品ID4（ASIN）<input type="text" name="productid4" value="{$input["productid4"]}"></label>
    <label>関連商品ID5（ASIN）<input type="text" name="productid5" value="{$input["productid5"]}"></label>
    <label>関連URL1<input type="text" name="url1" value="{$input["url1"]}"></label>
    <label>関連URL1の名前<input type="text" name="urlname1" value="{$input["urlname1"]}"></label>
    <label>関連URL2<input type="text" name="url2" value="{$input["url2"]}"></label>
    <label>関連URL2の名前<input type="text" name="urlname2" value="{$input["urlname2"]}"></label>
    <label>関連URL3<input type="text" name="url3" value="{$input["url3"]}"></label>
    <label>関連URL3の名前<input type="text" name="urlname3" value="{$input["urlname3"]}"></label>
    <label><input type="submit" value="送信"></label>
  </form>
</body>
</html>
EOF;

?>