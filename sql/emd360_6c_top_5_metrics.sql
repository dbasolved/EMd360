DEF section_name = 'Load Metrics - Top 5 Targets';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

COL title_01 NEW_V title_01
COL title_02 NEW_V title_02
COL title_03 NEW_V title_03
COL title_04 NEW_V title_04
COL title_05 NEW_V title_05

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'memUsedPct'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''memUsedPct''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Memory Used Percentage';
DEF abstract = 'Memory Used Percentage';
DEF foot = 'Chart represents the top 5 targets max memory used per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'noOfProcs'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''noOfProcs''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Number of Processes';
DEF abstract = 'Number of Processes';
DEF foot = 'Chart represents the top 5 targets with number of processes per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'pgScanRate'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''pgScanRate''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Page Scan Rate';
DEF abstract = 'Page Scan Rate';
DEF foot = 'Chart represents the top 5 targets with highest page scan rates per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'memfreePct'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Free Memory Percentage';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''memfreePct''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Free Memory Percentage';
DEF abstract = 'Free Memory Percentage';
DEF foot = 'Chart represents the top 5 targets memory free percentage per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'logicMemFreePct'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''noOfProcs''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Logical Free Memory Percentage';
DEF abstract = 'Logical Free Memory Percentage';
DEF foot = 'Chart represents the top 5 targets with logicial free memory percentage per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'noOfUsers'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''noOfUsers''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Number of Users';
DEF abstract = 'Number of Users';
DEF foot = 'Chart represents the top 5 targets with number of users per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'usedSwap'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''usedSwap''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Used Swap Space';
DEF abstract = 'Used Swap Space';
DEF foot = 'Chart represents the top 5 targets with used swap space per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuLoad_1min'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuLoad_1min''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'CPU Load per 1 minute';
DEF abstract = 'CPU Load per 1 minute';
DEF foot = 'Chart represents the top 5 targets with max cpu load per minute per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'memUsedPct'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''memUsedPct''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Memory Used Percentage';
DEF abstract = 'Memory Used Percentage';
DEF foot = 'Chart represents the top 5 targets with max meory used percentages per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuIntr'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuIntr''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Amount of CPU Interruption';
DEF abstract = 'Amount of CPU Interruption';
DEF foot = 'Chart represents the top 5 targets with max amount of CPU interruption per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'pgTrnsfrRate'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''pgTrnsfrRate''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Page Transfer Rate';
DEF abstract = 'Page Transfer Rate';
DEF foot = 'Chart represents the top 5 targets with max page transfer rates per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------
WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuLoad_15min'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max CPU Load Per 15 Minutes';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuLoad_15min''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max CPU Load Per 15 Minutes';
DEF abstract = 'Max CPU Load Per 15 Minutes';
DEF foot = 'Chart represents the top 5 targets with max CPU load per 15 minutes per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'swapUtil'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max Swap Utilization';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''swapUtil''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max Swap Utilization';
DEF abstract = 'Max Swap Utilization';
DEF foot = 'Chart represents the top 5 targets with max swap utilization per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuUtil'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max CPU Utilization';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuUtil''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max CPU Utilization';
DEF abstract = 'Max CPU Utilization';
DEF foot = 'Chart represents the top 5 targets with max CPU utilization per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuKernel'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max CPU Kernel Utilization';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuKernel''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max CPU Kernel Utilization';
DEF abstract = 'Max CPU Kernel Utilization';
DEF foot = 'Chart represents the top 5 targets with max CPU Kernel utilization per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'freeSwap'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max Free Swap';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''freeSwap''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max Free Swap';
DEF abstract = 'Max Free Swap';
DEF foot = 'Chart represents the top 5 targets with max free swap per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuLoad'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max Overall CPU Load';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuLoad''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max Overall CPU Load';
DEF abstract = 'Max Overall CPU Load';
DEF foot = 'Chart represents the top 5 targets with max overall CPU load per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'activeMem'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max Active Memory';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''activeMem''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max Active Memory';
DEF abstract = 'Max Active Memory';
DEF foot = 'Chart represents the top 5 targets with max active memory per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'freeMem'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max Free Memory';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''freeMem''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max Free Memory';
DEF abstract = 'Max Free Memory';
DEF foot = 'Chart represents the top 5 targets with max free memory per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuIOWait'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max Amount of CPU IO Wait';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuIOWait''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max Amount of CPU IO Wait';
DEF abstract = 'Max Amount of CPU IO Wait';
DEF foot = 'Chart represents the top 5 targets with max amunt of CPU IO wait per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'activeLogicalMem'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max Amount of Active Logical Memory';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''activeLogicalMem''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max Amount of Active Logcial Memory';
DEF abstract = 'Max Amount of Active Logical Memory';
DEF foot = 'Chart represents the top 5 targets with max amount of active logical memory per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuUser'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max CPU Per User';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuUser''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max CPU Per User';
DEF abstract = 'Max CPU Per User';
DEF foot = 'Chart represents the top 5 targets with max CPU per user per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'usedLogcialMemoryPct'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max Logical Memory Used Percentage';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''usedLogicalMemoryPct''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max Logcial Memory Used Percentage';
DEF abstract = 'Max Logcial Memory Used Percentage';
DEF foot = 'Chart represents the top 5 targets with max logcial memory used percentage per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

