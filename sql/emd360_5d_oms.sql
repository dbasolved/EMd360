DEF section_name = '5d. OMS';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. OMS Certs';
DEF main_table = 'sysman.mgmt_sec_info';
BEGIN
 :sql_text := '
select  ca_id, ca_status, sign_alg, ca_valid_from, ca_valid_till, key_strength, creation_timestamp, issuer, distinguished_name 
from sysman.mgmt_sec_info
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. OMS Upload Certs';
DEF main_table = 'sysman.mgmt_oms_upload_sec_info';
BEGIN
 :sql_text := '
select oms_id, ca_id, cert_valid_from, cert_valid_till, secure_timestamp, sign_alg, key_strength, issuer, distinguished_name, issuer_type, ssl_protocol
from sysman.mgmt_oms_upload_sec_info
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '3. OMS Console Certs';
DEF main_table = 'sysman.mgmt_oms_console_sec_info';
BEGIN
 :sql_text := '
select oms_id, ca_id, cert_valid_from, cert_valid_till, secure_timestamp, sign_alg, key_strength, issuer, distinguished_name, issuer_type, ssl_protocol
from sysman.mgmt_oms_console_sec_info
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '4. OMS Audit Info';
DEF main_table = 'sysman.mgmt$audit_log';
BEGIN
 :sql_text := '
select *
from sysman.mgmt$audit_log
';
END;
/
@@emd360_9a_pre_one.sql
