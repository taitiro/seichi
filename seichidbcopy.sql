-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- ホスト: 127.0.0.1
-- 生成日時: 2014 年 1 月 11 日 06:17
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
  `productid0` char(10) DEFAULT '',
  `productid1` char(10) DEFAULT '',
  `productid2` char(10) DEFAULT '',
  `productid3` char(10) DEFAULT '',
  `productid4` char(10) DEFAULT '',
  `img` varchar(2083) NOT NULL DEFAULT 'http://localhost:8080/seichi/img/noimage.gif' COMMENT '作品の画像',
  `url1` varchar(2083) NOT NULL DEFAULT '' COMMENT '作品の関連URL1',
  `urlname1` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL1の名前',
  `url2` varchar(2083) NOT NULL DEFAULT '' COMMENT '作品の関連URL1',
  `urlname2` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL2の名前',
  `url3` varchar(2083) NOT NULL DEFAULT '' COMMENT '作品の関連URL1',
  `urlname3` varchar(64) NOT NULL DEFAULT '' COMMENT '関連URL2の名前',
  `wikipedia` varchar(2083) NOT NULL DEFAULT '' COMMENT 'wikipediaの解説URL',
  PRIMARY KEY (`workid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='作品情報' AUTO_INCREMENT=8 ;

--
-- テーブルのデータのダンプ `work`
--

INSERT INTO `work` (`workid`, `name`, `workdesc`, `productid0`, `productid1`, `productid2`, `productid3`, `productid4`, `img`, `url1`, `urlname1`, `url2`, `urlname2`, `url3`, `urlname3`, `wikipedia`) VALUES
(1, 'けいおん！', '『けいおん!』（K-ON!）は、かきふらいによる日本の4コマ漫画作品、およびそれを原作としてメディアミックスで製作される作品群。\r\n\r\n廃部寸前の私立桜が丘女子高等学校（桜が丘高校）軽音部で4人の生徒たちがバンドを組み、ゼロから部活動を行っていくストーリー。途中新入生が加わり、5人となった。軽音部の結成から結成時のメンバー4人の大学進学までの3年間の部活動を描く。\r\n\r\n[TBSアニメーション・けいおん！公式ホームページ](http://www.tbs.co.jp/anime/k-on/)\r\n\r\n[けいおん! - Wikipedia](http://ja.wikipedia.org/wiki/%E3%81%91%E3%81%84%E3%81%8A%E3%82%93!)', '483227693X', '4862552196', '4905385040', '4870319950', 'B0042XA5X8', 'http://localhost:8080/seichi/img/noimage.gif', 'http://www.darakeru.com', 'テストURL', '', '', '', '', ''),
(2, 'らき☆すた', '『らき☆すた』は、美水かがみによる日本の4コマ漫画作品、およびそれを原作としたゲーム、アニメ、小説作品。角川書店の月刊ゲーム雑誌『コンプティーク』において2004年1月号より連載されているほか、『コンプエース』など数誌で掲載されている。\r\n\r\n小柄でアニメやゲームが大好きな、オタクな女子高生（7巻より大学生）“泉こなた”と、その友人でゆったりした性格の“柊つかさ”、つかさの双子の姉でしっかり者でツッコミ役の“柊かがみ”、容姿端麗で博識ながら天然な所がある“高良みゆき”の4人を中心として、その周囲の人々も含めたまったりとした普段の生活を描いている。\r\n\r\n[「らき☆すた」オフィシャルサイト／「らっきー☆ちゃんねるWEB」／「らきすた」公式サイト](http://www.lucky-ch.com/)\r\n\r\n[らきすた - Wikipedia](http://ja.wikipedia.org/wiki/%E3%82%89%E3%81%8D%E2%98%86%E3%81%99%E3%81%9F)', '', '4862552196', '4905385040', '4870319950', '', 'http://localhost:8080/seichi/img/noimage.gif', 'http://www.darakeru.com', 'テストURL', '', '', '', '', ''),
(3, 'デュラララ!!', '『デュラララ!!』 (DURARARA!!) は、成田良悟による日本のライトノベル。イラストはヤスダスズヒトが担当している。電撃文庫（KADOKAWA〈旧・アスキー・メディアワークス、メディアワークス〉）より、2004年4月から既刊12巻（2013年10月1日現在）が刊行されている。\r\n\r\n東京・池袋を舞台にした群像劇。高校生、オカルト、カラーギャングを中心とした物語でもある。', '', '4862552196', '4905385040', '4870319950', '', 'http://localhost:8080/seichi/img/noimage.gif', 'http://www.darakeru.com', 'テストURL', '', '', '', '', '');

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
(3, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='作品タグ' AUTO_INCREMENT=4 ;

--
-- テーブルのデータのダンプ `worktag`
--

INSERT INTO `worktag` (`worktagid`, `name`, `workid`) VALUES
(1, 'まんがタイムきらら', 1),
(2, '角川書店', 2),
(3, '芳文社', 1);

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
  ADD CONSTRAINT `placework_ibfk_2` FOREIGN KEY (`workid`) REFERENCES `work` (`workid`),
  ADD CONSTRAINT `placework_ibfk_1` FOREIGN KEY (`placeid`) REFERENCES `place` (`placeid`);

--
-- テーブルの制約 `workinfo`
--
ALTER TABLE `workinfo`
  ADD CONSTRAINT `workinfo_ibfk_1` FOREIGN KEY (`workid`) REFERENCES `work` (`workid`);

--
-- テーブルの制約 `worktag`
--
ALTER TABLE `worktag`
  ADD CONSTRAINT `worktag_ibfk_1` FOREIGN KEY (`workid`) REFERENCES `work` (`workid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
