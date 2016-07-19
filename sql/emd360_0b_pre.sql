--WHENEVER SQLERROR EXIT SQL.SQLCODE;
SET TERM ON; 
SET VER OFF; 
SET FEED OFF; 
SET ECHO OFF;
SET TIM OFF;
SET TIMI OFF;
CL COL;
COL row_num FOR 9999999 HEA '#' PRI;

-- version
DEF emd360_vYYNN = 'v1603';
DEF emd360_vrsn = '&&emd360_vYYNN. (2016-07-19)';
DEF emd360_prefix = 'emd360';

-- get dbid
COL emd360_dbid NEW_V emd360_dbid;
SELECT TRIM(TO_CHAR(dbid)) emd360_dbid FROM v$database;

-- parameters
PRO
PRO Parameter 1: 
PRO Name of Oracle Management Server (OMS)? (required)
PRO
COL emd360_guid new_V emd360_guid FOR A60;
SELECT target_guid emd360_guid FROM SYSMAN.MGMT$TARGET WHERE TARGET_NAME LIKE TRIM(LOWER('&1%')) AND TARGET_TYPE = LOWER('HOST')
/
--set a bind too
VAR emd360_guid VARCHAR2(60);
BEGIN 
  :emd360_guid := '&&emd360_guid.';
END;
/ 

PRO
PRO Parameter 2: 
PRO Name of Oracle Management Repository (OMR)? (required)
PRO
PRO If OMR is a PDB, use the CDB name.
PRO
COL emd360db_guid new_V emd360db_guid FOR A60;
SELECT target_guid emd360db_guid FROM SYSMAN.MGMT$TARGET WHERE TARGET_NAME LIKE TRIM(LOWER('&2%')) AND TARGET_TYPE = LOWER('ORACLE_DATABASE')
/
--set a bind too
VAR emd360db_guid VARCHAR2(60);
BEGIN 
  :emd360db_guid := '&&emd360db_guid.';
END;
/ 

--COL history_days NEW_V history_days;
-- range: takes at least 31 days and at most as many as actual history, with a default of 31. parameter restricts within that range. 
--SELECT TO_CHAR(LEAST(CEIL(SYSDATE - CAST(MIN(begin_interval_time) AS DATE)),  TO_NUMBER('&&emd360_conf_days.'))) history_days FROM dba_hist_snapshot WHERE '&&diagnostics_pack.' = 'Y' AND dbid = &&emd360_dbid.;
--SELECT '0' history_days FROM DUAL WHERE NVL(TRIM('&&diagnostics_pack.'), 'N') = 'N';

--DEF skip_script = 'sql/emd360_0f_skip_script.sql ';

-- get instance number
COL connect_instance_number NEW_V connect_instance_number;
SELECT TO_CHAR(instance_number) connect_instance_number FROM v$instance;

-- get instance name 
COL connect_instance_name NEW_V connect_instance_name;
SELECT TO_CHAR(instance_name) connect_instance_name FROM v$instance;

-- get database name (up to 10, stop before first '.', no special characters)
COL database_name_short NEW_V database_name_short FOR A10;
SELECT LOWER(SUBSTR(SYS_CONTEXT('USERENV', 'DB_NAME'), 1, 10)) database_name_short FROM DUAL;
SELECT SUBSTR('&&database_name_short.', 1, INSTR('&&database_name_short..', '.') - 1) database_name_short FROM DUAL;
SELECT TRANSLATE('&&database_name_short.',
'abcdefghijklmnopqrstuvwxyz0123456789-_ ''`~!@#$%&*()=+[]{}\|;:",.<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38),
'abcdefghijklmnopqrstuvwxyz0123456789-_') database_name_short FROM DUAL;

