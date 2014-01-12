<?php
require_once dirname(__FILE__)."\simple_html_dom.php";

$getNum = 300;
$getDate = date('Y-m-d', strtotime("-1 day"));
$getOldDate = date('Y-m-d', strtotime("-2 day"));
$inputURL = "http://mobile-trade.jp/fun/idolmaster/ranking.php?table=bid&sort=3&date_min="
    .$getDate
    ."&row="
    .$getNum;
$inputOldDate = dirname(__FILE__)."\\".$getOldDate.".json";
$outputDate = dirname(__FILE__)."\\".$getDate.".json";
$outputJSFile = dirname(__FILE__)."\\mobamas.js";

if(!file_exists($outputDate)){
    $rawArray = parseHTML(file_get_html($inputURL),$getNum);
    file_put_contents($outputDate,json_encode($rawArray, JSON_UNESCAPED_UNICODE));
}
$array = json_decode(file_get_contents($outputDate));

$oldArray = json_decode(file_get_contents($inputOldDate));
$innerStr = createList($array,$oldArray);
$jsStr=<<<EOF
$(function () {
    $('#mobamas-ul').html('{$innerStr}');
});
EOF;
file_put_contents($outputJSFile,$jsStr);

/*パース部分*/
function parseHTML($html,$getNum){
    $array = null;
    $ret = $html->find('table.card_ranking_result_table tbody', 0 );
    for($i=2; $i < ( $getNum +2 ) ; $i++){//2は、見出しの列を除くということ
        $data = $ret->find('tr', $i);//それぞれのアイドルの行
        $itemArray["id"] = 0;
        $itemArray["name"] = "";
        $itemArray["value"] = 0;
        $itemArray["id"] += str_replace("./rate.php?_id=","",$data->find('td',2)->find('a',0)->href);
        $itemArray["name"] = $data->find('td',2)->find('a',0)->plaintext;
        $itemArray["value"] += $data->find('td',7)->plaintext;
        $array[] = $itemArray;
        set_time_limit (30);
    }
    return $array;
}
/*js動的生成部分*/
function createList($array,$oldArray){
    $limitCount = 100;
    $count = 0;
    $retStr = "";
    
    for($i=0; $i < count($array); $i++){
        for($j=0;$j < count($oldArray); $j++){
            if($array[$i]->id == $oldArray[$j]->id ){
                $priceMove = round($oldArray[$j]->value - $array[$i]->value,2);
                $oneStr = "<li><a href=\"http://mobile-trade.jp/fun/idolmaster/rate.php?_id=".$array[$i]->id."\">".$array[$i]->name."</a>（".$array[$i]->value."）";
                if($priceMove > 0){
                    $oneStr .= " <span style=\"color:green\">"."+".$priceMove."</span></li>";
                }else if($priceMove == 0){
                    $oneStr .= " <span style=\"color:black\">".$priceMove."</span></li>";
                }else{
                    $oneStr .= " <span style=\"color:red\">".$priceMove."</span></li>";
                }
                $retStr .= $oneStr;
                //echo $oneStr;
                if($count > $limitCount){
                    return $retStr;
                }
            }
            set_time_limit (30);
        }
    }
    return $retStr;
}

?>