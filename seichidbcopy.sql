-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- ホスト: 127.0.0.1
-- 生成日時: 2014 年 1 月 17 日 06:21
-- サーバのバージョン: 5.5.32
-- PHP のバージョン: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- データベース: `seichidbcopy`
--
CREATE DATABASE IF NOT EXISTS `seichidbcopy` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `seichidbcopy`;

-- --------------------------------------------------------

--
-- テーブルの構造 `place`
--

CREATE TABLE IF NOT EXISTS `place` (
  `placeid` int(10) NOT NULL AUTO_INCREMENT COMMENT '場所ID',
  `name` varchar(140) NOT NULL COMMENT '場所名',
  `lat` decimal(9,6) NOT NULL COMMENT '緯度',
  `lng` decimal(9,6) NOT NULL COMMENT '経度',
  `placedesc` text NOT NULL COMMENT '場所の説明文(Markdown記法)',
  `address` varchar(255) NOT NULL COMMENT '場所の住所',
  `img` varchar(2083) NOT NULL DEFAULT 'http://localhost:8080/seichi/img/noimage.gif' COMMENT '場所の写真',
  `url1` varchar(2083) NOT NULL DEFAULT '' COMMENT '関連URL1',
  `urlname1` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL1の名前',
  `url2` varchar(2083) NOT NULL DEFAULT '' COMMENT '関連URL2',
  `urlname2` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL2の名前',
  `url3` varchar(2083) NOT NULL DEFAULT '' COMMENT '関連URL3',
  `urlname3` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL3の名前',
  `productid1` char(10) NOT NULL DEFAULT '',
  `productid2` char(10) NOT NULL DEFAULT '',
  `productid3` char(10) NOT NULL DEFAULT '',
  `productid4` char(10) NOT NULL DEFAULT '',
  `productid5` char(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`placeid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='場所情報' AUTO_INCREMENT=8 ;

--
-- テーブルのデータのダンプ `place`
--

INSERT INTO `place` (`placeid`, `name`, `lat`, `lng`, `placedesc`, `address`, `img`, `url1`, `urlname1`, `url2`, `urlname2`, `url3`, `urlname3`, `productid1`, `productid2`, `productid3`, `productid4`, `productid5`) VALUES
(1, '旧豊郷小学校', '35.202957', '136.233699', 'けいおんのキャラクターたちが通っていた学校です', '滋賀県犬上郡豊郷町大字石畑５２２', 'http://localhost:8080/seichi/img/1.jpg', 'http://www.darakeru.com', 'テストURL', '', '', '', '', '4862552196', '4905385040', '4870319950', '', ''),
(2, '修学院駅周辺北山通橋', '35.051273', '135.789161', 'けいおん第一期OPで軽音部の四人が走っていた場所', '京都府京都市左京区山端川端町', 'http://localhost:8080/seichi/img/noimage.gif', 'http://www.darakeru.com', 'テストURL', '', '', '', '', '4862552196', '4905385040', '4870319950', '', ''),
(3, '鷲宮神社', '36.099811', '139.654852', '柊つかさと柊かがみが住んでいる神社のモデル', '埼玉県久喜市鷲宮１丁目６−１', 'http://localhost:8080/seichi/img/3.jpg', 'http://www.darakeru.com', 'テストURL', '', '', '', '', '4862552196', '4905385040', '4870319950', '', ''),
(4, '春日部共栄中学高等学校 ', '35.960020', '139.741573', '泉こなたたちが通っていた高校のモデル', '埼玉県春日部市上大増新田２１３ ‎ ', 'http://localhost:8080/seichi/img/noimage.gif', 'http://www.darakeru.com', 'テストURL', '', '', '', '', '4862552196', '4905385040', '4870319950', '', ''),
(5, '京都アニメーション', '34.924743', '135.798595', '泉こなたたちが修学旅行で訪れた．', '京都府宇治市木幡大瀬戸３２ ‎ ', 'http://localhost:8080/seichi/img/noimage.gif', 'http://www.darakeru.com', 'テストURL', '', '', '', '', '4862552196', '4905385040', '4870319950', '', ''),
(6, 'サンシャイン通り', '35.730571', '139.715079', 'OP2カット目、ギターの音と共にセルティのバイクから画面が変わって正臣、杏里、帝人の三人が出てきた場所。', '東京都豊島区東池袋１丁目１４−１１', 'http://localhost:8080/seichi/img/noimage.gif', 'http://www.darakeru.com', 'テストURL', '', '', '', '', '4862552196', '4905385040', '4870319950', '', ''),
(7, '池袋駅東武東上線改札口', '35.730715', '139.710762', '1話目に登場', '東京都豊島区西池袋１丁目１−２５ ', 'http://localhost:8080/seichi/img/noimage.gif', 'http://www.darakeru.com', 'テストURL', '', '', '', '', '4862552196', '4905385040', '4870319950', '', '');

-- --------------------------------------------------------

--
-- テーブルの構造 `placeinfo`
--

CREATE TABLE IF NOT EXISTS `placeinfo` (
  `placeid` int(10) NOT NULL COMMENT '場所ID',
  `accessnum` int(10) NOT NULL DEFAULT '0' COMMENT 'ページヘのアクセス数',
  `visitnum` int(10) NOT NULL DEFAULT '0' COMMENT 'チェックイン数',
  PRIMARY KEY (`placeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='場所関連情報';

--
-- テーブルのデータのダンプ `placeinfo`
--

INSERT INTO `placeinfo` (`placeid`, `accessnum`, `visitnum`) VALUES
(1, 0, 0),
(2, 0, 0),
(3, 0, 0),
(4, 0, 0),
(5, 0, 0),
(6, 0, 0),
(7, 0, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `placetag`
--

CREATE TABLE IF NOT EXISTS `placetag` (
  `placetagid` int(10) NOT NULL AUTO_INCREMENT COMMENT '場所タグID',
  `name` varchar(24) NOT NULL COMMENT 'タグ名',
  `placeid` int(10) NOT NULL COMMENT '場所ID',
  PRIMARY KEY (`placetagid`),
  KEY `placeid` (`placeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='場所タグ情報' AUTO_INCREMENT=3 ;

--
-- テーブルのデータのダンプ `placetag`
--

INSERT INTO `placetag` (`placetagid`, `name`, `placeid`) VALUES
(1, '学校', 1),
(2, '会社', 5);

-- --------------------------------------------------------

--
-- テーブルの構造 `placework`
--

CREATE TABLE IF NOT EXISTS `placework` (
  `placeworkid` int(10) NOT NULL AUTO_INCREMENT COMMENT '場所作品関係ID',
  `placeid` int(10) NOT NULL COMMENT '場所ID',
  `workid` int(10) NOT NULL COMMENT '作品ID',
  PRIMARY KEY (`placeworkid`),
  UNIQUE KEY `placeworkid` (`placeworkid`),
  KEY `placeid` (`placeid`,`workid`),
  KEY `workid` (`workid`),
  KEY `placeid_2` (`placeid`),
  KEY `placeid_3` (`placeid`),
  KEY `workid_2` (`workid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='場所作品関係情報' AUTO_INCREMENT=8 ;

--
-- テーブルのデータのダンプ `placework`
--

INSERT INTO `placework` (`placeworkid`, `placeid`, `workid`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 2),
(6, 6, 3),
(7, 7, 3);

-- --------------------------------------------------------

--
-- テーブルの構造 `work`
--

CREATE TABLE IF NOT EXISTS `work` (
  `workid` int(10) NOT NULL AUTO_INCREMENT COMMENT '作品ID',
  `name` varchar(140) NOT NULL COMMENT '作品名',
  `workdesc` text NOT NULL COMMENT '作品の説明(Markdown記法)',
  `img` varchar(2083) NOT NULL DEFAULT '',
  `productid1` char(10) DEFAULT NULL,
  `productid2` char(10) DEFAULT NULL,
  `productid3` char(10) DEFAULT NULL,
  `productid4` char(10) DEFAULT NULL,
  `productid5` char(10) DEFAULT NULL,
  `url1` varchar(2083) NOT NULL DEFAULT '' COMMENT '作品の関連URL1',
  `urlname1` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL1の名前',
  `url2` varchar(2083) NOT NULL DEFAULT '' COMMENT '作品の関連URL1',
  `urlname2` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL2の名前',
  `url3` varchar(2083) NOT NULL DEFAULT '' COMMENT '作品の関連URL1',
  `urlname3` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL2の名前',
  `wikipedia` varchar(2083) NOT NULL DEFAULT '' COMMENT 'wikipediaの解説URL',
  PRIMARY KEY (`workid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='作品情報' AUTO_INCREMENT=168 ;

--
-- テーブルのデータのダンプ `work`
--

INSERT INTO `work` (`workid`, `name`, `workdesc`, `img`, `productid1`, `productid2`, `productid3`, `productid4`, `productid5`, `url1`, `urlname1`, `url2`, `urlname2`, `url3`, `urlname3`, `wikipedia`) VALUES
(1, 'ああっ女神さまっ', '『ああっ女神さまっ』（ああっめがみさまっ）は、藤島康介による日本の漫画作品。およびそれを原作としたアニメ作品群。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%82%E3%81%A3%E5%A5%B3%E7%A5%9E%E3%81%95%E3%81%BE%E3%81%A3)より）', '', '4063584364', '4063211991', '4063211983', '4063211975', '4063879151', 'http://kc.kodansha.co.jp/megamisama/', '限定版「ああっ女神さまっ」公式サイト', 'http://www.maql.co.jp/special/game/ps2/megami/', 'ああっ女神さまっ', 'http://www.maql.co.jp/special/game/ps2/megami/', 'ああっ女神さまっ', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%82%E3%81%A3%E5%A5%B3%E7%A5%9E%E3%81%95%E3%81%BE%E3%81%A3'),
(2, 'あいうら', '『あいうら』（AIURA）は、茶麻による日本の4コマ漫画作品。ニコニコ静画における「ニコニコで漫画を描いてみた」のコーナーで2011年3月2日より連載されている他、商業漫画雑誌である『4コマnanoエース』（角川書店）でもVol.4（2011年8月9日発売）より2013年10月号増刊（2013年9月9日発売）まで連載。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%84%E3%81%86%E3%82%89)より）', '', '4041209625', '4041201861', 'B00HPTA9XC', 'B00CA9B0VW', '4041206502', 'http://www.tv-tokyo.co.jp/anime/aiura/', 'あいうら', 'http://www.tv-tokyo.co.jp/anime/aiura/', 'あいうら', 'http://www.tv-tokyo.co.jp/anime/aiura/', 'あいうら', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%84%E3%81%86%E3%82%89'),
(3, 'アイカツ！', '『アイカツ! -アイドルカツドウ!-』は、バンダイが販売するトレーディングカードアーケードゲーム筐体・データカードダス（DCD）を使用した日本の女児向けアーケードゲーム。また、このゲームを原作とするテレビアニメ。\r\n\r\nゲームは2012年10月25日に稼動を開始した[1]。キャッチコピーは「国民的アイドルオーディションゲーム」。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%A4%E3%82%AB%E3%83%84!_-%E3%82%A2%E3%82%A4%E3%83%89%E3%83%AB%E3%82%AB%E3%83%84%E3%83%89%E3%82%A6!-)より）', '', 'B00FQ6ME34', 'B00DUSHKRU', 'B00GOLG17A', '4636903153', 'B00HJJXV8S', 'http://www.aikatsu.net/', 'アイカツ！ [aikatsu.net]', 'http://www.tv-tokyo.co.jp/anime/aikatsu/', 'アイカツ！ [tv-tokyo.co.jp]', 'http://www.tv-tokyo.co.jp/anime/aikatsu/', 'アイカツ！ [tv-tokyo.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%A4%E3%82%AB%E3%83%84!_-%E3%82%A2%E3%82%A4%E3%83%89%E3%83%AB%E3%82%AB%E3%83%84%E3%83%89%E3%82%A6!-'),
(4, 'THE iDOLM@STER', '『THE IDOLM@STER』（アイドルマスター）は、ナムコ（現バンダイナムコゲームス）が2005年7月26日に稼動を開始したアーケード用シミュレーションゲーム（公式ジャンルは「アイドルプロデュース体験ゲーム」）。 （[wikipedia](http://ja.wikipedia.org/wiki/THE_IDOLM@STER)より）', '', 'B00HHKO7IW', 'B00GUABOYA', 'B00HHKO7KA', '4758013071', 'B0088VGUGQ', 'http://ofa.idolmaster.jp/', 'アイドルマスター ワンフォーオール', 'http://www.namco.co.jp/ar/idolmaster/museum/', 'アイドルマスター ミュージアム', 'http://www.namco.co.jp/ar/idolmaster/museum/', 'アイドルマスター ミュージアム', 'http://ja.wikipedia.org/wiki/THE_IDOLM@STER'),
(5, 'アイドルマスターシンデレラガールズ', '『アイドルマスター シンデレラガールズ』 (THE IDOLM@STER CINDERELLA GIRLS) は、『THE IDOLM@STER』の世界観をモチーフとする携帯端末専用のソーシャルゲーム。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%A4%E3%83%89%E3%83%AB%E3%83%9E%E3%82%B9%E3%82%BF%E3%83%BC_%E3%82%B7%E3%83%B3%E3%83%87%E3%83%AC%E3%83%A9%E3%82%AC%E3%83%BC%E3%83%AB%E3%82%BA)より）', '', 'B00E59NQ8U', '4757541457', 'B00FB1W1UA', 'B00F917ESG', '4757539029', 'http://www.bandainamcogames.co.jp/cs/list/idolmaster/social_m/', 'アイドルマスターシンデレラガールズ', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%A4%E3%83%89%E3%83%AB%E3%83%9E%E3%82%B9%E3%82%BF%E3%83%BC_%E3%82%B7%E3%83%B3%E3%83%87%E3%83%AC%E3%83%A9%E3%82%AC%E3%83%BC%E3%83%AB%E3%82%BA'),
(6, 'あいまいみー', '『あいまいみー』は、ちょぼらうにょぽみによる日本の漫画作品。竹書房のウェブコミック配信サイト『まんがライフWIN』にて2009年6月より連載配信中の、漫画研究部に所属する4人の女子高生の「不毛な日常」を描く4コマ漫画。2013年1月から3月まで5分枠でのテレビアニメが放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%84%E3%81%BE%E3%81%84%E3%81%BF%E3%83%BC)より）', '', '481247440X', '4812484944', 'B00B2374WQ', '4812480841', '4812476674', 'http://www.takeshobo.co.jp/sp/tv_aimaimi/', 'あいまいみー [takeshobo.co.jp]', 'http://mangalifewin.takeshobo.co.jp/rensai/imyme/', 'あいまいみー [mangalifewin.takeshobo.co.jp]', 'http://mangalifewin.takeshobo.co.jp/rensai/imyme/', 'あいまいみー [mangalifewin.takeshobo.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%84%E3%81%BE%E3%81%84%E3%81%BF%E3%83%BC'),
(7, '藍より青し', '『藍より青し』（あいよりあおし）は、文月晃による日本の漫画作品。これを原作として、テレビアニメ、小説、ゲームなども制作された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E8%97%8D%E3%82%88%E3%82%8A%E9%9D%92%E3%81%97)より）', '', '4592134478', 'B00DMUL5YK', 'B002DELN8Y', 'B000JSIBLI', 'B00DMUL626', 'http://www.younganimal.com/', 'ヤングアニマル', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E8%97%8D%E3%82%88%E3%82%8A%E9%9D%92%E3%81%97'),
(8, '青い花', '青い花（あおいはな） （[wikipedia](http://ja.wikipedia.org/wiki/%E9%9D%92%E3%81%84%E8%8A%B1)より）', '', '4778322096', '4778320050', '4778321707', '4041104629', 'B00FED8910', 'http://www.aoihana.tv/', '青い花', 'http://www.aoihana.tv/', '青い花', 'http://www.aoihana.tv/', '青い花', 'http://ja.wikipedia.org/wiki/%E9%9D%92%E3%81%84%E8%8A%B1'),
(9, '蒼き鋼のアルペジオ', '『蒼き鋼のアルペジオ』（あおきはがねのアルペジオ、ARPEGGIO OF BLUE STEEL）は、Ark Performanceによる日本の漫画作品。『ヤングキングアワーズ』（少年画報社）において、2009年11月号から連載中。 （[wikipedia](http://ja.wikipedia.org/wiki/%E8%92%BC%E3%81%8D%E9%8B%BC%E3%81%AE%E3%82%A2%E3%83%AB%E3%83%9A%E3%82%B8%E3%82%AA)より）', '', '4785933755', 'B00FGCMDPC', '4785951508', 'B00F3VT552', 'B00FB3817A', 'http://www.aokihagane.com/', '蒼き鋼のアルペジオ -アルス・ノヴァ-', 'http://s.mxtv.jp/aokihagane/', '蒼き鋼のアルペジオ -ARS NOVA-', 'http://s.mxtv.jp/aokihagane/', '蒼き鋼のアルペジオ -ARS NOVA-', 'http://ja.wikipedia.org/wiki/%E8%92%BC%E3%81%8D%E9%8B%BC%E3%81%AE%E3%82%A2%E3%83%AB%E3%83%9A%E3%82%B8%E3%82%AA'),
(10, '青の祓魔師', '『青の祓魔師』（あおのエクソシスト）は、加藤和恵による日本の漫画作品。『ジャンプスクエア』（集英社）にて、2009年5月号から連載中。略称は「青エク」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%9D%92%E3%81%AE%E7%A5%93%E9%AD%94%E5%B8%AB)より）', '', '4088708954', '4088707893', '4088800982', '4088747097', 'B00ECL5HF6', 'http://www.ao-ex.com/tv/', '青の祓魔師 [ao-ex.com]', 'http://jumpsq.shueisha.co.jp/rensai/aonoexorcist/', '青の祓魔師 [jumpsq.shueisha.co.jp]', 'http://jumpsq.shueisha.co.jp/rensai/aonoexorcist/', '青の祓魔師 [jumpsq.shueisha.co.jp]', 'http://ja.wikipedia.org/wiki/%E9%9D%92%E3%81%AE%E7%A5%93%E9%AD%94%E5%B8%AB'),
(11, 'あかね色に染まる坂', '『あかね色に染まる坂』（あかねいろにそまるさか）は、fengから2007年7月27日に発売されたアダルトゲーム。2008年8月14日にGN SoftwareよりPlayStation 2版『あかね色に染まる坂 ぱられる』が発売。2009年12月17日にはPlayStation Portable版『あかね色に染まる坂ぽーたぶる』が発売。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%8B%E3%81%AD%E8%89%B2%E3%81%AB%E6%9F%93%E3%81%BE%E3%82%8B%E5%9D%82)より）', '', 'B008S7JWRE', 'B000PUAZ1E', 'B001H0RO3I', 'B002QXMV42', '4860326814', 'http://www.piacci.co.jp/akaneiro/', 'あかね色に染まる坂 ぽーたぶる', 'http://dir.yahoo.co.jp/Recreation/Games/Video_Games/Genres/Adventure/Love/Akaneiro/Akaneironisomarusaka_Anime/', 'あかね色に染まる坂 アニメ版', 'http://dir.yahoo.co.jp/Recreation/Games/Video_Games/Genres/Adventure/Love/Akaneiro/Akaneironisomarusaka_Anime/', 'あかね色に染まる坂 アニメ版', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%8B%E3%81%AD%E8%89%B2%E3%81%AB%E6%9F%93%E3%81%BE%E3%82%8B%E5%9D%82'),
(12, 'アキハバラ電脳組', '『アキハバラ電脳組』（アキハバラでんのうぐみ/CYBER TEAM in AKIHABARA）は、1998年4月4日から同年9月26日までTBS系列で放送された日本のテレビアニメ。全26話。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%AD%E3%83%8F%E3%83%90%E3%83%A9%E9%9B%BB%E8%84%B3%E7%B5%84)より）', '', 'B00005F5UL', 'B00005F625', 'B00005F5VA', 'B00005F620', 'B00005F5UP', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%AD%E3%83%8F%E3%83%90%E3%83%A9%E9%9B%BB%E8%84%B3%E7%B5%84'),
(13, 'アクセル・ワールド', '『アクセル・ワールド』は、川原礫による日本のライトノベル。イラストはHIMAが担当。電撃文庫（アスキー・メディアワークス）より、2009年2月から刊行されている。略称は「AW」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%AF%E3%82%BB%E3%83%AB%E3%83%BB%E3%83%AF%E3%83%BC%E3%83%AB%E3%83%89)より）', '', '4048662384', '4048675176', '4048660055', '4048663895', 'B00C1Y9ND8', 'http://www.accel-world.net/', 'アクセル・ワールド [accel-world.net]', 'http://www.mxtv.co.jp/accel_world/', 'アクセル・ワールド [mxtv.co.jp]', 'http://www.mxtv.co.jp/accel_world/', 'アクセル・ワールド [mxtv.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%82%A2%E3%82%AF%E3%82%BB%E3%83%AB%E3%83%BB%E3%83%AF%E3%83%BC%E3%83%AB%E3%83%89'),
(14, '惡の華', '『惡の華』（あくのはな）は、押見修造による日本の漫画作品。『別冊少年マガジン』（講談社）2009年10月号（創刊号）から連載中。2013年にテレビアニメが放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%83%A1%E3%81%AE%E8%8F%AF)より）', '', '4063949931', '4063842770', 'B00HKKOP36', '4063949230', '4063848728', 'http://s.mxtv.jp/akunohana/', '惡の華 [s.mxtv.jp]', 'http://akunohana-anime.jp/', '惡の華 [akunohana-anime.jp]', 'http://akunohana-anime.jp/', '惡の華 [akunohana-anime.jp]', 'http://ja.wikipedia.org/wiki/%E6%83%A1%E3%81%AE%E8%8F%AF'),
(15, '朝霧の巫女', '『朝霧の巫女』（あさぎりのみこ）は、宇河弘樹の漫画。副題は「平成稲生物怪録」。「ヤングキングアワーズ」（少年画報社）に2000年3月号から2007年8月号まで連載された。連載終了後も執筆は続行されており、単行本は全9巻で完結となった。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%9C%9D%E9%9C%A7%E3%81%AE%E5%B7%AB%E5%A5%B3)より）', '', '4785940107', '4785920602', '4785938536', '4785935588', 'B00H29IZ9A', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E6%9C%9D%E9%9C%A7%E3%81%AE%E5%B7%AB%E5%A5%B3'),
(16, 'あずまんが大王', '『あずまんが大王』（あずまんがだいおう）は、あずまきよひこによる日本の4コマ漫画、およびそれを原作としたアニメ作品である。『月刊コミック電撃大王』（メディアワークス（現・アスキー・メディアワークス））において1999年2月号から2002年5月号にかけて連載された。単行本は全4巻。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%9A%E3%81%BE%E3%82%93%E3%81%8C%E5%A4%A7%E7%8E%8B)より）', '', 'B003DA48RA', 'B002DE676C', '4091216951', 'B001DZW5OA', '4840214670', 'http://yotuba.com/azumanga.html', 'あずまんが大王', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Azumanga', 'あずまんが大王', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Azumanga', 'あずまんが大王', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%9A%E3%81%BE%E3%82%93%E3%81%8C%E5%A4%A7%E7%8E%8B'),
(17, 'あたしンち', '『あたしンち』（Atashin''chi）は、けらえいこ原作の漫画作品。およびそれを原題としたテレビアニメ作品である。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%9F%E3%81%97%E3%83%B3%E3%81%A1)より）', '', '4040660625', 'B00EEOZR9C', '4889913467', '4840148864', '4040661907', 'http://3d-atashi.jp/', '劇場版 あたしンち 情熱のちょ～超能力♪母大暴走！', 'http://www.shin-ei-animation.jp/atashinchi/', 'あたしンち', 'http://www.shin-ei-animation.jp/atashinchi/', 'あたしンち', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%9F%E3%81%97%E3%83%B3%E3%81%A1'),
(18, 'あっちこっち', '『あっちこっち』は、異識による4コマ漫画。『まんがタイムきらら』（芳文社）2006年10月号から12月号の3か月連続の読みきりの後に連載開始となった。タイトルの英語表記は「PLACE TO PLACE」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%A3%E3%81%A1%E3%81%93%E3%81%A3%E3%81%A1)より）', '', '483227659X', 'B007N12TJY', '4832241710', '4832277634', 'B00CA083B6', 'http://www.tbs.co.jp/anime/ackc/', 'あっちこっち', 'http://www.tbs.co.jp/anime/ackc/', 'あっちこっち', 'http://www.tbs.co.jp/anime/ackc/', 'あっちこっち', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%A3%E3%81%A1%E3%81%93%E3%81%A3%E3%81%A1'),
(19, 'アドルフに告ぐ', '『アドルフに告ぐ』（アドルフにつぐ）は、手塚治虫による日本の歴史漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%89%E3%83%AB%E3%83%95%E3%81%AB%E5%91%8A%E3%81%90)より）', '', 'B002DEKKNS', 'B002DEKKNI', '416775701X', '4063737705', '4061759728', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%89%E3%83%AB%E3%83%95%E3%81%AB%E5%91%8A%E3%81%90'),
(20, 'Another', '『Another』（アナザー）は、綾辻行人による日本の小説作品。『野性時代』（角川書店）にて2006年8月号から2009年5月号まで数回の休載を挟んで連載された。単行本は2009年10月29日発売、文庫版は上下2分冊で2011年11月25日に発売されている。 （[wikipedia](http://ja.wikipedia.org/wiki/Another)より）', '', '4048740032', '4041000017', '404110498X', 'B009WOZYPG', '4041000009', 'http://www.another-anime.jp/', 'Another [another-anime.jp]', 'http://www.mxtv.co.jp/another/', 'Another [mxtv.co.jp]', 'http://www.mxtv.co.jp/another/', 'Another [mxtv.co.jp]', 'http://ja.wikipedia.org/wiki/Another'),
(21, 'あにゃまる探偵 キルミンずぅ', '『あにゃまる探偵 キルミンずぅ』（あにゃまるたんてい キルミンずぅ）は、日本のサテライト・ハルフィルムメーカーと大韓民国のJM ANIMATIONにより制作された日本のテレビアニメ。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%AB%E3%82%83%E3%81%BE%E3%82%8B%E6%8E%A2%E5%81%B5_%E3%82%AD%E3%83%AB%E3%83%9F%E3%83%B3%E3%81%9A%E3%81%85)より）', '', '', '', '', '', '', 'http://www.tv-tokyo.co.jp/anime/kirumin/', 'あにゃまる探偵 キルミンずぅ [tv-tokyo.co.jp]', 'http://www.starchild.co.jp/special/kirumin/', 'あにゃまる探偵 キルミンずぅ [starchild.co.jp]', 'http://www.starchild.co.jp/special/kirumin/', 'あにゃまる探偵 キルミンずぅ [starchild.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%AB%E3%82%83%E3%81%BE%E3%82%8B%E6%8E%A2%E5%81%B5_%E3%82%AD%E3%83%AB%E3%83%9F%E3%83%B3%E3%81%9A%E3%81%85'),
(22, 'あの夏で待ってる', '『あの夏で待ってる』（あのなつでまってる）は、2012年1月から3月まで放送された日本のオリジナルアニメ作品。キャッチコピーは「その夏の思い出が、僕達の永遠になる」。略称は「なつまち」または「あの夏」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%AE%E5%A4%8F%E3%81%A7%E5%BE%85%E3%81%A3%E3%81%A6%E3%82%8B)より）', '', 'B00DI1LLWE', '4838104731', 'B006W17Q5I', 'B00COH7X3E', '404891457X', 'http://www.ichika-ichika.com/', 'あの夏で待ってる [ichika-ichika.com]', 'http://www.mxtv.co.jp/natsumachi/', 'あの夏で待ってる [mxtv.co.jp]', 'http://www.mxtv.co.jp/natsumachi/', 'あの夏で待ってる [mxtv.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%AE%E5%A4%8F%E3%81%A7%E5%BE%85%E3%81%A3%E3%81%A6%E3%82%8B'),
(23, 'あの日見た花の名前を僕達はまだ知らない。', '『あの日見た花の名前を僕達はまだ知らない。』（あのひみたはなのなまえをぼくたちはまだしらない）は、A-1 Pictures制作の日本のテレビアニメ作品。2011年4月から6月までフジテレビ・ノイタミナ枠などで放送された。全11話。略称は「あの花」、「あのはな」。なお2013年8月31日に劇場版が公開された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%AE%E6%97%A5%E8%A6%8B%E3%81%9F%E8%8A%B1%E3%81%AE%E5%90%8D%E5%89%8D%E3%82%92%E5%83%95%E9%81%94%E3%81%AF%E3%81%BE%E3%81%A0%E7%9F%A5%E3%82%89%E3%81%AA%E3%81%84%E3%80%82)より）', '', 'B00GTK8UA2', 'B00E0BK64U', 'B00GTKYBQE', 'B00GTL3S58', 'B00GTKH774', 'http://www.anohana.jp/', '劇場版 あの日見た花の名前を僕達はまだ知らない。', 'http://www.anohana.jp/tv/', 'あの日見た花の名前を僕達はまだ知らない。 [anohana.jp]', 'http://www.anohana.jp/tv/', 'あの日見た花の名前を僕達はまだ知らない。 [anohana.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%82%E3%81%AE%E6%97%A5%E8%A6%8B%E3%81%9F%E8%8A%B1%E3%81%AE%E5%90%8D%E5%89%8D%E3%82%92%E5%83%95%E9%81%94%E3%81%AF%E3%81%BE%E3%81%A0%E7%9F%A5%E3%82%89%E3%81%AA%E3%81%84%E3%80%82'),
(24, 'アベノ橋魔法☆商店街', '『アベノ橋魔法☆商店街』（アベノばし まほうしょうてんがい）は、ガイナックスが制作した日本のテレビアニメ作品。2002年4月よりCS放送キッズステーション、他で放送。全13話。再放送も行われた。2002年度文化庁メディア芸術祭アニメーション部門優秀賞受賞。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%99%E3%83%8E%E6%A9%8B%E9%AD%94%E6%B3%95%E2%98%86%E5%95%86%E5%BA%97%E8%A1%97)より）', '', 'B003X1CY8O', '4063345181', 'B008U45K5S', 'B000066O2K', 'B000065E37', 'http://www.gainax.co.jp/anime/abesho/', 'アベノ橋魔法☆商店街', 'http://www.gainax.co.jp/anime/abesho/', 'アベノ橋魔法☆商店街', 'http://www.gainax.co.jp/anime/abesho/', 'アベノ橋魔法☆商店街', 'http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%99%E3%83%8E%E6%A9%8B%E9%AD%94%E6%B3%95%E2%98%86%E5%95%86%E5%BA%97%E8%A1%97'),
(25, 'アマガミ', '『アマガミ』は、2009年にエンターブレイン[1]から発売された、PlayStation 2用恋愛シミュレーションゲームソフト。インターネットラジオ番組を皮切りに、ドラマCD化や漫画化といったメディアミックス展開が積極的に行われ、2010年と2012年の二度に渡るテレビアニメ化にも至った。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%9E%E3%82%AC%E3%83%9F)より）', '', 'B00FPFQ284', 'B00FPFMHGA', 'B005VLWVPA', 'B003UF9WGA', 'B003UF9WK6', 'http://www.tbs.co.jp/anime/amagami/1st/', 'アマガミSS', 'http://www.tbs.co.jp/anime/amagami/', 'アマガミSS+', 'http://www.tbs.co.jp/anime/amagami/', 'アマガミSS+', 'http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%9E%E3%82%AC%E3%83%9F'),
(26, 'AMNESIA', '『AMNESIA』（アムネシア）は、アイディアファクトリー（オトメイト）より2011年8月18日に発売されたPlayStation Portable・PlayStation Vita用乙女ゲーム。2012年3月15日に『AMNESIA LATER』（アムネシア・レイター）が、2013年4月18日に『AMNESIA CROWD』（アムネシア・クラウド）がそれぞれ発売された。 （[wikipedia](http://ja.wikipedia.org/wiki/AMNESIA)より）', '', '4891991941', 'B005GCMXI4', '4891991992', 'B00F4Q3HTG', '4891992107', 'http://www.anime-amnesia.com/', 'AMNESIA', 'http://www.otomate.jp/amnesia/', 'アムネシア', 'http://www.otomate.jp/amnesia/', 'アムネシア', 'http://ja.wikipedia.org/wiki/AMNESIA'),
(27, '荒川アンダー ザ ブリッジ', '『荒川アンダー ザ ブリッジ』（あらかわアンダー ザ ブリッジ）は、中村光による日本の漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E8%8D%92%E5%B7%9D%E3%82%A2%E3%83%B3%E3%83%80%E3%83%BC_%E3%82%B6_%E3%83%96%E3%83%AA%E3%83%83%E3%82%B8)より）', '', '', '', '', '', '', 'http://autb.jp/', '荒川アンダーザブリッジ', 'http://www.mbs.jp/autb/', '荒川アンダー ザ ブリッジ [mbs.jp]', 'http://www.mbs.jp/autb/', '荒川アンダー ザ ブリッジ [mbs.jp]', 'http://ja.wikipedia.org/wiki/%E8%8D%92%E5%B7%9D%E3%82%A2%E3%83%B3%E3%83%80%E3%83%BC_%E3%82%B6_%E3%83%96%E3%83%AA%E3%83%83%E3%82%B8'),
(28, 'R.O.D', 'R.O.D（アール・オー・ディー）は、R.O.D -READ OR DIE-として制作されたメディアミックスシリーズの総称。本を愛し、紙を自在に操って闘う紙使いの活躍を描く「文系アクション」。タイトルの英語 は直訳すると「読むか死ぬか」、すなわち「読まなければ死ぬ」「読まずに死ねるか!」という意味。 （[wikipedia](http://ja.wikipedia.org/wiki/R.O.D)より）', '', '4086307650', 'B002ZG75QE', '4087825183', '4086300028', 'B00005HY8S', 'http://www.sonymusic.co.jp/Animation/ROD/', 'READ OR DIE', '', '', '', '', 'http://ja.wikipedia.org/wiki/R.O.D'),
(29, 'アルプスの少女ハイジ', '『アルプスの少女ハイジ』（アルプスのしょうじょハイジ、Heidi）は、スイスの作家ヨハンナ・シュピリ（又はスピリ）の児童文学作品である。1880年から1881年に執筆された。原題は『Heidis Lehr- und Wanderjahre』（ハイジの修行時代と遍歴時代）及び『Heidi kann brauchen, was es gelernt hat』（ハイジは習ったことを使うことができる）という。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%AB%E3%83%97%E3%82%B9%E3%81%AE%E5%B0%91%E5%A5%B3%E3%83%8F%E3%82%A4%E3%82%B8)より）', '', 'B003WJD9XQ', 'B005BLYGXU', '4198605246', 'B000EAV7K8', 'B000EAV7JY', 'http://www.heidi.ne.jp/', 'アルプスの少女ハイジ', 'http://www.ne.jp/asahi/ts/hp/file5_heidi/file500_heidi_top.html', 'アルプスの少女ハイジという物語', 'http://www.ne.jp/asahi/ts/hp/file5_heidi/file500_heidi_top.html', 'アルプスの少女ハイジという物語', 'http://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%AB%E3%83%97%E3%82%B9%E3%81%AE%E5%B0%91%E5%A5%B3%E3%83%8F%E3%82%A4%E3%82%B8'),
(30, 'UN-GO', '『UN-GO』（アンゴ）は、フジテレビ系列「ノイタミナ枠」で2011年10月から12月まで放映された日本のテレビアニメ。ボンズ制作。 （[wikipedia](http://ja.wikipedia.org/wiki/UN-GO)より）', '', 'B008KZX806', '4041207487', 'B00618Z5YQ', 'B006NYZ0Z2', '4150310599', 'http://www.un-go.com/', 'UN-GO', '', '', '', '', 'http://ja.wikipedia.org/wiki/UN-GO'),
(31, 'Yes! プリキュア5', '『Yes!プリキュア5』（イエス・プリキュア・ファイブ）は、東映アニメーション制作のTVアニメ作品。『プリキュアシリーズ』第4作にして3代目のプリキュアである。なお、この項目では第5作の『Yes!プリキュア5GoGo!』（イエス・プリキュア・ファイブ・ゴーゴー）についても解説する。 （[wikipedia](http://ja.wikipedia.org/wiki/Yes!%E3%83%97%E3%83%AA%E3%82%AD%E3%83%A5%E3%82%A25)より）', '', '', '', '', '', '', 'http://b.bngi-channel.jp/ds_precure5gogo/', 'Yes！プリキュア5GoGo！ 全員しゅーGo！ドリームフェスティバル', 'http://www.toei-anim.co.jp/tv/yes_precure5/', 'Yes！プリキュア5 [toei-anim.co.jp]', 'http://www.toei-anim.co.jp/tv/yes_precure5/', 'Yes！プリキュア5 [toei-anim.co.jp]', 'http://ja.wikipedia.org/wiki/Yes!%E3%83%97%E3%83%AA%E3%82%AD%E3%83%A5%E3%82%A25'),
(32, 'イヴの時間', '『イヴの時間 Are you enjoying the time of EVE ?』（イヴのじかん）とは、日本のアニメーション作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A4%E3%83%B4%E3%81%AE%E6%99%82%E9%96%93)より）', '', 'B00EDIO2VS', '4757530110', 'B003JERTBW', 'B004I4SBKK', '4757535740', 'http://timeofeve.com/', 'イヴの時間', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%A4%E3%83%B4%E3%81%AE%E6%99%82%E9%96%93'),
(33, '異国迷路のクロワーゼ', '『異国迷路のクロワーゼ』（いこくめいろのクロワーゼ、）は、武田日向による日本の漫画作品。『ドラゴンエイジPure』（富士見書房）vol.2から連載され、同誌休刊後は『月刊ドラゴンエイジ』に移籍し2009年7月号より連載中。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%95%B0%E5%9B%BD%E8%BF%B7%E8%B7%AF%E3%81%AE%E3%82%AF%E3%83%AD%E3%83%AF%E3%83%BC%E3%82%BC)より）', '', '4047125229', '4047126098', 'B0054Z8R3S', '4829177004', 'B0051RHQYK', 'http://ikokumeiro.com/', '異国迷路のクロワーゼ', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E7%95%B0%E5%9B%BD%E8%BF%B7%E8%B7%AF%E3%81%AE%E3%82%AF%E3%83%AD%E3%83%AF%E3%83%BC%E3%82%BC'),
(34, '一撃殺虫!!ホイホイさん', '『一撃殺虫!!ホイホイさん』（いちげきさっちゅう!!ホイホイさん）は、田中久仁彦による日本の漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E4%B8%80%E6%92%83%E6%AE%BA%E8%99%AB!!%E3%83%9B%E3%82%A4%E3%83%9B%E3%82%A4%E3%81%95%E3%82%93)より）', '', 'B004L63FPG', '4840227683', 'B002A9J5TQ', 'B0000C9JCA', 'B0038OMC4C', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E4%B8%80%E6%92%83%E6%AE%BA%E8%99%AB!!%E3%83%9B%E3%82%A4%E3%83%9B%E3%82%A4%E3%81%95%E3%82%93'),
(35, '苺ましまろ', '『苺ましまろ』（いちごましまろ）は、ばらスィーによる日本の漫画、およびそれを原作としたアニメ、ゲーム作品。『月刊コミック電撃大王』（メディアワークス）において2001年から連載されている。2005年7月からテレビアニメが放送されたほか、同年8月にはゲーム化もされた。 （[wikipedia](http://ja.wikipedia.org/wiki/%E8%8B%BA%E3%81%BE%E3%81%97%E3%81%BE%E3%82%8D)より）', '', '4048914537', '4840222924', '4048676342', 'B00BXWAHES', 'B0098H5BV4', 'http://archive.asciimw.jp/mediamix/ichigo/', '苺ましまろ [asciimw.jp]', 'http://www.tbs.co.jp/ichigomashimaro/', '苺ましまろ [tbs.co.jp]', 'http://www.tbs.co.jp/ichigomashimaro/', '苺ましまろ [tbs.co.jp]', 'http://ja.wikipedia.org/wiki/%E8%8B%BA%E3%81%BE%E3%81%97%E3%81%BE%E3%82%8D'),
(36, 'いちばんうしろの大魔王', '『いちばんうしろの大魔王』（いちばんうしろのだいまおう）は、水城正太郎による日本のライトノベル。イラストは伊藤宗一が担当。ホビージャパン・HJ文庫より刊行。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%84%E3%81%A1%E3%81%B0%E3%82%93%E3%81%86%E3%81%97%E3%82%8D%E3%81%AE%E5%A4%A7%E9%AD%94%E7%8E%8B)より）', '', '4894256606', '4253234690', 'B003DQ2HNG', '4798604607', '4798601500', 'http://www.maql.co.jp/special/daimao/', 'いちばんうしろの大魔王 [maql.co.jp]', 'http://www.hobbyjapan.co.jp/hjbunko/daimaou/', 'いちばんうしろの大魔王 [hobbyjapan.co.jp]', 'http://www.hobbyjapan.co.jp/hjbunko/daimaou/', 'いちばんうしろの大魔王 [hobbyjapan.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%84%E3%81%A1%E3%81%B0%E3%82%93%E3%81%86%E3%81%97%E3%82%8D%E3%81%AE%E5%A4%A7%E9%AD%94%E7%8E%8B'),
(37, 'いつか天魔の黒ウサギ', '『いつか天魔の黒ウサギ』（いつかてんまのくろウサギ、Itsuka Tenma no Kuro Usagi）は、鏡貴也による日本のライトノベル。略称は「いつ天」。イラストは榎宮祐。富士見書房の富士見ファンタジア文庫より、2008年11月から刊行されている。\r\n\r\n2011年1月にテレビアニメ化が発表され、同年7月から9月まで放送された。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%84%E3%81%A4%E3%81%8B%E5%A4%A9%E9%AD%94%E3%81%AE%E9%BB%92%E3%82%A6%E3%82%B5%E3%82%AE)より）', '', '4047129690', '4829138866', '4829133473', '482913819X', '4829137509', 'http://www.itsu-ten.jp/', 'いつか天魔の黒ウサギ [itsu-ten.jp]', 'http://www.marine-e.co.jp/sakuhin/fujimi/kuro_usagi/', 'ドラマCD いつか天魔の黒ウサギ', 'http://www.marine-e.co.jp/sakuhin/fujimi/kuro_usagi/', 'ドラマCD いつか天魔の黒ウサギ', 'http://ja.wikipedia.org/wiki/%E3%81%84%E3%81%A4%E3%81%8B%E5%A4%A9%E9%AD%94%E3%81%AE%E9%BB%92%E3%82%A6%E3%82%B5%E3%82%AE'),
(38, '頭文字D', '『頭文字D』（イニシャル・ディー / 英語表記: Initial D） は、しげの秀一による日本の漫画作品、またそれを原作にしたテレビアニメと映画を指す。通称「イニD」。峠道において自動車を高速で走行させることを目的とする、走り屋の若者たちを描いた作品である。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%A0%AD%E6%96%87%E5%AD%97D)より）', '', '4063823776', '406382344X', 'B00G93OE5Y', '4063822567', '4063821811', 'http://avex.jp/initial-d/', '頭文字[イニシャル]D THE MOVIE', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/InitialsD/InitialD_Game/', '頭文字D ゲーム版', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/InitialsD/InitialD_Game/', '頭文字D ゲーム版', 'http://ja.wikipedia.org/wiki/%E9%A0%AD%E6%96%87%E5%AD%97D'),
(39, '妖狐×僕SS', '『妖狐×僕SS』（いぬぼくシークレットサービス）は、藤原ここあによる日本の漫画作品。スクウェア・エニックス刊『月刊ガンガンJOKER』2009年5月号（創刊号）より連載中。また、JOKERの姉妹誌である『月刊Gファンタジー』2010年5月号と『ヤングガンガン』2011年6号では特別編が出張掲載されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%A6%96%E7%8B%90%C3%97%E5%83%95SS)より）', '', '4757540922', '4757536305', 'B008779JQO', '4757539703', 'B007N8OQUM', 'http://www.inuboku.tv/', '妖狐×僕SS [inuboku.tv]', 'http://www.mbs.jp/inuboku/', '妖狐×僕SS [mbs.jp]', 'http://www.mbs.jp/inuboku/', '妖狐×僕SS [mbs.jp]', 'http://ja.wikipedia.org/wiki/%E5%A6%96%E7%8B%90%C3%97%E5%83%95SS'),
(40, 'イリヤの空、UFOの夏', '『イリヤの空、UFOの夏』（イリヤのそら、ユーフォーのなつ）は、電撃文庫から刊行されている秋山瑞人のライトノベル。また、これを原作とするOVA・ラジオドラマ・ゲーム・漫画作品である。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A4%E3%83%AA%E3%83%A4%E3%81%AE%E7%A9%BA%E3%80%81UFO%E3%81%AE%E5%A4%8F)より）', '', '4840219443', 'B00A0GIA6K', '4840224315', '4840221731', '4840219737', 'http://www.toei-anim.co.jp/animeister/iriya/', 'イリヤの空、UFOの夏', 'http://dir.yahoo.co.jp/Arts/Humanities/Literature/Literary_Fiction/Authors/Mizuhito_Akiyama', '秋山瑞人', 'http://dir.yahoo.co.jp/Arts/Humanities/Literature/Literary_Fiction/Authors/Mizuhito_Akiyama', '秋山瑞人', 'http://ja.wikipedia.org/wiki/%E3%82%A4%E3%83%AA%E3%83%A4%E3%81%AE%E7%A9%BA%E3%80%81UFO%E3%81%AE%E5%A4%8F'),
(41, '11eyes', '『11eyes -罪と罰と贖いの少女-』（イレブンアイズ つみとばつとあがないのしょうじょ）は、2008年4月25日に発売されたLassの第4作目のアダルトゲームソフト。 （[wikipedia](http://ja.wikipedia.org/wiki/11eyes_-%E7%BD%AA%E3%81%A8%E7%BD%B0%E3%81%A8%E8%B4%96%E3%81%84%E3%81%AE%E5%B0%91%E5%A5%B3-)より）', '', 'B004H7SGVW', 'B002PK0L7U', 'B00ANEUWI8', 'B0012NNJY8', 'B0031WUX6K', 'http://5pb.jp/games/11eyes/', '11eyes CrossOver', 'http://dir.yahoo.co.jp/Recreation/Games/Video_Games/Genres/Adventure/11eyes/11eyes_Anime/', '11eyes アニメ版', 'http://dir.yahoo.co.jp/Recreation/Games/Video_Games/Genres/Adventure/11eyes/11eyes_Anime/', '11eyes アニメ版', 'http://ja.wikipedia.org/wiki/11eyes_-%E7%BD%AA%E3%81%A8%E7%BD%B0%E3%81%A8%E8%B4%96%E3%81%84%E3%81%AE%E5%B0%91%E5%A5%B3-'),
(42, 'Wake Up, Girls!', '『Wake Up, Girls!』（ウェイクアップ・ガールズ）は、Ordet×タツノコプロ制作の日本のアニメ。略称はWUG（ワグ）。 （[wikipedia](http://ja.wikipedia.org/wiki/Wake_Up,_Girls!)より）', '', '', '', '', '', '', 'http://wakeupgirls.jp/', 'Wake Up, Girls! [wakeupgirls.jp]', 'http://www.tv-tokyo.co.jp/anime/wug/', 'Wake Up, Girls! [tv-tokyo.co.jp]', 'http://www.tv-tokyo.co.jp/anime/wug/', 'Wake Up, Girls! [tv-tokyo.co.jp]', 'http://ja.wikipedia.org/wiki/Wake_Up,_Girls!'),
(43, '宇宙兄弟', '『宇宙兄弟』（うちゅうきょうだい）は、小山宙哉による日本の漫画作品。講談社の漫画雑誌『モーニング』にて2008年1号から連載中。2013年10月現在22巻まで単行本化されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%AE%87%E5%AE%99%E5%85%84%E5%BC%9F)より）', '', '4063872637', '4063726746', 'B009KWUFNG', '4063872238', 'B00FED8QXQ', 'http://wwws.warnerbros.co.jp/uchukyodai-movie/', '宇宙兄弟', 'http://www.ytv.co.jp/uchukyodai/', '宇宙兄弟', 'http://www.ytv.co.jp/uchukyodai/', '宇宙兄弟', 'http://ja.wikipedia.org/wiki/%E5%AE%87%E5%AE%99%E5%85%84%E5%BC%9F'),
(44, '宇宙ショーへようこそ', '『宇宙ショーへようこそ』（うちゅうショーへようこそ、英題：Welcome to THE SPACE SHOW）は、2010年公開の日本のアニメ映画。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%AE%87%E5%AE%99%E3%82%B7%E3%83%A7%E3%83%BC%E3%81%B8%E3%82%88%E3%81%86%E3%81%93%E3%81%9D)より）', '', 'B003TU1YKI', 'B00426C8BW', 'B00426C8C6', '4416810393', 'B003E33R50', 'http://www.uchushow.net/', '宇宙ショーへようこそ', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E5%AE%87%E5%AE%99%E3%82%B7%E3%83%A7%E3%83%BC%E3%81%B8%E3%82%88%E3%81%86%E3%81%93%E3%81%9D'),
(45, '有頂天家族', '『有頂天家族』（うちょうてんかぞく、uchoten-kazoku）は、森見登美彦による日本の小説。森見作品の中で「五男」、「毛深い子」と呼ばれる。幻冬舎より2007年9月25日に刊行された。森見作品初の、動物が主人公の小説。3部作となる予定の「たぬきシリーズ」の第1部に当たる。公式読本巻末にて二部の発売を予告を発表。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%9C%89%E9%A0%82%E5%A4%A9%E5%AE%B6%E6%97%8F)より）', '', 'B00DR3ZLFQ', '4344415264', 'B00DR3ZLII', 'B00DR3ZK0C', '434402415X', 'http://s.mxtv.jp/uchoten_kazoku/', '有頂天家族 [s.mxtv.jp]', 'http://www.uchoten-anime.com/', '有頂天家族 [uchoten-anime.com]', 'http://www.uchoten-anime.com/', '有頂天家族 [uchoten-anime.com]', 'http://ja.wikipedia.org/wiki/%E6%9C%89%E9%A0%82%E5%A4%A9%E5%AE%B6%E6%97%8F'),
(46, 'うぽって!!', '『うぽって!!』（UPOTTE!!）は、天王寺キツネによる日本の漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%86%E3%81%BD%E3%81%A3%E3%81%A6!!)より）', '', 'B00E5V5IZ2', '404120805X', 'B0093GD6OY', 'B00CFJIP4C', 'B0093GDA86', 'http://www.kadokawa.co.jp/ace/upotte/', 'うぽって!!', 'http://twitter.com/anime_upotte/', 'Twitter - anime_upotte', 'http://twitter.com/anime_upotte/', 'Twitter - anime_upotte', 'http://ja.wikipedia.org/wiki/%E3%81%86%E3%81%BD%E3%81%A3%E3%81%A6!!'),
(47, '海がきこえる', '『海がきこえる』（うみがきこえる、英題：Ocean Waves）は、氷室冴子による小説。また、それを原作として1993年にスタジオジブリが制作したアニメーション作品及び1995年にテレビ朝日系列で放映されたテレビドラマ。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%B5%B7%E3%81%8C%E3%81%8D%E3%81%93%E3%81%88%E3%82%8B)より）', '', '4198911304', 'B00005R5J7', '4198911312', 'B000059HU9', '4191250647', 'http://homepage3.nifty.com/akinori_naka/', '海がきこえるを歩く', 'http://dir.yahoo.co.jp/Arts/Humanities/Literature/Literary_Fiction/Light_Novel/Titles/Umi_ga_Kikoeru', '海がきこえる', 'http://dir.yahoo.co.jp/Arts/Humanities/Literature/Literary_Fiction/Light_Novel/Titles/Umi_ga_Kikoeru', '海がきこえる', 'http://ja.wikipedia.org/wiki/%E6%B5%B7%E3%81%8C%E3%81%8D%E3%81%93%E3%81%88%E3%82%8B'),
(48, 'うみねこのなく頃に', '『うみねこのなく頃に』（うみねこのなくころに）は、同人サークル07th Expansion（有限会社FUJIX）が製作し、ショップなどの流通販路で商業販売している同人ゲームである。略称は「うみねこ」。タイトルは『うみねこのなく頃に』と、「な」を赤文字で表記する。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%86%E3%81%BF%E3%81%AD%E3%81%93%E3%81%AE%E3%81%AA%E3%81%8F%E9%A0%83%E3%81%AB)より）', '', '4757541759', '4757541767', '4757540450', '4757540442', 'B005LM0JYO', 'http://umineko.tv/', 'うみねこのなく頃に', 'http://www.umine.co/portable/', 'うみねこのなく頃に Portable', 'http://www.umine.co/portable/', 'うみねこのなく頃に Portable', 'http://ja.wikipedia.org/wiki/%E3%81%86%E3%81%BF%E3%81%AD%E3%81%93%E3%81%AE%E3%81%AA%E3%81%8F%E9%A0%83%E3%81%AB'),
(49, 'Aチャンネル', '『Aチャンネル』（エーチャンネル）は、黒田bbによる日本の4コマ漫画作品。芳文社の月刊雑誌『まんがタイムきららキャラット』にて2008年（平成20年）12月号から連載中。略称は「Aチャン」。『まんがタイムきららキャラット』2010年（平成22年）12月号にてテレビアニメ化が発表され、2011年（平成23年）4月から6月まで放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/A%E3%83%81%E3%83%A3%E3%83%B3%E3%83%8D%E3%83%AB)より）', '', '4832244086', '4832242652', '4832278762', '4832240072', '4832241273', 'http://www.a-ch.jp/', 'Aチャンネル [a-ch.jp]', 'http://www.mbs.jp/a-ch/', 'Aチャンネル [mbs.jp]', 'http://www.mbs.jp/a-ch/', 'Aチャンネル [mbs.jp]', 'http://ja.wikipedia.org/wiki/A%E3%83%81%E3%83%A3%E3%83%B3%E3%83%8D%E3%83%AB'),
(50, 'えびてん 公立海老栖川高校天悶部', '『えびてん 公立海老栖川高校天悶部』（えびてん こうりつえびすがわこうこうてんもんぶ）は、脚本：すかぢ、作画：狗神煌による日本の漫画作品。『月刊コンプエース』（角川書店）2008年12月号より連載中。2011年12月にアニメ化が発表され2012年7月にニコニコ生放送にて先行配信、2012年10月には地上波にて放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%88%E3%81%B3%E3%81%A6%E3%82%93_%E5%85%AC%E7%AB%8B%E6%B5%B7%E8%80%81%E6%A0%96%E5%B7%9D%E9%AB%98%E6%A0%A1%E5%A4%A9%E6%82%B6%E9%83%A8)より）', '', '', '', '', '', '', 'http://s.mxtv.jp/ebiten/', 'えびてん', 'http://ebiten.jp/', 'えびてん 公立海老栖川高校天悶部', 'http://ebiten.jp/', 'えびてん 公立海老栖川高校天悶部', 'http://ja.wikipedia.org/wiki/%E3%81%88%E3%81%B3%E3%81%A6%E3%82%93_%E5%85%AC%E7%AB%8B%E6%B5%B7%E8%80%81%E6%A0%96%E5%B7%9D%E9%AB%98%E6%A0%A1%E5%A4%A9%E6%82%B6%E9%83%A8'),
(51, 'NHKにようこそ！', '『NHKにようこそ!』は、滝本竜彦の小説。大学を中退した引きこもりの青年と、それを救うことが目的という少女を軸に、引きこもりの葛藤する姿を誇張も交えつつ描いた作品。ウェブサイト「Boiled Eggs Online」にて、2001年1月29日から4月16日まで連載。2002年1月、角川書店刊。2004年、大岩ケンヂの作画で漫画化され『月刊少年エース』にて連載開始、2006年にはアニメ化された。2007年、漫画版が完結。', '', '4048733397', 'B0093G7X20', 'B006DFSCVA', 'B002CZPKO2', 'B0093G85IQ', 'http://www.kadokawa.co.jp/hikky/', 'N・H・Kにようこそ！', 'http://www.kadokawa.co.jp/hikky/', 'N・H・Kにようこそ！', 'http://www.kadokawa.co.jp/hikky/', 'N・H・Kにようこそ！', 'http://ja.wikipedia.org/wiki/NHK%E3%81%AB%E3%82%88%E3%81%86%E3%81%93%E3%81%9D!'),
(52, 'えむえむっ！', '『えむえむっ!』は、松野秋鳴による日本のライトノベル。イラストはQP:flapper（小原トメ太・さくら小春）が担当。メディアファクトリーのMF文庫Jから12巻刊行され、2008年10月時点でトータルで100万部を超える作品となったが、作者急逝のため絶筆となった[1]。\r\n\r\n漫画化もされており、氷樹一世作画によるコミカライズが『月刊コミックアライブ』2008年9月号から2012年4月号まで連載された。コミックス第3巻の帯、次いでライトノベル第9巻の帯、QP:flapperの公式サイトにてテレビアニメ化が発表され、2010年10月から12月まで放送された。（([Wikipedia](http://ja.wikipedia.org/wiki/%E3%81%88%E3%82%80%E3%81%88%E3%82%80%E3%81%A3!)より)）', '', 'B0095F5PG0', '4840125325', 'B0095F5O52', 'B00436F2DM', 'B0095F5OFC', 'http://www.butaro.net/', 'えむえむっ！ [butaro.net]', 'http://www.mxtv.co.jp/emu_emu/', 'えむえむっ！ [mxtv.co.jp]', 'http://www.mxtv.co.jp/emu_emu/', 'えむえむっ！ [mxtv.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%88%E3%82%80%E3%81%88%E3%82%80%E3%81%A3!'),
(53, 'エルフェンリート', '『エルフェンリート』（elfen lied）とは岡本倫による青年漫画作品、およびそれを原作としたアニメ作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%A8%E3%83%AB%E3%83%95%E3%82%A7%E3%83%B3%E3%83%AA%E3%83%BC%E3%83%88)より）', '', 'B004Q3QS8K', 'B009LXTE7M', '4088763580', 'B00ECT85R0', '4088768841', 'http://www.vap.co.jp/elfenlied/', 'エルフェンリート', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Elfen_Lied', 'エルフェンリート', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Elfen_Lied', 'エルフェンリート', 'http://ja.wikipedia.org/wiki/%E3%82%A8%E3%83%AB%E3%83%95%E3%82%A7%E3%83%B3%E3%83%AA%E3%83%BC%E3%83%88'),
(54, 'Angel Beats!', '『Angel Beats!』（エンジェル ビーツ）は、2010年4月から6月まで放送されていたテレビアニメ作品である。全13話+特別編1話。略称は「AB!」、「AB」など。 （[wikipedia](http://ja.wikipedia.org/wiki/Angel_Beats!)より）', '', '', '', '', '', '', 'http://www.angelbeats.jp/', 'Angel Beats! [angelbeats.jp]', 'http://www.mxtv.co.jp/angelbeats/', 'Angel Beats! [mxtv.co.jp]', 'http://www.mxtv.co.jp/angelbeats/', 'Angel Beats! [mxtv.co.jp]', 'http://ja.wikipedia.org/wiki/Angel_Beats!'),
(55, 'おおかみこどもの雨と雪', '『おおかみこどもの雨と雪』（おおかみこどものあめとゆき）は、2012年7月21日に公開された日本のアニメーション映画。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%8A%E3%81%8B%E3%81%BF%E3%81%93%E3%81%A9%E3%82%82%E3%81%AE%E9%9B%A8%E3%81%A8%E9%9B%AA)より）', '', 'B00AHRI4H2', '4041003237', 'B00AHSQRBQ', 'B00AJEL71S', '4041207711', 'http://ookamikodomo.jp/', 'おおかみこどもの雨と雪', 'http://www.facebook.com/ookamikodomo/', 'Facebook - おおかみこどもの雨と雪', 'http://www.facebook.com/ookamikodomo/', 'Facebook - おおかみこどもの雨と雪', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%8A%E3%81%8B%E3%81%BF%E3%81%93%E3%81%A9%E3%82%82%E3%81%AE%E9%9B%A8%E3%81%A8%E9%9B%AA'),
(56, 'オオカミさんと七人の仲間たち', '『オオカミさんシリーズ』は、沖田雅による一連のライトノベル作品。イラストはうなじが担当。アスキー・メディアワークスの電撃文庫から刊行されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AA%E3%82%AA%E3%82%AB%E3%83%9F%E3%81%95%E3%82%93%E3%82%B7%E3%83%AA%E3%83%BC%E3%82%BA)より）', '', '4840235244', '4048701304', '4048911929', '4048686453', 'B003SKJPZ0', 'http://otogi-bank.com/', 'オオカミさんと七人の仲間たち', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%AA%E3%82%AA%E3%82%AB%E3%83%9F%E3%81%95%E3%82%93%E3%82%B7%E3%83%AA%E3%83%BC%E3%82%BA'),
(57, 'おおきく振りかぶって', '『おおきく振りかぶって』（おおきくふりかぶって）は、ひぐちアサによる日本の漫画、及びそれを原作としたテレビアニメ作品、ゲーム作品。『月刊アフタヌーン』（講談社）にて2003年11月号より連載中。テレビアニメは2007年4月よりTBS・MBSほかで放送された。2010年4月から6月まで第2期が放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%8A%E3%81%8D%E3%81%8F%E6%8C%AF%E3%82%8A%E3%81%8B%E3%81%B6%E3%81%A3%E3%81%A6)より）', '', '4063879364', '4063878813', 'B00HD9IV16', '4063143422', '4063878457', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Ookiku_Furikabutte/Ookiku_Furikabutte/', 'おおきく振りかぶって アニメ版', 'http://www.maql.co.jp/special/game/ds/oohuri/', 'おおきく振りかぶって ほんとのエースになれるかも', 'http://www.maql.co.jp/special/game/ds/oohuri/', 'おおきく振りかぶって ほんとのエースになれるかも', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%8A%E3%81%8D%E3%81%8F%E6%8C%AF%E3%82%8A%E3%81%8B%E3%81%B6%E3%81%A3%E3%81%A6'),
(58, '奥さまは魔法少女', '『奥さまは魔法少女』（おくさまはまほうしょうじょ）は、日本のテレビアニメ（UHFアニメ）作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%A5%A5%E3%81%95%E3%81%BE%E3%81%AF%E9%AD%94%E6%B3%95%E5%B0%91%E5%A5%B3)より）', '', '4840231036', 'B0009OLPGA', 'B000FCYAKO', 'B000DZI65S', 'B0009YGWOA', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E5%A5%A5%E3%81%95%E3%81%BE%E3%81%AF%E9%AD%94%E6%B3%95%E5%B0%91%E5%A5%B3'),
(59, '幼なじみは大統領', '『幼なじみは大統領 My girlfriend is the PRESIDENT.』（おさななじみはだいとうりょう マイ・ガールフレンド・イズ・ザ・プレジデント）は、2009年10月30日にALcotより発売されたアダルトゲーム。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%B9%BC%E3%81%AA%E3%81%98%E3%81%BF%E3%81%AF%E5%A4%A7%E7%B5%B1%E9%A0%98_My_girlfriend_is_the_PRESIDENT.)より）', '', 'B0046ASKNO', 'B002GP7OGA', 'B002U1QMLS', 'B0040NOZXG', 'B005ASHRI0', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E5%B9%BC%E3%81%AA%E3%81%98%E3%81%BF%E3%81%AF%E5%A4%A7%E7%B5%B1%E9%A0%98_My_girlfriend_is_the_PRESIDENT.'),
(60, 'おジャ魔女どれみ', '『おジャ魔女どれみ』（おジャまじょどれみ）は、東映アニメーションが15年ぶりに制作した、オリジナル魔法少女アニメ作品。版権上、原作は東堂いづみになっており、コミック・ゲームなどメディアミックス展開した。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E3%82%B8%E3%83%A3%E9%AD%94%E5%A5%B3%E3%81%A9%E3%82%8C%E3%81%BF)より）', '', '4063753271', '4063752062', '4063752879', '4063752739', '4063752356', 'http://www.toei-anim.co.jp/tv/doremi_n/', 'おジャ魔女どれみ ナ・イ・ショ', 'http://www.toei-anim.co.jp/tv/doremi_m/', 'も～っと！おジャ魔女どれみ', 'http://www.toei-anim.co.jp/tv/doremi_m/', 'も～っと！おジャ魔女どれみ', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E3%82%B8%E3%83%A3%E9%AD%94%E5%A5%B3%E3%81%A9%E3%82%8C%E3%81%BF'),
(61, '織田信奈の野望', '『織田信奈の野望』（おだのぶなのやぼう）は、春日みかげ・著、みやま零・画のライトノベル作品。ソフトバンククリエイティブ・GA文庫刊。（[wikipedia](http://ja.wikipedia.org/wiki/%E7%B9%94%E7%94%B0%E4%BF%A1%E5%A5%88%E3%81%AE%E9%87%8E%E6%9C%9B)より）', '', '4041209587', '4797372346', '4041207959', '479735450X', '4041201357', 'http://odanobuna.com/', '織田信奈の野望 [odanobuna.com]', 'http://ga.sbcr.jp/bunko_blog/nobuna/', '織田信奈の野望 [ga.sbcr.jp]', 'http://ga.sbcr.jp/bunko_blog/nobuna/', '織田信奈の野望 [ga.sbcr.jp]', 'http://ja.wikipedia.org/wiki/%E7%B9%94%E7%94%B0%E4%BF%A1%E5%A5%88%E3%81%AE%E9%87%8E%E6%9C%9B');
INSERT INTO `work` (`workid`, `name`, `workdesc`, `img`, `productid1`, `productid2`, `productid3`, `productid4`, `productid5`, `url1`, `urlname1`, `url2`, `urlname2`, `url3`, `urlname3`, `wikipedia`) VALUES
(62, 'おとめ妖怪ざくろ', '『おとめ妖怪 ざくろ』（おとめようかい ざくろ）は、星野リリィによる日本の漫画作品。『コミックバーズ』（幻冬舎コミックス）にて連載中。2010年10月から2011年1月までテレビアニメが放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%A8%E3%82%81%E5%A6%96%E6%80%AA_%E3%81%96%E3%81%8F%E3%82%8D)より）', '', '4344827619', '434482458X', '4344811879', '4344827287', '4344822641', 'http://www.otome-zakuro.jp/', 'おとめ妖怪 ざくろ [otome-zakuro.jp]', 'http://www.tv-tokyo.co.jp/anime/otome-zakuro/', 'おとめ妖怪 ざくろ [tv-tokyo.co.jp]', 'http://www.tv-tokyo.co.jp/anime/otome-zakuro/', 'おとめ妖怪 ざくろ [tv-tokyo.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%A8%E3%82%81%E5%A6%96%E6%80%AA_%E3%81%96%E3%81%8F%E3%82%8D'),
(63, 'お兄ちゃんだけど愛さえあれば関係ないよねっ', '『お兄ちゃんだけど愛さえあれば関係ないよねっ』（おにいちゃんだけどあいさえあればかんけいないよねっ）は、鈴木大輔による日本のライトノベル。イラストは閏月戈が担当。2010年12月よりMF文庫J（メディアファクトリー）から刊行されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E5%85%84%E3%81%A1%E3%82%83%E3%82%93%E3%81%A0%E3%81%91%E3%81%A9%E6%84%9B%E3%81%95%E3%81%88%E3%81%82%E3%82%8C%E3%81%B0%E9%96%A2%E4%BF%82%E3%81%AA%E3%81%84%E3%82%88%E3%81%AD%E3%81%A3)より）', '', '4840153388', '4840136769', 'B0095F5E6G', '4840154198', 'B00F90DM74', 'http://oniai.com/', 'お兄ちゃんだけど愛さえあれば関係ないよねっ [oniai.com]', 'http://www.mediafactory.co.jp/bunkoj/oniai/', 'お兄ちゃんだけど愛さえあれば関係ないよねっ [mediafactory.co.jp]', 'http://www.mediafactory.co.jp/bunkoj/oniai/', 'お兄ちゃんだけど愛さえあれば関係ないよねっ [mediafactory.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E5%85%84%E3%81%A1%E3%82%83%E3%82%93%E3%81%A0%E3%81%91%E3%81%A9%E6%84%9B%E3%81%95%E3%81%88%E3%81%82%E3%82%8C%E3%81%B0%E9%96%A2%E4%BF%82%E3%81%AA%E3%81%84%E3%82%88%E3%81%AD%E3%81%A3'),
(64, 'お兄ちゃんのことなんかぜんぜん好きじゃないんだからねっ!!', '『お兄ちゃんのことなんかぜんぜん好きじゃないんだからねっ!!』（おにいちゃんのことなんかぜんぜんすきじゃないんだからねっ）は、草野紅壱による日本の漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E5%85%84%E3%81%A1%E3%82%83%E3%82%93%E3%81%AE%E3%81%93%E3%81%A8%E3%81%AA%E3%82%93%E3%81%8B%E3%81%9C%E3%82%93%E3%81%9C%E3%82%93%E5%A5%BD%E3%81%8D%E3%81%98%E3%82%83%E3%81%AA%E3%81%84%E3%82%93%E3%81%A0%E3%81%8B%E3%82%89%E3%81%AD%E3%81%A3!!)より）', '', '4575843210', 'B009DBYIR8', '4575842303', 'B009DBYIOQ', 'B009DBYIG4', 'http://www.starchild.co.jp/special/oniichan/', 'お兄ちゃんのことなんかぜんぜん好きじゃないんだからねっ!! [starchild.co.jp]', 'http://www.mxtv.co.jp/oniichan/', 'お兄ちゃんのことなんかぜんぜん好きじゃないんだからねっ!! [mxtv.co.jp]', 'http://www.mxtv.co.jp/oniichan/', 'お兄ちゃんのことなんかぜんぜん好きじゃないんだからねっ!! [mxtv.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E5%85%84%E3%81%A1%E3%82%83%E3%82%93%E3%81%AE%E3%81%93%E3%81%A8%E3%81%AA%E3%82%93%E3%81%8B%E3%81%9C%E3%82%93%E3%81%9C%E3%82%93%E5%A5%BD%E3%81%8D%E3%81%98%E3%82%83%E3%81%AA%E3%81%84%E3%82%93%E3%81%A0%E3%81%8B%E3%82%89%E3%81%AD%E3%81%A3!!'),
(65, 'おねがい☆ティーチャー', '『おねがい☆ティーチャー』は、日本のテレビアニメ作品、およびそれを原作とする漫画・小説である。テレビアニメは2002年1月10日から3月28日にかけて、WOWOWのノンスクランブル帯にて放送された。略称は「おねてぃ」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%AD%E3%81%8C%E3%81%84%E2%98%86%E3%83%86%E3%82%A3%E3%83%BC%E3%83%81%E3%83%A3%E3%83%BC)より）', '', 'B00FYO1T7K', 'B005ITTNII', 'B005ITTNK6', 'B000O77LGK', 'B005ITTNJW', 'http://www.mxtv.co.jp/onegai_teacher/', 'おねがい☆ティーチャー', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%AD%E3%81%8C%E3%81%84%E2%98%86%E3%83%86%E3%82%A3%E3%83%BC%E3%83%81%E3%83%A3%E3%83%BC'),
(66, 'おねがい☆ツインズ', '『おねがい☆ツインズ』は日本のアニメ作品。『おねがい☆ティーチャー』の続編。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%AD%E3%81%8C%E3%81%84%E2%98%86%E3%83%84%E3%82%A4%E3%83%B3%E3%82%BA)より）', '', 'B00FYO1T7K', 'B005ITTNJW', '484023194X', 'B000OCYDRU', 'B005ITTNJM', 'http://www.shinguji-sakura.com/AT7/ateliertop.htm', 'Atelier 8793 dot works', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E3%81%AD%E3%81%8C%E3%81%84%E2%98%86%E3%83%84%E3%82%A4%E3%83%B3%E3%82%BA'),
(67, 'おもひでぽろぽろ', '『おもひでぽろぽろ』（英題：Only Yesterday）は、岡本螢・刀根夕子の漫画および、それを原作としたスタジオジブリ制作の劇場アニメ作品。監督・脚本は高畑勲。主題歌は作詞・曲（ベット・ミドラー歌）の「The Rose」を高畑勲が日本語に訳し、都はるみが歌った「愛は花、君はその種子」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8A%E3%82%82%E3%81%B2%E3%81%A7%E3%81%BD%E3%82%8D%E3%81%BD%E3%82%8D)より）', '', 'B00005R5J5', 'B008TNFHJY', '479260432X', 'B00005GFEX', 'B000GHRCFS', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%81%8A%E3%82%82%E3%81%B2%E3%81%A7%E3%81%BD%E3%82%8D%E3%81%BD%E3%82%8D'),
(68, '俺の妹がこんなに可愛いわけがない', '『俺の妹がこんなに可愛いわけがない』（おれのいもうとがこんなにかわいいわけがない）とは、伏見つかさによる日本のライトノベル。イラストはかんざきひろが担当している。電撃文庫（アスキー・メディアワークス）より、2008年8月から2013年6月まで刊行された。全12巻。本作を原作とする漫画、ドラマCD、アニメ、ゲームなどのメディアミックス展開が行われている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E4%BF%BA%E3%81%AE%E5%A6%B9%E3%81%8C%E3%81%93%E3%82%93%E3%81%AA%E3%81%AB%E5%8F%AF%E6%84%9B%E3%81%84%E3%82%8F%E3%81%91%E3%81%8C%E3%81%AA%E3%81%84)より）', '', 'B00EKTMT5Q', 'B00D41NXUG', '4048916076', 'B00DOJQ0FI', 'B00EVM9I1U', 'http://oreimo.dengeki.com/', '俺の妹がこんなに可愛いわけがない', 'http://dol.dengeki.com/sp/oreimo/anime/', '『俺の妹がこんなに可愛いわけがない』特集ページ', 'http://dol.dengeki.com/sp/oreimo/anime/', '『俺の妹がこんなに可愛いわけがない』特集ページ', 'http://ja.wikipedia.org/wiki/%E4%BF%BA%E3%81%AE%E5%A6%B9%E3%81%8C%E3%81%93%E3%82%93%E3%81%AA%E3%81%AB%E5%8F%AF%E6%84%9B%E3%81%84%E3%82%8F%E3%81%91%E3%81%8C%E3%81%AA%E3%81%84'),
(69, '俺たちに翼はない', '『俺たちに翼はない』（おれたちにつばさはない）は、2009年1月30日にNavelから発売された18禁恋愛アドベンチャーゲームならびにそのアニメ化作品である。通称「おれつば」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E4%BF%BA%E3%81%9F%E3%81%A1%E3%81%AB%E7%BF%BC%E3%81%AF%E3%81%AA%E3%81%84)より）', '', 'B00GIBTARY', 'B001OAMUO4', 'B00GIBTASI', 'B00170HXRU', 'B00GIBTAUQ', 'http://5pb.jp/games/oretsuba/', '俺たちに翼はない', 'http://5pb.jp/games/oretsuba/', '俺たちに翼はない', 'http://5pb.jp/games/oretsuba/', '俺たちに翼はない', 'http://ja.wikipedia.org/wiki/%E4%BF%BA%E3%81%9F%E3%81%A1%E3%81%AB%E7%BF%BC%E3%81%AF%E3%81%AA%E3%81%84'),
(70, '俺の彼女と幼なじみが修羅場すぎる', '『俺の彼女と幼なじみが修羅場すぎる』（おれのかのじょとおさななじみがしゅらばすぎる）は、裕時悠示による日本のライトノベル作品。イラストはるろおが担当している。SBクリエイティブ（旧・ソフトバンク クリエイティブ）・GA文庫刊。2013年3月の時点で累計70万部を突破している[1]。略称は「俺修羅」。（[wikipedia](http://ja.wikipedia.org/wiki/%E4%BF%BA%E3%81%AE%E5%BD%BC%E5%A5%B3%E3%81%A8%E5%B9%BC%E3%81%AA%E3%81%98%E3%81%BF%E3%81%8C%E4%BF%AE%E7%BE%85%E5%A0%B4%E3%81%99%E3%81%8E%E3%82%8B)より）', '', '4797363967', 'B00ARDX4S0', '4757540949', '4797372850', '4797372842', 'http://www.oreshura.net/', '俺の彼女と幼なじみが修羅場すぎる [oreshura.net]', 'http://s.mxtv.jp/oreshura/', '俺の彼女と幼なじみが修羅場すぎる [s.mxtv.jp]', 'http://s.mxtv.jp/oreshura/', '俺の彼女と幼なじみが修羅場すぎる [s.mxtv.jp]', 'http://ja.wikipedia.org/wiki/%E4%BF%BA%E3%81%AE%E5%BD%BC%E5%A5%B3%E3%81%A8%E5%B9%BC%E3%81%AA%E3%81%98%E3%81%BF%E3%81%8C%E4%BF%AE%E7%BE%85%E5%A0%B4%E3%81%99%E3%81%8E%E3%82%8B'),
(71, '終わりのクロニクル', '『終わりのクロニクル』（おわりのクロニクル）は、川上稔による日本のライトノベル。イラストはさとやす。電撃文庫（メディアワークス）より2003年6月から2005年12月にかけて刊行された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%B5%82%E3%82%8F%E3%82%8A%E3%81%AE%E3%82%AF%E3%83%AD%E3%83%8B%E3%82%AF%E3%83%AB)より）', '', '4840223890', 'B00A0GIJ34', '4840224072', 'B006YA0NAM', '4840232407', 'http://www.voltagenation.com/ahead/', '「終わりのクロニクル」イメージサウンドトラックシリーズ', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E7%B5%82%E3%82%8F%E3%82%8A%E3%81%AE%E3%82%AF%E3%83%AD%E3%83%8B%E3%82%AF%E3%83%AB'),
(72, 'カードキャプターさくら', '『カードキャプターさくら』（CARDCAPTOR SAKURA）は、CLAMPによる日本の漫画作品、またはそれを原作にしたテレビアニメ、アニメ映画、ゲームなどのメディアミックス作品。「CCさくら（さらに略してCCS）」と略されることがある。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AB%E3%83%BC%E3%83%89%E3%82%AD%E3%83%A3%E3%83%97%E3%82%BF%E3%83%BC%E3%81%95%E3%81%8F%E3%82%89)より）', '', 'B004JSTW5S', 'B002DE65UK', 'B002KNRINC', '4063197433', 'B002UZDM0S', 'http://www9.nhk.or.jp/anime/sakura/', 'カードキャプターさくら', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%AB%E3%83%BC%E3%83%89%E3%82%AD%E3%83%A3%E3%83%97%E3%82%BF%E3%83%BC%E3%81%95%E3%81%8F%E3%82%89'),
(73, 'カードファイト!!ヴァンガード', '『カードファイト!! ヴァンガード』（CARDFIGHT!! Vanguard）は、ブシロードの同名のトレーディングカードゲームを原作としたテレビアニメ作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AB%E3%83%BC%E3%83%89%E3%83%95%E3%82%A1%E3%82%A4%E3%83%88!!_%E3%83%B4%E3%82%A1%E3%83%B3%E3%82%AC%E3%83%BC%E3%83%89_(%E3%82%A2%E3%83%8B%E3%83%A1))より）', '', 'B00HL9YXNS', 'B00GRNBRA6', 'B007OQH8TY', 'B00GU5G1E8', 'B008UO6IH2', 'http://cf-vanguard.com/', 'CARDFIGHTヴァンガード', 'http://www.cs.furyu.jp/vanguard-lov/', 'カードファイト!! ヴァンガード ロック オン ビクトリー', 'http://www.cs.furyu.jp/vanguard-lov/', 'カードファイト!! ヴァンガード ロック オン ビクトリー', 'http://ja.wikipedia.org/wiki/%E3%82%AB%E3%83%BC%E3%83%89%E3%83%95%E3%82%A1%E3%82%A4%E3%83%88!!_%E3%83%B4%E3%82%A1%E3%83%B3%E3%82%AC%E3%83%BC%E3%83%89_(%E3%82%A2%E3%83%8B%E3%83%A1)'),
(74, 'ガールズ＆パンツァー', '『ガールズ&パンツァー』（ガールズ アンド パンツァー[注 1]、GIRLS und PANZER）は、2012年10月から同年12月までと2013年3月に放送された[注 2]テレビアニメ。全12話+総集編2話。略称は「ガルパン」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AC%E3%83%BC%E3%83%AB%E3%82%BA%26%E3%83%91%E3%83%B3%E3%83%84%E3%82%A1%E3%83%BC)より）', '', 'B00H1RLO1E', 'B00GZK5S06', 'B00E9NXMKY', 'B00FFOJ7ZA', 'B00HHL365Q', 'http://girls-und-panzer.jp/', 'GIRLS und PANZER', 'http://s.mxtv.jp/girls_und_panzer/', 'ガールズ＆パンツァー', 'http://s.mxtv.jp/girls_und_panzer/', 'ガールズ＆パンツァー', 'http://ja.wikipedia.org/wiki/%E3%82%AC%E3%83%BC%E3%83%AB%E3%82%BA%26%E3%83%91%E3%83%B3%E3%83%84%E3%82%A1%E3%83%BC'),
(75, '会長はメイド様！', '『会長はメイド様!』（かいちょうはメイドさま!）は、藤原ヒロによる日本の少女漫画作品。白泉社『LaLa』にて連載中。2006年2月号に第1話が読み切りとして掲載され、同年6月号から2013年11月号まで連載された。2013年9月現在、単行本は17巻まで刊行。ドラマCD化もされている。テレビアニメ作品がTBSにて2010年4月1日から9月23日まで放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E4%BC%9A%E9%95%B7%E3%81%AF%E3%83%A1%E3%82%A4%E3%83%89%E6%A7%98!)より）', '', '4592191889', '4592191870', '4592191862', 'B00ECL54ZO', '4592191854', 'http://www.hakusensha.co.jp/maidsama/', '会長はメイド様！ [hakusensha.co.jp]', 'http://www.tbs.co.jp/anime/maidsama/', '会長はメイド様！ [tbs.co.jp]', 'http://www.tbs.co.jp/anime/maidsama/', '会長はメイド様！ [tbs.co.jp]', 'http://ja.wikipedia.org/wiki/%E4%BC%9A%E9%95%B7%E3%81%AF%E3%83%A1%E3%82%A4%E3%83%89%E6%A7%98!'),
(76, 'CHAOS;HEAD', '『CHAOS;HEAD』（カオスヘッド、他表記：Chaos;HEAD、Chaos;HEAd、Chäos;HEAdなど）は、2008年4月25日にWindows用に発売された5pb.企画、ニトロプラス発売のコンピュータゲーム。コンシューマでは2009年2月26日に5pb.よりXbox 360版『CHAOS;HEAD NOAH』（カオスヘッド ノア）が発売された。2010年6月24日にPlayStation Portable (PSP) 版が、同年11月18日にiPhone/iPod touch版及びiPad版が、2012年1月24日にはAndroid版が、同年11月22日にはPlayStation 3 (PS3) 版が発売。\r\n\r\nこれを原作にテレビアニメ化もされており、2008年10月から12月に放送。2009年3月4日からDVDが発売された。 （[wikipedia](http://ja.wikipedia.org/wiki/CHAOS;HEAD)より）', '', 'B0013NBGRY', 'B003EQ3M0M', 'B0094D34TS', 'B003RRWCWC', 'B00368BI4U', 'http://www.nitroplus.co.jp/pc/lineup/into_15/', 'CHAOS;HEAD [nitroplus.co.jp]', 'http://lovechuchu.net/', 'CHAOS;HEAD らぶChu☆Chu!', 'http://lovechuchu.net/', 'CHAOS;HEAD らぶChu☆Chu!', 'http://ja.wikipedia.org/wiki/CHAOS;HEAD'),
(77, 'ガッチャマン クラウズ', '『ガッチャマン クラウズ』（GATCHAMAN Crowds） は、日本のテレビアニメ。第1期は2013年7月から9月まで日本テレビで放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AC%E3%83%83%E3%83%81%E3%83%A3%E3%83%9E%E3%83%B3_%E3%82%AF%E3%83%A9%E3%82%A6%E3%82%BA)より）', '', '', '', '', '', '', 'http://www.ntv.co.jp/GATCHAMAN_Crowds/', 'ガッチャマン クラウズ', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%AC%E3%83%83%E3%83%81%E3%83%A3%E3%83%9E%E3%83%B3_%E3%82%AF%E3%83%A9%E3%82%A6%E3%82%BA'),
(78, '河童のクゥと夏休み', '『河童のクゥと夏休み』（かっぱのクゥとなつやすみ、英題：Summer Days with Coo）は、2007年の日本のアニメーション映画。文部科学省特別選定作品及び日本PTA全国協議会特別推薦作品に選ばれた。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%B2%B3%E7%AB%A5%E3%81%AE%E3%82%AF%E3%82%A5%E3%81%A8%E5%A4%8F%E4%BC%91%E3%81%BF)より）', '', 'B0014FIWAK', '4265820069', 'B003L8QOEO', 'B0014FIWAU', '4575238279', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E6%B2%B3%E7%AB%A5%E3%81%AE%E3%82%AF%E3%82%A5%E3%81%A8%E5%A4%8F%E4%BC%91%E3%81%BF'),
(79, 'かなめも', '『かなめも』は、石見翔子による日本の4コマ漫画作品。月刊誌『まんがタイムきららMAX』（芳文社）にて2007年6月号から2013年12月号にかけて連載された（2011年5月号から2012年3月号までは休載）。コミックス（単行本）は全6巻。\r\n\r\n同誌2009年3月号で、同誌連載作品および石見作品にとって初となるアニメ化が発表され、同年7月から9月にかけてテレビ東京系列にて放送された。\r\n\r\n姉妹誌の『まんがタイムきらら』や『まんがタイムきららキャラット』にゲスト掲載や短期集中連載もされている。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8B%E3%81%AA%E3%82%81%E3%82%82)より）', '', '4832243713', '4832242423', '4832277251', '4832279602', 'B002E1HM1I', 'http://www.starchild.co.jp/special/kanamemo/', 'かなめも [starchild.co.jp]', 'http://www.tv-tokyo.co.jp/anime/kanamemo/', 'かなめも [tv-tokyo.co.jp]', 'http://www.tv-tokyo.co.jp/anime/kanamemo/', 'かなめも [tv-tokyo.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%8B%E3%81%AA%E3%82%81%E3%82%82'),
(80, 'CANAAN', '『CANAAN』（カナン）は、2009年7月から9月まで放送されたテレビアニメ。アニメーション制作はピーエーワークス。発表当初のタイトルは『428 the animation』。 （[wikipedia](http://ja.wikipedia.org/wiki/CANAAN)より）', '', 'B003XJDT0I', 'B007PL0YR6', '4758011567', 'B002GMNAX4', 'B002TG2ZQK', 'http://www.mxtv.co.jp/canaan/', 'CANAAN', 'http://dir.yahoo.co.jp/Recreation/Games/Video_Games/Genres/Adventure/Shibuya/CANAAN', 'CANAAN', 'http://dir.yahoo.co.jp/Recreation/Games/Video_Games/Genres/Adventure/Shibuya/CANAAN', 'CANAAN', 'http://ja.wikipedia.org/wiki/CANAAN'),
(81, '神様ドォルズ', '『神様ドォルズ』（かみさまドォルズ、"KAMISAMA DOLLS"）は、やまむらはじめによる日本の漫画作品。『月刊サンデージェネックス』（小学館）にて、2007年1月号より2013年3月号まで連載された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%A5%9E%E6%A7%98%E3%83%89%E3%82%A9%E3%83%AB%E3%82%BA)より）', '', '4091573398', '4099418162', '4091573207', '4091570976', 'B00C550XWS', 'http://www.kamisama-anime.jp/', '神様ドォルズ オフィシャルアニメサイト', 'http://www.tv-tokyo.co.jp/anime/kamisama-dolls/', '神様ドォルズ', 'http://www.tv-tokyo.co.jp/anime/kamisama-dolls/', '神様ドォルズ', 'http://ja.wikipedia.org/wiki/%E7%A5%9E%E6%A7%98%E3%83%89%E3%82%A9%E3%83%AB%E3%82%BA'),
(82, '神さまのいない日曜日', '『神さまのいない日曜日』（かみさまのいないにちようび）は、入江君人による日本のライトノベル。イラストは茨乃が担当している。2010年1月から富士見ファンタジア文庫（富士見書房）より刊行されている。略称は「神ない」「神日」など。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%A5%9E%E3%81%95%E3%81%BE%E3%81%AE%E3%81%84%E3%81%AA%E3%81%84%E6%97%A5%E6%9B%9C%E6%97%A5)より）', '', 'B00DUK5OX0', '4829134771', 'B00DUK5OKI', '4829135212', 'B00DUK5OMG', 'http://s.mxtv.jp/kami_nai/', '神さまのいない日曜日 [s.mxtv.jp]', 'http://kami-nai.com/', '神さまのいない日曜日 [kami-nai.com]', 'http://kami-nai.com/', '神さまのいない日曜日 [kami-nai.com]', 'http://ja.wikipedia.org/wiki/%E7%A5%9E%E3%81%95%E3%81%BE%E3%81%AE%E3%81%84%E3%81%AA%E3%81%84%E6%97%A5%E6%9B%9C%E6%97%A5'),
(83, '神様のメモ帳', '『神様のメモ帳』（かみさまのメモちょう）は、杉井光のライトノベル。イラスト担当は岸田メル。電撃文庫より2007年1月から刊行されている。（[wikipedia](http://ja.wikipedia.org/wiki/%E7%A5%9E%E6%A7%98%E3%81%AE%E3%83%A1%E3%83%A2%E5%B8%B3)より）', '', '4840236917', 'B005G10ZPI', '4048708104', '4048685430', 'B005G10ZP8', 'http://www.kamimemo.com/', '神様のメモ帳 [kamimemo.com]', 'http://www.jcstaff.co.jp/sho-sai/kamimemo-shokai/kamimemo-index.htm', '神様のメモ帳 [jcstaff.co.jp]', 'http://www.jcstaff.co.jp/sho-sai/kamimemo-shokai/kamimemo-index.htm', '神様のメモ帳 [jcstaff.co.jp]', 'http://ja.wikipedia.org/wiki/%E7%A5%9E%E6%A7%98%E3%81%AE%E3%83%A1%E3%83%A2%E5%B8%B3'),
(84, '神様はじめました', '『神様はじめました』（かみさまはじめました）は、鈴木ジュリエッタによる日本の漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%A5%9E%E6%A7%98%E3%81%AF%E3%81%98%E3%82%81%E3%81%BE%E3%81%97%E3%81%9F)より）', '', '4592192974', '4592192966', '4592185064', '4592105052', '459219294X', 'http://www.mikagesha.com/', '神様はじめました [mikagesha.com]', 'http://www.hanayume.com/kamisama/', '神様はじめました [hanayume.com]', 'http://www.hanayume.com/kamisama/', '神様はじめました [hanayume.com]', 'http://ja.wikipedia.org/wiki/%E7%A5%9E%E6%A7%98%E3%81%AF%E3%81%98%E3%82%81%E3%81%BE%E3%81%97%E3%81%9F'),
(85, 'かみちゅ！', ' 『かみちゅ!』は、テレビ朝日系列で2005年6月29日 - 9月28日まで放送された日本のテレビアニメ作品、およびそれを原作とする漫画作品。タイトルの『かみちゅ!』とは「神様で中学生!」（かみさまでちゅうがくせい）の意味である[1]。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8B%E3%81%BF%E3%81%A1%E3%82%85!)より）', '', '4840233195', 'B000E9WZQE', '4840237875', 'B000ALVXB4', '4758011788', 'http://www.nhk.or.jp/anime/kamichu/', 'かみちゅ！ [nhk.or.jp]', 'http://www.sonymusic.co.jp/Animation/kamichu/', 'かみちゅ！ [sonymusic.co.jp]', 'http://www.sonymusic.co.jp/Animation/kamichu/', 'かみちゅ！ [sonymusic.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%8B%E3%81%BF%E3%81%A1%E3%82%85!'),
(86, '神のみぞ知るセカイ', '『神のみぞ知るセカイ』（かみのみぞしるセカイ、 World God Only Knows）は、若木民喜による日本のラブコメディ漫画作品。ならびにその派生作品。『週刊少年サンデー』（小学館、以下「サンデー」）2008年19号より連載中。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%A5%9E%E3%81%AE%E3%81%BF%E3%81%9E%E7%9F%A5%E3%82%8B%E3%82%BB%E3%82%AB%E3%82%A4)より）', '', '4091245110', '4091591728', 'B00F0KSU1G', '4091243819', 'B00DYTHM3W', 'http://websunday.net/rensai/kaminomi/', '神のみぞ知るセカイ', 'http://kaminomi-memo.com/', '神のみぞ知るセカイ -SOUL MEMORIES-', 'http://kaminomi-memo.com/', '神のみぞ知るセカイ -SOUL MEMORIES-', 'http://ja.wikipedia.org/wiki/%E7%A5%9E%E3%81%AE%E3%81%BF%E3%81%9E%E7%9F%A5%E3%82%8B%E3%82%BB%E3%82%AB%E3%82%A4'),
(87, '鴨川ホルモー', '『鴨川ホルモー』（かもがわホルモー、KAMOGAWA HORUMO）は、日本の小説家・万城目学の青春ファンタジー小説。産業編集センターより2006年4月20日発行。2009年2月には文庫版が角川書店により刊行（表紙は単行本とは別のイラスト。解説は金原瑞人）。この作品を原作とした漫画作品が月刊少年エースにて連載された。また、2009年ゴールデンウィークには松竹配給で実写映画（監督:本木克英 出演:山田孝之 栗山千明）が公開。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%B4%A8%E5%B7%9D%E3%83%9B%E3%83%AB%E3%83%A2%E3%83%BC)より）', '', '4043939019', 'B002D11UBM', '4916199820', 'B009GPMAGW', '4043939027', 'http://blog.oricon.co.jp/horumo/', '映画『鴨川ホルモー』オフィシャルブログ', 'http://info.movies.yahoo.co.jp/detail/tymv/id332566/', 'Yahoo!映画 - 鴨川ホルモー', 'http://info.movies.yahoo.co.jp/detail/tymv/id332566/', 'Yahoo!映画 - 鴨川ホルモー', 'http://ja.wikipedia.org/wiki/%E9%B4%A8%E5%B7%9D%E3%83%9B%E3%83%AB%E3%83%A2%E3%83%BC'),
(88, '空の境界', '『空の境界』（からのきょうかい）は、奈須きのこによる日本の長編伝奇小説、および同作を原作としたドラマCD、アニメ、漫画。サブタイトルは「the Garden of sinners」。イラストは武内崇。愛称は「らっきょ」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%A9%BA%E3%81%AE%E5%A2%83%E7%95%8C)より）', '', 'B00GWGBZWS', 'B00GWGFECK', '406275892X', 'B00C3DUY5S', 'B005PMUPAI', 'http://s.mxtv.jp/karanokyoukai/', '劇場版 空の境界 [s.mxtv.jp]', 'http://www.karanokyoukai.com/', '劇場版 空の境界 [karanokyoukai.com]', 'http://www.karanokyoukai.com/', '劇場版 空の境界 [karanokyoukai.com]', 'http://ja.wikipedia.org/wiki/%E7%A9%BA%E3%81%AE%E5%A2%83%E7%95%8C'),
(89, '借りぐらしのアリエッティ', '『借りぐらしのアリエッティ』（かりぐらしのアリエッティ、英：The Borrower Arrietty、北米：The Secret World of Arrietty）は、2010年の日本のアニメ映画である。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%80%9F%E3%82%8A%E3%81%90%E3%82%89%E3%81%97%E3%81%AE%E3%82%A2%E3%83%AA%E3%82%A8%E3%83%83%E3%83%86%E3%82%A3)より）', '', 'B00361FLDQ', 'B004S0VP70', 'B003IMS5EU', '4198630089', 'B009B7I032', 'http://karigurashi.jp/', '借りぐらしのアリエッティ', 'http://www.ntv.co.jp/karigurashi/', '借りぐらしのアリエッティ×種田陽平展', 'http://www.ntv.co.jp/karigurashi/', '借りぐらしのアリエッティ×種田陽平展', 'http://ja.wikipedia.org/wiki/%E5%80%9F%E3%82%8A%E3%81%90%E3%82%89%E3%81%97%E3%81%AE%E3%82%A2%E3%83%AA%E3%82%A8%E3%83%83%E3%83%86%E3%82%A3'),
(90, 'ガリレイドンナ', '『ガリレイドンナ』（Galileidonna）は、A-1 Pictures制作の日本のテレビアニメ作品。2013年10月10日から12月19日まで、フジテレビの深夜アニメ枠『ノイタミナ』で放送された。略称は「ガリドン」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AC%E3%83%AA%E3%83%AC%E3%82%A4%E3%83%89%E3%83%B3%E3%83%8A)より）', '', 'B00FQDIL84', 'B00EQFY0BU', 'B00FQEBUGI', 'B00G1ZSEPG', 'B00FQF5HNE', 'http://www.galileidonna.tv/', 'ガリレイドンナ', 'http://www.galileidonna.tv/', 'ガリレイドンナ', 'http://www.galileidonna.tv/', 'ガリレイドンナ', 'http://ja.wikipedia.org/wiki/%E3%82%AC%E3%83%AA%E3%83%AC%E3%82%A4%E3%83%89%E3%83%B3%E3%83%8A'),
(91, 'カレイドスター', '『カレイドスター』（KALEIDO STAR）は、日本のアニメ作品シリーズ。狭義ではテレビシリーズの第1話から第26話を指す（シリーズ概要については後述）。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AB%E3%83%AC%E3%82%A4%E3%83%89%E3%82%B9%E3%82%BF%E3%83%BC)より）', '', 'B00HFIDS72', 'B00HFIDS6S', 'B0083QJW8Y', 'B0000BHO11', 'B001CK7OII', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%AB%E3%83%AC%E3%82%A4%E3%83%89%E3%82%B9%E3%82%BF%E3%83%BC'),
(92, '彼氏彼女の事情', '『彼氏彼女の事情』（かれしかのじょのじじょう）は、津田雅美による日本の少女漫画、およびそれを原作としたテレビアニメなどの総称。『LaLa』（白泉社）において、1996年2月号から4月号までの短期連載（全3話）として掲載されたのち、1996年7月号から2005年4月号まで連載された。単行本は全21巻。2011年6月号には、作者が当時連載中である『ちょっと江戸まで』の舞台に本作主人公が登場する読み切り特別編「ちょっとカレカノ〜『彼氏彼女の事情』世が世ならバージョン〜」が掲載された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%BD%BC%E6%B0%8F%E5%BD%BC%E5%A5%B3%E3%81%AE%E4%BA%8B%E6%83%85)より）', '', 'B002DELC1C', 'B00423BDKC', 'B00B47YLQM', 'B00DMU9PRY', '4592120655', 'http://www.gainax.co.jp/anime/karekano/', '彼氏彼女の事情 [gainax.co.jp]', 'http://homepage1.nifty.com/5th/kk/', 'After School カレカノ', 'http://homepage1.nifty.com/5th/kk/', 'After School カレカノ', 'http://ja.wikipedia.org/wiki/%E5%BD%BC%E6%B0%8F%E5%BD%BC%E5%A5%B3%E3%81%AE%E4%BA%8B%E6%83%85'),
(93, 'ガンダムビルドファイターズ', '『ガンダムビルドファイターズ』（）は、2013年10月7日からテレビ東京にて放送されている日本のテレビアニメ。ガンダムシリーズの各作品に登場するモビルスーツ(MS)やモビルアーマー(MA)などのロボット兵器のプラモデル、通称「ガンプラ」を題材とした作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AC%E3%83%B3%E3%83%80%E3%83%A0%E3%83%93%E3%83%AB%E3%83%89%E3%83%95%E3%82%A1%E3%82%A4%E3%82%BF%E3%83%BC%E3%82%BA)より）', '', 'B00FIZSQPS', 'B00GT6XLYQ', 'B00HS9YU70', 'B00FIZSQQ2', 'B00GT6XVYQ', 'http://gundam-bf.net/', 'ガンダムビルドファイターズ [gundam-bf.net]', 'https://twitter.com/buildfighters', 'Twitter - buildfighters', 'https://twitter.com/buildfighters', 'Twitter - buildfighters', 'http://ja.wikipedia.org/wiki/%E3%82%AC%E3%83%B3%E3%83%80%E3%83%A0%E3%83%93%E3%83%AB%E3%83%89%E3%83%95%E3%82%A1%E3%82%A4%E3%82%BF%E3%83%BC%E3%82%BA'),
(94, 'かんなぎ', '『かんなぎ』は、武梨えりによる日本の漫画作品。副題は「Crazy Shrine Maidens」。\r\n\r\n『Comic REX』（一迅社刊）にて創刊号（2006年1月号）より連載開始。2009年1月号より、「作者の病気療養」という理由で長期にわたる連載休止の状態となっていたが、2010年9月に2011年に連載を再開する旨が発表され[1]、2011年7月27日発売の『Comic REX』9月号より連載を再開した[2]。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8B%E3%82%93%E3%81%AA%E3%81%8E)より）', '', '4758063834', '4758063036', 'B0071WQP04', '4758063826', '4758060150', 'http://www.nagisama-fc.com/', 'かんなぎ [nagisama-fc.com]', 'http://www.mxtv.co.jp/kannagi/', 'かんなぎ [mxtv.co.jp]', 'http://www.mxtv.co.jp/kannagi/', 'かんなぎ [mxtv.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%8B%E3%82%93%E3%81%AA%E3%81%8E_%28%E6%BC%AB%E7%94%BB%29'),
(95, '学園戦記ムリョウ', '『学園戦記ムリョウ』（がくえんせんきムリョウ、en:SHINGU）は、NHK-BS2の「衛星アニメ劇場」で放送されたテレビアニメ作品。およびこれを原作とした漫画作品、小説作品ならびにコンピュータゲーム作品である。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%AD%A6%E5%9C%92%E6%88%A6%E8%A8%98%E3%83%A0%E3%83%AA%E3%83%A7%E3%82%A6)より）', '', 'B0070DAT2Y', 'B00005MIC0', 'B0000UMRYC', 'B00005L8K0', 'B002DEL7I0', 'http://www.muryou.gr.jp/', '学園戦記ムリョウ', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E5%AD%A6%E5%9C%92%E6%88%A6%E8%A8%98%E3%83%A0%E3%83%AA%E3%83%A7%E3%82%A6'),
(96, 'がくえんゆーとぴあ まなびストレート！', ' 『がくえんゆーとぴあ まなびストレート!』は、アニメーション制作会社ufotableによる、2007年に放送されたテレビアニメおよび漫画作品。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8C%E3%81%8F%E3%81%88%E3%82%93%E3%82%86%E3%83%BC%E3%81%A8%E3%81%B4%E3%81%82_%E3%81%BE%E3%81%AA%E3%81%B3%E3%82%B9%E3%83%88%E3%83%AC%E3%83%BC%E3%83%88!)より）', '', 'B007RQJND0', 'B000MTFE96', 'B000N4SG3G', 'B000O1OBIC', '4840242275', 'http://www.starchild.co.jp/special/manabi/', 'がくえんゆーとぴあ まなびストレート！ [starchild.co.jp]', 'http://www.tv-tokyo.co.jp/anime/manabi/', 'がくえんゆーとぴあ まなびストレート！ [tv-tokyo.co.jp]', 'http://www.tv-tokyo.co.jp/anime/manabi/', 'がくえんゆーとぴあ まなびストレート！ [tv-tokyo.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%8C%E3%81%8F%E3%81%88%E3%82%93%E3%82%86%E3%83%BC%E3%81%A8%E3%81%B4%E3%81%82_%E3%81%BE%E3%81%AA%E3%81%B3%E3%82%B9%E3%83%88%E3%83%AC%E3%83%BC%E3%83%88!'),
(97, '崖の上のポニョ', '『崖の上のポニョ』（がけのうえのポニョ）は、スタジオジブリ制作、宮崎駿監督の長編アニメーション映画。宮崎の長編監督作品としては2004年の『ハウルの動く城』以来4年ぶり、原作・脚本・監督のすべてを担当するのは2001年公開の『千と千尋の神隠し』以来7年ぶりの作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%B4%96%E3%81%AE%E4%B8%8A%E3%81%AE%E3%83%9D%E3%83%8B%E3%83%A7)より）', '', 'B0021D5ETQ', 'B005GIRMQQ', '4198625735', 'B009NPAVQG', 'B0032UXQWY', 'http://www.ghibli.jp/ponyo/', '崖の上のポニョ', 'http://www.yomiuri.co.jp/entertainment/ghibli/cnt_ponyo.htm', 'YOMIURI ONLINE - 「崖の上のポニョ」を探せ！', 'http://www.yomiuri.co.jp/entertainment/ghibli/cnt_ponyo.htm', 'YOMIURI ONLINE - 「崖の上のポニョ」を探せ！', 'http://ja.wikipedia.org/wiki/%E5%B4%96%E3%81%AE%E4%B8%8A%E3%81%AE%E3%83%9D%E3%83%8B%E3%83%A7'),
(98, '学校を出よう!', '『学校を出よう!』（がっこうをでよう!）は、谷川流による日本のライトノベル。イラストは蒼魚真青。電撃文庫（アスキー・メディアワークス）より、2003年6月から刊行されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%AD%A6%E6%A0%A1%E3%82%92%E5%87%BA%E3%82%88%E3%81%86!)より）', '', '4840223556', '4840228280', '4840226326', '4840227810', '4840224331', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E5%AD%A6%E6%A0%A1%E3%82%92%E5%87%BA%E3%82%88%E3%81%86!'),
(99, 'GUNSLINGER GIRL', '『GUNSLINGER GIRL』（ガンスリンガー・ガール）は、アスキー・メディアワークスの雑誌『月刊コミック電撃大王』に連載された、相田裕の漫画。または、これを原作とするテレビアニメ・ドラマCD・コンピュータゲーム作品。 （[wikipedia](http://ja.wikipedia.org/wiki/GUNSLINGER_GIRL)より）', '', '4840222371', 'B0030ZOYJU', 'B00AK4UKZQ', 'B002KYIAJM', '404891278X', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Gunslinger_Girl/GUNSLINGER_GIRL_Anime/', 'GUNSLINGER GIRL アニメ版', 'http://tunes.sakura.ne.jp/gsg/', 'GUNSLINGER GIRL WIKI', 'http://tunes.sakura.ne.jp/gsg/', 'GUNSLINGER GIRL WIKI', 'http://ja.wikipedia.org/wiki/GUNSLINGER_GIRL'),
(100, 'ガンパレードマーチ', '『高機動幻想ガンパレード・マーチ』（こうきどうげんそうガンパレード・マーチ）は、ソニー・コンピュータエンタテインメントから発売されたコンピュータゲームである。企画・開発アルファ・システム。ジャンルは基本的にはシミュレーションに属す。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%AB%98%E6%A9%9F%E5%8B%95%E5%B9%BB%E6%83%B3%E3%82%AC%E3%83%B3%E3%83%91%E3%83%AC%E3%83%BC%E3%83%89%E3%83%BB%E3%83%9E%E3%83%BC%E3%83%81)より）', '', '4048919687', 'B00005OVNG', '4048918230', '4048916491', 'B0052WHVG2', 'http://www.alfasystem.net/game/gp/', 'ガンパレードマーチ', 'http://gunparade.wiki.fc2.com/', 'GPM攻略 ガンパレードマーチ介入wiki', 'http://gunparade.wiki.fc2.com/', 'GPM攻略 ガンパレードマーチ介入wiki', 'http://ja.wikipedia.org/wiki/%E9%AB%98%E6%A9%9F%E5%8B%95%E5%B9%BB%E6%83%B3%E3%82%AC%E3%83%B3%E3%83%91%E3%83%AC%E3%83%BC%E3%83%89%E3%83%BB%E3%83%9E%E3%83%BC%E3%83%81'),
(101, 'Kiss×sis', '『kiss×sis』（キスシス）は、ぢたま(某)による日本の漫画作品。『月刊ヤングマガジン』（講談社）にて連載中。単行本は第12巻まで刊行中だが、第1巻が発売されたのは初掲載から3年以上が経過した2007年9月になってのことである。 （[wikipedia](http://ja.wikipedia.org/wiki/Kiss%C3%97sis)より）', '', '4063769267', '4063584399', '4063767884', 'B00HUI0FLO', 'B00B47B7E6', 'http://kc.kodansha.co.jp/kiss_sis/', 'kiss×sis [kodansha.co.jp]', 'http://www.starchild.co.jp/special/kiss_sis/', 'kiss×sis [starchild.co.jp]', 'http://www.starchild.co.jp/special/kiss_sis/', 'kiss×sis [starchild.co.jp]', 'http://ja.wikipedia.org/wiki/Kiss%C3%97sis'),
(102, '帰宅部活動記録', '『帰宅部活動記録』（きたくぶかつどうきろく）は、くろはによる日本の漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%B8%B0%E5%AE%85%E9%83%A8%E6%B4%BB%E5%8B%95%E8%A8%98%E9%8C%B2)より）', '', '4757535988', 'B00DR2WZGK', '4757541724', '4757537840', 'B00DR3UDHW', 'http://www.ntv.co.jp/kitakubu/', '帰宅部活動記録', 'http://www.ntv.co.jp/kitakubu/', '帰宅部活動記録', 'http://www.ntv.co.jp/kitakubu/', '帰宅部活動記録', 'http://ja.wikipedia.org/wiki/%E5%B8%B0%E5%AE%85%E9%83%A8%E6%B4%BB%E5%8B%95%E8%A8%98%E9%8C%B2'),
(103, '北へ。', '『北へ。』（きたへ）は、北海道を舞台としたトラベルコミュニケーションゲームシリーズ。開発はレッド・エンタテインメント、販売はハドソン。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%8C%97%E3%81%B8%E3%80%82)より）', '', 'B0000C0SSX', 'B000069U56', 'B00HV9URII', 'B00005F3L2', 'B0002YC57A', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E5%8C%97%E3%81%B8%E3%80%82'),
(104, 'Gift ～eternal rainbow～', '『Gift 〜ギフト〜』（ギフト）は、MOONSTONEが2005年5月27日に発売した、18禁恋愛アドベンチャーゲームである。MOONSTONEの制作したものとしては4作目にあたる。 （[wikipedia](http://ja.wikipedia.org/wiki/Gift_%E3%80%9C%E3%82%AE%E3%83%95%E3%83%88%E3%80%9C#.E3.82.A2.E3.83.8B.E3.83.A1.E7.89.88.E3.80.8EGift_.E3.80.9C.E3.82.AE.E3.83.95.E3.83.88.E3.80.9C_eternal_rainbow.E3.80.8F)より）', '', '', '', '', '', '', 'http://www.imagicatv.jp/content/gift-er/', 'Gift ～eternal rainbow～', 'http://www.imagicatv.jp/content/gift-er/', 'Gift ～eternal rainbow～', 'http://www.imagicatv.jp/content/gift-er/', 'Gift ～eternal rainbow～', 'http://ja.wikipedia.org/wiki/Gift_%E3%80%9C%E3%82%AE%E3%83%95%E3%83%88%E3%80%9C#.E3.82.A2.E3.83.8B.E3.83.A1.E7.89.88.E3.80.8EGift_.E3.80.9C.E3.82.AE.E3.83.95.E3.83.88.E3.80.9C_eternal_rainbow.E3.80.8F'),
(105, 'キミキス', '『キミキス』（Kimikiss）は、2006年にエンターブレインから発売された、PlayStation 2用恋愛シミュレーションゲームソフト。インターネットラジオ番組を皮切りに、ドラマCD化や漫画化、小説化、テレビアニメ化といったメディアミックス展開も積極的に行われた。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%9F%E3%82%AD%E3%82%B9)より）', '', 'B000Z1TOYM', 'B000BNCJL4', '4757728522', 'B000FP2T18', 'B00436G3BC', 'http://www.enterbrain.co.jp/game_site/kimikiss/', 'キミキス', 'http://www.kimikiss-pure-rouge.jp/', 'キミキス pure rouge', 'http://www.kimikiss-pure-rouge.jp/', 'キミキス pure rouge', 'http://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%9F%E3%82%AD%E3%82%B9'),
(106, '君が主で執事が俺で', '『君が主で執事が俺で』（きみがあるじでしつじがおれで）は、みなとそふとより2007年5月25日に発売されたWindows用の18禁恋愛アドベンチャーゲーム。みなとそふとのデビュー作である。通称「きみある」（スタッフ公認）。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%90%9B%E3%81%8C%E4%B8%BB%E3%81%A7%E5%9F%B7%E4%BA%8B%E3%81%8C%E4%BF%BA%E3%81%A7)より）', '', 'B000ZMXHRQ', 'B000NOP9RW', 'B008JA2AXS', 'B00116FVEM', 'B008JA2AE2', 'http://kimiaru.jp/', '君が主で執事が俺で [kimiaru.jp]', 'http://www.mxtv.co.jp/kimiaru/', '君が主で執事が俺で [mxtv.co.jp]', 'http://www.mxtv.co.jp/kimiaru/', '君が主で執事が俺で [mxtv.co.jp]', 'http://ja.wikipedia.org/wiki/%E5%90%9B%E3%81%8C%E4%B8%BB%E3%81%A7%E5%9F%B7%E4%BA%8B%E3%81%8C%E4%BF%BA%E3%81%A7'),
(107, '君が望む永遠', '『君が望む永遠』（きみがのぞむえいえん）は、2001年8月3日に âge（アージュ）より発売された恋愛アドベンチャーゲーム。また、これを原作とするテレビアニメ、OVAなどの関連作品。略称は君望（きみのぞ）、または君のぞ。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%90%9B%E3%81%8C%E6%9C%9B%E3%82%80%E6%B0%B8%E9%81%A0)より）', '', 'B00006WLI6', 'B005DWOD4Y', 'B0010Y92N6', 'B00008HYFF', 'B001ASA7S6', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E5%90%9B%E3%81%8C%E6%9C%9B%E3%82%80%E6%B0%B8%E9%81%A0'),
(108, '君と僕。', '『君と僕。』（きみとぼく）は、堀田きいちの青春ギャグ漫画作品。2003年に雑誌『月刊少年ガンガン』（スクウェア・エニックス）での掲載を開始、2004年から『ガンガンパワード』で連載、2009年からは『月刊Gファンタジー』に移籍して連載。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%90%9B%E3%81%A8%E5%83%95%E3%80%82)より）', '', '4757540272', '4757540183', '4757533837', '4757513909', '4757538049', 'http://www.tv-tokyo.co.jp/anime/kimiboku/', '君と僕。', 'http://www.kimiboku.tv/', '「君と僕。」オフィシャルサイト', 'http://www.kimiboku.tv/', '「君と僕。」オフィシャルサイト', 'http://ja.wikipedia.org/wiki/%E5%90%9B%E3%81%A8%E5%83%95%E3%80%82'),
(109, '君に届け', '『君に届け』（きみにとどけ）は、椎名軽穂による日本の少女漫画、および、これを原作としたテレビアニメ、実写映画。略称は「君届（きみとど）」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%90%9B%E3%81%AB%E5%B1%8A%E3%81%91)より）', '', '4088451147', '4088450590', '4088460618', '4088468813', 'B004I6EB84', 'http://www.banpresto-game.com/kimitodo/omoi/', '君に届け ～育てる想い～', 'http://www.banpresto-game.com/kimitodo/kimochi/', '君に届け ～伝えるキモチ～', 'http://www.banpresto-game.com/kimitodo/kimochi/', '君に届け ～伝えるキモチ～', 'http://ja.wikipedia.org/wiki/%E5%90%9B%E3%81%AB%E5%B1%8A%E3%81%91'),
(110, '逆境無頼カイジ', '『賭博黙示録カイジ』（とばくもくしろくカイジ）は、福本伸行による日本の漫画。『週刊ヤングマガジン』（講談社）で1996年から連載された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E8%B3%AD%E5%8D%9A%E9%BB%99%E7%A4%BA%E9%8C%B2%E3%82%AB%E3%82%A4%E3%82%B8#.E3.83.86.E3.83.AC.E3.83.93.E3.82.A2.E3.83.8B.E3.83.A1)より）', '', 'B005DCNPMU', 'B000ZJZ5YC', 'B0051RHQZO', '4862551076', 'B001C0J7Z6', 'http://www.ntv.co.jp/kaiji_hakairoku/', '逆境無頼カイジ 破戒録篇', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E8%B3%AD%E5%8D%9A%E9%BB%99%E7%A4%BA%E9%8C%B2%E3%82%AB%E3%82%A4%E3%82%B8#.E3.83.86.E3.83.AC.E3.83.93.E3.82.A2.E3.83.8B.E3.83.A1'),
(111, '究極超人あ～る', '『究極超人あ〜る』（きゅうきょくちょうじんあーる）は、ゆうきまさみによる日本の漫画作品、およびそれを原作としたOVA作品。第19回星雲賞マンガ部門受賞。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%A9%B6%E6%A5%B5%E8%B6%85%E4%BA%BA%E3%81%82%E3%80%9C%E3%82%8B)より）', '', '4091939082', 'B003WTHP3Q', 'B002CZPGGE', '4091931510', 'B00ANHM2KG', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E7%A9%B6%E6%A5%B5%E8%B6%85%E4%BA%BA%E3%81%82%E3%80%9C%E3%82%8B'),
(112, 'キューティクル探偵因幡', '『キューティクル探偵因幡』（キューティクルたんていいなば）は、もちによる日本の漫画作品。『月刊Gファンタジー』（スクウェア・エニックス）にて2007年9月号より連載中。2013年9月現在、単行本は12巻まで刊行中。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%82%AF%E3%83%AB%E6%8E%A2%E5%81%B5%E5%9B%A0%E5%B9%A1)より）', '', '4757540752', '4757522495', '4757539290', '4757538731', '4757525281', 'http://www.cdinaba.com/', 'キューティクル探偵因幡', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%A5%E3%83%BC%E3%83%86%E3%82%A3%E3%82%AF%E3%83%AB%E6%8E%A2%E5%81%B5%E5%9B%A0%E5%B9%A1'),
(113, '境界の彼方', '『境界の彼方』（きょうかいのかなた、Kyoukai no Kanata）は、鳥居なごむによる日本のライトノベル。イラストは鴨居知世が手掛けている。 KAエスマ文庫より刊行された。「異界士」と呼ばれる特殊な能力を有する存在が、「妖夢」と呼ばれる人間に害を及ぼす存在と戦うダークファンタジー作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%A2%83%E7%95%8C%E3%81%AE%E5%BD%BC%E6%96%B9)より）', '', 'B00FGKFJWI', 'B00FSMQ0BS', 'B00FGKFM34', '4990581245', 'B00FGKFJZ0', 'http://anime-kyokai.com/', '境界の彼方 [anime-kyokai.com]', 'http://www.kyotoanimation.co.jp/books/kyokai/', '境界の彼方 [kyotoanimation.co.jp]', 'http://www.kyotoanimation.co.jp/books/kyokai/', '境界の彼方 [kyotoanimation.co.jp]', 'http://ja.wikipedia.org/wiki/%E5%A2%83%E7%95%8C%E3%81%AE%E5%BD%BC%E6%96%B9'),
(114, '京騒戯画', '『京騒戯画』（きょうそうぎが）は、バンプレストと東映アニメーションによる日本のWebアニメおよびテレビアニメ作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E4%BA%AC%E9%A8%92%E6%88%AF%E7%94%BB)より）', '', 'B00F8UOB8Y', 'B00GMOISDO', 'B00F8UOAVM', 'B00F8UOB8O', 'B00F4VB1H6', 'http://www.kyousougiga-tv.com/', '京騒戯画', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E4%BA%AC%E9%A8%92%E6%88%AF%E7%94%BB'),
(115, 'ギルティクラウン', '『ギルティクラウン』 (GUILTY CROWN) は、フジテレビ系列「ノイタミナ」枠で2011年10月13日から2012年3月22日まで放送された日本のテレビアニメ。製作委員会方式によるオリジナルアニメ作品であり、それを原作とした漫画、ゲームへのメディアミックスを展開をしている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AE%E3%83%AB%E3%83%86%E3%82%A3%E3%82%AF%E3%83%A9%E3%82%A6%E3%83%B3)より）', '', '4757541708', 'B0089CPZOM', 'B005WO7WE6', 'B005XD7ULG', '4757541309', 'http://www.guilty-crown.jp/', 'ギルティクラウン', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%AE%E3%83%AB%E3%83%86%E3%82%A3%E3%82%AF%E3%83%A9%E3%82%A6%E3%83%B3'),
(116, 'キルミーベイベー', '『キルミーベイベー』は、カヅホによる日本の4コマ漫画作品。併記されている英語タイトルは「Baby, please kill me.」。芳文社の月刊雑誌『まんがタイムきららキャラット』2008年1月号で初めてフレッシュゲストとして掲載された後、同年7月号から同誌にて連載されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%AB%E3%83%9F%E3%83%BC%E3%83%99%E3%82%A4%E3%83%99%E3%83%BC)より）', '', 'B00FEYIVVC', '4832277731', 'B00E9Q9YTE', '4832242776', 'B00BKBCDB2', 'http://www.tbs.co.jp/anime/kmb/', 'キルミーベイベー [tbs.co.jp]', 'http://killmebaby.tv/', 'キルミーベイベー [killmebaby.tv]', 'http://killmebaby.tv/', 'キルミーベイベー [killmebaby.tv]', 'http://ja.wikipedia.org/wiki/%E3%82%AD%E3%83%AB%E3%83%9F%E3%83%BC%E3%83%99%E3%82%A4%E3%83%99%E3%83%BC'),
(117, '金色のコルダ', ' 『金色のコルダ』（きんいろのコルダ）は、コーエーから発売された女性向け恋愛シミュレーションゲーム。女性向けゲームの開発チーム、ルビー・パーティーによるネオロマンスシリーズ第3作目。（[wikipedia](http://ja.wikipedia.org/wiki/%E9%87%91%E8%89%B2%E3%81%AE%E3%82%B3%E3%83%AB%E3%83%80)より）', '', 'B00FRCTTBM', 'B00FRCTTD0', 'B00DIZHUBQ', 'B00FRYOYBK', 'B008EQEBZM', 'http://www.gamecity.ne.jp/psp/corda/', '金色のコルダ', 'http://www.gamecity.ne.jp/corda/', '「金色のコルダ」10周年記念サイト', 'http://www.gamecity.ne.jp/corda/', '「金色のコルダ」10周年記念サイト', 'http://ja.wikipedia.org/wiki/%E9%87%91%E8%89%B2%E3%81%AE%E3%82%B3%E3%83%AB%E3%83%80'),
(118, 'きんいろモザイク', '『きんいろモザイク』 (kin-iro mosaic) は、原悠衣による日本の4コマ漫画作品。芳文社『まんがタイムきららMAX』で2010年2 - 3月号掲載の後、2010年6月号より連載中。イギリスでホームステイを通じて友人となった日英の少女たちが成長後、日本で再会して繰り広げる物語をコメディタッチで描く。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8D%E3%82%93%E3%81%84%E3%82%8D%E3%83%A2%E3%82%B6%E3%82%A4%E3%82%AF)より）', '', 'B00DI3ZXYY', '4832243500', 'B00DI3ZXZ8', 'B00DI3ZXUS', '4832243918', 'http://s.mxtv.jp/kinmosa/', 'きんいろモザイク [s.mxtv.jp]', 'http://www.kinmosa.com/', 'きんいろモザイク [kinmosa.com]', 'http://www.kinmosa.com/', 'きんいろモザイク [kinmosa.com]', 'http://ja.wikipedia.org/wiki/%E3%81%8D%E3%82%93%E3%81%84%E3%82%8D%E3%83%A2%E3%82%B6%E3%82%A4%E3%82%AF'),
(119, '銀河へキックオフ!!', '『銀河へキックオフ!!』（ぎんがへキックオフ!!）は、日本のテレビアニメ作品。2012年4月から2013年2月まで、NHK BSプレミアムおよびNHK総合にて放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%8A%80%E6%B2%B3%E3%81%B8%E3%82%AD%E3%83%83%E3%82%AF%E3%82%AA%E3%83%95!!)より）', '', '4083211229', '4083211393', 'B00A70N9PQ', '4056069883', 'B00B402IBO', 'http://www.nhk.or.jp/anime/ginga/', '銀河へキックオフ!!', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E9%8A%80%E6%B2%B3%E3%81%B8%E3%82%AD%E3%83%83%E3%82%AF%E3%82%AA%E3%83%95!!');
INSERT INTO `work` (`workid`, `name`, `workdesc`, `img`, `productid1`, `productid2`, `productid3`, `productid4`, `productid5`, `url1`, `urlname1`, `url2`, `urlname2`, `url3`, `urlname3`, `wikipedia`) VALUES
(120, 'ぎんぎつね', '『ぎんぎつね』は、落合さよりによる日本の漫画作品。集英社の漫画雑誌『ウルトラジャンプ』にて連載中。2013年10月現在、単行本は10巻まで刊行されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8E%E3%82%93%E3%81%8E%E3%81%A4%E3%81%AD)より）', '', '4088796705', 'B00FJOUCXC', '4088796535', 'B00AMCJ39U', 'B00F4S3F2I', 'http://gingitsune.net/', 'ぎんぎつね [gingitsune.net]', 'http://www.tv-tokyo.co.jp/anime/gingitsune/', 'ぎんぎつね [tv-tokyo.co.jp]', 'http://www.tv-tokyo.co.jp/anime/gingitsune/', 'ぎんぎつね [tv-tokyo.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%8E%E3%82%93%E3%81%8E%E3%81%A4%E3%81%AD'),
(121, 'くじびきアンバランス', '『くじびきアンバランス』（KUJIBIKI UNBALANCE）は、漫画『げんしけん』の作中で劇中劇として登場する架空の漫画・アニメ。およびそれを元にして実際に製作された漫画・アニメ。略称は「くじアン」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%8F%E3%81%98%E3%81%B3%E3%81%8D%E3%82%A2%E3%83%B3%E3%83%90%E3%83%A9%E3%83%B3%E3%82%B9)より）', '', 'B000IZJ17U', '406314450X', 'B000IZJ18E', 'B0009X98BK', 'B0002IJMOU', 'http://www.mediafactory.co.jp/anime/kujian/', 'くじびきアンバランス', 'http://www.maql.co.jp/special/game/ps2/kujian/', 'くじびきアンバランス 会長お願いしま～っしゅファイト', 'http://www.maql.co.jp/special/game/ps2/kujian/', 'くじびきアンバランス 会長お願いしま～っしゅファイト', 'http://ja.wikipedia.org/wiki/%E3%81%8F%E3%81%98%E3%81%B3%E3%81%8D%E3%82%A2%E3%83%B3%E3%83%90%E3%83%A9%E3%83%B3%E3%82%B9'),
(122, 'GJ部', '『GJ部』（グッジョぶ）は、新木伸による日本のライトノベル。イラストはあるやが担当。ガガガ文庫（小学館）より、2010年3月から2012年3月にかけて本編全9巻が刊行され、その後特別編1巻が2013年3月に刊行された。 （[wikipedia](http://ja.wikipedia.org/wiki/GJ%E9%83%A8)より）', '', 'B00APRTPH2', '4094514619', 'B00APU43LW', '409451192X', 'B00APTZ6Q4', 'http://www.ntv.co.jp/gj/', 'GJ部', '', '', '', '', 'http://ja.wikipedia.org/wiki/GJ%E9%83%A8'),
(123, '雲のむこう、約束の場所', '『雲のむこう、約束の場所』（くものむこう やくそくのばしょ）は、新海誠が2004年に制作したアニメーション映画、およびそれを原作としてメディアミックス的展開がなされた小説などの作品群のことをいう。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%9B%B2%E3%81%AE%E3%82%80%E3%81%93%E3%81%86%E3%80%81%E7%B4%84%E6%9D%9F%E3%81%AE%E5%A0%B4%E6%89%80)より）', '', 'B0013LRIWS', 'B000793FBK', '4757725884', 'B0025PMHI6', 'B00074C5BG', 'http://www.kumonomukou.com/', '雲のむこう、約束の場所', 'http://www2.odn.ne.jp/~ccs50140/', 'Other voices -遠い声- [odn.ne.jp]', 'http://www2.odn.ne.jp/~ccs50140/', 'Other voices -遠い声- [odn.ne.jp]', 'http://ja.wikipedia.org/wiki/%E9%9B%B2%E3%81%AE%E3%82%80%E3%81%93%E3%81%86%E3%80%81%E7%B4%84%E6%9D%9F%E3%81%AE%E5%A0%B4%E6%89%80'),
(124, '海月姫', '『海月姫』（くらげひめ）は、東村アキコによる日本の漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%B5%B7%E6%9C%88%E5%A7%AB)より）', '', '406340921X', '4063409120', '4063407446', '4063409031', '4063408876', 'http://kuragehime.net/', 'TVアニメ海月姫公式サイト', 'http://kc.kodansha.co.jp/content/top.php/1000004534/', '海月姫', 'http://kc.kodansha.co.jp/content/top.php/1000004534/', '海月姫', 'http://ja.wikipedia.org/wiki/%E6%B5%B7%E6%9C%88%E5%A7%AB'),
(125, 'CLANNAD', '『CLANNAD』（クラナド）は、ゲームブランド・Keyが制作した3作目の恋愛アドベンチャーゲーム。 （[wikipedia](http://ja.wikipedia.org/wiki/CLANNAD_%28%E3%82%B2%E3%83%BC%E3%83%A0%29)より）', '', 'B007V2LN92', 'B004LKSB3I', 'B005HWAOOI', 'B00078WHCY', 'B00329NVYS', 'http://www.gungho.jp/cgame/game/clannad/', 'CLANNAD [gungho.jp]', 'http://www.prot.co.jp/psp/clannad/', 'CLANNAD [PSP]', 'http://www.prot.co.jp/psp/clannad/', 'CLANNAD [PSP]', 'http://ja.wikipedia.org/wiki/CLANNAD_%28%E3%82%B2%E3%83%BC%E3%83%A0%29'),
(126, '黒子のバスケ', '『黒子のバスケ』（くろこのバスケ、THE BASKETBALL WHICH KUROKO PLAYS）は、藤巻忠俊による日本の漫画作品。および、これを原作とするテレビアニメをはじめとした一連のメディアミックス作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%BB%92%E5%AD%90%E3%81%AE%E3%83%90%E3%82%B9%E3%82%B1)より）', '', '4088708512', 'B00FJQOH8G', '4089081998', 'B00HFXZ90G', 'B00FJQOH6S', 'http://www.mbs.jp/kurobas/', '黒子のバスケ [mbs.jp]', 'http://kurobas.com/', '黒子のバスケ [kurobas.com]', 'http://kurobas.com/', '黒子のバスケ [kurobas.com]', 'http://ja.wikipedia.org/wiki/%E9%BB%92%E5%AD%90%E3%81%AE%E3%83%90%E3%82%B9%E3%82%B1'),
(127, 'CROSS†CHANNEL', '『CROSS†CHANNEL』（クロスチャンネル）は、2003年9月26日に発売されたFlyingShine制作のアダルトゲーム。 （[wikipedia](http://ja.wikipedia.org/wiki/CROSS%E2%80%A0CHANNEL)より）', '', 'B002WRGK4E', 'B009LUZVZY', 'B004HZZ7ZC', 'B000A8SYNC', 'B0050MLPT8', 'http://www.cyberfront.co.jp/title/crosschannel/', 'CROSS†CHANNEL ～To all people～', 'http://www.cyberfront.co.jp/title/crosschannel_x360/', 'CROSS†CHANNEL～In memory of all people～', 'http://www.cyberfront.co.jp/title/crosschannel_x360/', 'CROSS†CHANNEL～In memory of all people～', 'http://ja.wikipedia.org/wiki/CROSS%E2%80%A0CHANNEL'),
(128, '黒魔女さんが通る!!', '『黒魔女さんが通る!!』（くろまじょさんがとおる）は石崎洋司による青い鳥文庫の作品。挿絵は藤田香。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%BB%92%E9%AD%94%E5%A5%B3%E3%81%95%E3%82%93%E3%81%8C%E9%80%9A%E3%82%8B!!)より）', '', '4062853426', '4062853205', '4062851822', '4062852683', '4062851326', 'http://www.shin-ei-animation.jp/kuromajyo/', '黒魔女さんが通る!!', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E9%BB%92%E9%AD%94%E5%A5%B3%E3%81%95%E3%82%93%E3%81%8C%E9%80%9A%E3%82%8B!!'),
(129, 'けいおん！', '『けいおん!』（K-ON!）は、かきふらいによる日本の4コマ漫画作品、およびそれを原作としてメディアミックスで製作される作品群。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%91%E3%81%84%E3%81%8A%E3%82%93!)より）', '', 'B00GYSJ49U', 'B00EC84MSC', 'B00BFDXYKY', '4832241966', 'B00CSVD1VY', 'http://www.tbs.co.jp/anime/k-on/', '劇場版 けいおん！', 'http://www.tbs.co.jp/anime/k-on/k-on_tv/', 'けいおん!!', 'http://www.tbs.co.jp/anime/k-on/k-on_tv/', 'けいおん!!', 'http://ja.wikipedia.org/wiki/%E3%81%91%E3%81%84%E3%81%8A%E3%82%93!'),
(130, 'ケロロ軍曹', '『ケロロ軍曹』（ケロロぐんそう、英語表記:Sergeant Frog）は、吉崎観音による日本の漫画作品、およびこれを原作とする一連の作品群の総称。またこれらに登場する主人公の名前。略称は「ケロロ」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%B1%E3%83%AD%E3%83%AD%E8%BB%8D%E6%9B%B9)より）', '', '4041205557', '4041201705', '4047133078', '4047157473', 'B004BR2NBC', 'http://www.keroro.com/', 'ケロロ秘密基地', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Sergeant_Keroro/Sergeant_Keroro_Anime/', 'ケロロ軍曹 アニメ版', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Sergeant_Keroro/Sergeant_Keroro_Anime/', 'ケロロ軍曹 アニメ版', 'http://ja.wikipedia.org/wiki/%E3%82%B1%E3%83%AD%E3%83%AD%E8%BB%8D%E6%9B%B9'),
(131, '月面兎兵器ミーナ', '『月面兎兵器ミーナ』（げつめんとへいき ミーナ）は、テレビドラマ『電車男』のオープニング、ならびに劇中に登場する架空のテレビアニメ。アニメ制作はGONZO。キャラクターデザインはokamaが担当。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%9C%88%E9%9D%A2%E5%85%8E%E5%85%B5%E5%99%A8%E3%83%9F%E3%83%BC%E3%83%8A)より）', '', 'B000MRA92U', 'B000MX7USK', 'B000P4L758', 'B0017TDODS', 'B000MX7USA', 'http://www.ideaf.co.jp/mina/main.html', '月面兎兵器ミーナ ふたつのPROJECT M', 'http://www.mi-na.jp/', '月面兎兵器ミーナ', 'http://www.mi-na.jp/', '月面兎兵器ミーナ', 'http://ja.wikipedia.org/wiki/%E6%9C%88%E9%9D%A2%E5%85%8E%E5%85%B5%E5%99%A8%E3%83%9F%E3%83%BC%E3%83%8A'),
(132, '幻影ヲ駆ケル太陽', '『幻影ヲ駆ケル太陽』（げんえいヲかケルたいよう、il sole penetra le illusioni）は、2013年7月から9月まで放送された日本のテレビアニメ作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%B9%BB%E5%BD%B1%E3%83%B2%E9%A7%86%E3%82%B1%E3%83%AB%E5%A4%AA%E9%99%BD)より）', '', 'B00E0G7X5A', 'B00EQ2F97W', 'B00ENXPAFU', 'B00DSJHL7K', 'B00FZLROIA', 'http://s.mxtv.jp/geneitaiyo/', '幻影ヲ駆ケル太陽 [s.mxtv.jp]', 'http://www.geneitaiyo.com/', '幻影ヲ駆ケル太陽 [geneitaiyo.com]', 'http://www.geneitaiyo.com/', '幻影ヲ駆ケル太陽 [geneitaiyo.com]', 'http://ja.wikipedia.org/wiki/%E5%B9%BB%E5%BD%B1%E3%83%B2%E9%A7%86%E3%82%B1%E3%83%AB%E5%A4%AA%E9%99%BD'),
(133, 'げんしけん', '『げんしけん』（The Society for the Study of Modern Visual Culture）は、木尾士目による日本の漫画作品。『月刊アフタヌーン』にて2002年から2006年にかけて連載された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%92%E3%82%93%E3%81%97%E3%81%91%E3%82%93)より）', '', '4063879453', 'B00HKKQHMS', '4063584623', '4063878953', 'B009KYCQIQ', 'http://www.mediafactory.co.jp/anime/genshiken/', 'げんしけん', 'http://kc.kodansha.co.jp/content/top.php/1000000032/', 'げんしけん／げんしけん二代目', 'http://kc.kodansha.co.jp/content/top.php/1000000032/', 'げんしけん／げんしけん二代目', 'http://ja.wikipedia.org/wiki/%E3%81%92%E3%82%93%E3%81%97%E3%81%91%E3%82%93'),
(134, 'けんぷファー', '『けんぷファー』は、築地俊彦による日本のライトノベル。イラストはせんむが担当。メディアファクトリー（現KADOKAWAメディアファクトリーブランドカンパニー）・MF文庫Jより刊行。ケンプファーに選ばれた主人公を中心としたバトルラブコメであり、物語は彼の一人称（時々三人称）で進む。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%91%E3%82%93%E3%81%B7%E3%83%95%E3%82%A1%E3%83%BC)より）', '', '4840150842', '4840122822', 'B002TVFGRA', 'B004F9QCFY', 'B004QYI6OS', 'http://www.starchild.co.jp/special/kenpu/', 'けんぷファー [starchild.co.jp]', 'http://www.tbs.co.jp/anime/kenpu/', 'けんぷファー [tbs.co.jp]', 'http://www.tbs.co.jp/anime/kenpu/', 'けんぷファー [tbs.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%91%E3%82%93%E3%81%B7%E3%83%95%E3%82%A1%E3%83%BC'),
(135, '恋風', '『恋風』（こいかぜ）は、吉田基已の漫画作品。講談社の漫画雑誌『イブニング』に連載。アニメ化もされ、2004年4月から6月までテレビ朝日・キッズステーションで放送された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%81%8B%E9%A2%A8)より）', '', '4063520048', 'B002DE73H4', '4063520919', 'B003KULZOW', 'B0002B5AAM', 'http://www.geneon-ent.co.jp/rondorobe/anime/koikaze/', '恋風', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E6%81%8B%E9%A2%A8'),
(136, '恋と選挙とチョコレート', '『恋と選挙とチョコレート』（こいとせんきょとチョコレート、Love, Election & Chocolate）は、2010年10月29日にspriteから発売されたアダルトゲーム。spriteの第1作。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%81%8B%E3%81%A8%E9%81%B8%E6%8C%99%E3%81%A8%E3%83%81%E3%83%A7%E3%82%B3%E3%83%AC%E3%83%BC%E3%83%88)より）', '', '4048662392', 'B0088LXJKG', 'B006JUVLFS', 'B0088LXKB4', '404891863X', 'http://www.koichoco.com/', '恋と選挙とチョコレート [koichoco.com]', 'http://www.tbs.co.jp/anime/koichoco/', '恋と選挙とチョコレート [tbs.co.jp]', 'http://www.tbs.co.jp/anime/koichoco/', '恋と選挙とチョコレート [tbs.co.jp]', 'http://ja.wikipedia.org/wiki/%E6%81%8B%E3%81%A8%E9%81%B8%E6%8C%99%E3%81%A8%E3%83%81%E3%83%A7%E3%82%B3%E3%83%AC%E3%83%BC%E3%83%88'),
(137, '高校球児ザワさん', '『高校球児ザワさん』（こうこうきゅうじザワさん）は、三島衛里子による日本の漫画。『ビッグコミックスピリッツ増刊号Casual』2008年6月7日号（小学館）に読み切りが掲載され、その後同年8月の『ビッグコミックスピリッツ』（同社）39号から2013年13号まで連載された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E9%AB%98%E6%A0%A1%E7%90%83%E5%85%90%E3%82%B6%E3%83%AF%E3%81%95%E3%82%93)より）', '', '4091853161', '4091825370', '409184846X', 'B00FJSBRNW', '4091846963', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E9%AB%98%E6%A0%A1%E7%90%83%E5%85%90%E3%82%B6%E3%83%AF%E3%81%95%E3%82%93'),
(138, '攻殻機動隊', '『攻殻機動隊』（こうかくきどうたい、英語タイトル：GHOST IN THE SHELL）は、士郎正宗による漫画作品。ジャンルとしてはサイバーパンクSFに属する。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%94%BB%E6%AE%BB%E6%A9%9F%E5%8B%95%E9%9A%8A)より）', '', 'B00DIOB46O', '406313248X', 'B00GU51IYG', 'B000BMUVKQ', '4063769070', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Ghost_in_the_shell/Ghost_In_The_Shell/', '攻殻機動隊 アニメ版', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Ghost_in_the_shell/Ghost_In_The_Shell_Game/', '攻殻機動隊 ゲーム版', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Ghost_in_the_shell/Ghost_In_The_Shell_Game/', '攻殻機動隊 ゲーム版', 'http://ja.wikipedia.org/wiki/%E6%94%BB%E6%AE%BB%E6%A9%9F%E5%8B%95%E9%9A%8A'),
(139, '鋼鉄天使くるみ', '『鋼鉄天使くるみ』（こうてつてんしくるみ）とは、介錯作の漫画作品並びにそれを原作とする一連のアニメ及び実写からなるシリーズ作品を指す。（[wikipedia](http://ja.wikipedia.org/wiki/%E9%8B%BC%E9%89%84%E5%A4%A9%E4%BD%BF%E3%81%8F%E3%82%8B%E3%81%BF)より）', '', 'B008AU2A6E', 'B00005FR0P', 'B0093G9MEW', 'B002DE6ZSC', 'B008U48YDS', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E9%8B%BC%E9%89%84%E5%A4%A9%E4%BD%BF%E3%81%8F%E3%82%8B%E3%81%BF'),
(140, '神戸在住', '『神戸在住』（こうべざいじゅう）は、木村紺による日本の漫画作品。『月刊アフタヌーン』（講談社）にて、1998年から2006年5月号（3月25日発売）まで連載された。全10巻。欧文タイトルは「from KOBE」。木村は本作品により、第31回日本漫画家協会賞新人賞を受賞した。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%A5%9E%E6%88%B8%E5%9C%A8%E4%BD%8F)より）', '', '4063211045', 'B002CZPMNG', '4063211827', 'B00AAR1ZUW', 'B00AAR1ZWA', 'http://tabibito.ashigaru.jp/', '旅人-en-', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E7%A5%9E%E6%88%B8%E5%9C%A8%E4%BD%8F'),
(141, 'GO!GO!575', '『project575』（プロジェクトごうしちごう）は、セガが2013年より展開しているメディアミックス形コンテンツ。 （[wikipedia](http://ja.wikipedia.org/wiki/Project575#.E3.83.86.E3.83.AC.E3.83.93.E3.82.A2.E3.83.8B.E3.83.A1)より）', '', 'B00GUNQ9X8', 'B00F4Q3FDE', 'B00F5J7MKC', 'B00F0LP28E', 'B003QF19YC', 'http://gogo575.sega.jp/', 'GO!GO!575', '', '', '', '', 'http://ja.wikipedia.org/wiki/Project575#.E3.83.86.E3.83.AC.E3.83.93.E3.82.A2.E3.83.8B.E3.83.A1'),
(142, 'ゴールデンタイム', '『ゴールデンタイム』（GOLDEN TIME）は、竹宮ゆゆこによる日本のライトノベル、およびそれを原作とする漫画・アニメ等のメディアミックス作品群である。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%B4%E3%83%BC%E3%83%AB%E3%83%87%E3%83%B3%E3%82%BF%E3%82%A4%E3%83%A0_%28%E5%B0%8F%E8%AA%AC%29)より）', '', '4048688782', 'B00FOL28UK', 'B00FB7ROS8', '4048660594', 'B00FOL28YQ', 'http://www.robot.co.jp/special/goldentime/', 'ゴールデンタイム', 'http://golden-time.jp/', 'ゴールデンタイム', 'http://golden-time.jp/', 'ゴールデンタイム', 'http://ja.wikipedia.org/wiki/%E3%82%B4%E3%83%BC%E3%83%AB%E3%83%87%E3%83%B3%E3%82%BF%E3%82%A4%E3%83%A0_%28%E5%B0%8F%E8%AA%AC%29'),
(143, '極上!!めちゃモテ委員長', '『極上!!めちゃモテ委員長』（ごくじょう めちゃモテいいんちょう）は、にしむらともこによる日本の漫画作品、およびそれを原作としたテレビアニメ、ゲーム作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%A5%B5%E4%B8%8A!!%E3%82%81%E3%81%A1%E3%82%83%E3%83%A2%E3%83%86%E5%A7%94%E5%93%A1%E9%95%B7)より）', '', 'B00390VXTA', 'B00CY236MG', 'B00501UPZE', '4091356087', 'B005448PTK', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Mechamote/Mechamote_Anime/', '極上!!めちゃモテ委員長 アニメ版', 'http://www.tv-tokyo.co.jp/anime/mechamote/', '極上!!めちゃモテ委員長', 'http://www.tv-tokyo.co.jp/anime/mechamote/', '極上!!めちゃモテ委員長', 'http://ja.wikipedia.org/wiki/%E6%A5%B5%E4%B8%8A!!%E3%82%81%E3%81%A1%E3%82%83%E3%83%A2%E3%83%86%E5%A7%94%E5%93%A1%E9%95%B7'),
(144, 'コクリコ坂から', '『コクリコ坂から』（コクリコざかから、英題：From Up On Poppy Hill）は、佐山哲郎の原作、高橋千鶴の作画による日本の漫画、およびそれを原作としたスタジオジブリ製作のアニメ映画である。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%B3%E3%82%AF%E3%83%AA%E3%82%B3%E5%9D%82%E3%81%8B%E3%82%89)より）', '', 'B007JFCP2A', 'B007JFC0XE', 'B007JFE21C', 'B004GCJOFA', 'B004XO5K4U', 'http://kokurikozaka.jp/', 'コクリコ坂から', 'http://kokurikozaka.jp/', 'コクリコ坂から', 'http://kokurikozaka.jp/', 'コクリコ坂から', 'http://ja.wikipedia.org/wiki/%E3%82%B3%E3%82%AF%E3%83%AA%E3%82%B3%E5%9D%82%E3%81%8B%E3%82%89'),
(145, 'ココロコネクト', '『ココロコネクト』（kokoro connect）は、庵田定夏によるライトノベルシリーズ。イラストは白身魚が担当し、ファミ通文庫（エンターブレイン）より、2010年1月から2013年9月全11巻（本編8巻、短編集3巻）が刊行されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%B3%E3%82%B3%E3%83%AD%E3%82%B3%E3%83%8D%E3%82%AF%E3%83%88)より）', '', '4047262900', '4047291501', 'B008KJJN92', '4047287369', '4047291331', 'http://www.kokoro-connect.com/', 'ココロコネクト [kokoro-connect.com]', 'http://kokoro-connect.channel.or.jp/', 'ココロコネクト ヨチランダム', 'http://kokoro-connect.channel.or.jp/', 'ココロコネクト ヨチランダム', 'http://ja.wikipedia.org/wiki/%E3%82%B3%E3%82%B3%E3%83%AD%E3%82%B3%E3%83%8D%E3%82%AF%E3%83%88'),
(146, '琴浦さん', '『琴浦さん』（ことうらさん、Kotoura-san）は、えのきづによる日本の漫画作品。「マンガ★ゲット」主催の「Manga Of The Year 2009」最優秀賞受賞。ウェブコミック掲載サイト『マンガごっちゃ』（マイクロマガジン社）にて、『琴浦さん漫画』（ことうらさんまんが）のタイトルで連載中。 （[wikipedia](http://ja.wikipedia.org/wiki/%E7%90%B4%E6%B5%A6%E3%81%95%E3%82%93)より）', '', '4896373413', 'B00AZNOCTC', '4896374231', 'B00B51BBQA', '4896373707', 'http://www.kotourasan.com/', '琴浦さん', 'http://kotourasan.net/', '「琴浦さん」特設サイト', 'http://kotourasan.net/', '「琴浦さん」特設サイト', 'http://ja.wikipedia.org/wiki/%E7%90%B4%E6%B5%A6%E3%81%95%E3%82%93'),
(147, '孤独のグルメ', '『孤独のグルメ』（こどくのグルメ）は、扶桑社の『月刊PANJA』誌上で1994年から1996年にかけて連載されていた原作・久住昌之、作画・谷口ジローによる漫画。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%AD%A4%E7%8B%AC%E3%81%AE%E3%82%B0%E3%83%AB%E3%83%A1)より）', '', '459402856X', 'B00ESXZ4QU', '459405644X', 'B007JSTFH0', 'B008ODF84I', 'http://www.tv-tokyo.co.jp/kodokunogurume3/', '孤独のグルメSeason3', 'http://www.tv-tokyo.co.jp/kodokunogurume2/', '孤独のグルメSeason2', 'http://www.tv-tokyo.co.jp/kodokunogurume2/', '孤独のグルメSeason2', 'http://ja.wikipedia.org/wiki/%E5%AD%A4%E7%8B%AC%E3%81%AE%E3%82%B0%E3%83%AB%E3%83%A1'),
(148, 'こちら葛飾区亀有公園前派出所', '『こちら葛飾区亀有公園前派出所』（こちらかつしかくかめありこうえんまえはしゅつじょ）は、秋本治による日本の漫画作品。『週刊少年ジャンプ』（集英社）において1976年42号より現在まで連載中。『週刊少年ジャンプ』の最長連載作品である。通称「こち亀（こちかめ）」。単行本（コミックス）は2013年12月時点で第188巻まで刊行。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%93%E3%81%A1%E3%82%89%E8%91%9B%E9%A3%BE%E5%8C%BA%E4%BA%80%E6%9C%89%E5%85%AC%E5%9C%92%E5%89%8D%E6%B4%BE%E5%87%BA%E6%89%80)より）', '', '4088708482', '4088708172', '4088706811', 'B00H35TXLM', '4088706463', 'http://www.j-kochikame.com/', 'こち亀.com', 'http://www.tbs.co.jp/kochikame/', 'ドラマ版「こちら葛飾区亀有公園前派出所」', 'http://www.tbs.co.jp/kochikame/', 'ドラマ版「こちら葛飾区亀有公園前派出所」', 'http://ja.wikipedia.org/wiki/%E3%81%93%E3%81%A1%E3%82%89%E8%91%9B%E9%A3%BE%E5%8C%BA%E4%BA%80%E6%9C%89%E5%85%AC%E5%9C%92%E5%89%8D%E6%B4%BE%E5%87%BA%E6%89%80'),
(149, '言の葉の庭', '『言の葉の庭』（ことのはのにわ The Garden of Words）は、新海誠監督の日本のアニメーション映画作品。2013年5月31日公開。キャッチコピーは"愛"よりも昔、"孤悲（こい）"のものがたり。 （[wikipedia](http://ja.wikipedia.org/wiki/%E8%A8%80%E3%81%AE%E8%91%89%E3%81%AE%E5%BA%AD)より）', '', 'B00BQA5OOU', '4758013195', 'B00BQA8I66', '4063879410', 'B00HD9J3QS', 'http://www.kotonohanoniwa.jp/', '言の葉の庭', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E8%A8%80%E3%81%AE%E8%91%89%E3%81%AE%E5%BA%AD'),
(150, 'こどものじかん', '『こどものじかん』は、私屋カヲルによる日本の漫画作品、およびそれをもとにしたテレビアニメ。小学校を舞台にしている。2004年に読み切り作品として初めて掲載され、2005年から2013年まで『コミックハイ!』（双葉社）で連載されていた。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%93%E3%81%A9%E3%82%82%E3%81%AE%E3%81%98%E3%81%8B%E3%82%93)より）', '', '457584246X', '4575831778', '4575842478', '4575841269', 'B009DBYIXW', 'http://www.kojika-anime.com/', 'こどものじかん', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%81%93%E3%81%A9%E3%82%82%E3%81%AE%E3%81%98%E3%81%8B%E3%82%93'),
(151, 'この世界の片隅に', '『この世界の片隅に』（このせかいのかたすみに）は、こうの史代による日本の漫画作品。『漫画アクション』（双葉社）にて2007年1月23日号～2009年1月20日号まで連載。単行本は同社より上・中・下巻が発売。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%93%E3%81%AE%E4%B8%96%E7%95%8C%E3%81%AE%E7%89%87%E9%9A%85%E3%81%AB)より）', '', '457583940X', '4575941468', '4575839418', 'B00B47J7YI', '4575941794', 'http://www.ntv.co.jp/konosekai/', 'この世界の片隅に', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%81%93%E3%81%AE%E4%B8%96%E7%95%8C%E3%81%AE%E7%89%87%E9%9A%85%E3%81%AB'),
(152, 'この中に１人、妹がいる！', '『この中に1人、妹がいる!』（このなかにひとり いもうとがいる）は、田口一による日本のライトノベル。イラストはCUTEGが担当している。2010年8月から2013年3月まで全11巻（本編10巻・短編1巻）がMF文庫J（メディアファクトリー[注 1]）より刊行された。原作たる小説のほか、漫画化・アニメ化など複数メディアでの展開がなされ、日本国外においても翻訳版が出版されている。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%93%E3%81%AE%E4%B8%AD%E3%81%AB1%E4%BA%BA%E3%80%81%E5%A6%B9%E3%81%8C%E3%81%84%E3%82%8B!)より）', '', 'B0095F4B24', 'B00HEW41KM', '4040661168', 'B008GYPLTC', 'B00H8K25IK', 'http://www.tbs.co.jp/anime/nakaimo/', 'この中に1人、妹がいる！ [tbs.co.jp]', 'http://www.mediafactory.co.jp/bunkoj/nakaimo/', 'この中に1人、妹がいる！ [mediafactory.co.jp]', 'http://www.mediafactory.co.jp/bunkoj/nakaimo/', 'この中に1人、妹がいる！ [mediafactory.co.jp]', 'http://ja.wikipedia.org/wiki/%E3%81%93%E3%81%AE%E4%B8%AD%E3%81%AB1%E4%BA%BA%E3%80%81%E5%A6%B9%E3%81%8C%E3%81%84%E3%82%8B!'),
(153, 'これはゾンビですか？', '『これはゾンビですか?』（KOREHA ZOMBIE DESUKA?）は、木村心一による日本のライトノベル作品。イラストは、こぶいちとむりりんの2人が担当している。略称は「これゾン」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%93%E3%82%8C%E3%81%AF%E3%82%BE%E3%83%B3%E3%83%93%E3%81%A7%E3%81%99%E3%81%8B%3F)より）', '', '4047129631', '4829133708', 'B0088NLOZG', '4047128066', 'B00D3Y2RXS', 'http://www.fujimishobo.co.jp/sp/201006zombie/', 'これはゾンビですか？ [fujimishobo.co.jp]', 'http://dir.yahoo.co.jp/Arts/Humanities/Literature/Literary_Fiction/Light_Novel/Titles/Korehazonbidesuka/Korezon_Anime/', 'これはゾンビですか？ アニメ版', 'http://dir.yahoo.co.jp/Arts/Humanities/Literature/Literary_Fiction/Light_Novel/Titles/Korehazonbidesuka/Korezon_Anime/', 'これはゾンビですか？ アニメ版', 'http://ja.wikipedia.org/wiki/%E3%81%93%E3%82%8C%E3%81%AF%E3%82%BE%E3%83%B3%E3%83%93%E3%81%A7%E3%81%99%E3%81%8B%3F'),
(154, 'サーバント×サービス', '『サーバント×サービス』（SERVANT×SERVICE）は、高津カリノによる日本の青年漫画。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%BC%E3%83%90%E3%83%B3%E3%83%88%C3%97%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9)より）', '', 'B00FGSXEHW', '4757533764', 'B00FGSVU32', '4757539924', 'B00F5VEU8W', 'http://www.servantservice.org/', 'サーバント×サービス [servantservice.org]', 'http://s.mxtv.jp/servantservice/', 'サーバント×サービス [s.mxtv.jp]', 'http://s.mxtv.jp/servantservice/', 'サーバント×サービス [s.mxtv.jp]', 'http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%BC%E3%83%90%E3%83%B3%E3%83%88%C3%97%E3%82%B5%E3%83%BC%E3%83%93%E3%82%B9'),
(155, '最近、妹のようすがちょっとおかしいんだが。', '『最近、妹のようすがちょっとおかしいんだが。』（さいきん いもうとのようすがちょっとおかしいんだが）は、松沢まりによる日本の漫画作品。『月刊ドラゴンエイジ』（KADOKAWA/富士見書房）2010年12月号から連載中。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%9C%80%E8%BF%91%E3%80%81%E5%A6%B9%E3%81%AE%E3%82%88%E3%81%86%E3%81%99%E3%81%8C%E3%81%A1%E3%82%87%E3%81%A3%E3%81%A8%E3%81%8A%E3%81%8B%E3%81%97%E3%81%84%E3%82%93%E3%81%A0%E3%81%8C%E3%80%82)より）', '', '404070018X', '404712995X', 'B00HS5DLII', 'B0093T5S5Q', '4040700120', 'http://www.imocyo-anime.com/', '最近、妹のようすがちょっとおかしいんだが。 [imocyo-anime.com]', 'http://www.fujimishobo.co.jp/sp/201108imocho/', '最近、妹のようすがちょっとおかしいんだが。 [fujimishobo.co.jp]', 'http://www.fujimishobo.co.jp/sp/201108imocho/', '最近、妹のようすがちょっとおかしいんだが。 [fujimishobo.co.jp]', 'http://ja.wikipedia.org/wiki/%E6%9C%80%E8%BF%91%E3%80%81%E5%A6%B9%E3%81%AE%E3%82%88%E3%81%86%E3%81%99%E3%81%8C%E3%81%A1%E3%82%87%E3%81%A3%E3%81%A8%E3%81%8A%E3%81%8B%E3%81%97%E3%81%84%E3%82%93%E3%81%A0%E3%81%8C%E3%80%82'),
(156, 'PSYCHO-PASS', '『PSYCHO-PASS サイコパス』は、フジテレビ『ノイタミナ』のオリジナルアニメで、2012年10月から2013年3月まで放送された日本のテレビアニメ。Production I.G制作。 （[wikipedia](http://ja.wikipedia.org/wiki/PSYCHO-PASS)より）', '', '4041104068', 'B009PF0920', 'B00C5UH4GG', '4800001021', 'B009PG9470', 'http://psycho-pass.com/', 'PSYCHO-PASS サイコパス', '', '', '', '', 'http://ja.wikipedia.org/wiki/PSYCHO-PASS'),
(157, '最終兵器彼女', '『最終兵器彼女』（さいしゅうへいきかのじょ）は、高橋しんの漫画。小学館の漫画雑誌「ビッグコミックスピリッツ」で、2000年1月から2001年10月まで連載された。単行本は小学館から全7巻と外伝1巻が刊行されており、累計総発行部数は400万部を記録している。略称は「最彼（さいかの）」・「サイカノ」。キャッチコピーは「この星で一番最後のラブストーリー。」（[wikipedia](http://ja.wikipedia.org/wiki/%E6%9C%80%E7%B5%82%E5%85%B5%E5%99%A8%E5%BD%BC%E5%A5%B3)より）', '', 'B002DE7CQG', '4091856810', 'B00DQ3BSLS', '4091807461', '4093876282', 'http://www.toei-anim.co.jp/movie/2006_saikano/', '最終兵器彼女', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/The_Last_Love_Song_on_This_Little_Planet/The_Last_Love_Song_on_This_Little_Planet_Anime/', '最終兵器彼女 アニメ版', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/The_Last_Love_Song_on_This_Little_Planet/The_Last_Love_Song_on_This_Little_Planet_Anime/', '最終兵器彼女 アニメ版', 'http://ja.wikipedia.org/wiki/%E6%9C%80%E7%B5%82%E5%85%B5%E5%99%A8%E5%BD%BC%E5%A5%B3'),
(158, '坂道のアポロン', '『坂道のアポロン』（さかみちのアポロン）は、小玉ユキによる日本の漫画作品。 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%9D%82%E9%81%93%E3%81%AE%E3%82%A2%E3%83%9D%E3%83%AD%E3%83%B3)より）', '', '4091316700', 'B007BRSMVO', '4091347932', 'B00B6DTGLO', 'B007OIGNES', 'http://www.noitamina-apollon.com/', '坂道のアポロン', 'http://www.apollon-jazz.com/', '坂道のアポロン オリジナル・サウンドトラック', 'http://www.apollon-jazz.com/', '坂道のアポロン オリジナル・サウンドトラック', 'http://ja.wikipedia.org/wiki/%E5%9D%82%E9%81%93%E3%81%AE%E3%82%A2%E3%83%9D%E3%83%AD%E3%83%B3'),
(159, '咲 -Saki-', '『咲-Saki-』（さき）は、小林立による日本の漫画作品。スクウェア・エニックス『ヤングガンガン』2006年4号から6号にかけて短期掲載され、その後同年12号より連載中 （[wikipedia](http://ja.wikipedia.org/wiki/%E5%92%B2-Saki-)より）', '', '', '', '', '', '', 'http://www.square-enix.co.jp/magazine/yg/introduction/saki/', '咲 - Saki', 'http://products.alchemist-net.co.jp/products/saki-A/', '咲-Saki- 阿知賀編 episode of side-A Portable', 'http://products.alchemist-net.co.jp/products/saki-A/', '咲-Saki- 阿知賀編 episode of side-A Portable', 'http://ja.wikipedia.org/wiki/%E5%92%B2-Saki-'),
(160, 'さくら荘のペットな彼女', '『さくら荘のペットな彼女』（さくらそうのペットなかのじょ）は、鴨志田一著のライトノベル。イラストは溝口ケージが担当している。2012年10月から2013年3月までテレビアニメが放送された。発売時期は未定であるが、「本当の最終巻」と題された10.5巻も発売予定である。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%95%E3%81%8F%E3%82%89%E8%8D%98%E3%81%AE%E3%83%9A%E3%83%83%E3%83%88%E3%81%AA%E5%BD%BC%E5%A5%B3)より）', '', '4048682806', 'B009PJQDD0', '4048917943', '4048914715', '4048869868', 'http://sakurasou.tv/', 'さくら荘のペットな彼女 [sakurasou.tv]', 'http://sakurasou.dengeki.com/', '『さくら荘のペットな彼女』原作公式サイト', 'http://sakurasou.dengeki.com/', '『さくら荘のペットな彼女』原作公式サイト', 'http://ja.wikipedia.org/wiki/%E3%81%95%E3%81%8F%E3%82%89%E8%8D%98%E3%81%AE%E3%83%9A%E3%83%83%E3%83%88%E3%81%AA%E5%BD%BC%E5%A5%B3'),
(161, 'ささみさん＠がんばらない', ' 『ささみさん@がんばらない』（ささみさんがんばらない）は、日日日による日本のライトノベル。イラストは左が担当している。ガガガ文庫（小学館）より、2009年12月から既刊10巻（2012年12月31日現在）が刊行されている。2011年12月17日に発売された第7巻の帯にてアニメ化が発表され[1]、2013年1月より3月まで放送された[2][3]。2012年10月から2013年5月までは『週刊少年サンデー』及び『週刊少年サンデーS』2013年8月号から11月号までコミカライズ版が連載。題名の「@」は基本的には読まない。（[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%95%E3%81%95%E3%81%BF%E3%81%95%E3%82%93@%E3%81%8C%E3%82%93%E3%81%B0%E3%82%89%E3%81%AA%E3%81%84)より）', '', '4094511768', '4091245455', '489610692X', '4094514201', 'B00FWPEVP8', 'http://www.tbs.co.jp/anime/sasami/', 'ささみさん＠がんばらない', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%81%95%E3%81%95%E3%81%BF%E3%81%95%E3%82%93@%E3%81%8C%E3%82%93%E3%81%B0%E3%82%89%E3%81%AA%E3%81%84'),
(162, 'サナララ', '『サナララ』は、2005年4月29日にねこねこソフトから発売されたアダルトゲーム。2012年10月26日にヒロイン追加、音声再収録、新OS対応等を行ったフルプライス版、『サナララR』が発売された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%8A%E3%83%A9%E3%83%A9)より）', '', 'B008U5BI44', 'B00ECSPVGO', '4894907712', 'B0007ZE144', 'B0006U1BXE', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%8A%E3%83%A9%E3%83%A9'),
(163, 'サマーウォーズ', '『サマーウォーズ』（SUMMER WARS）は、細田守による日本のアニメ映画。2009年8月1日に、新宿バルト9、池袋HUMAXシネマズ、丸の内ルーブルほか全国にて公開された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%9E%E3%83%BC%E3%82%A6%E3%82%A9%E3%83%BC%E3%82%BA)より）', '', 'B0030680TY', '4044288224', 'B0083TDH6Y', 'B003N4QAZY', 'B002M3UEP4', 'http://s-wars.jp/', 'サマーウォーズ', 'http://s-wars.jp/blog/', 'サマーウォーズ公式ブログ', 'http://s-wars.jp/blog/', 'サマーウォーズ公式ブログ', 'http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%9E%E3%83%BC%E3%82%A6%E3%82%A9%E3%83%BC%E3%82%BA'),
(164, 'サムライフラメンコ', '『サムライフラメンコ』 (Samurai Flamenco) は、マングローブ制作の日本のテレビアニメ作品。2013年10月10日より、フジテレビの深夜アニメ枠『ノイタミナ』にて放送中。略称は「サムメンコ」。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%A0%E3%83%A9%E3%82%A4%E3%83%95%E3%83%A9%E3%83%A1%E3%83%B3%E3%82%B3)より）', '', 'B00FQCFDEU', 'B00F93Y8JC', 'B00GBFVQ1A', 'B00FQCXZDQ', 'B00GJ7TNQU', 'http://www.samumenco.com/', 'サムライフラメンコ', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%82%B5%E3%83%A0%E3%83%A9%E3%82%A4%E3%83%95%E3%83%A9%E3%83%A1%E3%83%B3%E3%82%B3'),
(165, 'さよなら絶望先生', '『さよなら絶望先生』（さよならぜつぼうせんせい）は、久米田康治による日本のブラックコメディ漫画作品。『週刊少年マガジン』（講談社）にて、2005年22・23合併号から2012年28号まで連載。全301話。通称「絶望先生」。単行本は全三十集（30巻）。301話目をもって終了する旨は、事前にマガジン本誌で予告された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%95%E3%82%88%E3%81%AA%E3%82%89%E7%B5%B6%E6%9C%9B%E5%85%88%E7%94%9F)より）', '', '4063635821', '4063847055', 'B008PESNNO', '4063846733', 'B00A765DJA', 'http://kc.kodansha.co.jp/content/top.php/1000000196', 'さよなら絶望先生', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Good_by_Despair_Teacher/Good_by_Despair_Teacher_Anime/', 'さよなら絶望先生 アニメ版', 'http://dir.yahoo.co.jp/Entertainment/Comics_and_Animation/Comic_Books/Titles/Good_by_Despair_Teacher/Good_by_Despair_Teacher_Anime/', 'さよなら絶望先生 アニメ版', 'http://ja.wikipedia.org/wiki/%E3%81%95%E3%82%88%E3%81%AA%E3%82%89%E7%B5%B6%E6%9C%9B%E5%85%88%E7%94%9F'),
(166, 'さんかれあ', '『さんかれあ』は、はっとりみつるによる日本の漫画作品である。『別冊少年マガジン』（講談社）2010年1月号から連載中。単行本は2013年6月現在、講談社コミックスより第8巻までが刊行中。 （[wikipedia](http://ja.wikipedia.org/wiki/%E3%81%95%E3%82%93%E3%81%8B%E3%82%8C%E3%81%82)より）', '', '406394977X', '4063848736', '4063843416', 'B00HKKOP40', '4063847624', 'http://www.tbs.co.jp/anime/sankarea/', 'さんかれあ', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E3%81%95%E3%82%93%E3%81%8B%E3%82%8C%E3%81%82'),
(167, '斬魔大聖デモンベイン', '『斬魔大聖デモンベイン』（ざんまたいせいデモンベイン）（「斬」の文字は斬の下部に天と表記）は、2003年4月25日にニトロプラスより発売された18禁PCゲーム。2004年7月1日には角川書店よりPlayStation 2（以下、PS2）版『機神咆吼デモンベイン』（きしんほうこうデモンベイン）も発売された。 （[wikipedia](http://ja.wikipedia.org/wiki/%E6%96%AC%E9%AD%94%E5%A4%A7%E8%81%96%E3%83%87%E3%83%A2%E3%83%B3%E3%83%99%E3%82%A4%E3%83%B3)より）', '', 'B002W5UOTS', 'B000EZP290', 'B00030DKK4', '404427813X', 'B0000A02EG', '', '', '', '', '', '', 'http://ja.wikipedia.org/wiki/%E6%96%AC%E9%AD%94%E5%A4%A7%E8%81%96%E3%83%87%E3%83%A2%E3%83%B3%E3%83%99%E3%82%A4%E3%83%B3');

-- --------------------------------------------------------

--
-- テーブルの構造 `workinfo`
--

CREATE TABLE IF NOT EXISTS `workinfo` (
  `workid` int(10) NOT NULL COMMENT '作品ID',
  `accessnum` int(10) NOT NULL DEFAULT '0' COMMENT '作品ページのアクセス数',
  PRIMARY KEY (`workid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品関連情報';

--
-- テーブルのデータのダンプ `workinfo`
--

INSERT INTO `workinfo` (`workid`, `accessnum`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0),
(22, 0),
(23, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0),
(62, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0),
(68, 0),
(69, 0),
(70, 0),
(71, 0),
(72, 0),
(73, 0),
(74, 0),
(75, 0),
(76, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0),
(136, 0),
(137, 0),
(138, 0),
(139, 0),
(140, 0),
(141, 0),
(142, 0),
(143, 0),
(144, 0),
(145, 0),
(146, 0),
(147, 0),
(148, 0),
(149, 0),
(150, 0),
(151, 0),
(152, 0),
(153, 0),
(154, 0),
(155, 0),
(156, 0),
(157, 0),
(158, 0),
(159, 0),
(160, 0),
(161, 0),
(162, 0),
(163, 0),
(164, 0),
(165, 0),
(166, 0),
(167, 0);

-- --------------------------------------------------------

--
-- テーブルの構造 `worktag`
--

CREATE TABLE IF NOT EXISTS `worktag` (
  `worktagid` int(10) NOT NULL AUTO_INCREMENT COMMENT '作品タグID',
  `name` varchar(24) NOT NULL COMMENT 'タグ名',
  `workid` int(10) NOT NULL COMMENT '作品ID',
  PRIMARY KEY (`worktagid`),
  KEY `workid` (`workid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='作品タグ' AUTO_INCREMENT=1 ;

--
-- ダンプしたテーブルの制約
--

--
-- テーブルの制約 `placeinfo`
--
ALTER TABLE `placeinfo`
  ADD CONSTRAINT `placeinfo_ibfk_1` FOREIGN KEY (`placeid`) REFERENCES `place` (`placeid`);

--
-- テーブルの制約 `placetag`
--
ALTER TABLE `placetag`
  ADD CONSTRAINT `placetag_ibfk_1` FOREIGN KEY (`placeid`) REFERENCES `place` (`placeid`);

--
-- テーブルの制約 `placework`
--
ALTER TABLE `placework`
  ADD CONSTRAINT `placework_ibfk_1` FOREIGN KEY (`placeid`) REFERENCES `place` (`placeid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
