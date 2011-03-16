package cn.easy.js.fan.base;

import javax.servlet.http.HttpServletRequest;

public interface IPrivilege {
	public static final String MSG_INVALID = "对不起，您无权访问！";

	public abstract boolean isValid(HttpServletRequest paramHttpServletRequest,
			String paramString);

	public abstract String getUser(HttpServletRequest paramHttpServletRequest);
}
