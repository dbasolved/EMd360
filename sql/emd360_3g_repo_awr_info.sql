DEF section_name = 'Repository AWR Info';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = 'AWR Size (SYSAUX)';
DEF main_table = 'sys.v$sysaux_occupants';
BEGIN
 :sql_text := '
SELECT occupant_name, occupant_desc, ROUND(space_usage_kbytes/(1024*1024),2) space_gb
FROM   sys.v$sysaux_occupants
WHERE  occupant_name LIKE ''%AWR%''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'AWR Retention';
DEF main_table = 'sys.dba_hist_wr_control';
BEGIN
 :sql_text := '
SELECT EXTRACT(day FROM snap_interval)*24*60+EXTRACT(hour FROM snap_interval)*60+EXTRACT(minute FROM snap_interval) interval_min,
       (EXTRACT(day FROM retention)*24*60+EXTRACT(hour FROM retention)*60+EXTRACT(minute FROM retention))/(60*24) retention_days
FROM   sys.dba_hist_wr_control
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'AWR Retention';
DEF main_table = 'sys.dba_hist_snapshot';
BEGIN
 :sql_text := '
SELECT snap_id, dbid, instance_number, begin_interval_time, end_interval_time
FROM   sys.dba_hist_snapshot
WHERE  begin_interval_time > SYSDATE-31
';
END;
/
@@emd360_9a_pre_one.sql
