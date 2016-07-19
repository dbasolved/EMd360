DEF section_name = '3b. Database Info';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. System Global Aera';
DEF main_table = 'sysman.mgmt$db_sga';
BEGIN
  :sql_text := '
select sganame, sgasize
from sysman.mgmt$db_sga
where target_guid = ''&&emd360db_guid''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. System Global Aera (Dynamic Components)';
DEF main_table = 'sys.v$sga_dynamic_components';
BEGIN
  :sql_text := '
SELECT CASE
         WHEN component = ''DEFAULT buffer cache''     THEN ''D:buffer cache''
         WHEN component = ''DEFAULT 2K buffer cache''  THEN ''D: 2K buffer cache''
         WHEN component = ''DEFAULT 4K buffer cache''  THEN ''D: 4K buffer cache''
         WHEN component = ''DEFAULT 8K buffer cache''  THEN ''D: 8K buffer cache''
         WHEN component = ''DEFAULT 16K buffer cache'' THEN ''D:16K buffer cache''
         WHEN component = ''DEFAULT 32K buffer cache'' THEN ''D:32K buffer cache''
         WHEN component = ''KEEP buffer cache''        THEN ''K:buffer cache''
         WHEN component = ''RECYCLE buffer cache''     THEN ''R:buffer cache''
         ELSE component
       END component,
       current_size/1048576 current_size,
       last_oper_type ||
         CASE 
           WHEN last_oper_mode IS NOT NULL THEN ''/'' || SUBSTR(last_oper_mode,1,3)
           ELSE NULL
         END typmod,
       last_oper_Time,
       CASE WHEN component LIKE ''%buffer cache%'' THEN 0 ELSE 1 END order_col
FROM   sys.v$sga_dynamic_components
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '3. Memory Resize Operations';
DEF main_table = 'sys.v$sga_resize_ops';
BEGIN
  :sql_text := '
SELECT start_time, (end_time-start_time)*3600*24 ela,
       CASE
         WHEN component = ''DEFAULT buffer cache''     THEN ''D:buffer cache''
         WHEN component = ''DEFAULT 2K buffer cache''  THEN ''D: 2K buffer cache''
         WHEN component = ''DEFAULT 4K buffer cache''  THEN ''D: 4K buffer cache''
         WHEN component = ''DEFAULT 8K buffer cache''  THEN ''D: 8K buffer cache''
         WHEN component = ''DEFAULT 16K buffer cache'' THEN ''D:16K buffer cache''
         WHEN component = ''DEFAULT 32K buffer cache'' THEN ''D:32K buffer cache''
         WHEN component = ''KEEP buffer cache''        THEN ''K:buffer cache''
         WHEN component = ''RECYCLE buffer cache''     THEN ''R:buffer cache''
         ELSE component
       END component,
       SUBSTR(oper_type,1,3)||''/''||SUBSTR(oper_mode,1,3) typmod,
       initial_size/1048576 initial_size, (final_size-initial_size)/1048576 a_delta,
       CASE WHEN (target_size!=final_size) then (target_size-initial_size)/1048576
       END t_delta,
       final_size/1048576 final_size, SUBSTR(status,1,3) status
FROM  sys.v$sga_resize_ops o
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '4. SGA Resize Operations Summary';
DEF main_table = 'sys.v$sga_resize_ops';
BEGIN
  :sql_text := '
SELECT CASE
         WHEN component = ''DEFAULT buffer cache''     THEN ''D:buffer cache''
         WHEN component = ''DEFAULT 2K buffer cache''  THEN ''D: 2K buffer cache''
         WHEN component = ''DEFAULT 4K buffer cache''  THEN ''D: 4K buffer cache''
         WHEN component = ''DEFAULT 8K buffer cache''  THEN ''D: 8K buffer cache''
         WHEN component = ''DEFAULT 16K buffer cache'' THEN ''D:16K buffer cache''
         WHEN component = ''DEFAULT 32K buffer cache'' THEN ''D:32K buffer cache''
         WHEN component = ''KEEP buffer cache''        THEN ''K:buffer cache''
         WHEN component = ''RECYCLE buffer cache''     THEN ''R:buffer cache''
         ELSE component
       END component,
       MIN(final_size)/1048576 min_size, MAX(final_size)/1048576 max_size, ROUND(AVG(final_size)/1048576) avg_size,
       COUNT(*) num_resizes,
       SUM(CASE WHEN oper_type = ''GROW''   THEN 1 ELSE 0 END) num_gro,
       SUM(CASE WHEN oper_type = ''SHRINK'' THEN 1 ELSE 0 END) num_shr,
       CASE WHEN component LIKE ''%buffer cache%'' THEN 0 ELSE 1 END order_col
