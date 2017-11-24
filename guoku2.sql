set names UTF8;
drop database if exists guoku;
create database guoku charset=UTF8;
use guoku;

/*�����û���             gk_user
Uid(int(11))    Uname(varchar(32))   upwd(varchar(32))
email(varchar(64))    phone(varchar(16))   avatar(varchar(128))
user_name(varchar(32))  gender(int(1))
isdel(�ж�ɾ��)int(1)   type(Ȩ��)int(1)--�ж�Ȩ�ޣ��Ƿ���crud */
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
--���������         	gk_order
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
--�������±�         	gk_order_detail
--Did(int(11))  order_id(int(11))    product_id(int(11))  count(int(11))
--===============================================================================*/
create table gk_order_detail(
    did int primary key auto_increment,
    order_id int,
    product_id int,
    count int
);

/*-- --===============================================================================
--���ﳵ��            gk_shoppingcart_item
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
--�ջ���ַ��          gk_receiver_address
--Aid(int11)     user_id(int11)     receiver(�ջ���varchar16)
--  province(ʡvarchar16)  city(��varchar16)  county(��varchar16)
--     address(varchar128)   cellphone(�ջ��绰varchar16)
--   fixedphone(�̶��绰varchar16)    postcode(��������char(6))
--    tag(��ǩ������varchar(16))    is_default(tinyint(1))
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
(null,1,'dingding','����','������','��ֽ��','����2��','13412345678',
'5027123','033400',0),
(null,2,'dangdang','����','������','��ֽ��','����3��','13412345678',
'5027123','033400',0),
(null,3,'shishi','����','�ϳ���','��ֽ��','����4��','13412345678',
'5027123','033400',0),
(null,4,'liangliang','����','������','��ֽ��','����5��','13412345678',
'5027123','033400',0),
(null,5,'yueyue','����','�г���','��ֽ��','����8��','13412345678',
'5027123','033400',0);
/* --==============================================================================
--ϵ�з���            gk_product_family
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
--��Ʒ��              gk_selected_list
--Lid(int11)    family_id(int11)    title(varchar128)  sub_title(varchar128)
--details(varchar(256))   price(decimal(10,2))  promise(varchar(64))  spec(varchar64)
--lname(varchar32)******  category(varchar128)  sheif_time(bigint(20))
--  promotion_time(����ʱ��)(bigint(20))   sold_count(int(11))  is_onsale(tinyint(1))
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
(null,1,'��һ��Ĳʺ���  ���ϲʺ磬 �Զ��ʺ� ��','','','��39.00',
'','','������unicorn - ������','','','',0,0,0),
(null,1,'����ԡ�ҵĵص���ʪ�ֳ����׷�ù�����������������ָ�ϸ�壬
Ӳ�ʣ��д��������ĸо������Ҳ����е�ë������','ɭ�� SOYO','','��179.00',
'','','������ԡ�ҷ�����','','','',0,0,0),
(null,1,'���ò��������ʺ��õ��Ƶĵط���������������Ƽ򵥣�
�����˸о�ůů�ġ�','Paulmann �¹�����','','��1228.00',
'','','��������','','','',0,0,0),
(null,1,'����ɫ�ĵ��棬��ɫ��ˮĸ����������ɾ�������ˮĸ�ǳ����£�
�о���ʱҪ�γ����ˡ�','','','��148.00',
'','','ipad - ˮĸ������','','','',0,0,0),
(null,1,'����ը�Ķ����棬��������ϲ�������棬�ֵ��ķ��ֵ��ˣ�
������ǽ���˴����⡣','����ʢ','','��5.90',
'','','˽��ţ����','','','',0,0,0),
(null,1,'����Ϊʲô���è���ԣ�����Ϊ���������С��棬���������ǿ�
��˫�ۣ��򿪡�����è��һ�С�����ᷢ�֡������ǡ����಻Ϊ��֪��
С���ܡ�','','','��58.00','','','����è��һ��','','','',0,0,0),
(null,1,'��������������⣬�����ͺ��漦���ȸ�����ʳ����ֻ��Ҫ
һ������ȥ������һ��ȥ�ˣ������򵥣��ǳԻ�������','','','��38.80',
'','','����ȥ����','','','',0,0,0),
(null,1,'����������������Ϣ�������ر��峺���Ӱ�װ���ڸУ����֡�',
'LUPICIA','','��112.00','','','����������','','','',0,0,0),
(null,1,'�й���ƺ��ǽ�������Ʒ���״�"����"��ƣ��������ڣ���
���ȹ̣�һ��������������硣�������������ɳ���',
'','','��299.00','','','��������','','','',0,0,0),
(null,1,'һֱ����Ҫһ�����ڲ�ͬ�����ֺУ�������Ǻܷ��������ˣ�
��Ϊ��Ϧ�����յ��֣��� happy�ˡ����Ǻö���Ҫ����������ô���͸�
ϲ�����ֺе������ǡ�','jeancard','','��229.00','','','��·���������ֺ�','','','',0,0,0),
(null,1,'��ý�󻻾ƣ���������ݡ�Ҳ�������ҵ��ഺ������',
'','','��25.87','','','��ý�껻�� - ���� ��','','','',0,0,0),
(null,1,'��ָ���濪����ƣ�����������ڿ��ڴ�С���ʺ�����ָΧ��
�����ʯ������������ʯ��','A&G','','��315.00','','','�Ǽ�ϵ�� ̫����
���ǿ��ڽ�','','','',0,0,0),
(null,1,'�����ʵأ�͸���ź�������Ҫ������ɫҲ̫�ÿ��˰ɣ���ѩ��һ
����ˬ����Ȼ��ӡ�� logo ���������ˮ��ɫ����������ۡ�','GUESS','',
'��175.12','','','ӡ��LOGO����T��','','','',0,0,0),
(null,1,'��ϲ�����ӻơ������졢�̵���ɫ��С���ӵ�����Ҳ�ܷ�
�����е���������ȫ����������ݿ��ȡ�','��ǳ����','',
'��369.00','','','С���ӿ��ȱ�','','','',0,0,0),
(null,1,'�������������ˮ����������е�ʪ��������Ϳ��Դ�
�����������ɵĻ����ǽ�������ˮ��ϲ��С�ŵľ��顫','DOROQ �����','',
'��99.00','','','��������','','','',0,0,0),
(null,1,'��Ӱ����ľ����ڼ���ϲ�����㺣�ĵ����Ѳ�Ҫ�����',
'DOROQ �����','','��439.00','','','������㺣������ż','','','',0,0,0),
(null,1,'̫ϲ��������Ծ�Ļ�ɫ�ˣ��ʺϳ��Ƶ��ﶬ�����ž���ů��Ȥ��',
'KITAYAMA��ɽ�ư���','','��1918.00','','','ײɫ���ΰ�','','','',0,0,0),
(null,1,'��ѧ����ѧ���������࿴�����ٳ���ʳ��˯�����ܼ�Լ�Ĳ����С
��ǩ������ֽ����һ����һ���� 3 �����Ϳ�ѡ��','','',
'��10.00','','','�������ǩ','','','',0,0,0),
(null,1,'����ÿ���ڰ����ҿں졢���ࡢ�۱��Ŀ��գ�����û��һ����˳���ģ�
�Ǹ������ЯС�����������','','',
'��68.00','','','��Я����ױ��','','','',0,0,0),
(null,1,'��Ҫȡ�������ʣ������ʵ��������Ӷ���Ϊ�ʺϸ�����⿵���Ʒ������ķ��ڷ����������Ϊ����ƷĨ�����ϣ�һ�����á���Ϊ���ʳ�ģ����ܼ塢ը������������裬�����ṩ�ʵ���Ӫ������������ʳ��ø���������Ϊ����Ʒ������
ֱ��ͿĨ�ڼ������ü�������˳�������ܺ�����������ϣ�������Ħ��ʹ�á�',
'','','��129.98','','','������','','','',0,0,0),
(null,1,'CONTOUR ���� Lior Shulak Hai �� Galit Barak ������һ���ֹ�����������Ʒ�ơ�רע�ڴ�
���ļ�����ƣ����Դ�ڳ��еľ��ۺͽ�������ö��ָ����ƾͺܴ���Ȥ��','Contour','',
'��788.00','','','�ֹ���ָ','','','',0,0,0),
(null,1,'ǿ���Ƽ����ȶ����ĵģ��������������˰���','�ز�','',
'��119.00','','','����Ĩ���ɿ���ϵ��','','','',0,0,0),
(null,1,'����̽����ĸ��������ȥ�ʸкܺã�һ�㶼��low ��
 ����Щ�����ֵ���д���������еĶ�������������','','',
'��13.00','','','�̽���ĸ��ֽ','','','',0,0,0),
(null,1,'�����ǹ�ɫ����Լ�������͡������۾���ˢ��С�����
�ɷ���ճ��ʹ�á�','','','��39.00','','',
'�๦�������','','','',0,0,0),
(null,1,'���������Ĵ���Ʒ�ƣ��˴��������й���ͳ�Ļ���Ԫ�أ�˵��
��ȥ��......��֮���Ǻܺÿ���ÿһֻ�����Լ�����ɫ�������������
Ī����','LEGLE','','��295.00','','','���� �����װ',
'','','',0,0,0),
(null,1,'���Թ�ȵ� Sense-U Ӥ�������໤����ʵʱ�໤����������
���ⱦ��Ǻ�̡��ɱ������µȵ��µ���Ϣ���գ�ͬʱ�໤���������ԣ�ʵʱ
�������������Ѽҳ��鿴����','','','��298.00','','',
'Sense-UӤ�������໤��','','','',0,0,0),
(null,1,'��Сѧ����Ϊ�淶��--- ��װ���𣬴���ȹ�Ӻ͸���ţ�п㣬���� too cool',
'','','��149.00','','','������������','','','',0,0,0),
(null,1,'�ﵽ 20 �Ȼ��ɫ��������κ󻹿�������һ��������','Putty','',
'��57.20','','','���±�ɫ��Ƥ��','','','',0,0,0),
(null,1,'��Ȼû��ʲô�ر��װ�Σ����ǲ���̫����ˣ���ˮ�Գ��ã�',
'����ECOMOCO','','��98.75','','','ϴ������','  ','',
'',0,0,0),
(null,1,'������������������С��������������Ŀ��ڣ�
������Ƥ��Ҫ�Ǹ����ɡ�','booxi','','��126.00','','','�绰�������ɺ�',
'','','',0,0,0),
(null,1,'С���µ���ˢ�ޣ�Ҷ�Ӹ���ͼ����Ȼ�����£� �ɷŶ�
֧��ˢ��һ֧���࣬Ҳ�ɵ��廨ƿҲ��������~','','',
'��18.00','','','Ҷ�Ӹ����մ���ԡ��װ','','','',0,0,0),
(null,1,'��һ�ѵ��ɿ������ǿ��Ŷ�����ʳ����������ɫ�ģ�
�о�����������������δδδ�','','',
'��258.00','','','����ɿ���','','','',0,0,0),
(null,1,'Ӣ��С���·��ϲ����ˬ�͵����е����
�����Լ���͵����š�','','',
'��528.00','','','��ʿԲ��T��','','','',0,0,0),
(null,1,'�����Ҳ�������ͷ�����ţ�������Ҫ��
���и����͸�������и�̨�����ɴﵽ�������ֿɹ̶�����ͷ��Ŀ�ġ�',
'Leadtrend','','��35.00','','','�����и','','','',0,0,0);
/*--=============================================================================
--���±�            	gk_articles
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
 (null,'2017 ά�ܴ��������й�����ţ��Ʊ 9 ������������',
 '�����õ�С����ǣ����Ǻ�ѽ���ԴӰ���ĩ��ʽ����ά�����ǵ�
 ���ܴ����½�Ϻ��󣬸�·������Ů���������Σ�΢������������������...',
 '','images/articles/14.jpg'),
 (null,'�����ǵ����ؾ���һ�𣬸�ο�˴˵�θ������',
  '���Ѽ�ľۻ����Ǻܶ��˵ıر������������Ѿ���һ�𣬶����³�������Ʒ�ˣ�̸��˵�أ��񲻿��գ������������Ҫ�ʹ������...',
  '','images/articles/13.jpg'),
(null,'������������һ�� ZARA ��Ʒʲô��ֵ�����֣�',
 '��ʱ��Ʒ��ZARA�������Ӱʦʷ���ġ�÷���������Ƴ���ʱװ��Ƭ��ν���൱����������Ȼ��2017���ﶬ�˶�ϵ�У���ÿ����...',
 '','images/articles/10.jpg'),
(null,'����ζ������',
 '������������ƺ�����������Ҫ�磬��Ȼ��û������£��������Ѿ��������ˡ�ż�з紵�����������оͲ�ʱ����ʷ���˼����Ǿ䡰�ݶ�...',
 '','images/articles/4.jpg'),
(null,'����������ʲô�ã������������Ů�������ش����ǡ���',
 'ǰ����д��һƪ������Ϧ�����£��й����ڵ�������˵�����Ϸ̫�㣬������Ϊ���ǻ����˽��ҡ���������˽����Ҿͻ�֪�����ҵ�Ϸȷ...',
 '','images/articles/5.jpg'),
(null,'ɥɥ����Ҫ��Ҫ��һ����������ʣ�',
 '��˵ˮ�������ˣ������������ǵ�ù��ȥ���������̶����򵽻��ġ����쿴��һƪ�������Ʒ���˵���õ�����������ˮ�浽2019��...',
 '','images/articles/6.jpg'),
(null,'ǧԪ��С����Ʒ���ȼݣ���ò���������',
 '��ϣ�����У���˹�ý�ָӮ���˹���ŷ�ް͵��ģ�����շ�˹��˹�ý�ָ�ð������߯����ת�⡣����������������ǧ���֣��ƺ�Ψ...',
 '','images/articles/7.jpg'),
(null,'adidas �û�������Ь���ձ����Ȼ����˴�����У��˹�����ʱ������һ��ʧҵ�Ļ��ǣ�',
 '�����õ�С����ǣ����Ǻ�ѽ�����һ����adidas�����ƽ���������Ь���������������˿��õ�����˵ʵ��������ԭ��һֱ����...',
 '','images/articles/9.jpg'),

(null,'IKEA ë̺������ɶ����Ȩ������Ϸ����������������',
 '�����õ�С����ǣ����Ǻ�ѽ��Ҫ��������ļҾӵ�Ʒ��ʲô�����þ��õ���IKEA����ë̺�ˣ��Ͼ������ѿ�Խԭ�й��ܽ��ޣ���...',
 '','images/articles/20.jpg'),
(null,'���ػ��Լ�ϲ���˶�ʮ���������ѵ���������Ӧ������',
 '���������ʹ����һ�����⣺���͹������ĵ�����������ʲô�����廨���ţ��������ó������Ƕ��԰����˸��������ġ����õ�һ����...',
 '','images/articles/18.jpg'),
(null,'�����Ɑ��Ŵ�ԡ�����������ŵ��',
 '���þܾ����顣�ѵ����Ҹж�Ҳ����СƷ���ݵ�һ����ĩβ��Ȼ������ɿ�飬������ǻᶶ������������������ڣ�����һЦ�������...',
 '','images/articles/1.jpg'),
(null,'�͸��龭���ḻ����̸��������һ��������',
 '�������������һλ���������˾��ᡣһֱ�������������������Ѷ�����������Ȧ�����ģ�����£������һ��Ĳ�����������ǰ������...',
 '','images/articles/15.jpg'),
(null,'������������ʲô���Ĺ��£�',
 '������ֻ��һ��������֮�ġ���������ֻ��һ����������ɯ���������ϡ�Ψһ�����������ʤ�������ǣ���Щ��һ�޶�����Ʒ˭�ղض�һ...',
 '','images/articles/11.jpg'),
(null,'��������������֣�����һ���� Charly',
 '��һ������Ƭ��CharlieTheUnicorn�������޲���������Ц���������綯����������Ϸ���԰�ĳ�����������߱���...',
 '','images/articles/14.jpg'),
(null,'��Ϊ�����������ѧ���̣�����ʮ��',
 '��Ϊһ���������������һֱ������Ϧ�����˽���������ȫ�Ƕ��Լ��Ŀ��飬���������������һ�ѹ������������Ƿ����ܵ����ճ�...',
 '','images/articles/12.jpg'),
 (null,'��������ζ֮�£�ʫ���ơ����飬�������á�ح������Ϧϵ�л',
  '�����һֱ���ã�̸��������һ���������顣���۴�����ѧ���෱�ܣ��������������򴫳еı��ܣ��������ѧ���Ƕ����ܹ�ϵ������...',
  '','images/articles/15.jpg'),
(null,'����һƬ��������үү�͸����̵Ļ���',
 '��ôƯ����������������һ���ܺÿ�����������ɣ���ô���õı������˿϶�˳�֣���֧�����ɣ���ô�ɰ����������϶���ϲ������ֻ��...',
 '','images/articles/19.jpg'),
(null,'��ĺð��ð��㣬���������Ҳ����������',
 '����һֱ�����ܳ����������������Ҫô�����ر���졢ӵ���쳣�����������˸�Ҫô�Ͳ�����ôϲ���Է��������Ȼ��û�ҵ��¼ң�...',
 '','images/articles/18.jpg'),
(null,'��ֻ�иֱʣ�����д���Ҷ�������顣��',
 '������øֱʵľ�������Զ����׷�ݵ�Сѧһ���꼶����ʱ�ն��������Ķ�ͯǦ�ʣ�����һ�����з����ĸֱʣ����в�����һ����ϲ����...',
 '','images/articles/19.jpg'),
(null,'��˾��ʾ��̫��ҿ��Դ�ְô��ح������� X ���� BenQ',
 'ǰ���ã����������һ�����ţ�˵��һλ95���ʵϰ����Ϊ��˾��ĵ���̫�ö�ѡ���ְ����ƪ���������Ͽ���˵������һ�����ҵ���...',
 '','images/articles/17.jpg');
/* --=======================================================================
--��ƷͼƬ��               gk_selected_pic
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
--��ҳ��Ʒ��           gk_index_product
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
(null,'�ز�','����Ĩ���ɿ���ϵ��','','images/index/best/1.jpg','��119.00','','0','0','0'),
(null,'','�����������ѧ�����','','images/index/best/2.jpg','��109.00','','0','0','0'),
(null,'KITAYAMA��...','ײɫ���ΰ�','','images/index/best/3.jpg','��1918.00','','0','0','0'),
(null,'Leadtrend','�����и','','images/index/best/4.jpg','��35.00','','0','0','0'),
(null,'Banks&Co','�������ֹ���','','images/index/best/5.jpg','��85.00','','0','0','0'),
(null,'Cyclax','����ĥɰ��','','images/index/best/6.jpg','��59.00','','0','0','0'),
(null,'PLUS����ʿ','����','','images/index/best/7.jpg','��17.00','','0','0','0'),
(null,'ľȤ','����Կ��Ȧ','','images/index/best/8.jpg','��50.00','','0','0','0'),
(null,'Martube C...','���������籦','','images/index/best/9.jpg','��98.00','','0','0','0'),
(null,'Scrubba','������ϴ��','','images/index/best/10.jpg','��339.00','','0','0','0'),
(null,'booxi','�绰�������ɺ�','','images/index/best/11.jpg','��126.00','','0','0','0'),
(null,'KINTO','����ʽ �˲���','','images/index/best/12.jpg','��128.00','','0','0','0'),
(null,'����','���޼�ѹë�� ���','','images/index/best/13.jpg','��19.50','','0','0','0'),
(null,'��Ұ��','С������','','images/index/best/14.jpg','��75.00','','0','0','0'),
(null,' ���ֵ�',' ��ͱ�','','images/index/best/15.jpg','��32.00','','0','0','0'),
(null,'','�ڰ׳���T��','','images/index/best/16.jpg','��119.00','','0','0','0'),
(null,'DOROQ �����','��������','','images/index/best/17.jpg','��99.00','','0','0','0'),
(null,'','�������','','images/index/best/18.jpg','��99.00','','0','0','0'),
(null,'','�մ� ��Լ����','','images/index/best/19.jpg','��39.9','','0','0','0'),
(null,'Taste plu...','������װ','','images/index/best/20.jpg','��1900.00','','0','0','0'),
(null,'umtea ',' �¹�������','','images/index/best/21.jpg','��98.00','','0','0','0'),
(null,'','���ⱳ������Ŷ�����','','images/index/best/22.jpg','��298.00','','0','0','0'),
(null,'','����������','','images/index/best/23.jpg','��57.00','','0','0','0'),
(null,'','��ʵľ����','','images/index/best/24.jpg','��1599.00','','0','0','0'),
(null,'����','�ֹ�������','','images/index/best/25.jpg','��29.80','','0','0','0'),
(null,'','���޳���','','images/index/best/26.jpg','��399.00','','0','0','0'),
(null,'THE BEAST...','��ɫ����ʯ̨��','','images/index/best/27.jpg','��599.00','','0','0','0'),
(null,'ľ��','õ�廨ζ̼������','','images/index/best/28.jpg','��18.00','','0','0','0'),
(null,'�ȷ�','���̹���','','images/index/best/29.jpg','��33.00','','0','0','0'),
(null,'��Ʒ��ζ','̨��ʿ�ֺ��ǽ�ĸ��','','images/index/best/30.jpg','��65.00','','0','0','0'),
(null,'Andfunns','��Яװ�������','','images/index/best/31.jpg','��48.00','','0','0','0'),
(null,'','������','','images/index/best/32.jpg','��29.00','','0','0','0'),
(null,'','���������ָ�è��','','images/index/best/33.jpg','��1.80','','0','0','0'),
(null,'�����','Ӱ�໨���Ӱ�Ա�','','images/index/best/34.jpg','��398.00','','0','0','0'),
(null,'Michael M...','��������','','images/index/best/35.jpg','��1380.00','','0','0','0'),
(null,'��ݮ�����ɿ���','����ͤ','','images/index/best/36.jpg','��33.00','','0','0','0'),
(null,'Ĩ�����׼��','�ز�','','images/index/best/37.jpg','��89.00','','0','0','0'),
(null,'','��������','','images/index/best/38.jpg','��99.00','','0','0','0'),
(null,'','�в�è����װ��Ʒ','','images/index/best/39.jpg','��198.00','','0','0','0'),
(null,'RSVP','����С�����ǩ������','','images/index/best/40.jpg','��168.00','','0','0','0'),
(null,'','�ں�����ױ��','','images/index/best/41.jpg','��125.00','','0','0','0'),
(null,'','�ó涣ҧֹ����','','images/index/best/42.jpg','��115.28','','0','0','0'),
(null,'','����ζţ�鵰��','','images/index/best/43.jpg','��27.00','','0','0','0'),
(null,'һƬ��','�м�ţ�ż���','','images/index/best/44.jpg','��15.00','','0','0','0'),
(null,'��ȸ�±���','������ˮζʲ����','','images/index/best/45.jpg','��34.90','','0','0','0');


/*-- --==========================================================================
--bannerͼ     gk_banner_pic      (index,selected,article)
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
'images/index/banner/03.jpg','Place | Kinfolk �豾�����칫��','���е������һ��',''),
(null,'images/index/banner/05.jpg','images/index/banner/05.jpg',
'images/index/banner/06.jpg','���� | ��ѹ��߲�����','����������� Karolina Samal? ����һ���ʻ����е���ɥ�������������Լ��İ汾�����ԱȻ�������',''),
(null,'images/index/banner/07.jpg','images/index/banner/09.jpg',
'images/index/banner/08.jpg','ר�� | RUMO ���ԣ�������θ�����','���죬���լ�Ҳ���������',''),
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
'images/index/tuijie/1.jpg','���wahool','����ȫ��������ֵꡢԭ�����ʦ��ʱ��ICON�Լ������˵ļ���أ�������ǰհ��ʱ�г����Ļ���',''),
(null,'images/index/tuijie/2.jpg','images/index/tuijie/2.jpg',
'images/index/tuijie/2.jpg','���õ���B��','���ʺ��������ھ���ָ�������Ʒ�ʵ����õ�Ʒ������ʳס�е�ʵ�ﵽ��ɫȮ��ľ������磬�����ù���˵...',''),
(null,'images/index/tuijie/3.jpg','images/index/tuijie/3.jpg',
'images/index/tuijie/3.jpg','Lookʱ������','Hi�������� Look ʱ�����ģ�ÿ�������Ȥ��������ʵ�õ�ʱ�к��ġ�����������������У�����...',''),
(null,'images/index/tuijie/4.jpg','images/index/tuijie/4.jpg',
'images/index/tuijie/4.jpg','Enjoy��Ȥ','����һ���о���ΰ�Ǯ����Ư����',''),
(null,'images/index/tuijie/5.jpg','images/index/tuijie/5.jpg',
'images/index/tuijie/5.jpg','������ˮ','����������',''),
(null,'images/index/tuijie/6.jpg','images/index/tuijie/6.jpg',
'images/index/tuijie/6.jpg','èʺ����','����Ů����ָ�ϣ������Ƽ��ù��绻���Ĳ�ױ�����ϲ����ѵ��·�����������ָ����ʳ�����õ��߳���С�','');


/* --=====================================================================
--eventչʾ��     gk_event
--==================================================================== */
create table gk_event(
    eid int,
    title varchar(128) default null,
    sub_title varchar(128) default null,
    details varchar(256) default null,
    pic varchar(128) default null
 );
