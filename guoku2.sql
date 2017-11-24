set names UTF8;
drop database if exists guoku;
create database guoku charset=UTF8;
use guoku;

/*基本用户表             gk_user
Uid(int(11))    Uname(varchar(32))   upwd(varchar(32))
email(varchar(64))    phone(varchar(16))   avatar(varchar(128))
user_name(varchar(32))  gender(int(1))
isdel(判断删除)int(1)   type(权限)int(1)--判断权限，是否有crud */
create table gk_user(
    uid int primary key auto_increment,
    uname varchar(32) default null,
    upwd varchar(32) default null,
    email varchar(64) default null,
    phone varchar(16) default null,
    avatar varchar(128) default null,
    user_name varchar(32) default null,
    gender int default null,
    isdel int default 0,
    type int default 0
    );
    insert into gk_user values
 (null,'dingding','123456','375@qq.com','13511111114',
 'images/1.jpg','zhangsan',1,0,0),
 (null,'dangdang','123456','371@qq.com','13511111115',
  'images/2.jpg','lisi',0,0,1),
 (null,'shishi','123456','376@qq.com','13511111116',
   'images/3.jpg','wangwu',1,0,1),
 (null,'yueyue','123456','378@qq.com','13511111117',
      'images/4.jpg','zhaoliu',0,0,0),
 (null,'liangliang','123456','379@qq.com','13511111118',
      'images/5.jpg','xiaoqi',1,0,0);


/* --===========================================================================
--订单详情表         	gk_order
--oid(int(11))   user_id(int(11))  address_id(int(11))  status(int(11))
-- order_time(bigint(20))     pay_time(bigint(20))   deliver_time(bigint(20))
--  received_time(bigint(20))
--===========================================================================*/
create table gk_order(
    oid int primary key auto_increment,
    user_id int,
    address_id int,
    status int,
    order_time bigint(20) default null,
    pay_time bigint(20) default null,
    deliver_time bigint(20) default null,
    received_time bigint(20) default null
    );

/*-- --===========================================================================
--订单更新表         	gk_order_detail
--Did(int(11))  order_id(int(11))    product_id(int(11))  count(int(11))
--===============================================================================*/
create table gk_order_detail(
    did int primary key auto_increment,
    order_id int,
    product_id int,
    count int
);

/*-- --===============================================================================
--购物车表            gk_shoppingcart_item
--iid (int11)     user_id(int11)     product_id(int11)
-- count(int11)   is_checked(tinyint(1))
--==============================================================================*/
create table gk_shoppingcart_item(
    iid int primary key auto_increment,
    user_id int,
    product_id int,
    count int,
    is_checked tinyint(1)
);
/*-- --===============================================================================
--收货地址表          gk_receiver_address
--Aid(int11)     user_id(int11)     receiver(收货人varchar16)
--  province(省varchar16)  city(市varchar16)  county(县varchar16)
--     address(varchar128)   cellphone(收货电话varchar16)
--   fixedphone(固定电话varchar16)    postcode(邮政编码char(6))
--    tag(标签，分类varchar(16))    is_default(tinyint(1))
--=============================================================================*/
create table gk_receiver_address(
    aid int primary key auto_increment,
    user_id int,
    receiver varchar(16),
    province varchar(16),
    city varchar(16),
    county varchar(16),
    address varchar(128),
    cellphone varchar(16),
    fixedphone varchar(16),
    postcode char(6),
    is_default tinyint(1)
);
insert into gk_receiver_address values
(null,1,'dingding','北京','西城区','白纸坊','东街2号','13412345678',
'5027123','033400',0),
(null,2,'dangdang','北京','东城区','白纸坊','东街3号','13412345678',
'5027123','033400',0),
(null,3,'shishi','北京','南城区','白纸坊','东街4号','13412345678',
'5027123','033400',0),
(null,4,'liangliang','北京','北城区','白纸坊','东街5号','13412345678',
'5027123','033400',0),
(null,5,'yueyue','北京','中城区','白纸坊','东街8号','13412345678',
'5027123','033400',0);
/* --==============================================================================
--系列分类            gk_product_family
--Fid(int(11))      fname(varchar16)
--==============================================================================*/
create table gk_product_family(
    fid int primary key auto_increment,
    fname varchar(16)
);
insert into gk_product_family values
(null,'selected'),
(null,'articles'),
(null,'event'),
(null,'store');


