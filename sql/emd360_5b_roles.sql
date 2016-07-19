DEF section_name = '5b. Roles';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Total Roles';
DEF main_table = 'sysman.mgmt_roles';
BEGIN
 :sql_text := '
select count(role_name)
from sysman.mgmt_roles
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. List of Roles';
DEF main_table = 'sysman.mgmt_roles';
BEGIN
 :sql_text := '
select role_name, description, role_type
from sysman.mgmt_roles
';
END;
/
@@emd360_9a_pre_one.sql
