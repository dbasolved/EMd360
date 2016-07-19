DEF section_name = '2d. Blackout Operations';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Blackouts that have been started';
DEF main_table = 'sysman.MGMT$BLACKOUTS';
BEGIN
  :sql_text := '
SELECT created_by,
  blackout_name,
  reason,
  description,
  status,
  TO_CHAR(last_start_time, ''DD-MON-YY HH24:MI:SS'') last_start_time,
  TO_CHAR(last_end_time,''DD-MON-YY HH24:MI:SS'') last_end_time,
  schedule_type,
  TO_CHAR(schedule_start_time, ''DD-MON-YY HH24:MI:SS'') scheduled_start_time,
  TO_CHAR(schedule_end_time, ''DD-MON-YY HH24:MI:SS'') scheduled_end_time,
  ROUND(duration/60,0) duration_min
FROM sysman.MGMT$BLACKOUTS
WHERE status = ''Started''
ORDER BY last_start_time
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. Blackout history last &&emd360_conf_days.';
DEF main_table = 'sysman.mgmt$blackout_history';
BEGIN
  :sql_text := '
SELECT blackout_name,
  created_by,
  TO_CHAR(start_time, ''DD-MON-YY HH24:MI:SS'') start_time,
  TO_CHAR(end_time, ''DD-MON-YY HH24:MI:SS'') end_time,
  target_type,
  status
FROM sysman.mgmt$blackout_history
WHERE start_time <= trunc(sysdate) - ''&&emd360_conf_days''
';
END;
/
@@emd360_9a_pre_one.sql