DEF section_name = '3h. Cost Based Optimizer Info';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. CBO System Settings';
DEF main_table = 'sys.user_tab_stat_prefs';
BEGIN
 :sql_text := '
SELECT table_name, MIN(a) incremental, MIN(b) granularity, MIN(c) stale_pct
FROM   (
         SELECT table_name, preference_value a, NULL b, NULL c
         FROM   sys.user_tab_stat_prefs p
         WHERE  preference_name = ''INCREMENTAL''
        UNION ALL
         SELECT table_name, NULL a, preference_value b, NULL c
         FROM   sys.user_tab_stat_prefs p
         WHERE  preference_name = ''GRANULARITY''
        UNION ALL
         SELECT table_name, NULL a, NULL b, preference_value c
         FROM   sys.user_tab_stat_prefs p
         WHERE  preference_name = ''STALE_PERCENT''
       )
GROUP BY table_name
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. CBO Repository Settings';
DEF main_table = 'sysman.em_stats_monitor';
BEGIN
 :sql_text := '
SELECT table_name, MIN(run_type) run_type, MIN(a) incremental, MIN(b) granularity, MIN(c) stale_pct
FROM   (
         SELECT table_name, run_type, pref_value a, NULL b, NULL c
         FROM   sysman.em_stats_monitor p
         WHERE  pref_name = ''INCREMENTAL''
        UNION ALL
         SELECT table_name, run_type, NULL a, pref_value b, NULL c
         FROM   sysman.em_stats_monitor p
         WHERE  pref_name = ''GRANULARITY''
        UNION ALL
         SELECT table_name, run_type, NULL a, NULL b, pref_value c
         FROM   sysman.em_stats_monitor p
         WHERE  pref_name = ''STALE_PERCENT''
       )
GROUP BY table_name
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '3. CBO Statistics Gathering Log (last 31 days)';
DEF main_table = 'sysman.em_stats_monitor';
BEGIN
 :sql_text := '
SELECT log_date, run_type, ROUND(duration) duration, objects_analyzed, objects_stale, objects_filter, top_n value
FROM   sysman.em_stats_monitor_log
WHERE  log_date > SYSDATE-31
';
END;
/
@@emd360_9a_pre_one.sql