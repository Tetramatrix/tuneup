# Mozilla User Preferences

/* Do not edit this file.
 *
 * If you make changes to this file while the application is running,
 * the changes will be overwritten when the application exits.
 *
 * To make a manual change to preferences, you can visit the URL about:config
 * For more information, see http://www.mozilla.org/unix/customizing.html#prefs
 */

#user_pref("general.useragent.override", "Mozilla/5.0 (X11; U; Linux; en-GB; rv:1.9.2.3pre) Gecko/20100723 Firefox/3.5 Browser 1.7.4.8"); 
#user_pref("general.useragent.vendor", "Mozilla/5.0 (X11; U; Linux; en-GB; rv:1.9.2.3pre) Gecko/20100723 Firefox/3.5 Browser 1.7.4.8");
user_pref("config.trim_on_minimze", true); 
user_pref("browser.cache.disk.enable", false);
#user_pref("browser.cache.disk.parent_directory", "/ramdisk");
user_pref("browser.cache.memory.capacity", 8192);
user_pref("browser.sessionhistory.max_entries", 40);
user_pref("content.interrupt.parsing", true);
user_pref("content.notify.ontimer", true);
user_pref("content.max.tokenizing.time", 4500000);
user_pref("content.switch.threshold",1500000);
user_pref("content.notify.interval", 1500000);
user_pref("content.notify.backoffcount", 320000);
#default 8192
user_pref("content.maxtextrun", 650000);
#user_pref("content.maxtextrun", 8191);
user_pref("network.http.max-connections", 128);
user_pref("network.http.max-connections-per-server", 32);
user_pref("network.http.max-persistent-connections-per-server", 32);
user_pref("network.http.pipelining", true);
user_pref("network.http.pipelining.ssl", true);
user_pref("network.http.pipelining.maxrequests", 1000);  
user_pref("nglayout.initialpaint.delay", 0);
user_pref("javascript.options.jit.chrome");
user_pref("javascript.options.jit.content");
user_pref("dom.disable_window_status_change", true);
user_pref("dom.ipc.content.nice", 0);
user_pref("ui.submenuDelay", 0);
#400
user_pref("toolkit.browser.cacheRatioHeight", 1500000);
#420
user_pref("toolkit.browser.cacheRatioWidth", 1500000);
user_pref("network.dnsCacheExpiration", 360);
user_pref("network.dnsCacheEntries", 100);
user_pref("netowrk.ftp.idleConnectionTimeout", 60);
user_pref("network.http.keep-alive.timeout", 10);
user_pref("network.http.request.max-start-delay", 0);
user_pref("network.http.connect.timeout", 10);
user_prefs("dom.ipc.plugins.enabled", true);
user_prefs("nglayout.debug.checksum_xul_fastload_file", false);