DEF section_name = '2b. Patches';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Applied Patches';
DEF main_table = 'sysman.mgmt$applied_patches';
BEGIN
 :sql_text := '
SELECT PATCH,
  INSTALLATION_TIME,
  IS_PSU,
  IS_ONLINE_PATCH,
  PATCH_RELEASE,
  PLATFORM,
  HOST,
  HOME_LOCATION
FROM MGMT$APPLIED_PATCHES
where host = (select target_name from sysman.mgmt$target where target_guid = ''&&emd360_guid.'')
';
END;
/
@@emd360_9a_pre_one.sql