/*- --=================================================================================
--商品表              gk_selected_list
--Lid(int11)    family_id(int11)    title(varchar128)  sub_title(varchar128)
--details(varchar(256))   price(decimal(10,2))  promise(varchar(64))  spec(varchar64)
--lname(varchar32)******  category(varchar128)  sheif_time(bigint(20))
--  promotion_time(促销时间)(bigint(20))   sold_count(int(11))  is_onsale(tinyint(1))
--     isdel(int(1))
--============================================================================ */
create table gk_selected_list(
    lid int primary key auto_increment,
    family_id int,
    title varchar(128) default null,
    sub_title varchar(128) default null,
    details varchar(256) default null,
    price decimal(10,2) default null,
    promise varchar(64) default null,
    spec varchar(64) default null,
    lname varchar(32) default null,
    category varchar(128) default null,
    sheif_time bigint(20) default null,
    promotion_time bigint(20) default null,
    sold_count int,
    is_onsale tinyint(1),
    isdel int
);

insert into gk_selected_list values
(null,1,'吐一嘴的彩虹糖  爱上彩虹， 吃定彩虹 。','','','￥39.00',
'','','独角兽unicorn - 环保袋','','','',0,0,0),
(null,1,'最怕浴室的地垫又湿又潮容易发霉，这款硅藻土防滑垫手感细腻，
硬质，有触碰土壤的感觉，而且不会有掉毛的现象','森活 SOYO','','￥179.00',
'','','硅藻土浴室防滑垫','','','',0,0,0),
(null,1,'觉得餐厅是最适合用吊灯的地方，这款餐厅吊灯设计简单，
但给人感觉暖暖的。','Paulmann 德国柏曼','','￥1228.00',
'','','餐厅吊灯','','','',0,0,0),
(null,1,'暗黑色的底面，白色的水母，整个画面干净利索。水母非常精致，
感觉随时要游出来了。','','','￥148.00',
'','','ipad - 水母保护套','','','',0,0,0),
(null,1,'非油炸的冻干面，像我这种喜欢吃泡面，又担心肥胖的人，
这个真是解决了大难题。','海福盛','','￥5.90',
'','','私房牛肉面','','','',0,0,0),
(null,1,'人类为什么会对猫着迷？是因为它们柔软的小肉垫，还是宛如星空
的双眼？打开《关于猫的一切》，你会发现“主子们”更多不为人知的
小秘密。','','','￥58.00','','','关于猫的一切','','','',0,0,0),
(null,1,'想轻松制作红枣糕，红枣茶和红枣鸡汤等各种美食？您只需要
一个红枣去核器，一秒去核，操作简单，是吃货神器！','','','￥38.80',
'','','红枣去核器','','','',0,0,0),
(null,1,'真的有桃子香甜的气息，茶汤特别清澈。从包装到口感，满分～',
'LUPICIA','','￥112.00','','','白桃乌龙茶','','','',0,0,0),
(null,1,'中国设计红星奖银奖作品。首创"即座"设计，不凡于众！轻
便稳固，一体防盗，收纳自如。想坐就坐，轻松出行',
'','','￥299.00','','','贰般座包','','','',0,0,0),
(null,1,'一直都想要一个与众不同的音乐盒，这款算是很符合心意了，
作为七夕礼物收到手，很 happy了。但是好东西要拿来分享不是么，送给
喜欢音乐盒的朋友们。','jeancard','','￥229.00','','','走路机器人音乐盒','','','',0,0,0),
(null,1,'最好金贵换酒，相与醉沧州。也算是你我的青春回忆了',
'','','￥25.87','','','最好金龟换酒 - 傅真 著','','','',0,0,0),
(null,1,'戒指正面开口设计，可以轻轻调节开口大小，适合所有指围。
进口锆石，闪度媲美钻石。','A&G','','￥315.00','','','星际系列 太阳与
星星开口戒','','','',0,0,0),
(null,1,'纯棉质地，透气排汗。最主要的是颜色也太好看了吧，像雪碧一
样清爽，虽然是印花 logo 基础款，但是水绿色真的让人养眼。','GUESS','',
'￥175.12','','','印花LOGO纯棉T恤','','','',0,0,0),
(null,1,'很喜欢这款杯子黄、蓝、红、绿的配色，小王子的形象也很符
合书中的描述，完全不舍得拿来泡咖啡。','三浅陶社','',
'￥369.00','','','小王子咖啡杯','','','',0,0,0),
(null,1,'不用养在土里或水里，仅靠空气中的湿气和阳光就可以存活，
不过北方过干的话还是建议喷喷水。喜欢小号的精灵～','DOROQ 多洛库','',
'￥99.00','','','空气凤梨','','','',0,0,0),
(null,1,'电影形象木质鲲摆件，喜欢大鱼海棠的朋友不要错过。',
'DOROQ 多洛库','','￥439.00','','','正版大鱼海棠鲲玩偶','','','',0,0,0),
(null,1,'太喜欢这种跳跃的黄色了，适合沉闷的秋冬，看着就温暖有趣～',
'KITAYAMA北山制包所','','￥1918.00','','','撞色方形包','','','',0,0,0),
(null,1,'开学啦开学啦，多读书多看报，少吃零食多睡觉！很简约的不锈钢小
书签，夹在纸上像画一样，一共有 3 款造型可选。','','',
'￥10.00','','','不锈钢书签','','','',0,0,0),
(null,1,'深受每天在包里找口红、唇膏、粉饼的苦恼，从来没有一次是顺利的，
是该买个便携小包随身带着了','','',
'￥68.00','','','便携随身化妆包','','','',0,0,0),
(null,1,'主要取材自杏仁，经过适当精炼，从而成为适合高温烹饪的油品。能真的放在饭菜里，还能作为护肤品抹在身上，一油两用。作为烹饪食材，它能煎、炸、烘培或是凉拌，既能提供适当的营养，还能让饮食变得更健康；作为美容品，它能
直接涂抹于肌肤，让肌肤更加顺滑，还能和其他精油配合，当做按摩油使用。',
'','','￥129.98','','','杏仁油','','','',0,0,0),
(null,1,'CONTOUR 是由 Lior Shulak Hai 和 Galit Barak 创立的一个手工制作的首饰品牌。专注于纯
净的几何设计，灵感源于城市的景观和建筑，这枚戒指的设计就很大胆有趣。','Contour','',
'￥788.00','','','手工戒指','','','',0,0,0),
(null,1,'强烈推荐咖啡豆夹心的！！！命都给它了啊～','关茶','',
'￥119.00','','','夹心抹茶巧克力系列','','','',0,0,0),
(null,1,'这个烫金的字母贴画看上去质感很好，一点都不low 。
 多买些你名字的缩写贴满你所有的东西，哈哈哈哈','','',
'￥13.00','','','烫金字母贴纸','','','',0,0,0),
(null,1,'清新糖果色，简约创意造型。收纳眼镜牙刷等小物件，
可反复粘贴使用。','','','￥39.00','','',
'多功能置物夹','','','',0,0,0),
(null,1,'法国著名的瓷器品牌，此次融入了中国传统文化的元素，说不
下去了......总之就是很好看。每一只都有自己的特色，但组合起来又
莫名搭','LEGLE','','￥295.00','','','瓷碗 礼盒套装',
'','','',0,0,0),
(null,1,'来自硅谷的 Sense-U 婴儿呼吸监护器，实时监护宝宝呼吸，
避免宝宝呛奶、蒙被、高温等导致的窒息风险，同时监护新生儿俯卧，实时
发出警报，提醒家长查看。。','','','￥298.00','','',
'Sense-U婴儿呼吸监护器','','','',0,0,0),
(null,1,'［小学生行为规范］--- 秋装走起，搭配裙子和高腰牛仔裤，都是 too cool',
'','','￥149.00','','','短腰长袖卫衣','','','',0,0,0),
(null,1,'达到 20 度会变色，搓成球形后还可以像球一样弹跳。','Putty','',
'￥57.20','','','感温变色橡皮泥','','','',0,0,0),
(null,1,'虽然没有什么特别的装饰，但是材质太舒服了，吸水性超好！',
'今治ECOMOCO','','￥98.75','','','洗脸发带','  ','',
'',0,0,0),
(null,1,'盒内网袋，方便收纳小物件，网袋间贴心开口，
放置橡皮、要是更轻松。','booxi','','￥126.00','','','电话造型收纳盒',
'','','',0,0,0),
(null,1,'小清新的牙刷罐，叶子浮雕图案自然而清新， 可放二
支牙刷和一支牙膏，也可当插花瓶也是美美的~','','',
'￥18.00','','','叶子浮雕陶瓷卫浴套装','','','',0,0,0),
(null,1,'这一堆的巧克力光是看着都很有食欲，五颜六色的，
感觉生活都美好了起来。次次次次','','',
'￥258.00','','','混合巧克力','','','',0,0,0),
(null,1,'英伦小清新风格，喜欢清爽型的型男的最爱，
简洁婉约，低调优雅。','','',
'￥528.00','','','男士圆领T恤','','','',0,0,0),
(null,1,'避免找不到胶带头的困扰，不再需要刀
具切割胶带。透过胶带切割台，轻松达到随身切又可固定胶带头的目的。',
'Leadtrend','','￥35.00','','','胶带切割环','','','',0,0,0);
/*--=============================================================================
--文章表            	gk_articles
--Rid(int)  sub_title(varchar(128))   title(varchar(128))
-- details(varchar(256))   time(bigint(20))   pic(varchar128)
  --======================================================================= */
create table gk_articles(
    rid int,
    title varchar(128),
    sub_title varchar(128),
    details varchar(256),
    pic varchar(128)
 );
 insert into gk_articles values
 (null,'2017 维密大秀锁定中国，黄牛门票 9 万起你怕了吗？',
 '果库妹的小伙伴们，你们好呀。自从八月末正式宣布维多利亚的
 秘密大秀登陆上海后，各路少男少女都翘首以盼，微博话题讨论量早已破...',
 '','images/articles/14.jpg'),
 (null,'让我们单纯地聚在一起，抚慰彼此的胃和心灵',
  '朋友间的聚会大概是很多人的必备活动。与三五好友聚在一起，动手下厨，饮酒品菜，谈天说地，岂不快哉？但果库君今天要和大家讨论...',
  '','images/articles/13.jpg'),
(null,'初秋买买买，这一季 ZARA 新品什么最值得入手？',
 '快时尚品牌ZARA最近与摄影师史蒂文·梅塞尔合作推出的时装大片可谓是相当吸引眼球，虽然是2017年秋冬运动系列，但每套衣...',
 '','images/articles/10.jpg'),
(null,'杏仁味的秋天',
 '北京今年的秋似乎比往年来的要早，虽然还没步入九月，但气温已经降下来了。偶有风吹过，库妹脑中就不时想起史塔克家族那句“凛冬...',
 '','images/articles/4.jpg'),
(null,'“划船机有什么好，这个问题我让女朋友来回答你们。”',
 '前两天写了一篇关于七夕的文章，有果友在底下留言说库君我戏太足，这是因为你们还不了解我。如果你们了解了我就会知道：我的戏确...',
 '','images/articles/5.jpg'),
(null,'丧丧的你要不要来一颗酸酸的柠檬？',
 '据说水逆又来了，库妹最近真的是倒霉到去超市买酸奶都能买到坏的。昨天看了一篇星座运势分析说库妹的星座将持续水逆到2019年...',
 '','images/articles/6.jpg'),
(null,'千元内小众饰品来救驾！美貌绝不输大牌',
 '古希腊神话中，宙斯用戒指赢得了公主欧罗巴的心，火神赫菲斯托斯用戒指让阿弗洛狄忒回心转意。传情达意的信物纵有千万种，似乎唯...',
 '','images/articles/7.jpg'),
(null,'adidas 用机器人制鞋、日本超度机器人代替和尚，人工智能时代，第一个失业的会是？',
 '果库妹的小伙伴们，你们好呀。最近一条“adidas大力推进机器人制鞋厂”的新闻吸引了库妹的眼球，说实话，库妹原来一直觉得...',
 '','images/articles/9.jpg'),

(null,'IKEA 毛毯还能做啥？《权力的游戏》把它做成了披肩',
 '果库妹的小伙伴们，你们好呀。要问最近最火的家居单品是什么，库妹觉得当属IKEA的羊毛毯了，毕竟它早已跨越原有功能界限，火...',
 '','images/articles/20.jpg'),
(null,'“守护自己喜欢了二十几年的事物，难道不是理所应当？”',
 '果库妹曾问过大家一个问题：你送过最用心的生日礼物是什么？答案五花八门，不过看得出，我们都对爱的人付出过真心。库妹的一个大...',
 '','images/articles/18.jpg'),
(null,'干了这杯「糯言」，忘记他的诺言',
 '库妹拒绝矫情。难得自我感动也是像小品里演得一样，末尾虽然升华、煽情，但最后还是会抖个包袱，落个轻松自在，哈哈一笑。如果库...',
 '','images/articles/1.jpg'),
(null,'和感情经历丰富的人谈恋爱，是一件好事吗？',
 '最近，果库妹有一位朋友陷入了纠结。一直以来，她和她的男朋友都是我们朋友圈子里的模范情侣：她随口一提的餐厅，他会提前定好座...',
 '','images/articles/15.jpg'),
(null,'你的首饰里，藏着什么样的故事？',
 '世界上只有一条“海洋之心”，世界上只有一幅“蒙娜丽莎”。世界上“唯一”的物件数不胜数，可是，这些独一无二的作品谁收藏都一...',
 '','images/articles/11.jpg'),
(null,'如果独角兽有名字，那他一定叫 Charly',
 '有一部动画片叫CharlieTheUnicorn「独角兽查理」，超好笑的美国网络动画，结合了南方公园的唱歌跳舞和天线宝宝...',
 '','images/articles/14.jpg'),
(null,'她为开这家生活美学店铺，等了十年',
 '作为一名资深单身汪，库妹一直觉得七夕、情人节这种日子全是对自己的考验，就像老天给你洒了一把狗粮来考验你是否享受单身。刚吃...',
 '','images/articles/12.jpg'),
 (null,'“世上有味之事，诗、酒、爱情，往往无用”丨果库七夕系列活动',
  '果库君一直觉得，谈恋爱不是一件愉快的事情。无论从生物学人类繁衍，物种延续，基因传承的本能，还是社会学人们对亲密关系的需求...',
  '','images/articles/15.jpg'),
(null,'那是一片花海，是爷爷送给奶奶的花海',
 '这么漂亮的项链戴她身上一定很好看，买个送她吧；这么好用的笔他用了肯定顺手，买支送他吧；这么可爱的娃娃她肯定会喜欢，买只送...',
 '','images/articles/19.jpg'),
(null,'真的好爱好爱你，哪怕是异地也不想和你分手',
 '库妹一直觉得能承受异地恋的两个人要么心智特别成熟、拥有异常独立自主的人格；要么就不是那么喜欢对方，心想既然还没找到下家，...',
 '','images/articles/18.jpg'),
(null,'“只有钢笔，才能写下我对你的深情。”',
 '果库君用钢笔的经历，最远可以追溯到小学一二年级。当时刚丢下稚气的儿童铅笔，摸上一根略有份量的钢笔，心中不免有一份欣喜，尽...',
 '','images/articles/19.jpg'),
(null,'公司显示器太差，我可以辞职么？丨果库测评 X 明基 BenQ',
 '前不久，果库君看到一个新闻，说有一位95后的实习生因为公司配的电脑太烂而选择辞职，这篇新闻在网上可以说引起了一番激烈的讨...',
 '','images/articles/17.jpg');
/* --=======================================================================
--商品图片表               gk_selected_pic
--Pid(int(11))   product_list_id(int(11))   sm(varchar(128))
--  md(varchar(128))      lg(varchar(128)
-- ========================================================================= */
create table gk_selected_pic(
    pid int,
    product_list_id int,
    sm varchar(128) default null,
    md varchar(128) default null,
    lg varchar(128) default null
);
insert into gk_selected_pic values
(null,1,'images/selected/1.jpg','',''),
(null,2,'images/selected/2.jpg','',''),
(null,3,'images/selected/3.jpg','',''),
(null,4,'images/selected/4.jpg','',''),
(null,5,'images/selected/5.jpg','',''),
(null,6,'images/selected/6.jpg','',''),
(null,7,'images/selected/7.jpg','',''),
(null,8,'images/selected/8.jpg','',''),
(null,9,'images/selected/9.jpg','',''),
(null,10,'images/selected/10.jpg','',''),
(null,11,'images/selected/11.jpg','',''),
(null,12,'images/selected/12.jpg','',''),
(null,13,'images/selected/13.jpg','',''),
(null,14,'images/selected/14(3).jpg','',''),
(null,15,'images/selected/15.jpg','',''),
(null,16,'images/selected/16.jpg','',''),
(null,17,'images/selected/17.jpg','',''),
(null,18,'images/selected/18(3).jpg','',''),
(null,19,'images/selected/19.jpg','',''),
(null,20,'images/selected/20.jpg','',''),
(null,21,'images/selected/21.jpg','',''),
(null,22,'images/selected/22.jpg','',''),
(null,23,'images/selected/23.jpg','',''),
(null,24,'images/selected/24.jpg','',''),
(null,25,'images/selected/25.jpg','',''),
(null,26,'images/selected/26.jpg','',''),
(null,27,'images/selected/27.jpg','',''),
(null,28,'images/selected/28.jpg','',''),
(null,29,'images/selected/29.jpg','',''),
(null,30,'images/selected/30.jpg','',''),
(null,31,'images/selected/31.jpg','',''),
(null,32,'images/selected/32.jpg','',''),
(null,33,'images/selected/33.jpg','','');


/* --================================================================================
--首页商品表           gk_index_product
--ipd(int)   title(varchar(128)))   details(varchar(128))  pic(varchar(128))
--  price(decimal(10,2))   href(varchar(256) seq_recommended(tinyint(4)))
--  seq_new_arrival(tinyint(4))     seq_top_sale(tinyint(4))
--============================================================================= */
create table gk_index_product(
    ipd int,
    title varchar(128) default null,
    sub_title varchar(128) default null,
    details varchar(128) default null,
    pic varchar(128) default null,
    price decimal(10,2) default null,
    href varchar(256) default null,
    seq_recommended tinyint(4) default null,
    seq_new_arrival tinyint(4) default null,
    seq_top_sale tinyint(4) default null
);
insert into gk_index_product values
(null,'关茶','夹心抹茶巧克力系列','','images/index/best/1.jpg','￥119.00','','0','0','0'),
(null,'','搞怪立体青蛙学生书包','','images/index/best/2.jpg','￥109.00','','0','0','0'),
(null,'KITAYAMA北...','撞色方形包','','images/index/best/3.jpg','￥1918.00','','0','0','0'),
(null,'Leadtrend','胶带切割环','','images/index/best/4.jpg','￥35.00','','0','0','0'),
(null,'Banks&Co','杏仁油手工皂','','images/index/best/5.jpg','￥85.00','','0','0','0'),
(null,'Cyclax','杏仁磨砂膏','','images/index/best/6.jpg','￥59.00','','0','0','0'),
(null,'PLUS普乐士','剪刀','','images/index/best/7.jpg','￥17.00','','0','0','0'),
(null,'木趣','饼干钥匙圈','','images/index/best/8.jpg','￥50.00','','0','0','0'),
(null,'Martube C...','迷你随身充电宝','','images/index/best/9.jpg','￥98.00','','0','0','0'),
(null,'Scrubba','内衣手洗宝','','images/index/best/10.jpg','￥339.00','','0','0','0'),
(null,'booxi','电话造型收纳盒','','images/index/best/11.jpg','￥126.00','','0','0','0'),
(null,'KINTO','滑盖式 滤茶器','','images/index/best/12.jpg','￥128.00','','0','0','0'),
(null,'丹书','无限挤压毛豆 玩具','','images/index/best/13.jpg','￥19.50','','0','0','0'),
(null,'吉野堂','小鸡蛋糕','','images/index/best/14.jpg','￥75.00','','0','0','0'),
(null,' 吉乐岛',' 早餐杯','','images/index/best/15.jpg','￥32.00','','0','0','0'),
(null,'','黑白长袖T恤','','images/index/best/16.jpg','￥119.00','','0','0','0'),
(null,'DOROQ 多洛库','空气凤梨','','images/index/best/17.jpg','￥99.00','','0','0','0'),
(null,'','玻璃茶壶','','images/index/best/18.jpg','￥99.00','','0','0','0'),
(null,'','陶瓷 简约面碗','','images/index/best/19.jpg','￥39.9','','0','0','0'),
(null,'Taste plu...','锅具套装','','images/index/best/20.jpg','￥1900.00','','0','0','0'),
(null,'umtea ',' 德国花果茶','','images/index/best/21.jpg','￥98.00','','0','0','0'),
(null,'','海外背回西洋古董银器','','images/index/best/22.jpg','￥298.00','','0','0','0'),
(null,'','单人夏凉被','','images/index/best/23.jpg','￥57.00','','0','0','0'),
(null,'','纯实木餐椅','','images/index/best/24.jpg','￥1599.00','','0','0','0'),
(null,'甜诱','手工乳酪酥','','images/index/best/25.jpg','￥29.80','','0','0','0'),
(null,'','纯棉衬衫','','images/index/best/26.jpg','￥399.00','','0','0','0'),
(null,'THE BEAST...','金色大理石台灯','','images/index/best/27.jpg','￥599.00','','0','0','0'),
(null,'木村','玫瑰花味碳酸饮料','','images/index/best/28.jpg','￥18.00','','0','0','0'),
(null,'奕方','蓝柑果酱','','images/index/best/29.jpg','￥33.00','','0','0','0'),
(null,'珍品五味','台湾士林黑糖姜母茶','','images/index/best/30.jpg','￥65.00','','0','0','0'),
(null,'Andfunns','便携装香氛蜡烛','','images/index/best/31.jpg','￥48.00','','0','0','0'),
(null,'','帆布袋','','images/index/best/32.jpg','￥29.00','','0','0','0'),
(null,'','治愈麻薯手感猫咪','','images/index/best/33.jpg','￥1.80','','0','0','0'),
(null,'贽造局','影青花瓣叠影对杯','','images/index/best/34.jpg','￥398.00','','0','0','0'),
(null,'Michael M...','翠竹胸针','','images/index/best/35.jpg','￥1380.00','','0','0','0'),
(null,'草莓夹心巧克力','六花亭','','images/index/best/36.jpg','￥33.00','','0','0','0'),
(null,'抹茶玄米煎茶','关茶','','images/index/best/37.jpg','￥89.00','','0','0','0'),
(null,'','薄款长袖衬衫','','images/index/best/38.jpg','￥99.00','','0','0','0'),
(null,'','招财猫车内装饰品','','images/index/best/39.jpg','￥198.00','','0','0','0'),
(null,'RSVP','创意小企鹅牙签分配器','','images/index/best/40.jpg','￥168.00','','0','0','0'),
(null,'','黑胡桃梳妆镜','','images/index/best/41.jpg','￥125.00','','0','0','0'),
(null,'','蚊虫叮咬止痒仪','','images/index/best/42.jpg','￥115.28','','0','0','0'),
(null,'','柠檬味牛乳蛋糕','','images/index/best/43.jpg','￥27.00','','0','0','0'),
(null,'一片月','夹煎牛排夹子','','images/index/best/44.jpg','￥15.00','','0','0','0'),
(null,'扇雀饴本铺','鸟笼汽水味什锦糖','','images/index/best/45.jpg','￥34.90','','0','0','0');


/*-- --==========================================================================
--banner图     gk_banner_pic      (index,selected,article)
--Pbd(int(11))   src(varchar(128)) title(varchar(128)) href(varchar(128))

--============================================================================ */
create table gk_banner_pic(
    pbd int,
    sm varchar(128) default null,
    md varchar(128) default null,
    lg varchar(128) default null,
    title varchar(128) default null,
    sub_title varchar(128) default null,
    href varchar(128) default null
);

insert into gk_banner_pic values
(null,'images/index/banner/01.jpg','images/index/banner/03.jpg',
'images/index/banner/03.jpg','Place | Kinfolk 歌本哈根办公室','所有的最爱加在一起',''),
(null,'images/index/banner/05.jpg','images/index/banner/05.jpg',
'images/index/banner/06.jpg','发现 | 别把果蔬不当角','来自立陶宛的 Karolina Samal? ，因一束鲜花而感到沮丧，并决定创建自己的版本，可以比花更长。',''),
(null,'images/index/banner/07.jpg','images/index/banner/09.jpg',
'images/index/banner/08.jpg','专访 | RUMO 如茉，教你如何更恋床','冬天，舒服宅家才是正经事',''),
(null,'images/index/banner/10.jpg','images/index/banner/10.jpg',
'images/index/banner/11.jpg','','',''),

(null,'images/event/banner/12.jpeg','images/event/banner/12.jpeg',
'images/event/banner/12.jpeg','','',''),

(null,'images/store/banner/1.jpeg','images/store/banner/1.jpeg',
'images/store/banner/1.jpeg','','',''),
(null,'images/store/banner/2.jpeg','images/store/banner/2.jpeg',
'images/store/banner/2.jpeg','','',''),
(null,'images/store/banner/3.jpeg','images/store/banner/3.jpeg',
'images/store/banner/3.jpeg','','',''),

(null,'images/index/tuijie/1.jpg','images/index/tuijie/1.jpg',
'images/index/tuijie/1.jpg','丸货wahool','来自全球各地买手店、原创设计师、时尚ICON以及主理人的集结地，分享最前瞻的时尚潮流文化。',''),
(null,'images/index/tuijie/2.jpg','images/index/tuijie/2.jpg',
'images/index/tuijie/2.jpg','够得到的B格','本帐号致力于挖掘各种改善生活品质的美好单品，从衣食住行的实物到声色犬马的精神世界，都是用过才说...',''),
(null,'images/index/tuijie/3.jpg','images/index/tuijie/3.jpg',
'images/index/tuijie/3.jpg','Look时髦中心','Hi，这里是 Look 时髦中心，每天分享有趣，新鲜又实用的时尚好文。不仅告诉你大众流行，更有...',''),
(null,'images/index/tuijie/4.jpg','images/index/tuijie/4.jpg',
'images/index/tuijie/4.jpg','Enjoy雅趣','和你一起研究如何把钱花得漂亮。',''),
(null,'images/index/tuijie/5.jpg','images/index/tuijie/5.jpg',
'images/index/tuijie/5.jpg','菠萝汽水','发现新事物',''),
(null,'images/index/tuijie/6.jpg','images/index/tuijie/6.jpg',
'images/index/tuijie/6.jpg','猫屎星球','美少女购物指南，给你推荐用过如换脸的彩妆，穿上不想脱的衣服，吃完舔手指的零食，好用到高潮的小物！','');


/* --=====================================================================
--event展示表     gk_event
--==================================================================== */
create table gk_event(
    eid int,
    title varchar(128) default null,
    sub_title varchar(128) default null,
    details varchar(256) default null,
    pic varchar(128) default null
 );
insert into gk_event values
 (null,'远离夏日燥热，感受沁人心脾的檀木香 |...',
 '感谢库库妹抽中我，入坑果库四年，鬼使神差的人生第一次参加试用活动，被翻牌子很惊喜哈哈。其实...','','images/event/1.jpg'),
 (null,'一个可遇不可求的有趣好物 | ?被偷走...',
 '首先要感谢果库，从来不会中奖我的没想到竟然会上榜了，有幸成为试用者之一，感觉像中了五百万一样...','','images/event/2.jpg'),
 (null,'看完了果库妹的分享，瞬间喜欢上VISOANSKA | 老翟',
 '...','','images/event/3.jpg'),
  (null,'终于找到一瓶适合懒人的化妆水 | 王小嘟麻麻',
  '懒人必备法宝-琥珀水非常感谢VISOANSKA给我试用的机会，我是敏感...','','images/event/4.jpg'),
 (null,' 福利活动丨啊，记忆中的枫糖',
 '...','','images/event/5.jpg'),
  (null,' 哈迪白葡萄酒试喝报告（小幽篇） ',
  'Accolade Wine誉嘉集团是澳大利亚本土，...','','images/event/6.jpg'),
 (null,'哈迪白葡萄酒试喝报告（Alex Serious篇）',
 '...','','images/event/7.jpg'),
 (null,'哈迪白葡萄酒试喝报告（_Song篇）',
 '...','','images/event/8.jpg'),
 (null,'我印象中的哈迪徽章慕斯卡托甜白葡萄酒（Nick篇）',
 '...','','images/event/9.jpg'),
 (null,'试用福利丨看完果库妹的试用报告再报名好吗？',
 '身为一个阅化妆水无数的人，果库妹在这方面可谓...','','images/event/10.jpg'),
  (null,'果库试用报告丨把熊本熊塞进嘴里原来是这样的口感(o^^o)',
  '哈喽，果库妹来了...','','images/event/11.jpg'),
  (null,'Oracleen熊本熊电动牙刷试用报告（have fait...',
  '首先按照国际惯例感谢果库能够给我这个机会！在中奖的那一刻我就已经开始兴奋又...','','images/event/12.jpg'),
  (null,'把熊本熊放进嘴里，是种什么体验？丨试用福利',
  '熊本熊老师是个是名副其实的...','','images/event/13.jpg');

/* --?????????????????????????????????????????????
--=====================================================================
--store展示表     gk_store
--==================================================================== */
create table gk_store(
    sid int,
    title varchar(128) default null,
    details varchar(256) default null,
    pic varchar(128) default null
 );
insert into gk_store values
(null,'','','images/store/1.jpg'),
(null,'','','images/store/2.jpg'),
(null,'驱蚊香囊','','images/store/3.jpg'),
(null,'小号手拎式午餐袋','','images/store/4.jpg'),
(null,'RECYCLE 书签','','images/store/5.jpg'),
(null,'樱 暖金珐琅花瓣开口手镯','','images/store/6.jpg'),
(null,'Sakura 食物刺绣胸针组合','','images/store/7.jpg'),
(null,'冷泡冷萃茶叶咖啡壶','','images/store/8.jpg'),
(null,' 薄润款素色香插','','images/store/9.jpg'),
(null,'手提斜挎两用包','','images/store/10.jpg'),
(null,'和纸卡包 名片盒','','images/store/11.jpg'),
(null,'海报画挂画','','images/store/12.jpg');



