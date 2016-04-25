DEF section_name = 'Tablespace Information';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = 'Datafile Sizes';
DEF main_table = 'sys.dba_data_files';

col total_size_mb format 9999999999;
col total_size_gb format 9999999999;
BEGIN
 :sql_text := '
select file_name DATAFILE
	,to_char((bytes/(1024*1024)),99999999.99) TOTAL_SIZE_MB
	,to_char((bytes/(1024*1024*1024)),99999999.99) TOTAL_SIZE_GB 
from dba_data_files
group by file_name, bytes
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Tablespace Sizes';
DEF main_table = 'sys.dba_data_files';
BEGIN
 :sql_text := '
select tablespace_name, round(sum(bytes)/(1024*1024),2) Size_In_MB, round(sum(bytes)/(1024*1024*1024)) Size_In_GB
from dba_data_files
group by tablespace_name
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Tablespace Percent Used';
DEF main_table = 'sys.dba_data_files';
BEGIN
 :sql_text := '
SELECT    SUBSTR(seg.tablespace_name, 1,20)  tablespace_name
	,round(((seg.bytes_used/df.total))*100) || ''%'' pct_used
	,round(((fs.free/df.total)*100)) || ''%'' pct_free_wo_autoextend
	,ROUND(((1-DF.TOTAL/DF.MAXBYTES)*100)) || ''%'' PCT_FREE_W_AUTOEXTEND
	,SEG.BYTES_USED
	,DF.TOTAL
	,FS.FREE
	,df.maxbytes
FROM      
(SELECT  tablespace_name
  ,SUM(bytes) total, sum(maxbytes) maxbytes
	FROM      dba_data_files
	GROUP BY  tablespace_name) df
	,(SELECT tablespace_name
	               ,SUM(bytes) bytes_used
	  FROM   dba_segments
	  GROUP BY tablespace_name) seg
	,(SELECT   tablespace_name
	                 ,SUM(bytes)   free
	  FROM      dba_free_space
	 GROUP BY tablespace_name) fs,
         (SELECT tablespace_name, status from dba_tablespaces) dts
WHERE    df.tablespace_name = seg.tablespace_name
AND	fs.tablespace_name = seg.tablespace_name
AND       dts.tablespace_name = seg.tablespace_name
';
END;
/
@@emd360_9a_pre_one.sql

