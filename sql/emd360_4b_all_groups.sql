DEF section_name = '4b. Groups';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. All Groups';
DEF main_table = 'sysman.mgmt$group_members';
BEGIN
  :sql_text := '
select distinct group_name
from sysman.mgmt$group_members
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. Target Count Per Group';
DEF main_table = 'sysman.mgmt$group_members';
BEGIN
  :sql_text := '
select group_name, count(group_name) count
from sysman.mgmt$group_members
group by group_name
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '3. Derived Group Membership';
DEF main_table = 'sysman.mgmt$group_members';
BEGIN
  :sql_text := '
select composite_target_name group_name, member_target_name target_name, member_target_type target_type 
from sysman.mgmt$group_derived_memberships
';
END;
/
@@emd360_9a_pre_one.sql
