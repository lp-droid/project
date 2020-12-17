/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : shop_db

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2020-12-10 16:28:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '轮播图id',
  `title` varchar(50) NOT NULL COMMENT '轮播图标题',
  `img` varchar(255) NOT NULL COMMENT '轮播图图片地址',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='轮播图表';

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '轮播图1', '/uploads/banner/8f581960-7033-11ea-90dd-3b8abd26afb2.jpg', '1');
INSERT INTO `banner` VALUES ('2', '轮播图2', '/uploads/banner/972ca570-7033-11ea-90dd-3b8abd26afb2.jpg', '1');

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '购物车主键',
  `uid` varchar(50) NOT NULL COMMENT '用户id',
  `goodsid` int(11) NOT NULL COMMENT '商品编号',
  `num` tinyint(3) NOT NULL COMMENT '数量',
  `status` tinyint(1) NOT NULL COMMENT '是否上架 1上架 0下架',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`,`goodsid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='购物车表';

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('22', '5c577f10-fec2-11ea-aad5-f58168b46cbb', '5', '1', '1');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号',
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级分类编号',
  `catename` varchar(50) NOT NULL COMMENT '分类名称',
  `img` varchar(255) NOT NULL COMMENT '分类图片',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品分类表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '0', '家用电器', '', '1');
