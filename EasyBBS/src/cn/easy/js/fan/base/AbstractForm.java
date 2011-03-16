package cn.easy.js.fan.base;

import cn.easy.js.fan.web.ErrMsgException;
import cn.easy.js.fan.util.StrUtil;
import javax.servlet.http.HttpServletRequest;
import org.apache.log4j.Logger;

public abstract class AbstractForm {
	HttpServletRequest request;

	public Logger logger = null;

	String errmsg = "";

	public AbstractForm() {
		this.logger = Logger.getLogger(super.getClass().getName());
	}

	public void init() {
		this.errmsg = "";
	}

	public void log(String err, String div) {
		AbstractForm tmp8_7 = this;
		tmp8_7.errmsg = tmp8_7.errmsg + err + div;
	}

	public void log(String err) {
		log(err, "\\n");
	}

	public String getMessage() {
		return this.errmsg;
	}

	public boolean isValid() {
		return (this.errmsg.equals(""));
	}

	public void report() throws ErrMsgException {
		if (!(this.errmsg.equals("")))
			throw new ErrMsgException(this.errmsg);
	}

	public boolean chkStrLen(String str, int low, int high, boolean isequal) {
		if (str == null)
			return false;
		if (low > high)
			return false;
		int len = StrUtil.UTF8Len(str);
		if (isequal) {
			if ((len > high) || (len < low)) {
				return false;
			}
		} else if ((len >= high) || (len <= low)) {
			return false;
		}
		return true;
	}

	public boolean chkStrLen(String str, int low, int high) {
		return chkStrLen(str, low, high, true);
	}
}
