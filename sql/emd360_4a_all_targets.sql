DEF section_name = '4a. Targets';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. All Targets';
DEF main_table = 'sysman.mgmt$target';
BEGIN
  :sql_text := '
select * from sysman.mgmt$target
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. Counts By Target Type';
DEF main_table = 'sysman.mgmt$target';
BEGIN
  :sql_text := '
select target_type, count(target_type)
from sysman.mgmt$target
group by target_type
';
END;
/
@@emd360_9a_pre_one.sql

