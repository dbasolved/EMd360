DEF section_name = 'Repository Schemas Info';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = 'Invalid Schema Tables';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT o.object_id, o.owner, o.object_name, o.created, o.last_ddl_time 
FROM   dba_objects o, dba_tables t
WHERE  o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  t.status     != ''VALID''
  AND  t.dropped     = ''NO''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Invalid Schema Indexes';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT i.owner, i.index_name, i.index_type, i.status, i.last_analyzed 
FROM   dba_objects o, dba_tables t, dba_indexes i 
WHERE  o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  i.table_name  = t.table_name
  AND  i.table_owner = t.owner
  AND  i.temporary   = ''N''
  AND  i.dropped     = ''NO''
  AND  i.status     != ''VALID''
ORDER BY i.index_name
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Unanalyzed Table';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT o.object_id, o.owner, o.object_name, o.object_type, o.created, o.last_ddl_time 
FROM   sys.dba_objects o, sys.dba_tables t
WHERE  o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  o.status      = ''VALID''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  t.last_analyzed IS NULL
  AND  t.temporary   = ''N''
  AND  NOT EXISTS
       (SELECT 1
        FROM   dba_queues q
        WHERE  q.queue_table = t.table_name)
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Unanalyzed Indexes';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT i.index_name, i.index_type, i.status 
FROM   dba_objects o, dba_tables t, dba_indexes i
WHERE  o.object_name=t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  o.status      = ''VALID''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  t.temporary   = ''N''
  AND  t.num_rows    > 100
  AND  i.table_name  = t.table_name
  AND  i.table_owner = t.owner
  AND  i.temporary   = ''N''
  AND  i.dropped     = ''NO''
  AND  i.last_analyzed IS NULL 
  AND  NOT EXISTS 
       (SELECT 1
        FROM   dba_queues q
        WHERE  q.queue_table = t.table_name)
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Stale statistics on Indexes';
DEF main_table = 'sys.user_tables';
BEGIN
 :sql_text := '
SELECT /*+ ORDERED */ t.table_name, t.blocks, t.num_rows, j.index_name, j.last_analyzed
FROM   sys.user_tables t, sys.user_indexes j, sys.user_objects o
WHERE  t.status        = ''VALID''
  AND  t.dropped       = ''NO''
  AND  t.num_rows      > 100
  AND  t.temporary     = ''N''
  AND  t.table_name NOT LIKE ''BIN%''
  AND  NOT EXISTS
       (SELECT 1
        FROM   sys.user_queues q
        WHERE  q.queue_table = t.table_name)
  AND  EXISTS
       (SELECT 1
        FROM   user_ind_statistics i
        WHERE  i.table_name    = t.table_name
          AND  i.table_owner   = ''SYSMAN''
          AND  ( i.stale_stats != ''NO'' AND ( i.last_analyzed IS NULL OR i.last_analyzed < SYSDATE-7) )
          AND  i.stattype_locked IS NULL)
  AND  j.table_name = t.table_name          
  AND  ( j.last_analyzed IS NULL OR j.last_analyzed < SYSDATE-7 )
  AND  o.object_name  = t.table_name
  AND  o.object_type LIKE ''TABLE%''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Chained Rows';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT o.object_id, o.owner, o.object_name, o.object_type, o.created, o.last_ddl_time , t.chain_cnt
FROM   sys.dba_objects o, sys.dba_tables t
WHERE  o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  o.status      = ''VALID''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  t.last_analyzed IS NULL
  AND  t.temporary   = ''N''
  AND  NOT EXISTS
       (SELECT 1
        FROM   sys.dba_queues q
        WHERE  q.queue_table = t.table_name)
  AND  t.chain_cnt   > 0
';
END;
/
@@emd360_9a_pre_one.sql

