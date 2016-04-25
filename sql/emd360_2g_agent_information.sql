DEF section_name = 'Agent Information';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = 'Active Agents';
DEF main_table = 'sysman.mgmt_current_availability';
BEGIN
 :sql_text := '
select et.display_name, et.target_type, mca.current_status, mca.start_collection_timestamp, et.last_metric_load_time
from sysman.mgmt_current_availability mca, sysman.mgmt$target et
where mca.target_guid = et.target_guid (+)
and et.target_type = ''oracle_emd''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Agents Installed';
DEF main_table = 'sysman.em_manageable_entities';
BEGIN
 :sql_text := '
SELECT NVL(p.property_value,''Staging'') status, a.category_prop_1 os, COUNT(*) total, SUM(DECODE(SUBSTR(emd_url,1,5),''https'',1,0)) secure, SUM(DECODE(SUBSTR(emd_url,1,5),''https'',0,1)) unsecure
FROM   sysman.em_manageable_entities a, sysman.mgmt_target_properties p
WHERE  a.entity_type   = ''oracle_emd''
  AND  a.manage_status = 2
  AND  a.entity_guid   = p.target_guid(+)
  AND  ''orcl_gtp_lifecycle_status'' = p.property_name(+)
GROUP BY NVL(p.property_value,''Staging''), a.category_prop_1
ORDER BY status, os
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Deployed Agent Plugins';
DEF main_table = 'sysman.em_manageable_entities';
BEGIN
 :sql_text := '
SELECT pv.plugin_id, pv.version, pv.display_name, COUNT(*) nr_agents, 
       DECODE(pd.plugin_bits_type,1,''Plugin'',''Discovery'') content_type,
       pv.rev_version
FROM   sysman.em_plugin_version pv, sysman.em_current_deployed_plugin pd, sysman.em_manageable_entities t
WHERE  t.entity_guid        = pd.dest_id
  AND  pd.plugin_version_id = pv.plugin_version_id
  AND  pd.dest_type         = 3
GROUP BY pv.plugin_id, pv.version, pv.display_name, pd.plugin_bits_type, pv.rev_version
ORDER BY pv.plugin_id, pv.version DESC, pd.plugin_bits_type
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Agent-side targets';
DEF main_table = 'sysman.em_manageable_entities';
BEGIN
 :sql_text := '
SELECT entity_type, type_display_name, COUNT(*) total, COUNT(DISTINCT host_name) nr_agents
FROM   sysman.em_manageable_entities
WHERE  manage_status = 2
  AND  emd_url IS NOT NULL
GROUP BY entity_type, type_display_name
ORDER BY entity_type
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Repository upload URLs';
DEF main_table = 'sysman.mgmt_target_properties';
BEGIN
 :sql_text := '
SELECT property_value upload_url, COUNT(*) total
FROM   sysman.mgmt_target_properties p
WHERE  p.property_name = ''ReposUrl''
GROUP BY property_value
ORDER BY property_value
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Target Distribution';
DEF main_table = 'sysman.em_manageable_entities';
BEGIN
 :sql_text := '
SELECT entity_type, SUM(total) total, MIN(total) min_tot, MAX(total) max_tot, ROUND(AVG(total),1) avg_tot
FROM   (
        SELECT entity_type, emd_url, COUNT(*) total
        FROM   sysman.em_manageable_entities
        WHERE  manage_status = 2
          AND  emd_url IS NOT NULL
          AND  entity_type NOT IN (''host'',''oracle_emd'')
        GROUP BY entity_type, emd_url
       )
GROUP BY entity_type
ORDER BY entity_type
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Avaliablity (Ping) Status';
DEF main_table = 'sysman.em_manageable_entities';
BEGIN
 :sql_text := '
SELECT COUNT(*) total, SUM(DECODE(status,1,1,0)) up, SUM(DECODE(status,2,1,0)) down, SUM(DECODE(status,3,1,0)) potential
FROM   sysman.mgmt_emd_ping
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Agent Down Statistics';
DEF main_table = 'sysman.em_manageable_entities';
BEGIN
 :sql_text := '
SELECT sysman.gc_diag_ext.PingReason(down_reason_code) status, COUNT(*) total
FROM   sysman.mgmt_emd_ping
WHERE  down_reason_code != 0
GROUP BY down_reason_code
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Current Avaliablity';
DEF main_table = 'sysman.em_manageable_entities';
BEGIN
 :sql_text := '
SELECT sysman.gc_diag_ext.AvailabilityStatus(a.current_status) status, COUNT(*) total
FROM   sysman.em_manageable_entities t, sysman.em_current_availability a
WHERE  t.entity_type   = ''oracle_emd''
  AND  t.manage_status = 2
  AND  a.target_guid   = t.entity_guid
GROUP BY a.current_status
ORDER BY a.current_status
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Marker Avaliablity';
DEF main_table = 'sysman.em_manageable_entities';
BEGIN
 :sql_text := '
SELECT sysman.gc_diag_ext.AvailabilityStatus(a.marker_avail_status) status, COUNT(*) total
FROM   sysman.em_manageable_entities t, sysman.mgmt_availability_marker a
WHERE  t.entity_type   = ''oracle_emd''
  AND  t.manage_status = 2
  AND  a.target_guid   = t.entity_guid
GROUP BY a.marker_avail_status
ORDER BY a.marker_avail_status
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'System Errors (Last 31 Days)';
DEF main_table = 'sysman.mgmt_system_error_log';
BEGIN
 :sql_text := '
SELECT t.entity_guid, t.entity_name, l.module_name, COUNT(*) total, MIN(l.occur_date) min_date, MAX(l.occur_date) min_date
FROM   sysman.mgmt_system_error_log l, sysman.em_manageable_entities t
WHERE  l.log_level     = ''ERROR''
  AND  l.emd_url IS NOT NULL
  AND  l.occur_date    > SYSDATE-31
  AND  t.emd_url       = l.emd_url
  AND  t.entity_type   = ''oracle_emd''
  AND  t.manage_status = 2
GROUP BY t.entity_guid, t.entity_name, l.module_name
ORDER BY t.entity_name, l.module_name
';
END;
/
@@emd360_9a_pre_one.sql

