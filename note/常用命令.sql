--#############��������###############################
-- #######�������########
--notepad++ ȥ��
^(.*?)$\s+?^(?=.*^\1$)
 
---ɾ��ÿ��--remove֮ǰ��������
(.*)--remove
--remove
 
--###vim ��������
   ggVG        ȫѡ
   set nu      ��ʾ����
   num1,num2d  ɾ����num1��num2����
   
   --##��ȡ��ǰ�ű�����·��
   basepath=$(cd `dirname $0`; pwd)
 
 ## mysql�������
 select * from orderexpcarinstant limit 1 \G ;
 
 --#####��ȡhive������##########
 -- -----------��ȡhive������1------------------
 --1.������д����ʱ����
   insert overwrite table `dev_dm_sdm.sdm_app_nwb_newyear_tmp`
   select * from dm_sdm.sdm_app_nwb_rpt_wechat_newyear_d_new
   ;
 --2. ������д��hdfs��ʱĿ¼
 set hive.mapred.mode=nonstrict;
 set hive.exec.compress.output=false;
 use dev_dm_sdm ;
 
 INSERT OVERWRITE  DIRECTORY 'hdfs:///tmp/sdm_app_web_new_cust_inf_d/sdm_app_nwb_newyear_tmp' 
 ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' NULL DEFINED AS '' 
 SELECT * FROM dev_dm_sdm.sdm_app_nwb_newyear_tmp
 
 --3.��ȡhdfs�ļ�
 hadoop fs -getmerge 'hdfs:///tmp/sdm_app_web_new_cust_inf_d/sdm_app_nwb_newyear_tmp/*' /home/sdm_app/xx2020/sdm_app_nwb_newyear_tmp.csv
 
 -- -----------��ȡhive������2--------------
 ��������
 insert overwrite DIRECTORY 'hdfs:///tmp/tmp01'
 row format delimited fields terminated by '\t' lines terminated by '\n' NULL DEFINED AS '' 
 select * from driver.ods_driver_company_expdriver where ;
 
 hadoop fs -getmerge 'hdfs:///tmp/tmp01/*' /home/pubuser/xxu/tmp01.csv
 
load data local inpath '/home/pubuser/xxu/tmp01.csv' into table tmp01 part

--------------------------------------------------

 
