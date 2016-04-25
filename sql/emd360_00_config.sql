-- sqld360 configuration file. for those cases where you must change sqld360 functionality

/*************************** ok to modify (if really needed) ****************************/

-- history days (default 31)
DEF emd360_conf_days = '31';

/**************************** not recommended to modify *********************************/

-- excluding report types reduce usability while providing marginal performance gain
DEF emd360_conf_incl_html   = 'Y';
DEF emd360_conf_incl_text   = 'N';
DEF emd360_conf_incl_csv    = 'N';
DEF emd360_conf_incl_xml    = 'N';
DEF emd360_conf_incl_line   = 'Y';
DEF emd360_conf_incl_pie    = 'Y';
DEF emd360_conf_incl_bar    = 'Y';
DEF emd360_conf_incl_tree   = 'Y';
DEF emd360_conf_incl_bubble = 'Y';

-- include/exclude SQL Monitor reports
--DEF sqld360_conf_incl_sqlmon = 'Y';

-- include/exclude DBA_HIST_ASH (always on by default, turned off only by eDB180) 
--DEF sqld360_conf_incl_ash_hist = 'Y';

-- include/exclude AWR Reports (always on by default) 
--DEF sqld360_conf_incl_awrrpt = 'Y';

-- include/exclude ASH SQL Reports (always off by default, very expensive and little benefit) 
--DEF sqld360_conf_incl_ashrpt = 'N';


/**************************** not recommended to modify *********************************/

DEF emd360_conf_tool_page = '<a href="http://www.enkitec.com/products" target="_blank">';
DEF emd360_conf_tool_page = '<a href="http://dbasolved.com" target="_blank">';
DEF emd360_conf_all_pages_icon = '<a href="http://dbasolved.com" target="_blank"><img src="EMd360_img.jpg" alt="EMd360" height="46" width="50" /></a>';
DEF emd360_conf_all_pages_logo = '<img src="EMd360_all_pages_logo.jpg" alt="Enkitec now part of Accenture" width="117" height="29">';
--DEF emd360_conf_all_pages_logo = '';
DEF emd360_conf_google_charts = '<script type="text/javascript" src="https://www.google.com/jsapi"></script>';


/**************************** enter your modifications here *****************************/

--DEF sqld360_conf_incl_text = 'N';
--DEF sqld360_conf_incl_csv = 'N';

