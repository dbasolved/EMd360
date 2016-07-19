DEF section_name = '1a. Hardware';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = '1. Target Details';
DEF main_table = 'sysman.mgmt$target';
BEGIN
  :sql_text := '
SELECT display_name, type_qualifier2 operating_system
  FROM sysman.mgmt$target 
 WHERE target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '2. CPU Details';
DEF main_table = 'sysman.mgmt$hw_cpu_details';
BEGIN
  :sql_text := '
SELECT impl, vendor_name, freq_in_mhz, ecache_in_mb, num_cores, siblings 
  FROM sysman.mgmt$hw_cpu_details 
 WHERE target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '3. Host File Details';
DEF main_table = 'sysman.mgmt$hw_hosts_file';
BEGIN
  :sql_text := '
select ip_addr, value
from sysman.mgmt$hw_hosts_file
 WHERE target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '4. IO Devices';
DEF main_table = 'sysman.mgmt$hw_io_devices';
BEGIN
  :sql_text := '
select vendor_name, name, freq_in_mhz, bus 
from sysman.mgmt$hw_io_devices
 WHERE target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = '5. Network Devices';
DEF main_table = 'sysman.mgmt$hw_nic';
BEGIN
  :sql_text := '
select name, inet_address, max_transfer_unit, broadcast_address, mask, flags, mac_address, inet6_addresses, host_aliases, dhcp_enabled, is_physical
from sysman.mgmt$hw_nic
 WHERE target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql