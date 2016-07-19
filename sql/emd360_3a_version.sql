DEF section_name = '3a. Version';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Version';
DEF main_table = 'sys.v$instance';
BEGIN
 :sql_text := '
select version db_version
from sys.v$instance
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. Banner Info';
DEF main_table = 'sys.v$version';
BEGIN
 :sql_text := '
select banner 
from sys.v$version
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '3. General Info';
DEF main_table = 'sys.v$database';
BEGIN
 :sql_text := '
select dbid, name, created, log_mode, current_scn, open_mode
from v$database
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '4. Logging Info';
DEF main_table = 'sys.v$database';
BEGIN
 :sql_text := '
select supplemental_log_data_min, supplemental_log_data_pk, supplemental_log_data_ui, force_logging
from v$database
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '5. DataGuard Info';
DEF main_table = 'sys.v$database';
BEGIN
 :sql_text := '
select dataguard_broker, guard_status, protection_mode, protection_level
from v$database
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '6. Instance Info';
DEF main_table = 'sys.v$instance';
BEGIN
 :sql_text := '
select instance_number, version, startup_time, status, archiver, logins, database_status, blocked
from v$instance
';
END;
/
@@emd360_9a_pre_one.sql