insert into gk_event values
 (null,'Զ���������ȣ�����������Ƣ��̴ľ�� |...',
 '��л����ó����ң���ӹ������꣬��ʹ����������һ�βμ����û���������Ӻܾ�ϲ��������ʵ...','','images/event/1.jpg'),
 (null,'һ���������������Ȥ���� | ?��͵��...',
 '����Ҫ��л���⣬���������н��ҵ�û�뵽��Ȼ���ϰ��ˣ����ҳ�Ϊ������֮һ���о������������һ��...','','images/event/2.jpg'),
 (null,'�����˹����õķ���˲��ϲ����VISOANSKA | �ϵ�',
 '...','','images/event/3.jpg'),
  (null,'�����ҵ�һƿ�ʺ����˵Ļ�ױˮ | ��С�����',
  '���˱ر�����-����ˮ�ǳ���лVISOANSKA�������õĻ��ᣬ��������...','','images/event/4.jpg'),
 (null,' �����ح���������еķ���',
 '...','','images/event/5.jpg'),
  (null,' ���ϰ����Ѿ��Ժȱ��棨С��ƪ�� ',
  'Accolade Wine���μ����ǰĴ����Ǳ�����...','','images/event/6.jpg'),
 (null,'���ϰ����Ѿ��Ժȱ��棨Alex Seriousƪ��',
 '...','','images/event/7.jpg'),
 (null,'���ϰ����Ѿ��Ժȱ��棨_Songƪ��',
 '...','','images/event/8.jpg'),
 (null,'��ӡ���еĹ��ϻ���Ľ˹����������Ѿƣ�Nickƪ��',
 '...','','images/event/9.jpg'),
 (null,'���ø���ح��������õ����ñ����ٱ�������',
 '��Ϊһ���Ļ�ױˮ�������ˣ����������ⷽ���ν...','','images/event/10.jpg'),
  (null,'�������ñ���ح���ܱ�����������ԭ���������Ŀڸ�(o^^o)',
  '��ඣ�����������...','','images/event/11.jpg'),
  (null,'Oracleen�ܱ��ܵ綯��ˢ���ñ��棨have fait...',
  '���Ȱ��չ��ʹ�����л�����ܹ�����������ᣡ���н�����һ���Ҿ��Ѿ���ʼ�˷���...','','images/event/12.jpg'),
  (null,'���ܱ��ܷŽ��������ʲô���飿ح���ø���',
  '�ܱ�����ʦ�Ǹ���������ʵ��...','','images/event/13.jpg');

/* --?????????????????????????????????????????????
--=====================================================================
--storeչʾ��     gk_store
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
(null,'��������','','images/store/3.jpg'),
(null,'С������ʽ��ʹ�','','images/store/4.jpg'),
(null,'RECYCLE ��ǩ','','images/store/5.jpg'),
(null,'ӣ ů���Ż��꿪������','','images/store/6.jpg'),
(null,'Sakura ʳ������������','','images/store/7.jpg'),
(null,'�������Ͳ�Ҷ���Ⱥ�','','images/store/8.jpg'),
(null,' �������ɫ���','','images/store/9.jpg'),
(null,'����б�����ð�','','images/store/10.jpg'),
(null,'��ֽ���� ��Ƭ��','','images/store/11.jpg'),
(null,'�������һ�','','images/store/12.jpg');



