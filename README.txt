EMd360 v1603 (2016-07-19) by Bobby Curtis

EMd360 is a "free to use" tool to perform an in-depth investigation of a Oracle Enterprise 
Manager environment. It collects detailed information around the Oracle Management Server (OMS)
and Oracle Management Repository (OMR). It also helps to document any findings.
EMd360 installs nothing and is completely SQL based against the OMS. Expectation is that
EMd360 should be executed as SYS on the OMR.  It takes a few minutes to execute. Output 
ZIP file can be large (several MBs), so you may want to execute EMd360 from a 
system directory with at least 1 GB of free space. 

Steps
~~~~~
1. Unzip EMd360.zip, navigate to the root EMd360 directory, and connect as SYS, 
   DBA, or any User with Data Dictionary access:

   $ unzip EMd360.zip
   $ cd EMd360
   $ sqlplus <dba_user>/<dba_pwd>

2. Execute EMd360.sql indicating two input parameters. The first one is to specify 
   the OMS name. The second one is to specify the OMR database SID. Example below specifies 
   the OMS of "pebble" and the OMR of "emrep". EMd360 uses 31 days by default. 

   SQL> @emd360.sql pebble emrep 
   
3. Unzip output sqld360_<omr name>_<oms host>_YYYYMMDD_HH24MI.zip into a directory on your PC

4. Review main html file 0001_emd360_<omr name>_index.html

****************************************************************************************
   
    EMd360 - Enkitec's Oracle EM 360-degree View
    Copyright (C) 2016  Bobby Curtis

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.

*****************************************************************************************

History
~~~~~~~
EMd360 v1602 (2016-03-15) by Bobby Curtis

-Initial release

EMd360 v1603 (2016-07-19) by Bobby Curtis

-Added security (certificate) related items in the security section for agents and OMS
-Renumbered the output by section and sub-section
-Capitalized the headers of each column to see clearer


