DEF section_name = 'Disk Metrics';
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
DEF vaxis = 'Total Disk Usage';
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
	  AND metrics1.metric_name = ''TotalDiskUsage''
    and metrics1.metric_column = ''totdisksize''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Total Disk Usage';
DEF abstract = 'Total Disk Usage';
DEF foot = 'Chart represents the OMS total disk usage per day';
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
DEF vaxis = 'Total Disk Available Percentage';
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
    AND metrics1.metric_name = ''TotalDiskUsage''
    and metrics1.metric_column = ''totpercntavailable''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Total Disk Available Percentage';
DEF abstract = 'Total Disk Available Percentage';
DEF foot = 'Chart represents the OMS total disk percentage per day';
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
DEF vaxis = 'Total Disk Available';
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
    AND metrics1.metric_name = ''TotalDiskUsage''
    and metrics1.metric_column = ''totavailable''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Total Disk Available';
DEF abstract = 'Total Disk Available';
DEF foot = 'Chart represents the OMS total disk available per day';
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
DEF vaxis = 'Total Disk Used';
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
    AND metrics1.metric_name = ''TotalDiskUsage''
    and metrics1.metric_column = ''totused''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Total Disk Used';
DEF abstract = 'Total Disk Used';
DEF foot = 'Chart represents the OMS total disk used per day';
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
DEF vaxis = 'Total Disk Usage Percentage';
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
    AND metrics1.metric_name = ''TotalDiskUsage''
    and metrics1.metric_column = ''totpercntused''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = 'Total Disk Usage Percentage';
DEF abstract = 'Total Disk Usage Percentage';
DEF foot = 'Chart represents the OMS total disk used percentage per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------