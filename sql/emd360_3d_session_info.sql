DEF section_name = 'Session Info';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = 'Active Sessions';
DEF main_table = 'sys.v$session';
BEGIN
  :sql_text := '
select sid, serial#, username, status, schemaname, osuser, process, machine, port, terminal, program, type, sql_address, sql_id, logon_time, resource_consumer_group 
from sys.v$session
where status = ''ACTIVE''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Inactive Sessions';
DEF main_table = 'sys.v$session';
BEGIN
  :sql_text := '
select sid, serial#, username, status, schemaname, osuser, process, machine, port, terminal, program, type, sql_address, sql_id, logon_time, resource_consumer_group 
from sys.v$session
where status = ''INACTIVE''
';
END;
/
@@emd360_9a_pre_one.sql