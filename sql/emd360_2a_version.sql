DEF section_name = '2a. Version';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Version';
DEF main_table = 'sysman.mgmt_oms_parameters';
BEGIN
 :sql_text := '
select name, value
from sysman.mgmt_oms_parameters
where name = ''OMS_ID''
union all
select name, value
from sysman.mgmt_oms_parameters
where name in (''EM_SERVER_NAME'', ''EM_RELEASE_VERSION'', ''ORACLE_HOME'', ''INSTANCE_HOME'')
';
END;
/
@@emd360_9a_pre_one.sql