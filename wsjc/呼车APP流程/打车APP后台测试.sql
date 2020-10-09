网约车
包干
司机
乘客
--测试司机和乘客
"passengerId" : NumberLong("102100099506"),
"driverId" : NumberLong("1022001151659"),
--MYSQL 查询语句
select * from passengercarorders where passengerId = '102100099506';
select * from expdriverorders where driverId = '1022001151659';

--1.订单生成
select * from passengercarorders where passengerId = '102100099506';
--2.查询详情
select * from orderexpcarinstant where  orderId = '10202044030615049640'
select * from expdriverorders where orderId = '10202044030615049640';
select * from passengercarorders where orderId = '10202044030615049640';

1.正常流程：实时订单 orderexpcarinstant
    乘客发起 (订单和乘客订单生产)
  ->司机接单 (司机订单生产)
  ->司机到达地点
  ->司机开始计费
  ->司机结束行程发起账单 (司机订单同步至Mongo)
  ->乘客支付 (订单和乘客订单同步至Mongo)
 select * from passengercarorders where passengerId = '102100099506';
 select * from expdriverorders where orderId = '10202044030615049640';
select * from passengercarorders where orderId = '10202044030615049640';

2.成立取消流程： 乘客发起 -> 乘客取消
乘客发起: MYSQL中的订单是在乘客这边生产和同步
乘客取消：MYSQL中数据全部同步到MongoDB
--1.订单生产
select * from passengercarorders where passengerId = '102100099506';
--2.检查
select * from orderexpcarinstant where  orderId = '10202044030615049642' 
select * from expdriverorders where orderId = '10202044030615049642'; 

3.预约车 orderExpCarReserve
    乘客发起(乘客订单生产，总订单没有生成)
  ->司机接单 (司机订单生产)
  ->司机到达地点 
  ->司机开始计费
  ->司机结束行程发起账单
  ->
> db.orderExpCarReserve.find().pretty().limit(2)
> db.orderExpCarReserve.find({driverId:NumberLong("1022001151659")}).pretty()

--MongoDB查询语句
use carorder
db.OrderExpCarInstant.find({orderId:"10202044030615049640"}).pretty()
db.OrderExpCarInstant.find({orderId:"10202044030615049642"}).pretty()

db.orderExpCarReserve.find({orderId:"10202144030615009436"}).pretty()

db.ExpDriverOrders.find({passengerPhone:"17190412925"}).pretty()
db.orderExpCarReserve.find().pretty().limit(2)


--取消订单
db.PassengerCarOrders.find({orderId:"10202044030615049642"}).pretty()
{
        "_id" : ObjectId("5f7d779989276353645db0b9"),
        "orderId" : "10202044030615049642",
        "passengerId" : NumberLong("102100099506"),
        "createTime" : ISODate("2020-10-07T08:06:14Z"),
        "startAddr" : "中天美景大酒店",
        "endAddr" : "西乡体育中心",
        "status" : -20,   --？
        "orderType" : 20,
        "orderPrice" : 0,
        "channelId" : "1020000000",
        "isForOthers" : 0
}
--正常订单
db.PassengerCarOrders.find({orderId:"10202044030615049640"}).pretty() 
{
        "_id" : ObjectId("5f7d74f389276353645db0b3"),
        "orderId" : "10202044030615049640",
        "passengerId" : NumberLong("102100099506"),
        "createTime" : ISODate("2020-10-07T07:43:42Z"),
        "startAddr" : "旭生大厦",
        "endAddr" : "世界之窗",
        "status" : 60,        --？
        "orderType" : 20,     
        "orderPrice" : 1500,
        "driverId" : NumberLong("1022001151659"),  --？ 
        "channelId" : "1020000000",
        "isForOthers" : 0
}

user driver 
db.ExpDriverOrders.find({orderId:"10202044030615049640"}).pretty()
db.ExpDriverOrders.find({orderId:"10202044030615049642"}).pretty()