-- get host name (up to 30, stop before first '.', no special characters)
COL host_name_short NEW_V host_name_short FOR A30;
SELECT LOWER(SUBSTR(SYS_CONTEXT('USERENV', 'SERVER_HOST'), 1, 30)) host_name_short FROM DUAL;
SELECT SUBSTR('&&host_name_short.', 1, INSTR('&&host_name_short..', '.') - 1) host_name_short FROM DUAL;
SELECT TRANSLATE('&&host_name_short.',
'abcdefghijklmnopqrstuvwxyz0123456789-_ ''`~!@#$%&*()=+[]{}\|;:",.<>/?'||CHR(0)||CHR(9)||CHR(10)||CHR(13)||CHR(38),
'abcdefghijklmnopqrstuvwxyz0123456789-_') host_name_short FROM DUAL;

-- number fo rows per report
COL row_num NEW_V row_num HEA '#' PRI;

-- get rdbms version
COL db_version NEW_V db_version;
SELECT version db_version FROM v$instance;
--DEF skip_10g = '';
--COL skip_10g NEW_V skip_10g;
--SELECT '--' skip_10g FROM v$instance WHERE version LIKE '10%';
--COL skip_11g NEW_V skip_11g;
--SELECT '--' skip_11g FROM v$instance WHERE version LIKE '11%';
--DEF skip_11r1 = '';
--COL skip_11r1 NEW_V skip_11r1;
--SELECT '--' skip_11r1 FROM v$instance WHERE version LIKE '11.1%';
--DEF skip_11r201 = '';
--COL skip_11r201 NEW_V skip_11r201;
--SELECT '--' skip_11r201 FROM v$instance WHERE version LIKE '11.2.0.1%';
---- this is to bypass some bugs in 11.2.0.3 that can cause slowdown
--DEF skip_11r203 = '';
--COL skip_11r203 NEW_V skip_11r203;
--SELECT '--' skip_11r203 FROM v$instance WHERE version LIKE '11.2.0.3%';
--DEF skip_12r101 = '';
--COL skip_12r101 NEW_V skip_12r101;
--SELECT '--' skip_12r101 FROM v$instance WHERE version LIKE '12.1.0.1%';

-- get average number of CPUs
COL avg_cpu_count NEW_V avg_cpu_count FOR A3;
SELECT ROUND(AVG(TO_NUMBER(value))) avg_cpu_count FROM gv$system_parameter2 WHERE name = 'cpu_count';

-- get total number of CPUs
COL sum_cpu_count NEW_V sum_cpu_count FOR A3;
SELECT SUM(TO_NUMBER(value)) sum_cpu_count FROM gv$system_parameter2 WHERE name = 'cpu_count';

-- determine if rac or single instance (null means rac)
COL is_single_instance NEW_V is_single_instance FOR A1;
SELECT CASE COUNT(*) WHEN 1 THEN 'Y' END is_single_instance FROM gv$instance;

-- timestamp on filename
COL emd360_file_time NEW_V emd360_file_time FOR A20;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDD_HH24MI') emd360_file_time FROM DUAL;

-- snapshot ranges
--SELECT '0' history_days FROM DUAL WHERE TRIM('&&history_days.') IS NULL;
COL tool_sysdate NEW_V tool_sysdate;
SELECT TO_CHAR(SYSDATE, 'YYYYMMDDHH24MISS') tool_sysdate FROM DUAL;
COL as_of_date NEW_V as_of_date;
SELECT ', as of '||TO_CHAR(SYSDATE, 'Dy Mon DD @HH12:MIAM') as_of_date FROM DUAL;
--  COL minimum_snap_id NEW_V minimum_snap_id;
--  SELECT NVL(TO_CHAR(MAX(snap_id)), '0') minimum_snap_id FROM dba_hist_snapshot WHERE '&&diagnostics_pack.' = 'Y' AND dbid = &&emd360_dbid. AND begin_interval_time < SYSDATE - &&history_days.;
--  SELECT '-1' minimum_snap_id FROM DUAL WHERE TRIM('&&minimum_snap_id.') IS NULL;
--  COL maximum_snap_id NEW_V maximum_snap_id;
--  SELECT NVL(TO_CHAR(MAX(snap_id)), '&&minimum_snap_id.') maximum_snap_id FROM dba_hist_snapshot WHERE '&&diagnostics_pack.' = 'Y' AND dbid = &&emd360_dbid.;
--  SELECT '-1' maximum_snap_id FROM DUAL WHERE TRIM('&&maximum_snap_id.') IS NULL;

