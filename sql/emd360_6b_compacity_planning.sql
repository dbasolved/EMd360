DEF section_name = '6b. Compacity Planning';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

/*
DEF title = 'Min CPU Percentage Per Quarter'
DEF main_table = 'sysman.mgmt_metrics';


BEGIN
 :sql_text := '
select quarter, round(min(value_based_min),2) min_cpu_usage_pct
from
(SELECT t1.target_name, 
       t1.target_type, 
       t3.metric_column,
       round(MIN(t2.value_min.ium),2) value_based_min,
       to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'') as quarter
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = ''host''
      AND t3.metric_name     = ''Load''
      AND t3.metric_column   = ''cpuUtil''
      GROUP BY t1.target_name, t1.target_type,t3.metric_column, to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'')
      order by to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'')
)
group by quarter
order by 1
';
END;
/
@@emd360_9a_pre_one.sql
*/

-----------------------------
-----------------------------

DEF title = '1. Average CPU Used Per Quarter (Percentage)'
DEF main_table = 'sysman.mgmt_metrics';


BEGIN
 :sql_text := '
select quarter, round(max(avg_value_based_max),2) avg_cpu_usage_pct
from
(SELECT t1.target_name, 
       t1.target_type, 
       t3.metric_column,
       round(AVG(t2.value_maximum),2) avg_value_based_max,
       to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'') as quarter
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = ''host''
      AND t3.metric_name     = ''Load''
      AND t3.metric_column   = ''cpuUtil''
      GROUP BY t1.target_name, t1.target_type,t3.metric_column, to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'')
      order by to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'')
)
group by quarter
order by 1
';
END;
/
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

/*
DEF title = 'Max CPU Percentage Per Quarter'
DEF main_table = 'sysman.mgmt_metrics';


BEGIN
 :sql_text := '
select quarter, round(max(value_based_max),2) max_cpu_usage_pct
from
(SELECT t1.target_name, 
       t1.target_type, 
       t3.metric_column,
       round(MAX(t2.value_maximum),2) value_based_max,
       to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'') as quarter
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = ''host''
      AND t3.metric_name     = ''Load''
      AND t3.metric_column   = ''cpuUtil''
      GROUP BY t1.target_name, t1.target_type,t3.metric_column, to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'')
      order by to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'')
)
group by quarter
order by 1
';
END;
/
@@emd360_9a_pre_one.sql
*/

-----------------------------
-----------------------------

DEF title = '2. Average Memory Used Per Quarter (Percentage)'
DEF main_table = 'sysman.mgmt_metrics';


BEGIN
 :sql_text := '
select quarter, round(max(avg_value_based_max),2) avg_cpu_usage_pct
from
(SELECT t1.target_name, 
       t1.target_type, 
       t3.metric_column,
       round(AVG(t2.value_maximum),2) avg_value_based_max,
       to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'') as quarter
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = ''host''
      AND t3.metric_name     = ''Load''
      AND t3.metric_column   = ''memUsedPct''
      GROUP BY t1.target_name, t1.target_type,t3.metric_column, to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'')
      order by to_char(t2.rollup_timestamp, ''YYYY'')||''-Qtr''||to_char(t2.rollup_timestamp,''q'')
)
group by quarter
order by 1
';
END;
/
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------
