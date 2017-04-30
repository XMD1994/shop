/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50715
Source Host           : localhost:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50715
File Encoding         : 65001

Date: 2017-04-30 10:16:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for adminuser
-- ----------------------------
DROP TABLE IF EXISTS `adminuser`;
CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adminuser
-- ----------------------------
INSERT INTO `adminuser` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '水果');
INSERT INTO `category` VALUES ('2', '蔬菜');
INSERT INTO `category` VALUES ('3', '禽畜类');
INSERT INTO `category` VALUES ('4', '水产');
INSERT INTO `category` VALUES ('5', '特种类');
INSERT INTO `category` VALUES ('6', '五谷杂粮');

-- ----------------------------
-- Table structure for categorysecond
-- ----------------------------
DROP TABLE IF EXISTS `categorysecond`;
CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(30) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF21DB1FD15` (`cid`),
  CONSTRAINT `FK936FCAF21DB1FD15` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of categorysecond
-- ----------------------------
INSERT INTO `categorysecond` VALUES ('1', '李子', '1');
INSERT INTO `categorysecond` VALUES ('2', '脐橙', '1');
INSERT INTO `categorysecond` VALUES ('3', '柚子', '1');
INSERT INTO `categorysecond` VALUES ('4', '梨', '1');
INSERT INTO `categorysecond` VALUES ('5', '苹果', '1');
INSERT INTO `categorysecond` VALUES ('6', '西瓜', '1');
INSERT INTO `categorysecond` VALUES ('7', '甜瓜', '1');
INSERT INTO `categorysecond` VALUES ('9', '白菜', '2');
INSERT INTO `categorysecond` VALUES ('10', '小白菜', '2');
INSERT INTO `categorysecond` VALUES ('11', '包菜', '2');
INSERT INTO `categorysecond` VALUES ('12', '香菜', '2');
INSERT INTO `categorysecond` VALUES ('13', '冬瓜', '2');
INSERT INTO `categorysecond` VALUES ('14', '南瓜', '2');
INSERT INTO `categorysecond` VALUES ('15', '鸡', '3');
INSERT INTO `categorysecond` VALUES ('16', '鸭', '3');
INSERT INTO `categorysecond` VALUES ('17', '鹅', '3');
INSERT INTO `categorysecond` VALUES ('18', '猪', '3');
INSERT INTO `categorysecond` VALUES ('19', '牛', '3');
INSERT INTO `categorysecond` VALUES ('20', '草鱼', '4');
INSERT INTO `categorysecond` VALUES ('21', '泥鳅', '4');
INSERT INTO `categorysecond` VALUES ('22', '黄鳝', '4');
INSERT INTO `categorysecond` VALUES ('23', '鲤鱼', '4');
INSERT INTO `categorysecond` VALUES ('24', '竹鼠', '5');
INSERT INTO `categorysecond` VALUES ('25', '乌龟', '5');
INSERT INTO `categorysecond` VALUES ('26', '牛蛙', '5');
INSERT INTO `categorysecond` VALUES ('27', '娃娃鱼人工养殖', '5');
INSERT INTO `categorysecond` VALUES ('28', '红豆', '6');
INSERT INTO `categorysecond` VALUES ('29', '黑豆', '6');
INSERT INTO `categorysecond` VALUES ('30', '玉米', '6');
INSERT INTO `categorysecond` VALUES ('31', '小麦', '6');
INSERT INTO `categorysecond` VALUES ('32', '小米', '6');
INSERT INTO `categorysecond` VALUES ('33', '大米', '6');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `FKE8B2AB6166C01961` (`oid`),
  KEY `FKE8B2AB6171DB7AE4` (`pid`),
  CONSTRAINT `FKE8B2AB6166C01961` FOREIGN KEY (`oid`) REFERENCES `orders` (`oid`),
  CONSTRAINT `FKE8B2AB6171DB7AE4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `addr` varchar(40) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `FKC3DF62E5AA3D9C7` (`uid`),
  CONSTRAINT `FKC3DF62E5AA3D9C7` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `pname` varchar(40) DEFAULT NULL,
  `market_price` double DEFAULT NULL,
  `shop_price` double DEFAULT NULL,
  `image` varchar(30) DEFAULT NULL,
  `pdesc` varchar(255) DEFAULT NULL,
  `is_hot` int(2) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEFB9B74E02` (`csid`),
  CONSTRAINT `FKED8DCCEFB9B74E02` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '三华李', '15', '10', 'products/1/L10001.JPEG', '三华李是李子的一种，最早在广东省翁源县三华镇种植而得名，是翁源县目前最具盛名的特色水果，其种植历史可上溯到五百年前的明朝嘉靖年间。三华李成熟期在6月份，肉质鲜红，松脆爽口，果味清甜，无涩味，史有“岭南夏令果王”的称号。三华李品种有大蜜李、鸡麻李、小蜜李等。', '1', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('2', '青脆李', '20', '16', 'products/1/L10002.jpg', '青脆李：核小而肉厚，加之茂县独特的气候和日照条件，形成了青脆李特有的风味，备受人们喜爱。青脆李，饱满圆润，玲珑剔透，形态美艳，口味甘甜，是人们喜爱的传统水果之一。它既可鲜食，又可以制成罐头、果脯，全年食用。青翠李的营养比较丰富，适量吃些李子，可以生津利尿、清除肝热，有利于身体健康。', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('3', '半边红李子', '30', '15', 'products/1/L10003.JPEG', '半边红李子个大皮薄，口感清爽，具有促进消化、清肝利水、降压镇咳、美容养颜的功效，深受市场欢迎。', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('4', '脆红李', '12', '11', 'products/1/L10004.JPEG', '脆红李，树势中庸，树冠自然开心形。果实正圆形或近圆球形，果个较小，平均单果重15～25克，最大单果重40克。果皮紫红色，果肉黄色或偶带片状红色。缝合线正，缝沟浅，果点黄色，较密，大小均匀。果粉厚，灰白色，肉质脆，味甜，', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('5', '安哥诺李子', '15', '10', 'products/1/L10005.jpg', '安哥诺李果实大型，平均单果重96克，最大单果重152克。果实扁圆形，果顶平，缝合线浅而不明显。果面紫黑色，光亮美观。果皮较厚，果粉少，果点小。果肉淡黄色，近核处果肉微红色，质细，不溶质，汁液多，味甜，富香气。离核，核小。含可溶性固形物14％～15％，总糖13.1％，可滴定酸0.7％。果实耐贮藏，品质极佳。', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('6', '美国大李', '30', '20', 'products/1/L10006.JPEG', '美国大李原产美国。北京、河北、辽宁种植较多，果实圆形，平均单果重70.8克，最大单果重110克；果顶凹陷；果皮底色黄绿，着紫黑，皮薄，果粉厚，灰白色；果肉橙黄色，质致密，纤维多，汁多，味甜酸，浓厚；含可溶性固形物12%。离核，核长圆形。可食率98.1%。品质上等。在常温下果实可贮放8天左右。', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('7', '桃形李', '10', '8', 'products/1/L10007.JPEG', '平均单果重40克左右，最大果重达100克。果面深红色并附有白色蜡层，可食率高达 97.8%，可溶性固形物20%，含有机酸0.57%。每100克果肉中含蛋白质0.5克，脂肪0.2克，碳水化合物9克，营养非常丰富，常温下可储放10天左右，冷藏可保鲜50天，可做馈赠之佳品。', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('8', '蜂糖李 ', '40', '33', 'products/1/L10008.JPEG', '果实圆形，淡黄色，外被蜡粉，果顶一侧微突，一侧缝合线明显。平均单果重35.3g，最大单果重65.1g。平均纵径44.3mm，横径38.6mm，果形指数0.87。果肉淡黄色，平均果肉厚26.45mm。可溶性固形物17.8\\%，可食率91\\%。离核，核卵圆形。', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('9', '黑巨王李子', '2', '1.1', 'products/1/L10009.jpg', '果实近圆球形，果形指数 0.8，田间实测平均单果重 33.3 克。成熟时果皮底色青黄，阳面呈紫红色，全果着粉，缝合线较明显，果梗长 3.0 厘米左右。果皮较薄，果肉黄绿色，离核。可溶性固形物 11.6%，每 100 毫升果汁中含糖 8.07 克，酸 0.66 克，维生素 C3.55毫克。质地嫩脆化渣，风味甜浓，清香爽口，耐贮性较强。', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('10', '茵红李', '20', '10', 'products/1/L10010.JPEG', '果实品质优良，成熟期较晚，市场价位高。茵红李平均单果重40克，最大果重可达60克以上；果实扁园形，强光面是紫红色，全果着粉，果肉黄绿色，汁多，肉脆，皮薄，离核；于7月中旬成熟，且避开了本地品种的上市期，市场销售情况良好，较耐贮运，具有较明显的市场优势。', '0', '2017-03-27 20:18:00', '1');
INSERT INTO `product` VALUES ('11', '赣南脐橙', '100', '68', 'products/1/C20001.JPEG', '赣南脐橙作为江西省唯一产品，入围商务部、质检总局中欧地理标志协定谈判的地理标志产品清单 赣南脐橙富含人体所必需的各类营养成分，其富含钙、铁、磷、镁、钾、钠等元素。还含有维生素P、胡萝卜素、类胡萝卜素、(R)—柠檬油、香豆素、黄酮类化合物、柠檬苦素类似物、甘油糖脂质、吖啶酮、果胶等防癌物质。', '1', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('12', '冰糖橙', '150', '99', 'products/1/C20002.JPEG', '果实近圆形，橙红色，果皮光滑；单果重150～170克，可溶性固形物14.5％，糖含量12克/100毫升以上，酸含量0.6克/100毫升，味浓甜带清香，少核，3～4粒。', '0', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('13', '纽荷尔脐橙', '50', '49', 'products/1/C20003.JPEG', '果实圆形或短椭圆形，橙红色，剥离难，具清香味，果肉细嫩而脆，化渣，汁多，瓣9~13片，不甚整齐，汁胞橙黄色，排列整齐，果汁甜酸适囗，风味浓郁，品质上乘等。', '0', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('14', '血橙 ', '200', '168', 'products/1/C20004.JPEG', '血橙又名红肉，果肉粉红色，色泽均匀，有特殊香味，品质优，商品性好，极耐储存。', '0', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('15', ' 红江橙', '150', '138', 'products/1/C20005.jpg', '红江橙果大型好，皮薄光滑，肉质柔嫩，果肉橙红，鲜甜多汁 ，风味独特，红江橙被又称为\'国宴佳果\',为绿色食品，在国内被誉为人间仙果，在国外则被冠为中国橙王。', '0', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('16', '富硒脐橙', '99', '68', 'products/1/C20006.JPEG', '果香四溢 鲜嫩多汁 营养丰富 新鲜供应 原厂直销,含微量元素硒，硒是人类生命必需的微量元素', '0', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('17', '宜昌脐橙', '99', '58', 'products/1/C20007.JPEG', '秭归柑橘品质优良，风味独特，脐橙具有果大无核、皮薄、色鲜、肉脆汁多、香郁味甜的品质。其营养丰富，老少皆宜，是形、色、香、味俱佳的鲜食柑橘精品和纯天然保健果品。经测定，秭归脐橙可溶性固形物含量12-15%,每100毫升果汁中含糖11-13克、酸0.6-0.9克、维生素C50-60毫克，还富含蛋白质、无机盐、粗纤维、钙等多种营养成分。', '0', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('18', '卡拉卡拉脐橙', '198', '168', 'products/1/C20008.jpg', '卡拉卡拉脐橙（CaraCara），又名红肉脐橙，赣南脐橙，原产于委内瑞拉，为“948”项目引进品种。果实圆球形或近圆形，多为闭脐，无核，平均单果重190克左右，果面光滑，深橙色，果皮薄，囊瓣11～12瓣；可食率73.39/6，果汁率44.8%，可溶性固形物11.9%，糖含量9.07克/100毫升，酸含量1.07克/100毫升。固酸比11.12，糖酸比8.48，维生素C含量45.84毫克/100毫升。', '0', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('19', '塔罗科血橙 ', '100', '88', 'products/1/C20009.jpg', '脐橙的大小以70～85毫米为宜，不宜过大。果实越大，靠近果梗处越容易失水，损害脐橙的口感。 触摸脐橙表皮。要选择果皮薄、果面光滑、色泽好的脐橙，果皮的密集度高、均匀且有硬度的脐橙，所含水分也较高，最为可口。 ', '0', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('20', '琼中绿橙', '179', '138', 'products/1/C20010.jpg', '绿橙皮为绿色，肉为红色，看似尚未成熟，实则味甜汁多。此品种皮薄汁多、酸甜适中、化渣率高等优点。与普通的橙子比起来，其纤维更纤细，口感更好。', '1', '2017-03-27 20:18:00', '2');
INSERT INTO `product` VALUES ('21', '沙田柚', '100', '78', 'products/1/y30001.jpg', '沙田柚因广西容县沙田村最先种植故称做沙田柚。沙田柚不但营养价值高，而且还具有健胃、润肺、补血、清肠、利便、消食、解酒毒等功效。', '1', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('22', '平和蜜柚', '98', '88', 'products/1/y30002.JPEG', '琯溪蜜柚果大，1500—2000克，长卵形或梨形；果面淡黄色，皮薄；果肉质地柔软，汁多化渣，酸甜适中，种子少或无。每100ml果汁含糖9.17—11.6g，酸0.73—1.0g，维生素C 48.93—51.98mg，可溶性固形物10.7—11.6g。可食部分68%左右', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('23', '红心柚', '98', '68', 'products/1/y30003.JPEG', '处红柚果实大小适中\r\n\r\n，外观端正，锥圆形，单果重800～1000克，平均单果重870克；果实纵径12至15厘米，横径13至16厘米，果形指数0.96，果皮橙黄色，香气浓，厚0.5～1.0厘米，汁胞细，果面光滑，有光泽，果皮易剥离，海绵层淡红色，易与瓤瓣剥离，囊瓣12～15瓣，囊壁薄而红。果肉爽口、化渣，后味清新，少籽或无籽，果实可食率63.28%。', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('24', '梅州蜜柚', '98', '58', 'products/1/y30004.JPEG', '味道（密香爽甜、不带酸）、水分（晶莹脆嫩五渣）、营养（维生素C含量奇高，类胰岛素成分、果糖、微量元素）柚香迷人，甜美多汁。', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('25', '金柚', '123', '98', 'products/1/y30005.jpg', '金柚果汁中含可溶性固形物14%，高者16%，全糖12.68%，有机酸0. 368%，每100毫升果汁含维生素C104. 6毫克，较甜橙高2倍，较桔类高4倍，还含有蛋白质、脂肪及维生素B1、B2、E、P以及人体不可缺少的磷、钙、镁、硫、钠等矿质营养元素。中医认为金柚具有化痰止咳，消食块膈，主治孕妇食少、口淡、去胃中恶气，解酒毒，消除饮酒者口中的异味等功效。', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('26', '桔柚', '158', '128', 'products/1/y30006.JPEG', '果实扁圆形，紧实，果梗部略呈球形，果顶部平坦，果皮橙黄色，果面不太光滑，剥皮略难，同胡柚相近，带有橙香味，单果重300克左右、少核。果肉橙色，肉质柔软，固形物含量12.5%以上，含酸量0.5%以下。', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('27', '翡翠柚', '168', '138', 'products/1/y30007.jpg', '果实大小适中，果实近圆形，纵径12～15厘米，横径12～15厘米，单果重700～1000克，果实品质独特，果肉淡绿色，味甜汁多，维生素C含量丰富，品质优良。', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('28', '冰糖柚', '98', '78', 'products/1/y30008.jpg', '“安江冰糖柚”营养价值很高，含有非常丰富的蛋白质、有机酸及钙、磷、镁、钠等人体必需的元素，柚肉中还富含维生素c以及类胰岛素等成分，有降血糖、降血脂、减肥、美肤养颜等**。经常食用，对高血压、糖尿病、血管硬化等疾病有辅助**作用，对肥胖者有健体养颜功能。此外，柚肉含有生理活性物质皮甙，可降低血黏度，减少血栓的形成，因此对脑血管疾病也有较好的预防作用。', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('29', '垫江白柚', '148', '138', 'products/1/y30009.jpg', '湖南省湘西土家族苗族自治州保靖县供应柚子 垫江白柚，现在有货\r\n规格：单颗重：2斤以上 颜色：红心 包装：箱装 ', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('30', '胡柚', '188', '168', 'products/1/y30010.jpg', '胡柚果实美观，呈梨形，圆球形或扁球形，色泽金黄。单果重300克左右，皮厚约0.6cm,可食率约70%,可溶性固形物11-13.2％，富含多种维生素和人体所必需的16氨基酸以及磷、钾、铁、钙等元素，营养价值很高。其内质饱满，脆嫩多汁，酸甜适度，甘中微苦，鲜爽可口。并具有清凉祛火，镇咳化痰，降低血糖，润喉醒洒，养颜益寿等诸多药理**，是老少皆宜的集营养、美容、延年益寿于一体的纯天然保健食品。', '0', '2017-03-27 20:18:00', '3');
INSERT INTO `product` VALUES ('31', '黄金梨', '387', '186', 'products/1/L40001.jpg', '果实近圆形或稍扁，平均单果重250克，大果重500克。\r\n黄金梨\r\n黄金梨(9张)\r\n 不套袋果果皮黄绿色，贮藏后变为金黄色。套袋果果皮淡黄色，果面洁净，果点小而稀。果肉白色，肉质脆嫩，多汁，石细胞少，果心极小，可食率达95%以上，不套袋果可溶性固形物含量14%～16%，套袋果12%～15%，风味甜。', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('32', '皇冠梨', '387', '186', 'products/1/L40002.jpg', '果实椭圆，平均250克左右，果面黄白，果点小类似黄冠苹果。品质优：皮薄，肉厚，质细，松软多汁，风味酸甜适口且带蜜香，果核小，可食率高，石细胞少，可溶性固形物含量11.6%。', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('33', '酥梨', '387', '186', 'products/1/L40003.JPEG', '果实近圆柱形，顶部平截稍宽，平均单果重250克，大者可达1 000克以上；果皮绿黄色，贮后黄色；果点小而密；梗洼浅狭，中广有条锈式片锈；萼片多脱落；果心小；果肉白色，中粗，酥脆，汁多，味浓甜，有石细胞；含可溶性固形物11%-14%，可溶性糖7.35%，可滴定酸0.10%，维生素0.21毫克/百克。', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('34', '鸭梨', '387', '186', 'products/1/L40004.jpg', '皮薄核小，汁多味，石细胞极少，酸甜适中，清香绵长，脆而不腻，素有“天生甘露”之称。\r\n内含丰富的维生素C和钙、磷、铁等矿物质，在维生素B家族中堪称佼佼者，含糖量高达12%以上', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('35', '红香酥梨', '387', '186', 'products/1/L40005.JPEG', '果实长卵圆形或纺锤形，平均单果重200克，最大果重498克，果面洁净、光滑、果点大。果皮底色绿黄、阳面2/3鲜红色；果肉白色，肉质细嫩，石细胞少，汁多、味甘甜、香味浓。品质极上。', '1', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('36', '贵妃梨', '387', '186', 'products/1/L40006.JPEG', '果实中大，重约 150一200克，短纺锤形。果梗粗直，长3～7厘米，基部常膨大成肉质。萼片小，较浅，果皮绿黄色，果肉淡黄色，果心中大，靠近果心处石细胞较多，后熟后肉质半软，人口不溶，汁中多，味酸甜较淡，生食品质中等', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('37', '早酥梨', '387', '186', 'products/1/L40007.JPEG', '果实多呈卵圆形或长卵形，平均单果重约250克，大者可达700克；果皮黄绿或绿黄色，果面光滑，有光泽，并具棱状突起，果皮薄而脆；果点小，不明显；果心较小；果肉白色，质细，酥脆爽口，石细胞少，汁特多，味甜稍淡，含可溶性固形物11%～14%，可溶性糖7.23%，可滴定酸0.28%，维生素C 3.70毫克/百克，品质上。', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('38', '青梨', '387', '186', 'products/1/L40008.JPEG', '性凉味甘微酸，入肺、胃经，能生津润燥，清热化痰。主治热病伤津、热咳烦渴、惊狂、噎嗝、便秘等症，并可帮助消化、止咳化痰、滋阴润肺、解疮毒、酒毒等。', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('39', '金顶谢花酥梨', '387', '186', 'products/1/L40009.JPEG', '果实为近长圆形，果皮黄而微绿色，梗洼附近果点较大，周围间有突起，有放射状金黄色锈斑，果皮光滑，皮质较厚，果梗中粗，萼洼广而浅，萼片脱落或宿存；果肉白色、多汁、味甜。', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('40', '酸梨', '387', '186', 'products/1/L40010.JPEG', '梨含有蛋白质，脂肪，糖，粗纤维，钙、磷、铁等矿物质，多种维生素等。具有降低血压、养阴清热的功效，患高血压、心脏病、肝炎、肝硬化的病人，\r\n酸梨图片\r\n酸梨图片\r\n经常吃些梨大有益处；能促进食欲，帮助消化，并有利尿通便和解热作用，可用于高热时补充水分和营养。', '0', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('41', '苹果梨', '387', '186', 'products/1/L40011.jpg', '苹果梨的最大特点是甜酸适度营养丰富，口味鲜美香甜，果大肉多，肉色乳白细腻，质地脆而汁多，果核小，可食部分占85．9%，品质上乘。据分析，延边苹果梨含有丰富的维生素C、B1、B2等以及钙、磷、铁等成分，营养丰富，有润肺、消痰、止咳、降火、清心、利尿之功效，还能增进食欲、助消化，对体虚、津液不足者颇益。', '1', '2017-03-27 20:18:00', '4');
INSERT INTO `product` VALUES ('42', '红富士苹果', '899', '358', 'products/1/P50001.png', '体积很大，遍体通红，形状很圆，平均大小如棒球一般。果实的重量中，有9－11%是单糖，而且其果肉紧密，比其他很多苹果变种都要甜美和清脆，因此受到全世界消费者的广泛喜爱。富士苹果与其他苹果相比有更长的最佳食用日期，甚至无需放入冰箱保存。', '1', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('43', '嘎啦苹果', '899', '358', 'products/1/P50002.jpg', '果实中等大，单果重180—200克，短圆锥形，果面金黄色。阳面具浅红晕，有红色断续宽条纹，果型端正美观。果顶有五棱，果梗细长，果皮薄，有光泽。果肉浅黄色，肉质致密、细脆、汁多，味甜微酸，十分适口。品质上乘，较耐贮藏。', '0', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('44', '水晶富士 ', '899', '358', 'products/1/P50003.jpg', '富士苹果[1]  的特点是体积很大，遍体通红，形状很圆，平均大小如棒球一般。果实的重量中，有9－11%是单糖，而且其果肉紧密，比其他很多苹果变种都要甜美和清脆，因此受到全世界消费者的广泛喜爱。富士苹果与其他苹果相比有更长的最佳食用日期，甚至无需放入冰箱保存。', '1', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('45', '冰糖心苹果', '899', '358', 'products/1/P50004.JPEG', ' 面光滑细腻、色泽光亮自然。苹果的果核部分糖分堆积成透明状，形成了世界上独一无二的“糖心”红富士苹果。', '0', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('46', '寒富苹果', '899', '358', 'products/1/P50005.JPEG', '果实短圆锥形，果形端正，全面着鲜艳红色，特别是摘掉果袋经摘叶转果后，果色更美观。单果平均重250克以上，最大单果重已达900克，是目前苹果当中单果重最大品种之一。果肉淡黄色，肉质酥脆，汁多味浓，有香气，品质上，耐贮性强。', '0', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('47', '奶油富士', '899', '358', 'products/1/P50006.JPEG', '超薄的果皮内裹着白里带点嫩黄的果肉，奶香四溢。含糖量极高，糖分高，使果核部分的糖份堆积成透明状，由于低温状态下采摘，水份也特别充足，一口甜在心里，水润白嫩，看着都很有食欲。', '1', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('48', '花牛苹果', '899', '358', 'products/1/P50007.JPEG', '平均单果重260g左右；可溶性固形物含量12.5—14%；可滴定酸0.2-0.36%；去皮果肉硬度6.5kg/c㎡。“花牛”苹果果实圆锥形，全面鲜红或浓红，色泽艳丽，色相片红或条红色，果实着色度90—100%；果个整齐，果面光滑、亮洁；果形端正高桩、五棱突出明显，果形指数0.9—1.0；果肉黄白色，肉质细，致密，松脆，汁液多，风味独特，香气浓郁，口感好，品质上。', '0', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('49', '花冠苹果', '899', '358', 'products/1/P50008.JPEG', '体积很大，遍体通红，形状很圆，平均大小如棒球一般。', '0', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('50', '黄香蕉苹果', '899', '358', 'products/1/P50009.JPEG', '果形呈长圆锥形，斤果三个左右；成熟后果皮呈金苋，阳面带有红晕，皮薄无锈斑，有光泽；肉质细密，呈黄白色，汁液较多，味深醇香，甜酸适口。', '0', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('51', '高原苹果', '899', '358', 'products/1/P50010.JPEG', '体积很大，遍体通红，形状很圆，平均大小如棒球一般。', '1', '2017-03-27 20:18:00', '5');
INSERT INTO `product` VALUES ('52', '京欣西瓜', '997', '299', 'products/1/X60001.jpg', '瓜圆、肉厚、沙甜，个重。一般的重7至15斤，瓜皮一般的厚1.5厘米左右，是制作蜜饯的原料，用它加工而成的西瓜酱清淳甜美。', '0', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('53', '黑美人西瓜', '997', '299', 'products/1/X60002.JPEG', '皮色较浅，外观十分优美，果重2.5公斤左右。果肉红色肉质鲜嫩多汁，糖度高达14-15ºC左右。果实至瓜尾品质依然安定甜美，果皮薄而坚韧，特别耐贮运。', '1', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('54', '麒麟西瓜', '997', '299', 'products/1/X60003.JPEG', '果面深绿色，瓜瓤一般为粉红色，皮薄，瓜瓤脆嫩，口味沙甜多汁，含有丰富的矿物盐和多种维生素，不但能开胃口、助消化，又有很好的利尿作用，为消暑的佳品。新鲜的西瓜汁和鲜嫩的瓜皮能增加皮肤弹性，使人变的更年轻，减少皱纹，增添光泽。', '0', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('55', '双星西瓜', '997', '299', 'products/1/X60004.jpg', '单瓜重10-12公斤.果实正圆球形,果型极端正,无畸形果.果皮深绿色覆黑色均匀窄条纹,无乱条、无断条、外观美丽。皮薄、果皮坚韧不裂果，果肉大红、细甜脆爽，汁水丰多，不空心、不倒瓤、不水洇，极耐贮运。', '0', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('56', '硒砂瓜', '997', '299', 'products/1/X60005.jpg', '瓜个大皮厚、便于运输、果肉鲜红、果汁丰富、甘甜爽口、舒心如蜜，糖份含量高达13.8%。出产的瓜营养元素含量全面合理，其中：含人体必须的氨基酸18种，维生素3种、微量元素5种，其中含钙56mg/kg、钾1090mg/kg，特别是含有人体保健必需的硒（硒含量达到了0.0056mg/kg）和锌等微量元素，具有提高人体免疫力、抗衰老和防癌作用，因之得名“硒砂瓜”。中卫香山西瓜不使用任何化肥和农药，经国家绿色食品发展中心审查监测，产品质量完全符合绿色有机食品要求，被认证为A级绿色有机食品。', '0', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('57', '无籽西瓜', '997', '299', 'products/1/X60006.JPEG', '无籽，个大，皮薄', '1', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('58', '花皮无籽西瓜', '997', '299', 'products/1/X60007.JPEG', '果实高圆球形，果形指数1.06，单瓜重5～6公斤，果皮淡绿，上面均匀分布17条宽绿条纹，果皮厚度1.14厘米，果肉桃红，中心可溶性固形物含量12%。', '0', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('59', '地雷瓜', '997', '299', 'products/1/X60008.JPEG', '瓜圆形、花皮、皮薄、瓜皮韧性好；甜度高，水分足', '0', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('60', '小兰西瓜', '997', '299', 'products/1/X60009.JPEG', '果实为特小型，含糖量16度（属超高糖型），小型黄肉西瓜,皮色淡绿，底子青色霞条斑，瓤肉黄色晶亮，种小而少', '1', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('61', '墨童西瓜 ', '997', '299', 'products/1/X60010.JPEG', '果实圆形，黑皮有规则浅棱沟，表面有腊粉，外形独特美观，果肉鲜红，纤维少，汁多味甜，质细爽口。中心糖含量11.5%~12%，边延梯度小，无籽性好。皮厚0.8厘米，平均单果重2.0~2.5公斤。', '0', '2017-03-27 20:18:00', '6');
INSERT INTO `product` VALUES ('62', '绿宝甜瓜', '198', '83.16', 'products/1/T70001.jpg', '果实的颜色为绿色，近似圆苹果型，果皮平滑，果肉色绿，肉厚，有香甜味；种子表面光滑。', '1', '2017-03-27 20:18:00', '7');
INSERT INTO `product` VALUES ('63', '羊角脆甜瓜', '198', '83.16', 'products/1/T70002.jpg', '果实成灰白色，淡绿，瓜瓤桔黄色，果长25厘米左右，单瓜重1－2公斤，肉厚2厘米左右，含糖量高，香甜度可达20－26度，口感独特，味香，质脆。', '1', '2017-03-27 20:18:00', '7');
INSERT INTO `product` VALUES ('64', '早雪', '198', '83.16', 'products/1/T70003.JPEG', '皮色为白皮，带着皮一块吃。 含糖量比较高，15.16 个糖量，风味好甜度大。果形400-600 克，适合市场需要。', '0', '2017-03-27 20:18:00', '7');
INSERT INTO `product` VALUES ('65', '牛奶甜瓜', '198', '83.16', 'products/1/T70004.jpg', '瓜皮红褐色，甜的  。', '1', '2017-03-27 20:18:00', '7');
INSERT INTO `product` VALUES ('66', '丰田瓜', '198', '83.16', 'products/1/T70005.jpg', '含有多种人体所需的营养成分和有益物质,如果糖、葡萄糖、维生素C、有机酸、氨基酸以及钙、磷、铁等矿物质，清明前后大批量上市，单个果重1.8-2.2斤左右，肉质脆爽，风味清香纯正', '0', '2017-03-27 20:18:00', '7');
INSERT INTO `product` VALUES ('67', '白皮红肉', '198', '83.16', 'products/1/T70006.JPEG', '皮白似雪，肉红似血，糖份极高', '1', '2017-03-27 20:18:00', '7');
INSERT INTO `product` VALUES ('68', '喻屯甜瓜', '198', '83.16', 'products/1/T70007.JPEG', '含有苹果酸、葡萄糖、氨基酸、甜菜茄、维生素C等，且含量丰富，而且香瓜对感染性高烧、口渴等症状都有很好的疗效，夏季多吃香瓜很不错的。', '1', '2017-03-27 20:18:00', '7');
INSERT INTO `product` VALUES ('69', '花姑娘甜瓜', '198', '83.16', 'products/1/T70008.JPEG', '花皮甜瓜，含有大量的碳水化合物及柠檬酸等物质，且香瓜的水分充沛，有消暑清热、生津解渴、除烦的效果;', '1', '2017-03-27 20:18:00', '7');
INSERT INTO `product` VALUES ('70', '红皮甜瓜', '198', '83.16', 'products/1/T70009.JPEG', '香瓜的营养丰富，含糖量较高，可补充人体所需的能量及营养素。', '0', '2017-03-27 20:18:00', '7');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `addr` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