--  -- ebs
--  DEF ebs_release = '';
--  DEF ebs_system_name = '';
--  COL ebs_release NEW_V ebs_release;
--  COL ebs_system_name NEW_V ebs_system_name;
--  SELECT release_name ebs_release, applications_system_name ebs_system_name FROM applsys.fnd_product_groups WHERE ROWNUM = 1;
--  
--  -- siebel
--  DEF siebel_schema = '';
--  DEF siebel_app_ver = '';
--  COL siebel_schema NEW_V siebel_schema;
--  COL siebel_app_ver NEW_V siebel_app_ver;
--  SELECT owner siebel_schema FROM sys.dba_tab_columns WHERE table_name = 'S_REPOSITORY' AND column_name = 'ROW_ID' AND data_type = 'VARCHAR2' AND ROWNUM = 1;
--  SELECT app_ver siebel_app_ver FROM &&siebel_schema..s_app_ver WHERE ROWNUM = 1;
--  
--  -- psft
--  DEF psft_schema = '';
--  DEF psft_tools_rel = '';
--  COL psft_schema NEW_V psft_schema;
--  COL psft_tools_rel NEW_V psft_tools_rel;
--  SELECT owner psft_schema FROM sys.dba_tab_columns WHERE table_name = 'PSSTATUS' AND column_name = 'TOOLSREL' AND data_type = 'VARCHAR2' AND ROWNUM = 1;
--  SELECT toolsrel psft_tools_rel FROM &&psft_schema..psstatus WHERE ROWNUM = 1;

-- local or remote exec (local will be --) 
COL emd360_remote_exec NEW_V emd360_remote_exec FOR A20;
SELECT '--' emd360_remote_exec FROM dual;
-- this SQL errors out in 11.1.0.6 and < 10.2.0.5, this is expected, the value is used only >= 11.2
SELECT CASE WHEN a.port <> 0 AND a.machine <> b.host_name THEN NULL ELSE '--' END emd360_remote_exec FROM v$session a, v$instance b WHERE sid = USERENV('SID');


