--######### 打车APP后台业务流程：呼叫业务流程

/*##############################################################
订单完成前：数据在Mysql
##############################################################*/
--1.查询运营监控网站，查看订单号

--2.连接Mysql（UAT(传统出行)）
-- 实时单(乘客发起实时呼车，订单生成)
select * from orderexpcarinstant where  orderId = '10202044030615049617'  
-- 扫码起单(乘客扫司机提供二维码)
select * from orderexpcarappoint;
-- 预约单(乘客发起预约呼叫)
select * from orderexpcarreserve;

-- 司机订单表
select * from expdriverorders where orderId = '10202044030615049617';
-- 乘客订单表
select * from passengercarorders where orderId = '10202044030615049617';

/*##############################################################
订单完成后：数据同步到MongoDB
##############################################################*/
--连接MongoDB（UAT(传统出行)）
数据查询通过mongos连接：emr任意机器连接
mongo 172.18.5.100:20017
## 认证
use admin
db.auth("appuser","0IP6k+ERm39lTpjsdBkhohY75WMkyB")

--MongoDB使用：
--查询carorder数据：正常(乘客支付打车账单后，订单完成)
## 查库
mongos> show dbs         
## 选库
mongos> use carorder
## 查表
mongos> show collections
## 查询数据
mongos> db.OrderExpCarInstant.find().pretty().limit(2)
## 查询订单数据
mongos> db.OrderExpCarInstant.find({orderId:"10202044030615049617"}).pretty()

--查询driver数据：正常(司机提交打车账单后)
mongos> show dbs
mongos> user driver
mongos> show collections
mongos> db.ExpDriverOrders.find().pretty().limit(2)
mongos> db.ExpDriverOrders.find({orderId:"10202044030615049617"}).pretty()

--查询PassengerCarOrders：正常(乘客支付打车账单后)
mongos> show dbs
mongos> use carorder
mongos> show collections
mongos> db.PassengerCarOrders.find().pretty().limit(2)
mongos> db.PassengerCarOrders.find({orderId:"10202044030615049617"}).pretty()