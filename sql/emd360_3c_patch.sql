DEF section_name = '3c. Patches';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Patch Sets';
DEF main_table = 'sys.dba_registry';
BEGIN
 :sql_text := '
select comp_id, version from sys.dba_registry
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. Patch History';
DEF main_table = 'sys.registry$history';
BEGIN
 :sql_text := '
SELECT * 
FROM sys.registry$history
';
END;
/
@@emd360_9a_pre_one.sql