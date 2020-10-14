--#############常用命令###############################
-- #######正则语句########
--notepad++ 去重
^(.*?)$\s+?^(?=.*^\1$)
 
---删除每行--remove之前所有内容
(.*)--remove
--remove
 
--###vim 常用命令
   ggVG        全选
   set nu      显示行数
   num1,num2d  删除从num1到num2的行
   
   --##获取当前脚本绝对路径
   basepath=$(cd `dirname $0`; pwd)
 
 ## mysql竖着输出
 select * from orderexpcarinstant limit 1 \G ;
 
 --#####获取hive表数据##########
 -- -----------获取hive表数据1------------------
 --1.将数据写到临时表中
   insert overwrite table `dev_dm_sdm.sdm_app_nwb_newyear_tmp`
   select * from dm_sdm.sdm_app_nwb_rpt_wechat_newyear_d_new
   ;
 --2. 将数据写到hdfs临时目录
 set hive.mapred.mode=nonstrict;
 set hive.exec.compress.output=false;
 use dev_dm_sdm ;
 
 INSERT OVERWRITE  DIRECTORY 'hdfs:///tmp/sdm_app_web_new_cust_inf_d/sdm_app_nwb_newyear_tmp' 
 ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' NULL DEFINED AS '' 
 SELECT * FROM dev_dm_sdm.sdm_app_nwb_newyear_tmp
 
 --3.拉取hdfs文件
 hadoop fs -getmerge 'hdfs:///tmp/sdm_app_web_new_cust_inf_d/sdm_app_nwb_newyear_tmp/*' /home/sdm_app/xx2020/sdm_app_nwb_newyear_tmp.csv
 
 -- -----------获取hive表数据2--------------
 但分区表
 insert overwrite DIRECTORY 'hdfs:///tmp/tmp01'
 row format delimited fields terminated by '\t' lines terminated by '\n' NULL DEFINED AS '' 
 select * from driver.ods_driver_company_expdriver where ;
 
 hadoop fs -getmerge 'hdfs:///tmp/tmp01/*' /home/pubuser/xxu/tmp01.csv
 
load data local inpath '/home/pubuser/xxu/tmp01.csv' into table tmp01 part

--------------------------------------------------

 
