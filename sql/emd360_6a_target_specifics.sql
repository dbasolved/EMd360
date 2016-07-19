DEF section_name = '6a. Target Specific Info';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Data Files';
DEF main_table = 'sysman.mgmt$db_datafiles';
BREAK target_name;
BEGIN
 :sql_text := '
SELECT dbdf.target_name,
  dbdf.tablespace_name,
  ROUND(dbdf.create_bytes/(1024*1024*1024),2) size_gb,
  nvl(dbdf.increment_by,0) increment_by,
  nvl(ROUND(dbdf.max_file_size/(1024*1024*1024),2),0) max_size_gb,
  dbdf.autoextensible,
  dbdf.file_name,
  dbdf.collection_timestamp
FROM sysman.mgmt$db_datafiles dbdf,
  sysman.em_targets emt
WHERE dbdf.target_guid = emt.target_guid
AND emt.target_type    = ''oracle_database''
';
END;
/
@@emd360_9a_pre_one.sql

