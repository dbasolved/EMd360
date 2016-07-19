DEF section_name = '2e. Incidents';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Incidents';
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

DEF main_table = 'sysman.mgmt$incidents';
DEF vaxis = 'Amount Of New Incidents Created (Per Day)';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       is_new,
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
from (select trunc(creation_date) cdate, count(resolution_state) is_new
		from sysman.mgmt$incidents
		where resolution_state = ''New''
		and creation_date >= sysdate - 31
		group by trunc(creation_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = '1. New Incidents Per Day';
DEF abstract = 'Amount of New Incidents (Per Day)';
DEF foot = 'Chart represents how many new incidents per day';
@@emd360_9a_pre_one.sql

-----------------------------------------
-----------------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Incidents';
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

DEF main_table = 'sysman.mgmt$incidents';
DEF vaxis = 'Amount Of Closed Incidents (Per Day)';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       is_closed,
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
from (select trunc(creation_date) cdate, count(resolution_state) is_closed
		from sysman.mgmt$incidents
		where resolution_state = ''Closed''
		and creation_date >= sysdate - 31
		group by trunc(creation_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = '2. Amount Of Closed Incidents (Per Day)';
DEF abstract = 'Amount Of Closed Incidents (Per Day)';
DEF foot = 'Chart represents how many closed incidents per day';
@@emd360_9a_pre_one.sql

-----------------------------------------
-----------------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Incidents';
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

DEF main_table = 'sysman.mgmt$incidents';
DEF vaxis = 'Amount Of Urgent Incidents (Per Day)';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       is_urgent,
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
from (select trunc(creation_date) cdate, count(priority) is_urgent
		from sysman.mgmt$incidents
		where priority = ''Urgent''
		and creation_date >= sysdate - 31
		group by trunc(creation_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = '3. Amount Of Urgent Incidents (Per Day)';
DEF abstract = 'Amount Of Urgent Incidents (Per Day)';
DEF foot = 'Chart represents how many urgent incidents per day';
@@emd360_9a_pre_one.sql

-----------------------------------------
-----------------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Incidents';
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

DEF main_table = 'sysman.mgmt$incidents';
DEF vaxis = 'Amount Of Very High Incidents (Per Day)';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       is_very_high,
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
from (select trunc(creation_date) cdate, count(priority) is_very_high
		from sysman.mgmt$incidents
		where priority = ''Very High''
		and creation_date >= sysdate - 31
		group by trunc(creation_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = '4. Amount Of Very High Incidents (Per Day)';
DEF abstract = 'Amount Of Very High Incidents (Per Day)';
DEF foot = 'Chart represents how many very high incidents per day';
@@emd360_9a_pre_one.sql

-----------------------------------------
-----------------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Incidents';
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

DEF main_table = 'sysman.mgmt$incidents';
DEF vaxis = 'Amount Of High Incidents (Per Day)';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       is_high,
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
from (select trunc(creation_date) cdate, count(priority) is_high
		from sysman.mgmt$incidents
		where priority = ''High''
		and creation_date >= sysdate - 31
		group by trunc(creation_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = '5. Amount Of High Incidents (Per Day)';
DEF abstract = 'Amount Of High Incidents (Per Day)';
DEF foot = 'Chart represents how many high incidents per day';
@@emd360_9a_pre_one.sql

-----------------------------------------
-----------------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Incidents';
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

DEF main_table = 'sysman.mgmt$incidents';
DEF vaxis = 'Amount Of Medium Incidents (Per Day)';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       is_medium,
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
from (select trunc(creation_date) cdate, count(priority) is_medium
		from sysman.mgmt$incidents
		where priority = ''Medium''
		and creation_date >= sysdate - 31
		group by trunc(creation_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = '6. Amount Of Medium Incidents (Per Day)';
DEF abstract = 'Amount Of Medium Incidents (Per Day)';
DEF foot = 'Chart represents how many medium incidents per day';
@@emd360_9a_pre_one.sql

-----------------------------------------
-----------------------------------------

DEF chartype = 'LineChart';
DEF stacked = '';
DEF tit_01 = 'Incidents';
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

DEF main_table = 'sysman.mgmt$incidents';
DEF vaxis = 'Amount Of Low Incidents (Per Day)';

BEGIN
 :sql_text := '
select 0 snap_id,
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') begin_notify_date, 
       TO_CHAR(cdate, ''YYYY-MM-DD HH24:MI'') end_notify_date,
       is_low,
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
from (select trunc(creation_date) cdate, count(priority) is_low
		from sysman.mgmt$incidents
		where priority = ''Medium''
		and creation_date >= sysdate - 31
		group by trunc(creation_date))
order by 3
';
END;
/

DEF skip_lch='';
DEF title = '7. Amount Of Low Incidents (Per Day)';
DEF abstract = 'Amount Of Low Incidents (Per Day)';
DEF foot = 'Chart represents how many Low incidents per day';
@@emd360_9a_pre_one.sql