WITH top_5 AS
(SELECT *
  FROM
    (SELECT target_name, target_guid, target_type, category_prop_1, type_meta_ver,ROW_NUMBER() OVER (ORDER BY sum_value_max DESC) myrank -- used ROW_NUMBER so DUPLICATES are handled
    FROM
      (SELECT t1.target_name, t1.target_guid,t1.target_type, t1.category_prop_1, t1.type_meta_ver, SUM(t2.value_maximum) sum_value_max
      FROM sysman.mgmt_targets t1,
        sysman.mgmt_metrics_1day t2,
        sysman.mgmt_metrics t3
      WHERE t2.target_guid = t1.target_guid
      AND t3.target_type     = t1.target_type
      AND t2.metric_guid      = t3.metric_guid
      AND t3.category_prop_1 = t1.category_prop_1
      AND t3.type_meta_ver   = t1.type_meta_ver
      AND t1.target_type      = 'host'
      AND t3.metric_name     = 'Load'
      AND t3.metric_column   = 'cpuQLen'
      AND TRUNC(rollup_timestamp) >= sysdate-31
      GROUP BY t1.target_name, t1.target_guid,t1.target_type,t1.category_prop_1,t1.type_meta_ver
      )
    )
  WHERE myrank <= 5
  )
SELECT
  MAX(CASE WHEN targets.myrank = 1 THEN to_char(targets.target_name) ELSE NULL END) title_01,
  MAX(CASE WHEN targets.myrank = 2 THEN to_char(targets.target_name) ELSE NULL END) title_02,
  MAX(CASE WHEN targets.myrank = 3 THEN to_char(targets.target_name) ELSE NULL END) title_03,
  MAX(CASE WHEN targets.myrank = 4 THEN to_char(targets.target_name) ELSE NULL END) title_04,
  MAX(CASE WHEN targets.myrank = 5 THEN to_char(targets.target_name) ELSE NULL END) title_05
FROM top_5 targets
order by 1;


DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = '&&title_01.';
DEF tit_02 = '&&title_02.';
DEF tit_03 = '&&title_03.';
DEF tit_04 = '&&title_04.';
DEF tit_05 = '&&title_05.';
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
DEF vaxis = 'Max CPU Queue Length';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(rollup_time, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       title_01_ ,
       title_02_ ,
       title_03_ ,
       title_04_ ,
       title_05_ ,
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
from (select to_date(rollup_timestamp) rollup_time,
      sum(case when target_name = ''&&title_01.'' then to_char(round(value_maximum,0)) else null end) title_01_,
      sum(case when target_name = ''&&title_02.'' then to_char(round(value_maximum,0)) else null end) title_02_,
      sum(case when target_name = ''&&title_03.'' then to_char(round(value_maximum,0)) else null end) title_03_,
      sum(case when target_name = ''&&title_04.'' then to_char(round(value_maximum,0)) else null end) title_04_,
      sum(case when target_name = ''&&title_05.'' then to_char(round(value_maximum,0)) else null end) title_05_
      from
      (
          select t1.target_name, t2.rollup_timestamp, t2.value_maximum
          from sysman.mgmt_targets t1, sysman.mgmt_metrics_1day t2, sysman.mgmt_metrics t3
          where t2.target_guid = t1.target_guid
          AND t3.target_type     = t1.target_type
          AND t2.metric_guid      = t3.metric_guid
          AND t3.category_prop_1 = t1.category_prop_1
          AND t3.type_meta_ver   = t1.type_meta_ver
          AND t1.target_type      = ''host''
          AND t3.metric_name     = ''Load''
          AND t3.metric_column   = ''cpuQLen''
          AND TRUNC(t2.rollup_timestamp) >= sysdate-31
          and t1.target_name in (''&&title_01.'',''&&title_02.'',''&&title_03.'',''&&title_04.'',''&&title_05.'')
      )
group by (to_date(rollup_timestamp))
order by 1
)
';
END;
/

DEF skip_lch='';
DEF title = 'Max CPU Queue Length';
DEF abstract = 'Max CPU Queue Length';
DEF foot = 'Chart represents the top 5 targets with max CPU queue length per day';
@@emd360_9a_pre_one.sql

-----------------------------
-----------------------------