FROM  sys.v$sga_resize_ops
GROUP BY component
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '5. Memory Resize Operations Summary';
DEF main_table = 'sys.v$memory_resize_ops';
BEGIN
  :sql_text := '
SELECT CASE
         WHEN component = ''DEFAULT buffer cache''     THEN ''D:buffer cache''
         WHEN component = ''DEFAULT 2K buffer cache''  THEN ''D: 2K buffer cache''
         WHEN component = ''DEFAULT 4K buffer cache''  THEN ''D: 4K buffer cache''
         WHEN component = ''DEFAULT 8K buffer cache''  THEN ''D: 8K buffer cache''
         WHEN component = ''DEFAULT 16K buffer cache'' THEN ''D:16K buffer cache''
         WHEN component = ''DEFAULT 32K buffer cache'' THEN ''D:32K buffer cache''
         WHEN component = ''KEEP buffer cache''        THEN ''K:buffer cache''
         WHEN component = ''RECYCLE buffer cache''     THEN ''R:buffer cache''
         ELSE component
       END component,
       MIN(final_size)/1048576 min_size, MAX(final_size)/1048576 max_size, ROUND(AVG(final_size)/1048576) avg_size,
       COUNT(*) num_resizes,
       SUM(CASE WHEN oper_type = ''GROW''   THEN 1 ELSE 0 END) num_gro,
       SUM(CASE WHEN oper_type = ''SHRINK'' THEN 1 ELSE 0 END) num_shr,
       CASE WHEN component LIKE ''%buffer cache%'' THEN 0 ELSE 1 END order_col
FROM  sys.v$memory_resize_ops
GROUP BY component
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '6. PGA Resize Operations Overview';
DEF main_table = 'sys.dba_hist_pgastat';
BEGIN
  :sql_text := '
SELECT s.instance_number, TRUNC(end_interval_time,''MI'') snap_time,
       SUM(CASE WHEN name=''aggregate PGA target parameter'' THEN value ELSE 0 END)/1048576 pga_target,
       ROUND(SUM(CASE WHEN name=''total PGA allocated'' THEN value ELSE 0 END)/1048576) pga_alloc,
       SUM(CASE WHEN name=''process count'' THEN value ELSE 0 END) procs,
       ROUND(SUM(CASE WHEN name=''total PGA used for auto workareas''   THEN value ELSE 0 END)/1048576,2) auto,
       ROUND(SUM(case when name=''total PGA used for manual workareas'' THEN value ELSE 0 END)/1048576,2) manual
FROM   sys.dba_hist_snapshot s, sys.dba_hist_pgastat  p
WHERE  s.dbid = p.dbid
  AND  s.instance_number   = p.instance_number
  AND  s.snap_id           = p.snap_id
  AND  s.end_interval_time > TRUNC(SYSDATE)-31
  AND  p.name IN (''total PGA allocated'', ''aggregate PGA target parameter'',''process count'',''total PGA used for auto workareas'',''total PGA used for manual workareas'')
GROUP BY s.instance_number, TRUNC(end_interval_time,''MI'')
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '7. Options';
DEF main_table = 'sysman.mgmt$db_options';
BEGIN
  :sql_text := '
select name, selected
from sysman.mgmt$db_options
where target_guid = ''&&emd360db_guid''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '8. Initialization Parameters';
DEF main_table = 'sysman.mgmt$db_init_params';
BEGIN
  :sql_text := '
select name, isdefault, value
from sysman.mgmt$db_init_params
where target_guid = ''&&emd360db_guid''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '9. License Info';
DEF main_table = 'sysman.mgmt$db_init_params';
BEGIN
  :sql_text := '
select target_name, target_type, sessions_current, sessions_highwater, users_max, collection_timestamp last_time_collected
from sysman.mgmt$db_license
where target_guid = ''&&emd360db_guid''
';
END;
/
@@emd360_9a_pre_one.sql
