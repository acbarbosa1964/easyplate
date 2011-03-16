package cn.easy.js.fan.base;

import javax.servlet.http.HttpServletRequest;

public interface ISkin {
	public abstract String LoadStr(HttpServletRequest paramHttpServletRequest,
			String paramString);
}
