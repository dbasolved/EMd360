DEF section_name = 'Administrators';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = 'Total Administrators';
DEF main_table = 'sysman.mgmt_created_users';
BEGIN
  :sql_text := '
select count(user_name) Total_Administrators
from sysman.mgmt_created_users
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'List of Administrators';
DEF main_table = 'sysman.mgmt_created_users';
BEGIN
  :sql_text := '
select user_name, system_user, last_authenticated_ts, user_description
from sysman.mgmt_created_users
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Missing EM Admin Accounts';
DEF main_table = 'sysman.mgmt_created_users';
BEGIN
  :sql_text := '
SELECT object_name
FROM   em_diag_schema_objects_ext o
WHERE  o.object_type = ''USER''
  AND  NOT EXISTS
       (SELECT 1
        FROM   sysman.mgmt_created_users u
        WHERE  u.user_name = o.object_name
          AND  u.system_user NOT IN (2,3))
  AND  o.object_name NOT IN (''CLOUD_ENGINE_USER'',''CLOUD_SWLIB_USER'',''ORACLE_OCM'',''SYSMAN_APM'',''SYSMAN_MDS'',''SYSMAN_OPSS'')
ORDER BY object_name
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Targets without valid owner';
DEF main_table = 'sysman.mgmt_created_users';
BEGIN
  :sql_text := '
SELECT e.entity_guid, e.entity_name, e.entity_type, e.host_name, e.owner
FROM   em_manageable_entities e
WHERE  NOT EXISTS
       (
        SELECT 1
        FROM   mgmt_created_users u 
        WHERE  u.user_name = e.owner
       )
  AND  e.owner != ''<SYSTEM>''
ORDER BY e.owner, e.entity_type, e.entity_name
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Non-Standard EM Admin Accounts';
DEF main_table = 'sysman.mgmt_created_users';
BEGIN
  :sql_text := '
SELECT u.user_id, c.user_name, c.system_user, u.account_status
FROM   dba_users u, sysman.mgmt_created_users c
WHERE  u.username        = c.user_name
  AND  u.account_status != ''EXPIRED ''||CHR(38)||'' LOCKED''
  AND  c.user_name IN (''CLOUD_ENGINE_USER'',''CLOUD_SWLIB_USER'',''SYSMAN_RO'')
ORDER BY c.user_name
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Pending Delete Users';
DEF main_table = 'sysman.mgmt_created_users';
BEGIN
  :sql_text := '
SELECT a.user_name, b.job_id, b.job_name, b.job_owner, b.system_job,
       DECODE(b.expired,0,''no'',1,''yes'',b.expired) expired,
       DECODE(b.job_status,0,''active'',1,''suspended'',2,''stopped'',3,''credentials'',b.job_status) job_status 
FROM   (SELECT user_name
        FROM   sysman.mgmt_created_users
        WHERE  deleting = 1) a,
       (SELECT j.job_id, j.job_name, j.job_owner, j.expired, j.job_status, j.system_job, p.scalar_value
        FROM   sysman.mgmt_job j, sysman.mgmt_job_parameter p
        WHERE  j.job_type       = ''DeleteUser''
          AND  j.expired        = 0
          AND  j.job_id         = p.job_id
          AND  p.execution_id   = HEXTORAW(''0000000000000000'')
          AND  p.parameter_name = ''user_name'') b
WHERE  a.user_name = b.scalar_value (+)
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Blocked EM Admin Accounts';
DEF main_table = 'sysman.mgmt_created_users';
BEGIN
  :sql_text := '
SELECT u.account_status, c.user_name, u.user_id, c.system_user
FROM   dba_users u, sysman.mgmt_created_users c
WHERE  u.username        = c.user_name
  AND  c.system_user NOT IN (1,2,3)
  AND  u.account_status != ''OPEN''
  AND  c.user_name NOT IN (''CLOUD_ENGINE_USER'',''CLOUD_SWLIB_USER'',''SYSMAN_RO'')
ORDER BY u.account_status, c.user_name
';
END;
/
@@emd360_9a_pre_one.sql

