DEF section_name = 'Operating System';
SPO &&emd360_main_report..html APP;
PRO <h2>&&section_name.</h2>
SPO OFF;

DEF title = 'Operating System Sumamry';
DEF main_table = 'sysman.mgmt$os_summary';
BEGIN
 :sql_text := '
select name, base_version, update_level, max_swap_space_in_mb, default_run_level, run_level 
from sysman.mgmt$os_summary 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Hardware Summary Reported by Operating System';
DEF main_table = 'sysman.mgmt$os_summary';
BEGIN
 :sql_text := '
select domain, system_config 
from sysman.mgmt$os_hw_summary 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Hardware Summary Reported by Operating System 2';
DEF main_table = 'sysman.mgmt$os_summary';
BEGIN
 :sql_text := '
select ma, freq, mem, disk, cpu_count, physical_cpu_count, logical_cpu_count, total_cpu_cores, virtual, system_serial_number 
from sysman.mgmt$os_hw_summary 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System Components';
DEF main_table = 'sysman.mgmt$os_components';
BEGIN
 :sql_text := '
select name, ctype, version, installation_date
from sysman.mgmt$os_components 
where target_guid = ''&&emd360_guid''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System Services';
DEF main_table = 'sysman.mgmt$os_init_services';
BEGIN
 :sql_text := '
select init_process, run_state  
from sysman.mgmt$os_init_services 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System Kernel Parameters';
DEF main_table = 'sysman.mgmt$os_kernel_params';
BEGIN
 :sql_text := '
select source, name, value, datatype 
from sysman.mgmt$os_kernel_params 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System Limits';
DEF main_table = 'sysman.mgmt$os_limits';
BEGIN
 :sql_text := '
select cputime, fileblocks, data, stack, coredump, nofiles, vmemory 
from sysman.mgmt$os_limits 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System Modules';
DEF main_table = 'sysman.mgmt$os_modules';
BEGIN
 :sql_text := '
select name, size_in_bytes 
from sysman.mgmt$os_modules 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System File System Mounts';
DEF main_table = 'sysman.mgmt$os_fs_mount';
BEGIN
 :sql_text := '
select resource_name, type, mount_location, mount_options 
from sysman.mgmt$os_fs_mount 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System Patch Summary';
DEF main_table = 'sysman.mgmt$os_patch_summary';
BEGIN
 :sql_text := '
select name, vendor_name, base_version, update_level, distributor_version, max_swap_space_in_mb, num_patches 
from sysman.mgmt$os_patch_summary 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System Patches';
DEF main_table = 'sysman.mgmt$os_patches';
BEGIN
 :sql_text := '
select osname, vendor_name, os, patch 
from sysman.mgmt$os_patches 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql

DEF title = 'Operating System Properties';
DEF main_table = 'sysman.mgmt$os_properties';
BEGIN
 :sql_text := '
select source, name, value, datatype 
from sysman.mgmt$os_properties 
where target_guid = ''&&emd360_guid.''
';
END;
/
@@emd360_9a_pre_one.sql