/*
DEF title = 'Cascade delete foreign key constraints without indexes';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT c.owner, c.table_name, c.constraint_name, s.column_name, s.position
FROM   sys.dba_objects o, sys.dba_tables t, sys.dba_constraints c, sys.dba_cons_columns s
WHERE  o.object_name     = t.table_name
  AND  o.owner           = t.owner
  AND  o.object_type     = ''TABLE''
  AND  o.status          = ''VALID''
  AND  t.status          = ''VALID''
  AND  t.dropped         = ''NO''
  AND  t.temporary       = ''N''
  AND  c.owner           = t.owner
  AND  c.table_name      = t.table_name
  AND  c.constraint_type = ''R''
  AND  c.table_name      = s.table_name
  AND  c.owner           = s.owner
  AND  c.constraint_name = s.constraint_name
  AND  c.delete_rule     = ''CASCADE''
  AND  NOT EXISTS 
       (SELECT 1
        FROM   sys.dba_ind_columns i
        WHERE  i.table_name  = c.table_name
          AND  i.column_name = s.column_name)
';
END;
/
@@emd360_9a_pre_one.sql
*/

DEF title = 'Indexes with NOLOGGING';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT i.owner, i.index_name,i.index_type,i.status
FROM   sys.dba_objects o,sys.dba_tables t, sys.dba_indexes i
WHERE  o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  o.status      = ''VALID''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  i.table_name  = t.table_name
  AND  i.table_owner = t.owner
  AND  i.temporary   = ''N''
  AND  i.dropped     = ''NO''
  AND  i.logging    != ''YES''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Tables with chained rows';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT o.object_id, o.owner, o.object_name, t.blocks, t.num_rows, t.chain_cnt, t.last_analyzed
FROM   sys.dba_objects o, sys.dba_tables t
WHERE  o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  o.status      = ''VALID''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  t.num_rows    > 100
  AND  t.chain_cnt   > 0
  AND  t.temporary   = ''N''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Index Size to Large';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT o.owner, o.table_name, i.index_name, SUM(column_length) total_size
FROM   sys.dba_objects o, sys.dba_tables t, sys.dba_ind_columns i
WHERE  o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  i.table_name  = t.table_name
  AND  i.index_owner = t.owner
GROUP BY o.owner, o.table_name, i.index_name HAVING SUM(column_length) > 3215
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Invalid GUID column definitions';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT c.table_name, c.column_name, c.data_type, c.data_length
FROM   sys.dba_objects o, sys.dba_tables t, sys.dba_tab_columns c
WHERE  o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  c.column_name LIKE ''%_GUID''
  AND  c.table_name  = t.table_name
  AND  c.owner       = t.owner
  AND  c.data_type  != ''NUMBER''
  AND  (c.data_type != ''RAW'' OR (data_length != 16 AND data_length != 32) )
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Tables with missing leading TARGET_GUID index';
DEF main_table = 'sys.dba_objects';
BEGIN
 :sql_text := '
SELECT c.table_name, c.column_name, c.data_type, c.data_length
FROM   sys.dba_objects o, sys.dba_tables t, sys.dba_tab_columns c
WHERE o.object_name = t.table_name
  AND  o.owner       = t.owner
  AND  o.object_type = ''TABLE''
  AND  t.status      = ''VALID''
  AND  t.dropped     = ''NO''
  AND  c.column_name IN (''ENTITY_GUID'',''TARGET_GUID'')
  AND  c.table_name  = t.table_name
  AND  c.owner       = t.owner
  AND  c.table_name NOT IN
       (
         SELECT table_name
         FROM   sys.dba_ind_columns i
         WHERE  i.table_owner     = c.owner
           AND  i.column_name     = c.column_name
           AND  i.column_position = 1
        UNION ALL
         SELECT DISTINCT table_name
         FROM   sys.user_tab_partitions
        UNION ALL
         SELECT table_name
         FROM   sysman.mgmt_target_delete_exceptions
       )
';
END;
/
@@emd360_9a_pre_one.sql