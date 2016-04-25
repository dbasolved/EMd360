DEF section_name = 'Load Metrics';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Memory Used Percentage';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''memUsedPct''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Memory Used Percentage';
DEF abstract = 'Memory Used Percentage';
DEF foot = 'Chart represents the OMS Memory used per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Number of Processes';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''noOfProcs''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Number of Processes';
DEF abstract = 'Number of Processes';
DEF foot = 'Chart represents the number of processes on OMS used per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Page Scan Rate';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''pgScanRate''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Page Scan Rate';
DEF abstract = 'Page Scan Rate';
DEF foot = 'Chart represents the number of OMS page scans per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Memory Free Percentage';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''memfreePct''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Memory Free Percentage';
DEF abstract = 'Memory Free Percentage';
DEF foot = 'Chart represents the percentage of memory free per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Logical Free Memory Percentage';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''logicMemFreePct''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Logical Free Memory Percentage';
DEF abstract = 'Logical Free Memory Percentage';
DEF foot = 'Chart represents the logical free memory on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Number of Users';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''noOfUsers''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Number of Users';
DEF abstract = 'Number of Users';
DEF foot = 'Chart represents the number of users on OMS used per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Used Swap Space';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''usedSwap''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Used Swap Space';
DEF abstract = 'Used Swap Space';
DEF foot = 'Chart represents the amout of swap used on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'CPU Load per 1 minute';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuLoad_1min''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'CPU Load per 1 minute';
DEF abstract = 'CPU Load per 1 minute';
DEF foot = 'Chart represents the load on cpu in 1 minute increments per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Memory Used Percentage';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''memUsedPct''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Memory Used Percentage';
DEF abstract = 'Memory Used Percentage';
DEF foot = 'Chart represents the amount of memory used on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Amount of CPU Interruption';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuIntr''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Amount of CPU Interruption';
DEF abstract = 'Amount of CPU Interruption';
DEF foot = 'Chart represents the amount of CPU interruption on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Page Transfer Rate';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''pgTrnsfrRate''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Page Transfer Rate';
DEF abstract = 'Page Transfer Rate';
DEF foot = 'Chart represents the amount of page transfers on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'CPU Load per 15 minutes';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuLoad_15min''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'CPU Load per 15 minutes';
DEF abstract = 'CPU Load per 15 minutes';
DEF foot = 'Chart represents the amount of CPU load in 15 minute intervals on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Swap Utilization';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''swapUtil''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Swap Utilization';
DEF abstract = 'Swap Utilization';
DEF foot = 'Chart represents the amout of swap used by OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'CPU Utilization';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuUtil''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'CPU Utilization';
DEF abstract = 'CPU Utilization';
DEF foot = 'Chart represents the amout of CPU utilization on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'CPU Kernel Utilization';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuKernel''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'CPU Kernel Utilization';
DEF abstract = 'CPU Kernel Utilization';
DEF foot = 'Chart represents the amount of CPU/Kernel utilization on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Free Swap';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''freeSwap''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Free Swap';
DEF abstract = 'Free Swap';
DEF foot = 'Chart represents the amount of free swap on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Overall CPU Load';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuLoad''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Overall CPU Load';
DEF abstract = 'Overall CPU Load';
DEF foot = 'Chart represents the amout of CPU Load on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Active Memory';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''activeMem''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Active Memory';
DEF abstract = 'Active Memory';
DEF foot = 'Chart represents the active memory on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Free Memory';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''freeMem''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Free Memory';
DEF abstract = 'Free Memory';
DEF foot = 'Chart represents the amount of free memory on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Amount of CPU IO Wait';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuIOWait''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Amount of CPU IO Wait';
DEF abstract = 'Amount of CPU IO Wait';
DEF foot = 'Chart represents the amount of CPU IO wait on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Amount of Active Logical Memory';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''activeLogicalMem''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Amount of Active Logcial Memory';
DEF abstract = 'Amount of Active Logical Memory';
DEF foot = 'Chart represents the amount of active logical memory on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'CPU Per User';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuUser''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'CPU Per User';
DEF abstract = 'CPU Per User';
DEF foot = 'Chart represents the amount of CPU per user on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'Logical Memory Used Percentage';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''usedLogicalMemoryPct''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Logical Memory Used Percentage';
DEF abstract = 'Logical Memory Used Percentage';
DEF foot = 'Chart represents the amount of logical memory used on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Average';
DEF tit_02 = 'Minimum';
DEF tit_03 = 'Maximum';
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

DEF main_table = 'sysman.mgmt_metrics';
DEF vaxis = 'CPU Queue Length';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       value_avg,
       value_min,
       value_max,
       0 dummy_04,
       0 dummy_05,
       0 dummy_06,
       0 dummy_07,
       0 dummy_08,
       0 dummy_09,
       0 dummy_10,
       0 dummy_11,
       0 dummy_12,
       0 dummy_13,
       0 dummy_14,
       0 dummy_15
from (SELECT trunc(rollup_timestamp) rollup_time,
	    round(metrics.value_average,2) value_avg,
	    round(metrics.value_minimum,2) value_min,
	    round(metrics.value_maximum,2) value_max
	  FROM sysman.mgmt_metrics_1day metrics,
	    sysman.mgmt_metrics metrics1,
	    sysman.mgmt_targets targets
	  WHERE metrics.target_guid = targets.target_guid
    AND metrics1.target_type = targets.target_type
	  AND metrics.metric_guid  = metrics1.metric_guid
    and metrics1.category_prop_1 = targets.category_prop_1 
    and metrics1.type_meta_ver = targets.type_meta_ver 
	  AND targets.target_guid = ''&&emd360_guid''
    and targets.target_type = ''host''
	  AND metrics1.metric_name = ''Load''
    and metrics1.metric_column = ''cpuQLen''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'CPU Queue Length';
DEF abstract = 'CPU Queue Length';
DEF foot = 'Chart represents the queue length on the cpu on OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------