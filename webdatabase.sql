/*
 Navicat Premium Data Transfer

 Source Server         : MySQL01
 Source Server Type    : MySQL
 Source Server Version : 50740
 Source Host           : localhost:3306
 Source Schema         : webdatabase

 Target Server Type    : MySQL
 Target Server Version : 50740
 File Encoding         : 65001

 Date: 22/05/2023 17:16:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NULL DEFAULT NULL,
  `fname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fpic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fprice` int(11) NOT NULL,
  `forder` int(11) NULL DEFAULT 1 COMMENT '美食排序',
  `fdesc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fregtime` date NOT NULL,
  PRIMARY KEY (`fid`) USING BTREE,
  INDEX `tid`(`tid`) USING BTREE,
  CONSTRAINT `tid` FOREIGN KEY (`tid`) REFERENCES `ftype` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, 32, '虾皮萝卜丝汤', '52da1ae8a9375.jpg', 14, 1, '清淡的虾皮萝卜丝汤!作为最流行的夏季汤品，逐渐走入大家的心中。清淡的萝卜丝配上淡味的虾皮，将百煮的浓汤浇在汤面上，一碗清淡爽口的虾皮萝卜丝汤出锅了', '2023-05-07');
INSERT INTO `food` VALUES (2, 32, '白蛤蒸蛋', '52da147fc29fb.jpg', 15, 2, '白蛤蒸蛋　洗净的白蛤经过腌制，放入到新鲜的鸡蛋中，加上各种调味品。海鲜加鸡蛋，不仅美味而且营养价值高，对于害怕海鲜腥味的朋友也可以品尝。', '2023-05-07');
INSERT INTO `food` VALUES (3, 26, '梅子茶泡饭', '52da0feb79de3.jpg', 10, 5, '梅子茶泡饭 喜欢饭泡水的朋友，一定不能错过，汤水微有酸甜味，米饭软硬适中，是快速餐饮，解饿充饥的首选', '2023-05-07');
INSERT INTO `food` VALUES (4, 15, '水煮肉片', '52da0e14dce6a.jpg', 30, 4, '水煮肉片 使用小米辣椒，辣而不辛，肉片爽滑，轻嚼即化，不油腻，爱吃辣的朋友绝对不能错过', '2023-05-07');
INSERT INTO `food` VALUES (5, 15, '香酥小肉丸', '52fcef7a7ab06.jpg', 20, 2, '香酥小肉丸  不油腻，外层酥脆，内层肉质松软', '2023-05-07');
INSERT INTO `food` VALUES (6, 38, '蓝莓味冰激凌', '52da0a1841e10.jpg', 5, 1, '蓝莓味冰激凌  细细的沙冰上面，浇上酸甜可口的蓝莓糖浆，大大的一杯，清凉爽口，是夏季解暑的上佳单品。', '2023-05-07');
INSERT INTO `food` VALUES (7, 33, '酸辣白菜粉丝', '52da1b7bbfe87.jpg', 9, 1, '酸辣白菜粉丝  喜欢吃酸的朋友绝对喜欢这道菜，使用传统手法腌制的酸菜，配上爽口的粉丝，将酸爽融为一体，加上少许的辣椒后，酸中微微带辣，绝对够味', '2023-05-07');
INSERT INTO `food` VALUES (8, 33, '香辣牛肉面', '52da1db1dd3b6.jpg', 8, 10, '香辣牛肉面  麻辣鲜香集为一体，各种调味品加以烹饪，面质劲道，汤味鲜辣，加上爽滑牛肉，就是这个味儿。', '2023-05-07');
INSERT INTO `food` VALUES (9, 40, '苹果橙汁', '52fceb99d6f92.jpg', 5, 1, '新鲜的苹果和橙子，现榨现送。', '2023-05-07');
INSERT INTO `food` VALUES (10, 14, '冰爽柠檬汁', '52fc1e482e4e2.jpg', 6, 1, '温馨雅室正阳春，宾至如归笑语频。<br>冷气舒身身解暑，热茶润口口生津。<br>兰芽雀舌今之贵，凤饼龙团古所珍。<br>绿韵悠悠今胜古，香茗似酒醉游人。', '2023-05-07');
INSERT INTO `food` VALUES (11, 14, '冰镇青柠苏打水', '52fc1e9874cec.jpg', 4, 1, '温馨雅室正阳春，宾至如归笑语频。<br>冷气舒身身解暑，热茶润口口生津。<br>兰芽雀舌今之贵，凤饼龙团古所珍。<br>绿韵悠悠今胜古，香茗似酒醉游人。', '2023-05-07');
INSERT INTO `food` VALUES (12, 25, '酸妞面包', '52fced755d4a1.jpg', 8, 1, '酸妞面包  甜甜的面包，加上少许的酸粉，是早餐、开胃的甜点佳品', '2023-05-07');
INSERT INTO `food` VALUES (13, 43, '拉罐汽水', '52fc1fea98afd.jpg', 5, 1, '细雨斜风作小寒， <br>淡烟疏柳媚晴滩. <br>入淮清洛渐漫漫， <br>雪沫乳花浮午盏.<br>蓼茸蒿笋试春盘,<br>人间有味是清欢.', '2023-05-07');
INSERT INTO `food` VALUES (14, 32, '四物番鸭汤', '52fcee55f24eb.jpg', 10, 1, '四物番鸭汤  是美容滋补的上好单品', '2023-05-07');
INSERT INTO `food` VALUES (15, 40, '鲜榨草莓汁', '52fc206e27500.jpg', 6, 1, '细雨斜风作小寒， <br>淡烟疏柳媚晴滩. <br>入淮清洛渐漫漫， <br>雪沫乳花浮午盏.<br>蓼茸蒿笋试春盘,<br>人间有味是清欢.', '2023-05-07');
INSERT INTO `food` VALUES (16, 40, '鲜榨木瓜奶', '52fc20a9458c6.jpg', 6, 1, '细雨斜风作小寒， <br>淡烟疏柳媚晴滩. <br>入淮清洛渐漫漫， <br>雪沫乳花浮午盏.<br>蓼茸蒿笋试春盘,<br>人间有味是清欢.', '2023-05-07');
INSERT INTO `food` VALUES (17, 25, '冰沙餐饮', '52fc22baeccf5.jpg', 8, 1, '天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。<br>形美味浓鲜果珍，健脾润肺九州闻。<br>产销两旺年超亿，绿色“香田”出国门。', '2023-05-07');
INSERT INTO `food` VALUES (18, 40, '五彩水果汁', '52fc27a7f3f6b.jpg', 10, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (19, 25, '火山冰沙', '52fc233ad861d.jpg', 10, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (20, 41, '蓝莓酱沙冰', '52fc23ba2900e.jpg', 0, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (21, 15, '粉蒸牛肉', '52fc3b2132278.jpg', 40, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (22, 25, '水果魔方', '52fc24512e9c1.jpg', 10, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (23, 25, '巧克力樱桃甜点', '52fc24878e2f1.jpg', 10, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (24, 25, '树莓香草雪糕', '52fc24bfd5442.jpg', 8, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (25, 25, '水果沙拉', '52fc24e7d52e6.jpg', 10, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (26, 42, '西瓜芒果奶昔', '52fc2513180f3.jpg', 10, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (27, 25, '水晶草莓', '52fc2553d94d3.jpg', 8, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (28, 37, '拉花咖啡', '52fc27e146137.jpg', 10, 1, '濒危物种叹珍稀，繁育放流举世奇。<br>翘企明年鱼上市，佳肴佐酒欲涎垂。<br>天然食品神，返扑又归真。绿色无污染，清醇可健身。<br>田畴千里碧，棚室四时春。淡饭粗茶饱，青蔬弥足珍。', '2023-05-07');
INSERT INTO `food` VALUES (29, 15, '椒香口水手撕鸡', '52fc3b7fe2e8c.jpg', 35, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (30, 15, '歌乐山辣子鸡', '52fc3bad1708a.jpg', 35, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (31, 15, '宫保鸡丁', '52fc3bd4d7b9c.jpg', 36, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (32, 15, '崂山蘑菇毽子肉', '52fc3c2872a3a.jpg', 40, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (33, 15, '老成都鸡米芽菜', '52fc3c674077e.jpg', 40, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (34, 15, '蚂蚁上树', '52fc3c8e9cb23.jpg', 39, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (35, 15, '松仁扒脆皖鱼', '52fc3ce075f0c.jpg', 40, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (36, 15, '万喜八宝烟熏肠', '52fc3d2cd68ec.jpg', 35, 1, '此州乃竹乡，春笋满山谷。<br>山夫折盈抱，抱来早市鬻。<br>物以多为贱，双钱易一束。<br>置之炊甑中，与饭同时熟。<br>紫箨坼故锦，素肌掰新玉。<br>每日遂加餐，经时不思肉。<br>久为京洛客，此味常不足。<br>且食勿踟蹰，南风吹作竹。', '2023-05-07');
INSERT INTO `food` VALUES (37, 31, '中药鸡汤', '52fc3db2cfc13.jpg', 39, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。<br>暂借垂莲十分盏，一浇空腹五车书。<br>青浮卵碗槐芽饼，红点冰盘藿叶鱼。<br>细雨斜风作小寒， <br>淡烟疏柳媚晴滩. <br>入淮清洛渐漫漫， <br>雪沫乳花浮午盏.<br>蓼茸蒿笋试春盘,<br>人间有味是清欢.', '2023-05-07');
INSERT INTO `food` VALUES (38, 44, '韩国火锅', '52fc3f1620ef9.jpg', 45, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (39, 45, '特质砂锅', '52fc3f77e6e20.jpg', 45, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (40, 46, '经典火锅', '52fc3fac1853e.jpg', 45, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (41, 26, '大虾牛腩饭', '52fc40de9d72f.jpg', 20, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (42, 26, '海参牛腩饭', '52fc410a53153.jpg', 25, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (43, 26, '金针菇肥牛盖饭', '52fc4130ce1c5.jpg', 20, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (44, 48, '美味盖鱼饭', '52fc415b1ffbb.jpg', 20, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (45, 19, '金光四溢', '52fc8eaf149fc.jpg', 30, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (46, 22, '红烧茄子', '52fc8ee8618c3.jpg', 35, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (47, 23, '红烧鸡腿', '52fc8f110d265.jpg', 50, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (48, 21, '青春如虹', '52fc8f76d4a6e.jpg', 25, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (49, 59, '烧麦', '52fc8fa12a233.jpg', 15, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (50, 27, '草莓小虾', '52fc8fdcd8fc1.jpg', 35, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (51, 27, '千层豆腐', '52fc901433aa4.jpg', 30, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (52, 49, '韩国泡饭', '52fc95f53ac02.jpg', 20, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (53, 50, '喜沙肉盖饭', '52fc964ad89de.jpg', 20, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (54, 55, '黄金盖饭', '52fc9682bb47d.jpg', 18, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (55, 57, '豆饼面条', '52fc96c751a2d.jpg', 15, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (56, 57, '清淡面条', '52fc96fad99fc.jpg', 13, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (57, 58, '海绵宝宝', '52fc972152868.jpg', 5, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (58, 59, '寿司拼盘', '52fc975e311c0.jpg', 20, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (59, 28, '碳烤生蚝', '52fc978d44a54.jpg', 20, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (60, 60, '鲜虾米线', '52fc97c9e34b7.jpg', 15, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');
INSERT INTO `food` VALUES (61, 19, '秘制翅扇贝', '52fc98252b588.jpg', 30, 1, '枇杷已熟粲金珠，桑落初尝滟玉蛆。', '2023-05-07');

-- ----------------------------
-- Table structure for ftype
-- ----------------------------
DROP TABLE IF EXISTS `ftype`;
CREATE TABLE `ftype`  (
  `tid` int(11) NOT NULL,
  `tname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ftype
-- ----------------------------
INSERT INTO `ftype` VALUES (14, '冰饮');
INSERT INTO `ftype` VALUES (15, '川菜');
INSERT INTO `ftype` VALUES (19, '湘菜');
INSERT INTO `ftype` VALUES (21, '浙菜');
INSERT INTO `ftype` VALUES (22, '京菜');
INSERT INTO `ftype` VALUES (23, '东北风味');
INSERT INTO `ftype` VALUES (25, '甜品');
INSERT INTO `ftype` VALUES (26, '中式盖饭');
INSERT INTO `ftype` VALUES (27, '家常菜');
INSERT INTO `ftype` VALUES (28, '日本锄烧火锅');
INSERT INTO `ftype` VALUES (29, '四川火锅');
INSERT INTO `ftype` VALUES (30, '重庆火锅');
INSERT INTO `ftype` VALUES (31, '养生');
INSERT INTO `ftype` VALUES (32, '滋补');
INSERT INTO `ftype` VALUES (33, '米粉');
INSERT INTO `ftype` VALUES (37, '咖啡');
INSERT INTO `ftype` VALUES (38, '冰淇淋');
INSERT INTO `ftype` VALUES (39, '啤酒');
INSERT INTO `ftype` VALUES (40, '果汁');
INSERT INTO `ftype` VALUES (41, '冰沙');
INSERT INTO `ftype` VALUES (42, '奶昔');
INSERT INTO `ftype` VALUES (43, '汽水');
INSERT INTO `ftype` VALUES (44, '韩国火锅');
INSERT INTO `ftype` VALUES (45, '特质砂锅');
INSERT INTO `ftype` VALUES (46, '经典火锅');
INSERT INTO `ftype` VALUES (47, '创新火锅');
INSERT INTO `ftype` VALUES (48, '日式盖饭');
INSERT INTO `ftype` VALUES (49, '韩国泡饭');
INSERT INTO `ftype` VALUES (50, '家常盖饭');
INSERT INTO `ftype` VALUES (52, '安神');
INSERT INTO `ftype` VALUES (53, '保健');
INSERT INTO `ftype` VALUES (55, '经典盖饭');
INSERT INTO `ftype` VALUES (56, '聚气');
INSERT INTO `ftype` VALUES (57, '面条');
INSERT INTO `ftype` VALUES (58, '蛋糕');
INSERT INTO `ftype` VALUES (59, '馒头');
INSERT INTO `ftype` VALUES (60, '过桥米线');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `userpwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES (1, 'admin', 'admin');
INSERT INTO `userinfo` VALUES (2, 'zhangsan', 'zhangsan');
INSERT INTO `userinfo` VALUES (3, 'lisi', 'lisi');
INSERT INTO `userinfo` VALUES (4, 'wangwu', 'wangwu');
INSERT INTO `userinfo` VALUES (5, 'zhaoliu', 'zhaoliu');
INSERT INTO `userinfo` VALUES (6, '111', '111');
INSERT INTO `userinfo` VALUES (8, '1', '1');
INSERT INTO `userinfo` VALUES (9, '2', '2');
INSERT INTO `userinfo` VALUES (17, '4', '4');

SET FOREIGN_KEY_CHECKS = 1;
