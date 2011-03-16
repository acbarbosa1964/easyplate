package cn.easy.js.fan.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URL;
import org.apache.log4j.Logger;
import org.jdom.Attribute;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

public class XMLConfig {
	private XMLProperties properties;

	private String filePath;

	Logger logger;

	Document doc = null;

	Element root = null;

	String rootChild = "";

	String encoding = "gb2312";

	public XMLConfig(String filePath, boolean isRealPath, String encoding) {
		this.encoding = encoding;
		this.filePath = filePath;
		if (!(isRealPath)) {
			URL cfgURL = super.getClass().getClassLoader()
					.getResource(filePath);
			filePath = cfgURL.getFile();
		}

		File file = new File(filePath);

		this.logger = Logger.getLogger(XMLConfig.class.getName());

		SAXBuilder sb = new SAXBuilder();
		try {
			this.doc = sb.build(file);
			this.root = this.doc.getRootElement();
			this.properties = new XMLProperties(file, this.doc);
		} catch (JDOMException e) {
			this.logger.error("XMLConfig:" + e.getMessage());
		} catch (IOException e) {
			this.logger.error("XMLConfig:" + e.getMessage());
		}
	}

	public void setRootChild(String rootChild) {
		this.rootChild = rootChild;
	}

	public Element getRootElement() {
		return this.root;
	}

	public String get(String name) {
		return this.properties.getProperty(name);
	}

	public int getInt(String name) {
		String p = get(name);
		if (StrUtil.isNumeric(p)) {
			return Integer.parseInt(p);
		}
		return -65536;
	}

	public void set(String name, String value) {
		this.properties.setProperty(name, value);
	}

	public String getDescription(String name) {
		Element which = this.root.getChild(this.rootChild).getChild(name);
		if (which == null)
			return null;
		return which.getAttribute("desc").getValue();
	}

	public boolean put(String name, String value) {
		Element which = this.root.getChild(this.rootChild).getChild(name);
		if (which == null)
			return false;
		which.setText(value);
		writemodify();
		return true;
	}

	public void writemodify() {
		String indent = "    ";
		boolean newLines = true;

		Format format = Format.getPrettyFormat();
		format.setIndent(indent);
		format.setEncoding(this.encoding);
		XMLOutputter outp = new XMLOutputter(format);
		try {
			FileOutputStream fout = new FileOutputStream(this.filePath);
			outp.output(this.doc, fout);
			fout.close();
		} catch (IOException e) {
		}
	}
}
