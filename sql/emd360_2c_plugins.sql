DEF section_name = '2c. Plug-Ins';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Repository Plug-Ins';
DEF main_table = 'sysman.GC_CURRENT_DEPLOYED_PLUGIN';
BEGIN
 :sql_text := '
SELECT PLUGIN_ID,
  VERSION,
  PLUGIN_NAME,
  DESTINATION_TYPE,
  DESTINATION_NAME,
  PLUGIN_HOME,
  deployed_date
FROM SYSMAN.GC_CURRENT_DEPLOYED_PLUGIN
where destination_type = ''Repository''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. Oracle Management Server (OMS) Plug-Ins';
DEF main_table = 'sysman.GC_CURRENT_DEPLOYED_PLUGIN';
BEGIN
 :sql_text := '
SELECT PLUGIN_ID,
  VERSION,
  PLUGIN_NAME,
  DESTINATION_TYPE,
  DESTINATION_NAME,
  PLUGIN_HOME,
  deployed_date
FROM SYSMAN.GC_CURRENT_DEPLOYED_PLUGIN
where destination_type = ''OMS''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '3. Agent Plug-Ins';
DEF main_table = 'sysman.GC_CURRENT_DEPLOYED_PLUGIN';
BEGIN
 :sql_text := '
SELECT PLUGIN_ID,
  VERSION,
  PLUGIN_NAME,
  DESTINATION_TYPE,
  DESTINATION_NAME,
  PLUGIN_HOME,
  deployed_date
FROM SYSMAN.GC_CURRENT_DEPLOYED_PLUGIN
where destination_type = ''Agent''
';
END;
/
@@emd360_9a_pre_one.sql
