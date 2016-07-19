DEF section_name = '4c. Templates';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Number of Templates';
DEF main_table = 'sysman.mgmt$templates';
BEGIN
  :sql_text := '
select count(1)
from (
select template_name, target_type, description, owner, created_date, last_updated_date, last_updated_by
from sysman.mgmt$templates
where owner != ''SYSMAN''
union
select template_name, target_type, description, owner, created_date, last_updated_date, last_updated_by
from sysman.mgmt$templates
where owner = ''SYSMAN''
and is_oracle_certified = 0
order by target_type
)
';
END;
/
@@emd360_9a_pre_one.sql


DEF title = '2. Default Templates';
DEF main_table = 'sysman.mgmt$templates';
BEGIN
  :sql_text := '
select template_name, target_type, description, owner, created_date, last_updated_date, last_updated_by
from sysman.mgmt$templates
where is_default = 1
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '3. Non-Certified Templates';
DEF main_table = 'sysman.mgmt$templates';
BEGIN
  :sql_text := '
select template_name, target_type, description, owner, created_date, last_updated_date, last_updated_by
from sysman.mgmt$templates
where owner != ''SYSMAN''
union
select template_name, target_type, description, owner, created_date, last_updated_date, last_updated_by
from sysman.mgmt$templates
where owner = ''SYSMAN''
and is_oracle_certified = 0
order by target_type
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '4. Template Metrics';
DEF main_table = 'sysman.mgmt$templates';
BEGIN
  :sql_text := '
select tms.template_name, tms.metric_name, tms.column_label, tms.warning_threshold, tms.critical_threshold
from sysman.mgmt$template_metric_settings tms, sysman.mgmt$templates t
where tms.template_guid = t.template_guid
order by tms.template_guid
';
END;
/
@@emd360_9a_pre_one.sql
