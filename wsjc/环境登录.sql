#dev跳板机
ip  ：172.18.19.217
port：20962

#选择任意节点登录
> emr 

#登录 hbase
#登录 hive

#登录 mongo 
> mongo 172.18.5.100:20017
#认证
> use admin
> db.auth("appuser","0IP6k+ERm39lTpjsdBkhohY75WMkyB")
#常用查询
> show dbs         
> use carorder
> show collections
> db.OrderExpCarInstant.find().pretty().limit(2) -- 10202044030630
> db.orderExpCarAppoint.find().pretty().limit(2) -- 1020224403064
> db.orderExpCarReserve.find().pretty().limit(1) -- 1020214403062
> db.OrderExpCarInstant.find({orderId:"10202044030615049617"}).pretty()

##########################生产环境
腾讯云的跳板机：172.25.0.3   端口：20962
阿里云的跳板机：172.18.2.214  端口：20962   
用户名和密码是你名字拼音

dtmpl_prod_emr_data01   hive集群环境
172.18.239.251          Azkaban 部署环境
