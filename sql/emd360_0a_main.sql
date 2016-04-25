@@emd360_00_config.sql
@@emd360_0b_pre.sql

DEF max_col_number = '6';
DEF column_number = '0';
SPO &&emd360_main_report..html APP;
PRO <table><tr class="main">
PRO <td class="c">Physical Information</td>
PRO <td class="c">Oracle Management Server Information</td>
PRO <td class="c">Oracle Management Repository Information</td>
PRO <td class="c">Configuration Information</td>
PRO <td class="c">Security Information</td>
PRO <td class="c">General Target Information</td>
PRO </tr><tr class="main"><td>
PRO <img src="EMd360_img.jpg" alt="EMd360" height="228" width="230" />
PRO <br>
PRO
SPO OFF;

PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DEF column_number = '1';

@@emd360_1a_hardware.sql
@@emd360_1b_operating_system.sql


--@@&&skip_10g.&&skip_11r1.sqld360_1c_xpand.sql

PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DEF column_number = '2';

SPO &&emd360_main_report..html APP;
PRO
PRO </td><td>
PRO
SPO OFF;

@@emd360_2a_version.sql
@@emd360_2b_patches.sql
@@emd360_2c_plugins.sql
@@emd360_2d_blackout.sql
@@emd360_2e_incident_rules.sql
@@emd360_2f_notify_requests.sql
@@emd360_2g_agent_information.sql
--@@emd360_2a_plans.sql

PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DEF column_number = '3';

SPO &&emd360_main_report..html APP;
PRO
PRO </td><td>
PRO
SPO OFF;

@@emd360_3a_version.sql
@@emd360_3b_db_info.sql
@@emd360_3c_patch.sql
@@emd360_3d_session_info.sql
@@emd360_3e_tablespace_info.sql
@@emd360_3f_repo_schema_info.sql 
@@emd360_3g_repo_awr_info.sql
@@emd360_3h_repo_cbo_info.sql  

--@@emd360_3a_objects.sql

PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DEF column_number = '4';

SPO &&emd360_main_report..html APP;
PRO
PRO </td><td>
PRO
SPO OFF;

@@emd360_4a_all_targets.sql
@@emd360_4b_all_groups.sql
@@emd360_4c_templates.sql
@@emd360_4d_metrics.sql
@@emd360_4e_disk_metrics.sql
@@emd360_4f_network_metrics.sql

--@@emd360_3a_objects.sql

PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DEF column_number = '5';

SPO &&emd360_main_report..html APP;
PRO
PRO </td><td>
PRO
SPO OFF;

@@emd360_5a_administrators.sql
@@emd360_5b_roles.sql
--@@emd360_3a_objects.sql

PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

DEF column_number = '6';

SPO &&emd360_main_report..html APP;
PRO
PRO </td><td>
PRO
SPO OFF;

@@emd360_6a_target_specifics.sql
@@emd360_6b_compacity_planning.sql
@@emd360_6c_top_5_metrics.sql



--@@emd360_3a_objects.sql

PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- log footer
SPO &&emd360_log..txt APP;
PRO
PRO ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PRO
DEF;
PRO
PRO end log
SPO OFF;

-- main footer
SPO &&emd360_main_report..html APP;
PRO
PRO </td></tr></table>
SPO OFF;
@@emd360_0c_post.sql
