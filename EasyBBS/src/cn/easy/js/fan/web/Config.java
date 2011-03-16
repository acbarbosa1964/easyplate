package cn.easy.js.fan.web;

import cn.easy.js.fan.kernal.ISchedulerUnit;
import cn.easy.js.fan.kernal.Scheduler;
import cn.easy.js.fan.security.SecurityUtil;
import cn.easy.js.fan.util.XMLProperties;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.util.Iterator;
import java.util.List;
import java.util.Vector;
import org.apache.log4j.Logger;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

public class Config {
	private XMLProperties properties;

	private final String CONFIG_FILENAME = "config.xml";

	private final String ADMIN_PWD = "Application.admin_pwd";

	private String cfgpath;

	Logger logger;

	Document doc = null;

	Element root = null;

	public Config() {
		URL cfgURL = super.getClass().getClassLoader()
				.getResource("config.xml");
		this.cfgpath = cfgURL.getFile();
		this.properties = new XMLProperties(this.cfgpath);

		this.logger = Logger.getLogger(Config.class.getName());

		SAXBuilder sb = new SAXBuilder();
		try {
			FileInputStream fin = new FileInputStream(this.cfgpath);
			this.doc = sb.build(fin);
			this.root = this.doc.getRootElement();
			fin.close();
		} catch (JDOMException e) {
			this.logger.error("Config:" + e.getMessage());
		} catch (IOException e) {
			this.logger.error("Config:" + e.getMessage());
		}
	}

	public String getProperty(String name) {
		return this.properties.getProperty(name);
	}

	public void setProperty(String name, String value) {
		this.properties.setProperty(name, value);
	}

	public String getAdminPwdMD5() {
		return this.properties.getProperty("Application.admin_pwd");
	}

	public boolean setAdminPwdMD5(String pwd) {
		try {
			pwd = SecurityUtil.MD5(pwd);
		} catch (Exception e) {
			this.logger.error(e.getMessage());
		}
		this.properties.setProperty("Application.admin_pwd", pwd);
		return true;
	}

	public void initScheduler() {
		Scheduler.getInstance().ClearUnits();

		Element which = this.root.getChild("scheduler");
		if (which == null) {
			return;
		}
		List list = which.getChildren();
		Iterator ir = list.iterator();
		while (ir.hasNext()) {
			Element e = (Element) ir.next();
			String className = e.getTextTrim();
			try {
				ISchedulerUnit isu = (ISchedulerUnit) Class.forName(className)
						.newInstance();
				isu.registSelf();
			} catch (Exception e1) {
				this.logger.error("initScheduler:" + e1.getMessage());
			}
		}
	}

	public Vector getDBInfos() {
		Element which = this.root.getChild("DataBase");
		if (which == null) {
			return new Vector();
		}
		Vector v = new Vector();

		List list = which.getChildren("db");
		Iterator ir = list.iterator();
		while (ir.hasNext()) {
			Element e = (Element) ir.next();
			DBInfo di = new DBInfo();
			di.name = e.getChildTextTrim("name");

			String strDefault = e.getChildTextTrim("Default");
			if (strDefault.equals("true"))
				di.isDefault = true;
			else
				di.isDefault = false;
			di.DBDriver = e.getChildTextTrim("DBDriver");
			di.ConnStr = e.getChildTextTrim("ConnStr");
			di.PoolName = e.getChildTextTrim("PoolName");
			String UsePool = e.getChildTextTrim("UsePool");
			if (UsePool.equals("true"))
				di.isUsePool = true;
			else
				di.isUsePool = false;
			v.addElement(di);
		}
		return v;
	}
}
