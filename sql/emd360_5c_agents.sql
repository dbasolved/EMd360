DEF section_name = '5c. Agent';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Agent Security Certs';
DEF main_table = 'sysman.mgmt_agent_sec_info';
BEGIN
 :sql_text := '
WITH targets AS
  (SELECT target_guid, target_name FROM sysman.mgmt$target)
SELECT t2.target_name, t1.ca_id, t1.cert_valid_from, t1.cert_valid_till, t1.sign_alg, t1.key_strength, t1.secure_timestamp, t1.distinguished_name 
FROM sysman.mgmt_agent_sec_info t1, targets t2
WHERE t1.target_guid = t2.target_guid
and t1.agent_target_guid = t2.target_guid
';
END;
/
@@emd360_9a_pre_one.sql