-- udump mnd pid, oved here from 0c_post
-- get udump directory path
COL emd360_udump_path NEW_V emd360_udump_path FOR A500;
SELECT value||DECODE(INSTR(value, '/'), 0, '\', '/') emd360_udump_path FROM v$parameter2 WHERE name = 'user_dump_dest';

-- get diag_trace path
COL emd360_diagtrace_path NEW_V emd360_diagtrace_path FOR A500;
SELECT value||DECODE(INSTR(value, '/'), 0, '\', '/') emd360_diagtrace_path FROM v$diag_info WHERE name = 'Diag Trace';

-- get pid
COL emd360_spid NEW_V emd360_spid FOR A5;
SELECT TO_CHAR(spid) emd360_spid FROM v$session s, v$process p WHERE s.sid = SYS_CONTEXT('USERENV', 'SID') AND p.addr = s.paddr;

-- inclusion config determine skip flags
COL emd360_skip_html NEW_V emd360_skip_html;
COL emd360_skip_xml  NEW_V emd360_skip_xml;
COL emd360_skip_text NEW_V emd360_skip_text;
COL emd360_skip_csv  NEW_V emd360_skip_csv;
COL emd360_skip_line NEW_V emd360_skip_line;
COL emd360_skip_pie  NEW_V emd360_skip_pie;
COL emd360_skip_bar  NEW_V emd360_skip_bar;
COL emd360_skip_tree NEW_V emd360_skip_tree;
COL emd360_skip_bubble NEW_V emd360_skip_bubble;

SELECT CASE '&&emd360_conf_incl_html.'   WHEN 'N' THEN '--' END emd360_skip_html   FROM DUAL;
SELECT CASE '&&emd360_conf_incl_xml.'    WHEN 'N' THEN '--' END emd360_skip_xml    FROM DUAL;
SELECT CASE '&&emd360_conf_incl_text.'   WHEN 'N' THEN '--' END emd360_skip_text   FROM DUAL;
SELECT CASE '&&emd360_conf_incl_csv.'    WHEN 'N' THEN '--' END emd360_skip_csv    FROM DUAL;
SELECT CASE '&&emd360_conf_incl_line.'   WHEN 'N' THEN '--' END emd360_skip_line   FROM DUAL;
SELECT CASE '&&emd360_conf_incl_pie.'    WHEN 'N' THEN '--' END emd360_skip_pie    FROM DUAL;
SELECT CASE '&&emd360_conf_incl_bar.'    WHEN 'N' THEN '--' END emd360_skip_bar    FROM DUAL;
SELECT CASE '&&emd360_conf_incl_tree.'   WHEN 'N' THEN '--' END emd360_skip_tree   FROM DUAL;
SELECT CASE '&&emd360_conf_incl_bubble.' WHEN 'N' THEN '--' END emd360_skip_bubble FROM DUAL;

-- COL emd360_skip_awrrpt NEW_V emd360_skip_awrrpt;
-- SELECT CASE '&&emd360_conf_incl_awrrpt.' WHEN 'N' THEN '--' END emd360_skip_awrrpt FROM DUAL;
-- 
-- COL emd360_skip_ashrpt NEW_V emd360_skip_ashrpt;
-- SELECT CASE '&&emd360_conf_incl_ashrpt.' WHEN 'N' THEN '--' END emd360_skip_ashrpt FROM DUAL;
-- 
-- COL emd360_skip_sqlmon NEW_V emd360_skip_sqlmon;
-- SELECT CASE '&&emd360_conf_incl_sqlmon.' WHEN 'N' THEN '--' END emd360_skip_sqlmon FROM DUAL;
-- 
-- COL emd360_skip_eadam NEW_V emd360_skip_eadam;
-- SELECT CASE '&&emd360_conf_incl_eadam.' WHEN 'N' THEN '--' END emd360_skip_eadam FROM DUAL;
-- 
-- COL emd360_skip_rawash NEW_V emd360_skip_rawash;
-- SELECT CASE '&&emd360_conf_incl_rawash.' WHEN 'N' THEN '--' END emd360_skip_rawash FROM DUAL;
-- 
-- COL emd360_skip_stats_h NEW_V emd360_skip_stats_h;
-- SELECT CASE '&&emd360_conf_incl_stats_h.' WHEN 'N' THEN '--' END emd360_skip_stats_h FROM DUAL;
-- 
-- COL emd360_skip_fmatch NEW_V emd360_skip_fmatch;
-- SELECT CASE '&&emd360_conf_incl_fmatch.' WHEN 'N' THEN '--' END emd360_skip_fmatch FROM DUAL;
-- 
-- COL emd360_skip_metadata NEW_V emd360_skip_metadata;
-- SELECT CASE '&&emd360_conf_incl_metadata.' WHEN 'N' THEN '--' END emd360_skip_metadata FROM DUAL;
-- 
-- COL emd360_skip_tcb NEW_V emd360_skip_tcb;
-- SELECT CASE '&&emd360_conf_incl_tcb.' WHEN 'N' THEN '--' END emd360_skip_tcb FROM DUAL;
-- 
-- COL emd360_tcb_exp_data NEW_V emd360_tcb_exp_data;
-- COL emd360_tcb_exp_sample NEW_V emd360_tcb_exp_sample;
-- SELECT CASE '&&emd360_conf_tcb_sample.' WHEN '0' THEN 'FALSE' ELSE 'TRUE' END emd360_tcb_exp_data, LEAST(TO_NUMBER('&&emd360_conf_tcb_sample.'),100) emd360_tcb_exp_sample FROM dual;

-- setup
DEF sql_trace_level = '1';
DEF main_table = '';
DEF title = '';
DEF title_no_spaces = '';
DEF title_suffix = '';
DEF common_emd360_prefix = '&&emd360_prefix._&&database_name_short.';
DEF emd360_main_report = '00001_&&common_emd360_prefix._index';
DEF emd360_log = '00002_&&common_emd360_prefix._log';
DEF emd360_tkprof = '00003_&&common_emd360_prefix._tkprof';
DEF emd360_main_filename = '&&common_emd360_prefix._&&host_name_short.';
DEF emd360_log2 = '00004_&&common_emd360_prefix._log2';
DEF emd360_tracefile_identifier = '&&common_emd360_prefix.';
DEF emd360_copyright = ' (c) 2015';
DEF top_level_hints = 'NO_MERGE';
DEF sq_fact_hints = 'MATERIALIZE NO_MERGE';
DEF ds_hint = 'DYNAMIC_SAMPLING(4)';
DEF def_max_rows = '50000';
DEF max_rows = '5e4';
--DEF skip_tcb = '';
--DEF skip_ash_rpt = '--';
DEF skip_html = '';
DEF skip_xml = '';
DEF skip_text = '';
DEF skip_csv = '';
DEF skip_lch = 'Y';
DEF skip_pch = 'Y';
DEF skip_bch = 'Y';
DEF skip_tch = 'Y';
DEF skip_uch = 'Y';
DEF skip_all = '';
DEF abstract = '';
DEF abstract2 = '';
DEF foot = '';
DEF treeColor = '';
DEF bubbleMaxValue = '';
DEF bubbleSeries = '';
DEF bubblesDetails = '';
DEF sql_text = '';
DEF chartype = '';
DEF stacked = '';
DEF haxis = '&&db_version. dbname:&&database_name_short. host:&&host_name_short. (avg cpu_count: &&avg_cpu_count.)';
DEF vaxis = '';
DEF vbaseline = '';
DEF tit_01 = '';
DEF tit_02 = '';
DEF tit_03 = '';
DEF tit_04 = '';
DEF tit_05 = '';
DEF tit_06 = '';
DEF tit_07 = '';
DEF tit_08 = '';
DEF tit_09 = '';
DEF tit_10 = '';
DEF tit_11 = '';
DEF tit_12 = '';
DEF tit_13 = '';
DEF tit_14 = '';
DEF tit_15 = '';
DEF exadata = '';
DEF max_col_number = '1';
DEF column_number = '1';
COL skip_html NEW_V skip_html;
COL skip_text NEW_V skip_text;
COL skip_csv NEW_V skip_csv;
COL skip_lch NEW_V skip_lch;
COL skip_pch NEW_V skip_pch;
COL skip_bch NEW_V skip_bch;
COL skip_all NEW_V skip_all;
COL dummy_01 NOPRI;
COL dummy_02 NOPRI;
COL dummy_03 NOPRI;
COL dummy_04 NOPRI;
COL dummy_05 NOPRI;
COL dummy_06 NOPRI;
COL dummy_07 NOPRI;
COL dummy_08 NOPRI;
COL dummy_09 NOPRI;
COL dummy_10 NOPRI;
COL dummy_11 NOPRI;
COL dummy_12 NOPRI;
COL dummy_13 NOPRI;
COL dummy_14 NOPRI;
COL dummy_15 NOPRI;
COL emd360_time_stamp NEW_V emd360_time_stamp FOR A20;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD/HH24:MI:SS') emd360_time_stamp FROM DUAL;
COL hh_mm_ss NEW_V hh_mm_ss FOR A8;
COL title_no_spaces NEW_V title_no_spaces;
COL spool_filename NEW_V spool_filename;
COL one_spool_filename NEW_V one_spool_filename;
VAR row_count NUMBER;
-- next two are using to hold the reports SQL
VAR sql_text CLOB;
VAR sql_text_backup CLOB;
--VAR sql_text_backup2 CLOB;
VAR sql_text_display CLOB;
VAR file_seq NUMBER;
EXEC :file_seq := 5;
VAR get_time_t0 NUMBER;
VAR get_time_t1 NUMBER;
-- Exadata
ALTER SESSION SET "_serial_direct_read" = ALWAYS;
ALTER SESSION SET "_small_table_threshold" = 1001;
-- nls
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ".,";
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD/HH24:MI:SS';
ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'YYYY-MM-DD/HH24:MI:SS.FF';
ALTER SESSION SET NLS_TIMESTAMP_TZ_FORMAT = 'YYYY-MM-DD/HH24:MI:SS.FF TZH:TZM';
-- adding to prevent slow access to ASH with non default NLS settings
ALTER SESSION SET NLS_SORT = 'BINARY';
ALTER SESSION SET NLS_COMP = 'BINARY';
-- to work around bug 12672969
ALTER SESSION SET "_optimizer_order_by_elimination_enabled"=false; 
-- to work around bug 19567916
ALTER SESSION SET "_optimizer_aggr_groupby_elim"=false; 
-- workaround nigeria
ALTER SESSION SET "_gby_hash_aggregation_enabled" = TRUE;
ALTER SESSION SET "_hash_join_enabled" = TRUE;
ALTER SESSION SET "_optim_peek_user_binds" = TRUE;
ALTER SESSION SET "_optimizer_skip_scan_enabled" = TRUE;
ALTER SESSION SET "_optimizer_sortmerge_join_enabled" = TRUE;
ALTER SESSION SET cursor_sharing = EXACT;
ALTER SESSION SET db_file_multiblock_read_count = 128;
ALTER SESSION SET optimizer_index_caching = 0;
-- to work around Siebel
ALTER SESSION SET optimizer_index_cost_adj = 100;
ALTER SESSION SET optimizer_dynamic_sampling = 2;
ALTER SESSION SET "_always_semi_join" = CHOOSE;
ALTER SESSION SET "_and_pruning_enabled" = TRUE;
ALTER SESSION SET "_subquery_pruning_enabled" = TRUE;
-- workaround fairpoint
COL db_vers_ofe NEW_V db_vers_ofe;
SELECT TRIM('.' FROM TRIM('0' FROM version)) db_vers_ofe FROM v$instance;
ALTER SESSION SET optimizer_features_enable = '&&db_vers_ofe.';
-- tracing script in case it takes long to execute so we can diagnose it
ALTER SESSION SET MAX_DUMP_FILE_SIZE = '1G';
ALTER SESSION SET TRACEFILE_IDENTIFIER = "&&emd360_tracefile_identifier.";
--ALTER SESSION SET STATISTICS_LEVEL = 'ALL';
ALTER SESSION SET EVENTS '10046 TRACE NAME CONTEXT FOREVER, LEVEL &&sql_trace_level.';
SET TERM OFF; 
SET HEA ON; 
SET LIN 32767; 
SET NEWP NONE; 
SET PAGES &&def_max_rows.; 
SET LONG 32000; 
SET LONGC 2000; 
SET WRA ON; 
SET TRIMS ON; 
SET TRIM ON; 
SET TI OFF; 
SET TIMI OFF; 
SET ARRAY 1000; 
SET NUM 20; 
SET SQLBL ON; 
SET BLO .; 
SET RECSEP OFF;

PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- log header
SPO &&emd360_log..txt;
PRO begin log
PRO
host env
DEF;
SPO OFF;

-- main header
SPO &&emd360_main_report..html;
@@emd360_0d_html_header.sql
PRO </head>
PRO <body>
PRO <h1><em>&&emd360_conf_tool_page.EMd360</a></em> &&emd360_vYYNN.: EM 360-degree view &&emd360_conf_all_pages_logo.</h1>
PRO
PRO <pre>
PRO Guid:&&emd360_guid. dbname:&&database_name_short. version:&&db_version. host:&&host_name_short. days:&&emd360_conf_days. today:&&emd360_time_stamp.
PRO </pre>
PRO
SPO OFF;

-- zip
HOS zip -jq &&emd360_main_filename._&&emd360_file_time. js/sorttable.js
HOS zip -jq &&emd360_main_filename._&&emd360_file_time. js/EMd360_img.jpg
HOS zip -jq &&emd360_main_filename._&&emd360_file_time. js/EMd360_favicon.ico
HOS zip -jq &&emd360_main_filename._&&emd360_file_time. js/EMd360_all_pages_logo.jpg
--WHENEVER SQLERROR CONTINUE;
