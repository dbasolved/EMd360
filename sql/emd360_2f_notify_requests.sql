DEF section_name = 'Notify Requests';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Notifications';
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

DEF main_table = 'sysman.em_notify_requests';
DEF vaxis = 'Amount of Notifications Sent';
DEF vbaseline = '';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(edate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(edate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       notify_request_count,
       0 dummy_02,
       0 dummy_03,
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
from (select trunc(enqueue_date) EDATE, count(enqueue_date) NOTIFY_REQUEST_COUNT
      from sysman.em_notify_requests
      group by trunc(enqueue_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = 'Notify Requests - Total';
DEF abstract = 'Notify Request Totals';
DEF foot = 'Chart represents how many notifications have been sent per day';
@@emd360_9a_pre_one.sql

-----------------------------------------
-----------------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Notifications';
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

DEF main_table = 'sysman.em_notify_requests';
DEF vaxis = 'Amount of Notifications Sent';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(edate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(edate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       notify_request_count,
       0 dummy_02,
       0 dummy_03,
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
from (select trunc(enqueue_date) EDATE, count(enqueue_date) NOTIFY_REQUEST_COUNT
      from sysman.em_notify_requests
      where notif_type = 1
      group by trunc(enqueue_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = 'Notify Requests - Email';
DEF abstract = 'Notify Request - Email';
DEF foot = 'Chart represents how many notifications have been sent per day';
@@emd360_9a_pre_one.sql

-----------------------------------------
-----------------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Notifications';
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

DEF main_table = 'sysman.em_notify_requests';
DEF vaxis = 'Amount of Notifications Sent';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(edate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(edate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       notify_request_count,
       0 dummy_02,
       0 dummy_03,
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
from (select trunc(enqueue_date) EDATE, count(enqueue_date) NOTIFY_REQUEST_COUNT
      from sysman.em_notify_requests
      where notif_type = 4
      group by trunc(enqueue_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = 'Notify Request - SNMP';
DEF abstract = 'Notify Request - SNMP';
DEF foot = 'Chart represents how many notifications have been sent per day';
@@emd360_9a_pre_one.sql

