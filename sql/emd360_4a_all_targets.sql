DEF section_name = 'Targets';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = 'All Targets';
DEF main_table = 'sysman.mgmt$target';
BEGIN
  :sql_text := '
select * from sysman.mgmt$target
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Counts By Target Type';
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

