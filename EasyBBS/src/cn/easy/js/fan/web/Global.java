package cn.easy.js.fan.web;

import cn.easy.js.fan.kernal.Scheduler;
import cn.easy.js.fan.util.StrUtil;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.TimeZone;
import java.util.Vector;
import org.apache.log4j.Logger;

public class Global {
	static Logger logger = Logger.getLogger(Global.class.getName());

	public static String author;

	public static String AppName;

	public static String server;

	public static String port;

	public static String virtualPath;

	public static String defaultDB;

	public static int MaxSize = 1024000;

	public static int FileSize = 1024000;

	public static boolean hasBlog = false;

	public static String INTERNET_FLAG_SECURE = "secure";

	public static String internetFlag;

	static HashMap dbinfos = new HashMap();

	public static String smtpServer;

	public static int smtpPort;

	public static String smtpUser;

	public static String smtpPwd;

	public static String realPath;

	public static String email;

	public static int maxUploadingFileCount;

	public static String desc;

	public static String copyright;

	public static String icp;

	public static String contact;

	public static String version;

	public static String title;

	public static Locale locale;

	public static TimeZone timeZone;

	public Global() {
		init();
	}

	public static void init() {
		Config config = new Config();

		author = config.getProperty("Application.author");
		AppName = config.getProperty("Application.name");
		server = config.getProperty("Application.server");
		port = config.getProperty("Application.port");
		virtualPath = StrUtil.getNullString(config
				.getProperty("Application.virtualPath"));
		String strMaxSize = StrUtil.getNullString(config
				.getProperty("Application.WebEdit.MaxSize"));
		if (StrUtil.isNumeric(strMaxSize)) {
			MaxSize = Integer.parseInt(strMaxSize);
		}
		String strmaxUploadingFileCount = StrUtil.getNullString(config
				.getProperty("Application.WebEdit.maxUploadingFileCount"));
		if (StrUtil.isNumeric(strmaxUploadingFileCount))
			maxUploadingFileCount = Integer.parseInt(strmaxUploadingFileCount);
		String strFileSize = StrUtil.getNullString(config
				.getProperty("Application.FileSize"));
		if (StrUtil.isNumeric(strFileSize)) {
			FileSize = Integer.parseInt(strFileSize);
		}
		String sHasBlog = StrUtil.getNullString(config
				.getProperty("Application.hasBlog"));
		if (sHasBlog.equals("true")) {
			hasBlog = true;
		}
		smtpServer = config.getProperty("Application.smtpServer");
		String sPort = config.getProperty("Application.smtpPort");
		if (StrUtil.isNumeric(sPort))
			smtpPort = Integer.parseInt(sPort);
		smtpUser = config.getProperty("Application.smtpUser");
		smtpPwd = config.getProperty("Application.smtpPwd");

		realPath = config.getProperty("Application.realPath");
		email = config.getProperty("Application.email");

		internetFlag = StrUtil.getNullString(config
				.getProperty("Application.internetFlag"));

		desc = StrUtil.getNullStr(config.getProperty("Application.desc"));
		copyright = StrUtil.getNullStr(config
				.getProperty("Application.copyright"));

		icp = StrUtil.getNullStr(config.getProperty("Application.icp"));

		contact = StrUtil.getNullStr(config.getProperty("Application.contact"));

		version = StrUtil.getNullStr(config.getProperty("Application.version"));

		title = StrUtil.getNullStr(config.getProperty("Application.title"));

		String lang = StrUtil.getNullStr(config.getProperty("i18n.lang"));
		String country = StrUtil.getNullStr(config.getProperty("i18n.country"));
		String strTimeZone = StrUtil.getNullStr(config
				.getProperty("i18n.timeZone"));

		locale = new Locale(lang, country);
		timeZone = TimeZone.getTimeZone(strTimeZone);

		Scheduler.initInstance(1000L);

		config.initScheduler();

		dbinfos.clear();
		Vector v = config.getDBInfos();
		Iterator ir = v.iterator();
		while (ir.hasNext()) {
			DBInfo di = (DBInfo) ir.next();
			if (di.isDefault) {
				defaultDB = di.name;
			}

			dbinfos.put(di.name, di);
		}
	}

	public static DBInfo getDBInfo(String key) {
		return ((DBInfo) dbinfos.get(key));
	}

	public static void setDefaultDB(String db) {
		defaultDB = db;
	}

	public void setSmtpServer(String smtpServer) {
		smtpServer = smtpServer;
	}

	public void setSmtpPort(int smtpPort) {
		smtpPort = smtpPort;
	}

	public void setSmtpUser(String smtpUser) {
		smtpUser = smtpUser;
	}

	public void setSmtpPwd(String smtpPwd) {
		smtpPwd = smtpPwd;
	}

	public void setRealPath(String realPath) {
		realPath = realPath;
	}

	public void setEmail(String email) {
		email = email;
	}

	public void setMaxUploadingFileCount(int maxUploadingFileCount) {
		maxUploadingFileCount = maxUploadingFileCount;
	}

	public void setTitle(String title) {
		title = title;
	}

	public static String getRootPath() {
		if (!(virtualPath.equals(""))) {
			if (port.equals("80")) {
				return "http://" + server + "/" + virtualPath;
			}

			return "http://" + server + ":" + port + "/" + virtualPath;
		}

		if (port.equals("80")) {
			return "http://" + server;
		}
		return "http://" + server + ":" + port;
	}

	public static String getSmtpServer() {
		return smtpServer;
	}

	public static int getSmtpPort() {
		return smtpPort;
	}

	public static String getSmtpUser() {
		return smtpUser;
	}

	public static String getSmtpPwd() {
		return smtpPwd;
	}

	public static String getRealPath() {
		return realPath;
	}

	public static String getEmail() {
		return email;
	}

	public static int getMaxUploadingFileCount() {
		return maxUploadingFileCount;
	}

	public static String getInternetFlag() {
		return internetFlag;
	}

	public static String getDesc() {
		return desc;
	}

	public static String getCopyright() {
		return copyright;
	}

	public static String getIcp() {
		return icp;
	}

	public static String getContact() {
		return contact;
	}

	public static String getVersion() {
		return version;
	}

	public static String getTitle() {
		return title;
	}

	public static Locale getLocale() {
		return locale;
	}

	public static TimeZone getTimeZone() {
		return timeZone;
	}

	static {
		new Global();

		maxUploadingFileCount = 30;
	}
}
