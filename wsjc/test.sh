#!/bin/bash
#- 任务名：  <ScriptFile>   </ScriptFile>
#- 目标表:  <TargetTable>   </TargetTable>
#- 源表:    <SourceTable>  
#-           
#-           
#-          </SourceTable>
#- 运行方式：   每日全量/每日增量/月末/月初跑上月末
#- 运行频率：   日/月
#- 任务功能说明：<Remark>web端数据报表-v3-数据中台</Remark>
#- 创建时间：    <CreateDate> </CreateDate>
#- 修改记录：
#--------------------------------------------------------
#- 修改人         修改日期        修改内容
#- xuxiu         2020-10-01       工单编号+修改内容
#---------------------------------------------------------

hive shell << EOF
-- 数据库
USE DEFAULT;

 INSERT overwrite TABLE t_emp
 SELECT id
      , name
   FROM e_emp
  WHERE id='101';

 INSERT INTO t_emp
 SELECT id    -- 员工号
      , name  -- 员工姓名
   FROM e_emp
  WHERE id='102';
EOF