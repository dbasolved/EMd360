DEF section_name = '4f. Network Metrics';
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
DEF vaxis = 'Network Read Rate';
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
	  AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''readRate''
	  AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '1. Network Read Rate';
DEF abstract = 'Network Read Rate';
DEF foot = 'Chart represents the amount of network reads on the OMS per day';
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
DEF vaxis = 'Network Write Rate';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''writeRate''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '2. Network Write Rate';
DEF abstract = 'Network Write Rate';
DEF foot = 'Chart represents the amount of network writes from the OMS per day';
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
DEF vaxis = 'Total Network Rate';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''totalRate''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '3. Total Network Rate';
DEF abstract = 'Total Network Rate';
DEF foot = 'Chart represents the total amount of network reads and writes on the OMS per day';
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
DEF vaxis = 'Total Network Error Rate';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''totalErrorRate''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '4. Total Network Error Rate';
DEF abstract = 'Total Network Error Rate';
DEF foot = 'Chart represents the amount of network errors on the OMS per day';
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
DEF vaxis = 'Network Read Throughput';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''readThroughput''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '5. Network Read Throughput';
DEF abstract = 'Network Read Throughput';
DEF foot = 'Chart represents the amount of network read throughputs on the OMS per day';
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
DEF vaxis = 'Network Input Errors';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''inpErrors''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '6. Network Input Errors';
DEF abstract = 'Network Input Errors';
DEF foot = 'Chart represents the amount of network input errors on the OMS per day';
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
DEF vaxis = 'Network Output Errors';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''outErrors''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '7. Network Output Errors';
DEF abstract = 'Network Output Errors';
DEF foot = 'Chart represents the amount of network output errors on the OMS per day';
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
DEF vaxis = 'Network Collisions Rate';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''collisions''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '8. Network Collisions Rate';
DEF abstract = 'Network Collisions Rate';
DEF foot = 'Chart represents the amount of network collisons on the OMS per day';
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
DEF vaxis = 'Total Network Throughput';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''totalThroughput''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '9. Total Network Throughput';
DEF abstract = 'Total Network Throughput';
DEF foot = 'Chart represents the total amount of network throughput on the OMS per day';
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
DEF vaxis = 'Network Write Throughput';
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
    AND metrics1.metric_name = ''Network''
    and metrics1.metric_column = ''writeThroughput''
    AND rollup_timestamp >= sysdate-31)
';
END;
/

DEF skip_lch='';
DEF title = '10. Network Write Throughput';
DEF abstract = 'Network Write Throughput';
DEF foot = 'Chart represents the amount of network write throughputs on the OMS per day';
@@emd360_9a_pre_one.sql

-------------------------------
-------------------------------