INSERT INTO `category` VALUES ('2', '0', '手机通讯', '', '1');
INSERT INTO `category` VALUES ('3', '0', '电脑办公', '', '1');
INSERT INTO `category` VALUES ('4', '0', '家居', '', '1');
INSERT INTO `category` VALUES ('5', '0', '服装', '', '1');
INSERT INTO `category` VALUES ('7', '1', '电视', '/uploads/category/fc3abc50-6c2c-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('8', '1', '空调', '/uploads/category/354b31f0-6c2d-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('9', '1', '洗衣机', '/uploads/category/436e9470-6c2d-11ea-b86c-579aced212c2.jpg', '1');
INSERT INTO `category` VALUES ('10', '2', '诺基亚手机', '/uploads/category/fee7e580-6c2d-11ea-b86c-579aced212c2.png', '1');
INSERT INTO `category` VALUES ('11', '3', '笔记本', '/uploads/category/ddb0b9f0-6de0-11ea-a8e1-0d680bf54839.jpg', '1');
INSERT INTO `category` VALUES ('12', '2', '手机配件', '/uploads/category/764b6740-9673-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('13', '2', '小米手机', '/uploads/category/91238110-9673-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('14', '2', 'oppo手机', '/uploads/category/5f200c50-9674-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('15', '3', 'mac本', '/uploads/category/86b1e680-9674-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('16', '3', '华为笔记本', '/uploads/category/a740dc80-9674-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('17', '3', '戴尔笔记本', '/uploads/category/b63aeff0-9674-11ea-b348-a734901db180.jpg', '1');
INSERT INTO `category` VALUES ('18', '0', '男鞋', '', '1');
INSERT INTO `category` VALUES ('19', '0', '女鞋', '', '1');
INSERT INTO `category` VALUES ('20', '0', '化妆品', '', '1');
INSERT INTO `category` VALUES ('21', '0', '运动户外', '', '1');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品编号',
  `first_cateid` smallint(5) unsigned NOT NULL COMMENT '一级分类编号',
  `second_cateid` smallint(6) NOT NULL COMMENT '二级分类编号',
  `goodsname` varchar(100) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `market_price` decimal(10,2) NOT NULL COMMENT '市场价格',
  `img` varchar(255) NOT NULL COMMENT '商品图片',
  `description` text COMMENT '商品描述',
  `specsid` int(11) NOT NULL COMMENT '规格id',
  `specsattr` varchar(255) NOT NULL COMMENT '规则属性值',
  `isnew` tinyint(1) NOT NULL COMMENT '是否新品1是2不是',
  `ishot` tinyint(1) NOT NULL COMMENT '是否热卖1是2不是',
  `status` tinyint(1) NOT NULL COMMENT '状态1启用2禁用',
  `number` tinyint(5) NOT NULL DEFAULT '100' COMMENT '商品库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品表';

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '2', '10', '小米10', '3999.00', '3999.00', '/uploads/fa5c2790-6c48-11ea-b894-9bd516f4e52e.jpg', '<p>　　<img src=\"https://2a.zol-img.com.cn/product/203_320x240/46/ceO5UTMmNZBhY.jpg\" style=\"max-width: 100%;\"></p><p>现在的手机已经进入智能时代，诺基亚也推出了很多智能机型。像lumia920、1020、930和830。都可以说是诺基亚的经典机型。人们大多数认识windows phone不是通过微软，而是通过诺基亚。可以说诺基亚的智能手机成为windows phone的代名词。</p><p>　　诺基亚920可以说是诺基亚的旗舰机型，也是小编认识诺基亚的第一款机型，诺基亚的工业造型带给小编震撼是其他手机从没有的。诺基亚920采用的2.5d玻璃和深色的金属按键，显得更加有质感更加有设计感。至于手机系统方面并没有太多可说的，windows phone的流畅是没得说的。</p><center><p></p></center><p>　　说到诺基亚就不得不说诺基亚的拍照功能，诺基亚手机的拍照性能可以说是智能手机领域中的佼佼者，而在诺基亚中要说拍照非诺基亚1020莫属，这是一款主打拍照的手机，采用了4100万的蔡司认证的摄像头，在拍照功能上完全能够秒杀一些普通的微型单反，我相信买这款手机的没有一个不是冲着4100万的摄像头去的。</p><center><p></p></center><p>　　诺基亚最近的两部旗舰机型lumia930和lumia830也是不错的，在造型方面lumia930和lumia830是非常相似的，在正面摆放的时候不仔细看很难分辨出lumia930和lumia830有什么区别，最大的区别就是摄像头那个奥利奥了。在性能上面lumia930可以说是lumia830的升级版。这两款手机的金属边框的设计是小编非常喜欢的，但是金属边框也带来了不便，就是金属边框的导热很快，在长时间使用后容易烫手。</p>', '3', '白色,黑色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('2', '3', '11', '联想小新', '4499.00', '4699.00', '/uploads/2747d670-6de1-11ea-a8e1-0d680bf54839.jpg', '<p><img src=\"https://img30.360buyimg.com/sku/jfs/t1/92075/21/15594/69153/5e7332afE99041ba5/6796969792546bcf.jpg\" style=\"max-width:100%;\"><br></p><p>目前，市面上的联想笔记本主要可分为三大系列——联想3000系列(以低廉的价格为卖点，主攻个人消费类市场)、联想IdeaPad系列(以出色的影音娱乐功能为卖点，主攻个人消费类市场)和联想昭阳系列(以优秀的机身设计为卖点，主攻商务办公市场)。</p><p>　　联想3000系列包括：G530(超值娱乐)、G430(超值经典)和G230(超值便携)。其中，G530还分为G530M和G530A;G430还分为G430L、G430M和G430A;G230只有一种G230G。</p><p>　　一般来说，我们将G530M、G530A、G430L、G430M、G430A和G230G称为主型号。在主型号后面有一条小横线，在横线后面还有一组字母，我们将这组字母称为副型号。副型号的第一位字母可以看出处理器属于什么类型(P就是PXXXX系列处理器，T就是TXXX系列处理器);第二位和第三位字母是处理器型号第一位数字的英文缩写(TH是3、FO是4、FI是5、SI是6、SE是7，EI是8)。</p><p>　　从总的产品线来看，联想ideaPad笔记本又可进一步细分为三大系列：</p><p>　　Y系列：Y330、Y430，Y530、Y730，主要定位于主流消费者，经济实惠，性价比十分突出。</p><p>　　U系列：U8、U110、U330，主要定位于超轻薄机型，价格略微偏高。</p><p>　　S系列：S9、S10，这系列笔记本就是所谓的“上网本”，价格低廉、小巧便携，但性能很弱。</p><p>　　以上所有型号中的第一位数字，都代表这款本本的屏幕尺寸，比如Y730当中的7代表的17英寸,Y430当中的4代表14.1英寸,U110当中的1代表11.1英寸。而最后两位数字则代表这是第几代产品，也就是代表硬件配置的升级。比如当Y510退市后，接替它的就是Y530，今后还会有Y540、Y550等等。不过U8、S9和S10是例外，因为它们的配置相对不会有太多变动。</p>', '3', '白色', '1', '2', '1', '100');
INSERT INTO `goods` VALUES ('3', '2', '10', '荣耀9X', '1299.00', '1399.00', '/uploads/d6a0eff0-70be-11ea-91a2-9395060d7390.jpg', '<p><img src=\"https://res0.vmallres.com/pimages//product/6901443398027/428_428_C5B3EEB31BA081CF605FE04A1118DEF332F4C3003CC60ECEmp.png\" style=\"max-width:100%;\"><br></p><p>超感知徕卡五摄：5000万像素超感知摄像头（广角， f/1.9光圈，OIS光学防抖） + 4000万像素电影摄像头（超广角，f/1.8光圈） +  800万像素超级变焦摄像头（10倍光学变焦，f/4.4光圈，OIS光学防抖） + 800万像素长焦摄像头（3倍光学变焦，f/2.4光圈，OIS光学防抖） + 3D深感摄像头&nbsp;&nbsp;</p><p>景深摄像头同时支持红外解锁功能，不同拍照模式的照片像素可能有差异，请以实际为准。&nbsp;&nbsp;<br></p>', '3', '白色', '1', '2', '1', '100');
INSERT INTO `goods` VALUES ('4', '2', '10', '华为matep30', '3999.00', '4999.00', '/uploads/fb704ec0-70be-11ea-91a2-9395060d7390.jpg', '<p><img src=\"https://res.vmallres.com/pimages/detailImg/2020/05/30/9B15103812CAB45D51285E9E6917074DE09DE5F19E2F0798.jpg\" style=\"max-width:100%;\"><br></p><p>不同拍照模式的照片像素可能有差异，请以实际为准。&nbsp;&nbsp;<br></p>', '3', '黑色', '2', '2', '1', '100');
INSERT INTO `goods` VALUES ('5', '3', '11', '华为MateBook13', '4299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '<p><img src=\"https://res.vmallres.com/pimages/detailImg/2020/08/17/596A83EB91276F6C3350F35DFD96F363B6DC6D8677DE9C0D.jpg\" style=\"max-width:100%;\"><br></p><p><img src=\"https://res.vmallres.com/pimages/detailImg/2020/08/17/889C99B8A980F2A5F073C130DD431E2339427DEA79B67BBB.jpg\" style=\"max-width:100%;\"><br></p>', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('6', '3', '11', '华为MateBook14', '5299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('7', '3', '11', '华为MateBook15', '6299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '<p><img src=\"https://res.vmallres.com/pimages//product/6901443407224//428_428_3902B07CFCF23A955D3BF09823304B91BFCF9973436C427Dmp.png\" style=\"max-width:100%;\"><br></p><p>受产品配置和制造工艺影响，实际机身尺寸或有差异，请以实物为准&nbsp;&nbsp;<br></p>', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('8', '3', '11', '华为MateBook16', '7299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '<p><img src=\"https://res.vmallres.com/pimages/detailImg/2020/07/31/ED39D29316FB0058808EE52B6F2B2E238E67052456A02BEB.jpg\" style=\"max-width:100%;\"><br></p>', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('9', '3', '11', '华为MateBook17', '8299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '<p><img src=\"https://res.vmallres.com/pimages/detailImg/2020/07/27/1C12C22462F76A346A4D9FAEDEF0CE9EE1BDE96312A98718.jpg\" style=\"max-width:100%;\"><br></p>', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('10', '3', '11', '华为MateBook18', '9299.00', '4597.00', '/uploads/1faae7a0-70bf-11ea-91a2-9395060d7390.jpg', '<p><img src=\"https://res.vmallres.com/pimages/detailImg/2020/07/27/7D8B001A3A990674116B373212552C6A75E88A1957445D06.jpg\" style=\"max-width:100%;\"><br></p>', '3', '白色', '2', '1', '1', '100');
INSERT INTO `goods` VALUES ('11', '3', '11', '华为笔记本', '5000.00', '6000.00', '/uploads/2a61cc70-d8a4-11ea-b018-b35815b27deb.jpg', '<p>不错的商品<img src=\"https://res.vmallres.com/pimages/detailImg/2020/07/27/7C00FDD3B8CD815AA939EBD5836289F476360F7169CACABF.jpg\" style=\"max-width: 100%;\"></p>', '5', '55英寸', '1', '2', '1', '100');
INSERT INTO `goods` VALUES ('12', '3', '11', '小米笔记本', '2003.00', '2222.00', '/uploads/43eaf810-d8a4-11ea-b018-b35815b27deb.jpg', '<p>不错的手机</p>', '5', '55英寸', '1', '2', '1', '100');
INSERT INTO `goods` VALUES ('13', '3', '11', '华为(HUAWEI)MateBook 13 2020款全面屏轻薄性能笔记本电脑 十代酷睿(i5 16G 512G MX250 触控屏 多屏协同)银', '5899.00', '5997.00', '/uploads/1f7ac4a0-ea89-11ea-a252-4dda8d645e29.png', '<p><img src=\"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/ab34717e664e8a21ee33549fcb623198.jpg\" style=\"max-width:100%;\"><img src=\"https://cdn.cnbj1.fds.api.mi-img.com/mi-mall/7d143d29cd749a4e5cfe221b28aeab7a.jpg\" style=\"max-width: 100%;\"><br></p>', '3', '黑色,白色', '1', '1', '1', '100');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL COMMENT '用户编号',
  `phone` char(11) NOT NULL COMMENT '手机号',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '密码',
  `randstr` char(5) NOT NULL DEFAULT '' COMMENT '密码随机串',
  `addtime` char(13) NOT NULL COMMENT '注册时间',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员表';

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('2', '2be08210-70fa-11ea-9c17-a5b3f9b0d2ba', '18811112222', '小U', '', 'O6ImO', '1585403036849', '1');
INSERT INTO `member` VALUES ('3', 'cf431060-94e2-11ea-a222-2d7506ebb3ac', '13716052241', '', '', '', '1589351244904', '1');
INSERT INTO `member` VALUES ('4', '7c947070-c5ca-11ea-836c-39c3b7b2c413', '13716052244', '', '', '', '1594728405240', '1');
INSERT INTO `member` VALUES ('5', 'ee980fb0-c5ca-11ea-9202-0b2e8b6924b0', '13716052245', '', '', '', '1594728596528', '1');
INSERT INTO `member` VALUES ('6', '5c577f10-fec2-11ea-aad5-f58168b46cbb', '18301682292', '', '', '', '1600992131459', '1');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单编号',
  `pid` smallint(6) NOT NULL COMMENT '上级菜单编号',
  `title` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(100) NOT NULL COMMENT '菜单图标',
  `type` tinyint(1) NOT NULL COMMENT '菜单类型1目录2菜单',
  `url` varchar(100) NOT NULL COMMENT '菜单地址',
  `status` tinyint(1) NOT NULL COMMENT '菜单状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单权限表';

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '0', '系统设置', 'el-icon-setting', '1', '', '1');
INSERT INTO `menu` VALUES ('2', '1', '菜单管理', '', '2', '/menu', '1');
INSERT INTO `menu` VALUES ('3', '1', '角色管理', '', '2', '/role', '1');
INSERT INTO `menu` VALUES ('7', '1', '管理员管理', '', '2', '/user', '1');
INSERT INTO `menu` VALUES ('8', '0', '商城管理', 'el-icon-s-goods', '1', '', '1');
INSERT INTO `menu` VALUES ('9', '8', '商品分类', '', '2', '/category', '1');
INSERT INTO `menu` VALUES ('10', '8', '商品规格', '', '2', '/specs', '1');
INSERT INTO `menu` VALUES ('11', '8', '商品管理', '', '2', '/goods', '1');
INSERT INTO `menu` VALUES ('12', '8', '会员管理', '', '2', '/member', '1');
INSERT INTO `menu` VALUES ('14', '8', '轮播图管理', '', '2', '/banner', '1');
INSERT INTO `menu` VALUES ('15', '8', '秒杀活动', '', '2', '/seckill', '1');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL COMMENT '会员id',
  `orderid` int(11) DEFAULT NULL COMMENT '主订单id',
  `goodsid` int(11) DEFAULT NULL COMMENT '商品id',
  `num` tinyint(3) DEFAULT NULL COMMENT '购买的商品数量',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('84', '5c577f10-fec2-11ea-aad5-f58168b46cbb', '77', '1', '2');
INSERT INTO `orders` VALUES ('85', '5c577f10-fec2-11ea-aad5-f58168b46cbb', '77', '2', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色编号',
  `rolename` varchar(100) NOT NULL COMMENT '角色名称',
  `menus` varchar(255) NOT NULL COMMENT '菜单权限 存放的是菜单编号，用逗号隔开',
  `status` tinyint(1) NOT NULL COMMENT '角色状态1正常2禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台用户角色表';

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('3', '系统管理员', '1,2,3,7,8,9,10,11,12,13,14,15', '1');
INSERT INTO `role` VALUES ('4', '客服专员', '8,9,10,11,12,13', '1');

-- ----------------------------
-- Table structure for seckill
-- ----------------------------
DROP TABLE IF EXISTS `seckill`;
CREATE TABLE `seckill` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '秒杀表id',
  `title` varchar(100) NOT NULL COMMENT '活动名称',
  `begintime` char(13) NOT NULL COMMENT '秒杀开始时间',
  `endtime` char(13) NOT NULL COMMENT '秒杀结束时间',
  `first_cateid` smallint(5) NOT NULL COMMENT '商品一级分类编号',
  `second_cateid` smallint(5) NOT NULL COMMENT '商品二级分类编号',
  `goodsid` int(11) NOT NULL COMMENT '商品编号',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='限时秒杀活动表';

-- ----------------------------
-- Records of seckill
-- ----------------------------
INSERT INTO `seckill` VALUES ('11', '双十一', '1603267200000', '1603288800000', '3', '11', '2', '1');
INSERT INTO `seckill` VALUES ('12', '光棍节促销', '1604984400000', '1605023220000', '3', '11', '6', '1');

-- ----------------------------
-- Table structure for shop_order
-- ----------------------------
DROP TABLE IF EXISTS `shop_order`;
CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) DEFAULT NULL COMMENT '会员id',
  `username` char(10) DEFAULT NULL COMMENT '收件人姓名',
  `userphone` char(11) DEFAULT NULL COMMENT '收件人手机号',
  `address` varchar(50) DEFAULT NULL COMMENT '收件人地址',
  `countmoney` decimal(10,2) DEFAULT NULL COMMENT '订单支付金额',
  `countnumber` smallint(5) DEFAULT NULL COMMENT '商品数量',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单状态：0:是待支付，1是代发货',
  `addtime` bigint(20) NOT NULL COMMENT '订单添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_order
-- ----------------------------
INSERT INTO `shop_order` VALUES ('77', '5c577f10-fec2-11ea-aad5-f58168b46cbb', '张三丰', '18301673847', '郑州中公', '16496.00', '4', '0', '1605086850174');

-- ----------------------------
-- Table structure for specs
-- ----------------------------
DROP TABLE IF EXISTS `specs`;
CREATE TABLE `specs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `specsname` varchar(50) NOT NULL COMMENT '规格名称',
  `status` tinyint(1) NOT NULL COMMENT '规格状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格表';

-- ----------------------------
-- Records of specs
-- ----------------------------
INSERT INTO `specs` VALUES ('3', '颜色', '1');
INSERT INTO `specs` VALUES ('5', '尺寸', '1');

-- ----------------------------
-- Table structure for specs_attr
-- ----------------------------
DROP TABLE IF EXISTS `specs_attr`;
CREATE TABLE `specs_attr` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规格项编号',
  `specsid` int(11) NOT NULL COMMENT '规格的specsid',
  `specsval` varchar(50) NOT NULL COMMENT '规格值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='商品规格明细表';

-- ----------------------------
-- Records of specs_attr
-- ----------------------------
INSERT INTO `specs_attr` VALUES ('7', '5', '55英寸');
INSERT INTO `specs_attr` VALUES ('8', '5', '60英寸');
INSERT INTO `specs_attr` VALUES ('13', '3', '白色');
INSERT INTO `specs_attr` VALUES ('14', '3', '黑色');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '住建',
  `uid` varchar(50) NOT NULL COMMENT '管理员编号',
  `roleid` smallint(5) NOT NULL COMMENT '角色编号',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` char(32) NOT NULL COMMENT '密码',
  `randstr` char(5) NOT NULL COMMENT '随机加密串',
  `status` tinyint(1) NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台管理员用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '7f412140-6b72-11ea-a476-bbdc6fb709e3', '3', 'admin', '904793bd8f8b17435798173c6af24eff', 'LFLK8', '1');
INSERT INTO `user` VALUES ('2', 'ef0d6e20-6b72-11ea-86b6-ff96b988db92', '4', 'kefu', '51a956280a6ecc833943d0db633c3bc8', 'N9vs3', '1');
