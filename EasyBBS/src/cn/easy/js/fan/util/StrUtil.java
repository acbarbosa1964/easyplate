package cn.easy.js.fan.util;

import cn.easy.js.fan.web.Global;
import cn.easy.js.fan.web.ErrMsgException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;

public class StrUtil {
	public static String UrlEncode(String str, String charset) {
		if (str == null)
			return "";
		String s = "";
		try {
			s = URLEncoder.encode(str, charset);
		} catch (Exception e) {
		}
		return s;
	}

	public static String UrlEncode(String str) {
		return UrlEncode(str, "utf-8");
	}

	public static String[] split(String str, String token) {
		str = getNullStr(str).trim();
		if (str.equals(""))
			return null;
		return str.split(token);
	}

	public static String getUrl(HttpServletRequest request) {
		String str = "";
		str = request.getRequestURL() + "?"
				+ UrlEncode(request.getQueryString(), "utf-8");

		return str;
	}

	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		if (ip == null) {
			ip = getNullStr(request.getRemoteAddr());
		}
		return getNullString(ip);
	}

	public static String getNullString(String str) {
		return ((str == null) ? "" : str);
	}

	public static String getNullStr(String str) {
		return ((str == null) ? "" : str);
	}

	public static String replace(String strSource, String strFrom, String strTo) {
		if ((strSource.equals("")) || (strSource == null))
			return strSource;
		String strDest = "";
		int intFromLen = strFrom.length();

		if ((strSource == null) || (strSource.trim().equals("")))
			return strSource;
		int intPos;
		while ((intPos = strSource.indexOf(strFrom)) != -1) {
			strDest = strDest + strSource.substring(0, intPos);
			strDest = strDest + strTo;
			strSource = strSource.substring(intPos + intFromLen);
		}
		strDest = strDest + strSource;

		return strDest;
	}

	public static String sqlstr(String str) {
		if ((str == null) || (str.trim().equals(""))) {
			str = "''";
			return str;
		}
		str = "'" + replace(str, "'", "''") + "'";
		return str;
	}

	public static String UnicodeToGB(String strIn) {
		return UnicodeToUTF8(strIn);
	}

	public static int UTF8Len(String str) {
		int k = 0;
		for (int i = 0; i < str.length(); ++i) {
			if (str.charAt(i) > 255)
				k += 2;
			else
				++k;
		}
		return k;
	}

	public static String Unicode2GB(String strIn) {
		String strOut = null;
		if ((strIn == null) || (strIn.trim().equals("")))
			return strIn;
		try {
			byte[] b = strIn.getBytes("ISO8859_1");
			strOut = new String(b, "GB2312");
		} catch (Exception e) {
		}
		return strOut;
	}

	public static String UnicodeToUTF8(String strIn) {
		String strOut = null;
		if ((strIn == null) || (strIn.trim().equals("")))
			return strIn;
		try {
			byte[] b = strIn.getBytes("ISO8859_1");

			strOut = new String(b, "utf-8");
		} catch (Exception e) {
		}
		return strOut;
	}

	public static String GBToUnicode(String strIn) {
		String strOut = null;
		if ((strIn == null) || (strIn.trim().equals("")))
			return strIn;
		try {
			byte[] b = strIn.getBytes("GB2312");
			strOut = new String(b, "ISO8859_1");
		} catch (UnsupportedEncodingException e) {
		}
		return strOut;
	}

	public static String UTF8ToUnicode(String strIn) {
		String strOut = null;
		if ((strIn == null) || (strIn.trim().equals("")))
			return strIn;
		try {
			byte[] b = strIn.getBytes("utf-8");
			strOut = new String(b, "ISO8859_1");
		} catch (UnsupportedEncodingException e) {
		}
		return strOut;
	}

	public static String p_center(String str) {
		return "<p align=center>" + str + "</p>";
	}

	public static String p_center(String str, String color) {
		return "<p align=center><font color='" + color + "'>" + str
				+ "</font></p>";
	}

	public static String makeErrMsg(String msg) {
		String str = "<BR><BR><BR>";
		str = str
				+ "<table width='70%' height='50' border='0' align='center' cellpadding='0' cellspacing='1' bgcolor='blue'>";
		str = str + "<tr>";
		str = str + "<td bgcolor='#FFFFFF' align='center'><b><font color=red>"
				+ msg + "</font></b></td>";

		str = str + "</tr>";
		str = str + "</table>";
		return str;
	}

	public static String makeErrMsg(String msg, String textclr, String bgclr) {
		String str = "<BR><BR><BR>";
		str = str
				+ "<table width='70%' height='50' border='0' align='center' cellpadding='0' cellspacing='1' bgcolor='"
				+ bgclr + "'>";

		str = str + "<tr>";
		str = str + "<td bgcolor='#FFFFFF' align='center'><font color='"
				+ textclr + "'><b>" + msg + "</b></font></td>";

		str = str + "</tr>";
		str = str + "</table>";
		return str;
	}

	public static String waitJump(String msg, int t, String url) {
		String str = "";
		String spanid = "id" + System.currentTimeMillis();
		str = "\n<ol><b><span id=" + spanid + "> 3 </span>";
		str = str + "秒钟后系统将自动返回... </b></ol>";
		str = str + "<ol>" + msg + "</ol>";
		str = str + "<script language=javascript>\n";
		str = str + "<!--\n";
		str = str + "function tickout(secs) {\n";
		str = str + spanid + ".innerText = secs;\n";
		str = str + "if (--secs > 0) {\n";
		str = str + "  setTimeout('tickout(' +secs + ')', 1000);\n";
		str = str + "}\n";
		str = str + "}\n";
		str = str + "tickout(" + t + ");\n";
		str = str + "-->\n";
		str = str + "</script>\n";
		str = str + "<meta http-equiv=refresh content=" + t + ";url=" + url
				+ ">\n";
		return str;
	}

	public static String Alert_Redirect(String msg, String toUrl) {
		String str = "";
		str = "<script language=javascript>\n";
		str = str + "<!--\n";
		str = str + "alert(\"" + msg + "\")\n";
		if (!(toUrl.equals("")))
			str = str + "location.href=\"" + toUrl + "\"\n";
		str = str + "-->\n";
		str = str + "</script>\n";
		return str;
	}

	public static String Alert_Back(String msg) {
		String str = "";
		str = "<script language=javascript>\n";
		str = str + "<!--\n";
		str = str + "alert(\"" + msg + "\")\n";
		str = str + "history.back()\n";
		str = str + "-->\n";
		str = str + "</script>\n";
		return str;
	}

	public static String Alert(String msg) {
		String str = "";
		str = "<script language=javascript>\n";
		str = str + "<!--\n";
		str = str + "alert(\"" + msg + "\")\n";
		str = str + "-->\n";
		str = str + "</script>\n";
		return str;
	}

	public static double toDouble(String str) throws ErrMsgException {
		double d = 0.0D;
		try {
			d = Double.parseDouble(str);
		} catch (Exception e) {
			throw new ErrMsgException("toDouble:" + e.getMessage());
		}
		return d;
	}

	public static int toInt(String str) throws ErrMsgException {
		int d = 0;
		try {
			d = Integer.parseInt(str);
		} catch (Exception e) {
			throw new ErrMsgException(e.getMessage());
		}
		return d;
	}

	public static boolean isNumeric(String s) {
		if (s == null)
			return false;
		boolean flag = true;
		char[] numbers = s.toCharArray();
		if (numbers.length == 0)
			return false;
		for (int i = 0; i < numbers.length; ++i) {
			if (!(Character.isDigit(numbers[i]))) {
				flag = false;
				break;
			}
		}
		return flag;
	}

	public static boolean isCharOrNum(String s) {
		int len = s.length();
		for (int i = 0; i < len; ++i) {
			char ch = s.charAt(i);
			if ((((ch < 'a') || (ch > 'z'))) && (((ch < 'A') || (ch > 'Z')))
					&& (((ch < '0') || (ch > '9')))) {
				return false;
			}
		}
		return true;
	}

	public static boolean isChars(String s) {
		int len = s.length();
		for (int i = 0; i < len; ++i) {
			char ch = s.charAt(i);
			if ((((ch < 'a') || (ch > 'z'))) && (((ch < 'A') || (ch > 'Z')))) {
				return false;
			}
		}
		return true;
	}

	public static boolean isNotCN(String str) {
		Pattern pa = Pattern.compile("[一-龠]", 128);
		Matcher m = pa.matcher(str);

		return (!(m.find()));
	}

	public static String FormatDate(Date d, String format) {
		if (d == null)
			return "";
		SimpleDateFormat myFormatter = new SimpleDateFormat(format);
		return myFormatter.format(d);
	}

	public static String FormatPrice(double value) {
		String subval = "0.00";
		if (value > 0.0D) {
			subval = Double.toString(value);
			int decimal_len = subval.length() - (subval.lastIndexOf(46) + 1);
			if (decimal_len > 1)
				subval = subval.substring(0, subval.lastIndexOf(46) + 3);
			else
				subval = subval + "0";
		}
		return subval;
	}

	public static String FormatPrice(String value) {
		if (value == null)
			return null;
		String subval = "0.00";
		if (Double.parseDouble(value) > 0.0D) {
			subval = value;
			int decimal_len = subval.length() - (subval.lastIndexOf(46) + 1);
			if (decimal_len > 1)
				subval = subval.substring(0, subval.lastIndexOf(46) + 3);
			else
				subval = subval + "0";
		}
		return subval;
	}

	public static String toHtml(String str) {
		if ((str == null) || (str.equals("")))
			return "";
		StringBuffer buf = new StringBuffer(str.length() + 6);

		char ch = ' ';
		for (int i = 0; i < str.length(); ++i) {
			ch = str.charAt(i);
			if (ch == '<') {
				buf.append("&lt;");
			} else if (ch == '>') {
				buf.append("&gt;");
			} else if (ch == ' ') {
				buf.append("&nbsp;");
			} else if (ch == '\n') {
				buf.append("<br>");
			} else if (ch == '\'') {
				buf.append("&#039;");
			} else if (ch == '"')
				buf.append("&quot;");
			else {
				buf.append(ch);
			}

		}

		str = buf.toString();
		return str;
	}

	public static String replyCanSee(String content, boolean canSee,
			String subStr) {
		String patternStr = "";

		patternStr = "(\\[REPLY\\])(.[^\\[]*)(\\[\\/REPLY\\])";
		Pattern pattern = Pattern.compile(patternStr, 34);
		Matcher matcher = pattern.matcher(content);
		if (canSee)
			content = matcher.replaceAll(subStr + "<BR>" + "$2");
		else
			content = matcher.replaceAll(subStr);
		return content;
	}

	public static String experienceCanSee(String content, boolean canSee,
			String subStr) {
		String patternStr = "";

		patternStr = "(\\[HIDE_EXP=([0-9]*)\\])(.[^\\[]*)(\\[\\/HIDE_EXP\\])";
		Pattern pattern = Pattern.compile(patternStr, 34);
		Matcher matcher = pattern.matcher(content);
		if (canSee)
			content = matcher.replaceAll(subStr + "<BR>" + "$3");
		else
			content = matcher.replaceAll(subStr);
		return content;
	}

	public static String ubbWithoutAutoLink(String content) {
		String patternStr = "";

		patternStr = "\\[em(.[^\\[]*)\\]";
		Pattern pattern = Pattern.compile(patternStr);
		Matcher matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<img src=images/emot/em$1.gif border=0 align=middle>");

		patternStr = "(\\[URL\\])(.[^\\[]*)(\\[\\/URL\\])";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<A HREF=\"$2\" TARGET=_blank>$2</A>");
		patternStr = "(\\[URL=(.[^\\[]*)\\])(.[^\\[]*)(\\[\\/URL\\])";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<A HREF=\"$2\" TARGET=_blank>$3</A>");
		pattern = Pattern
				.compile("(\\[EMAIL\\])(\\S+\\@.[^\\[]*)(\\[\\/EMAIL\\])");

		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<img align=absmiddle src=images/email1.gif><A HREF=\"mailto:$2\">$2</A>");

		pattern = Pattern
				.compile("(\\[EMAIL=(\\S+\\@.[^\\[]*)\\])(.[^\\[]*)(\\[\\/EMAIL\\])");

		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<img align=absmiddle src=images/email1.gif><A HREF=\"mailto:$2\" TARGET=_blank>$3</A>");

		patternStr = "\\[color=(.[^\\[]*)\\](.*)\\[\\/color\\]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<font color=$1>$2</font>");

		patternStr = "\\[face=(.[^\\[]*)\\](.[^\\[]*)\\[\\/face\\]";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<font face=$1>$2</font>");
		patternStr = "\\[center\\](.+)\\[\\/center\\]";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<div align=center>$1</div>");

		patternStr = "\\[right\\](.[^\\[]*)\\[\\/right\\]";

		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<div align=right>$1</div>");

		patternStr = "\\[QUOTE\\](.[^\\[]*)\\[\\/QUOTE\\]";
		pattern = Pattern.compile(patternStr, 32);

		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<table align=center style=\"width:80%\" cellpadding=5 cellspacing=1 class=tableborder1><TR><TD class=123>$1</td></tr></table>");
		patternStr = "\\[fly\\](.*)\\[\\/fly\\]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<marquee width=90% behavior=alternate scrollamount=3>$1</marquee>");

		patternStr = "\\[move\\](.*)\\[\\/move\\]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<MARQUEE scrollamount=3>$1</marquee>");
		patternStr = "\\[glow=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\\](.*)\\[\\/glow]";

		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<table width=$1 style=\"filter:glow(color=$2, strength=$3)\">$4</table>");

		patternStr = "\\[SHADOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\\](.[^\\[]*)\\[\\/SHADOW]";

		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<table width=$1 style=\"filter:shadow(color=$2, strength=$3)\">$4</table>");

		patternStr = "\\[I\\](.[^\\[]*)\\[\\/I\\]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<i>$1</i>");
		patternStr = "\\[U\\](.[^\\[]*)(\\[\\/U\\])";

		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<u>$1</u>");
		patternStr = "\\[B\\](.[^\\[]*)(\\[\\/B\\])";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<b>$1</b>");

		patternStr = "\\[size=([1-8])\\](.[^\\[]*)\\[\\/size\\]";

		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<font size=$1>$2</font>");

		patternStr = "\\[dir=*([0-9]*),*([0-9]*)\\](.*)\\[\\/dir]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<object classid=clsid:166B1BCA-3F9C-11CF-8075-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=7,0,2,0 width=$1 height=$2><param name=src value=$3><embed src=$3 pluginspage=http://www.macromedia.com/shockwave/download/ width=$1 height=$2></embed></object>");
		patternStr = "\\[QT=*([0-9]*),*([0-9]*)\\](.*)\\[\\/QT]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<embed src=$3 width=$1 height=$2 autoplay=true loop=false controller=true playeveryframe=false cache=false scale=TOFIT bgcolor=#000000 kioskmode=false targetcache=false pluginspage=hhttttpp://www.apple.com/quicktime/></embed>");
		patternStr = "\\[mp=*([0-9]*),*([0-9]*)\\](.*)\\[\\/mp]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=$1 height=$2 ><param name=ShowStatusBar value=-1><param name=Filename value=$3><embed type=application/x-oleobject codebase=hhttttpp://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=$3  width=$1 height=$2></embed></object>");
		patternStr = "\\[rm=*([0-9]*),*([0-9]*)\\](.*)\\[\\/rm]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width=$1 height=$2><PARAM NAME=SRC VALUE=$3><PARAM NAME=CONSOLE VALUE=Clip1><PARAM NAME=CONTROLS VALUE=imagewindow><PARAM NAME=AUTOSTART VALUE=true></OBJECT><br><OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width=$1><PARAM NAME=SRC VALUE=$3><PARAM NAME=AUTOSTART VALUE=-1><PARAM NAME=CONTROLS VALUE=controlpanel><PARAM NAME=CONSOLE VALUE=Clip1></OBJECT>");
		patternStr = "(\\[flash\\])(.[^\\[]*)(\\[\\/flash\\])";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<a href=\"$2\" TARGET=_blank><IMG SRC=images/pic/swf.gif border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=hhttttpp://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=\"$2\"><PARAM NAME=quality VALUE=high><embed src=\"$2\" quality=high pluginspage='hhttttpp://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400></embed>$2</OBJECT>");
		patternStr = "(\\[flash=*([0-9]*),*([0-9]*)\\])(.[^\\[]*)(\\[\\/flash\\])";

		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<a href=\"$4\" TARGET=_blank><IMG SRC=images/pic/swf.gif border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=hhttttpp://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=$2 height=$3><PARAM NAME=movie VALUE=\"$4\"><PARAM NAME=quality VALUE=high><embed src=\"$4\" quality=high pluginspage='hhttttpp://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=$2 height=$3></embed>$4</OBJECT>");

		patternStr = "\\[img\\](.[^\\[]*)\\[\\/img\\]";
		pattern = Pattern.compile(patternStr, 2);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<a onfocus=this.blur() href=\"$1\" target=_blank><IMG SRC=\"$1\" border=0 alt=按此在新窗口浏览图片 onmousewheel='return zoomimg(this)' onload=\"javascript:if(this.width>screen.width-333)this.width=screen.width-333\"></a><br>");

		content = content.replaceAll("hhttttpp", "http");
		content = content.replaceAll("ffttpp", "ftp");
		return content;
	}

	public static String ubb(String content, boolean show_smile) {
		String patternStr = "";
		String replacementStr = "";

		if (show_smile) {
			patternStr = "\\[em(.[^\\[]*)\\]";

			replacementStr = "<img src=images/emot/em$1.gif border=0 align=middle>";

			Pattern pattern = Pattern.compile(patternStr);
			Matcher matcher = pattern.matcher(content);
			content = matcher.replaceAll(replacementStr);
		}
		patternStr = "(\\[URL\\])(.[^\\[]*)(\\[\\/URL\\])";
		Pattern pattern = Pattern.compile(patternStr, 32);
		Matcher matcher = pattern.matcher(content);
		content = matcher.replaceAll("<A HREF=\"$2\" TARGET=_blank>$2</A>");
		patternStr = "\\[URL=([^\\[]*?)\\](.[^\\[]*?)(\\[\\/URL\\])";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<A HREF=\"$1\" TARGET=_blank>$2</A>");
		pattern = Pattern
				.compile("(\\[EMAIL\\])(\\S+\\@.[^\\[]*)(\\[\\/EMAIL\\])");

		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<img align=absmiddle src=images/email1.gif><A HREF=\"mailto:$2\">$2</A>");

		pattern = Pattern
				.compile("(\\[EMAIL=(\\S+\\@.[^\\[]*)\\])(.[^\\[]*)(\\[\\/EMAIL\\])");

		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<img align=absmiddle src=images/email1.gif><A HREF=\"mailto:$2\" TARGET=_blank>$3</A>");

		patternStr = "\\[color=(.[^\\[]*)\\](.*)\\[\\/color\\]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<font color=$1>$2</font>");

		patternStr = "\\[face=(.[^\\[]*)\\](.[^\\[]*)\\[\\/face\\]";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<font face=$1>$2</font>");
		patternStr = "\\[center\\](.+)\\[\\/center\\]";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<div align=center>$1</div>");

		patternStr = "\\[right\\](.[^\\[]*)\\[\\/right\\]";

		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<div align=right>$1</div>");

		patternStr = "\\[QUOTE\\](.[^\\[]*)\\[\\/QUOTE\\]";
		pattern = Pattern.compile(patternStr, 32);

		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<table align=center style=\"width:80%\" cellpadding=5 cellspacing=1 class=tableborder1><TR><TD class=123>$1</td></tr></table>");
		patternStr = "\\[fly\\](.*)\\[\\/fly\\]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<marquee width=90% behavior=alternate scrollamount=3>$1</marquee>");

		patternStr = "\\[move\\](.*)\\[\\/move\\]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<MARQUEE scrollamount=3>$1</marquee>");
		patternStr = "\\[glow=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\\](.*)\\[\\/glow]";

		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<table width=$1 style=\"filter:glow(color=$2, strength=$3)\">$4</table>");

		patternStr = "\\[SHADOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\\](.[^\\[]*)\\[\\/SHADOW]";

		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<table width=$1 style=\"filter:shadow(color=$2, strength=$3)\">$4</table>");

		patternStr = "\\[I\\](.[^\\[]*)\\[\\/I\\]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<i>$1</i>");
		patternStr = "\\[U\\](.[^\\[]*)(\\[\\/U\\])";

		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<u>$1</u>");
		patternStr = "\\[B\\](.[^\\[]*)(\\[\\/B\\])";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<b>$1</b>");

		patternStr = "\\[size=([1-8])\\](.[^\\[]*)\\[\\/size\\]";

		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<font size=$1>$2</font>");

		patternStr = "\\[dir=*([0-9]*),*([0-9]*)\\](.*)\\[\\/dir]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<object classid=clsid:166B1BCA-3F9C-11CF-8075-444553540000 codebase=http://download.macromedia.com/pub/shockwave/cabs/director/sw.cab#version=7,0,2,0 width=$1 height=$2><param name=src value=$3><embed src=$3 pluginspage=http://www.macromedia.com/shockwave/download/ width=$1 height=$2></embed></object>");
		patternStr = "\\[QT=*([0-9]*),*([0-9]*)\\](.*)\\[\\/QT]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<embed src=$3 width=$1 height=$2 autoplay=true loop=false controller=true playeveryframe=false cache=false scale=TOFIT bgcolor=#000000 kioskmode=false targetcache=false pluginspage=hhttttpp://www.apple.com/quicktime/></embed>");
		patternStr = "\\[mp=*([0-9]*),*([0-9]*)\\](.*)\\[\\/mp]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=$1 height=$2 ><param name=ShowStatusBar value=-1><param name=Filename value=$3><embed type=application/x-oleobject codebase=hhttttpp://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=$3  width=$1 height=$2></embed></object>");
		patternStr = "\\[rm=*([0-9]*),*([0-9]*)\\](.*)\\[\\/rm]";
		pattern = Pattern.compile(patternStr, 32);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width=$1 height=$2><PARAM NAME=SRC VALUE=$3><PARAM NAME=CONSOLE VALUE=Clip1><PARAM NAME=CONTROLS VALUE=imagewindow><PARAM NAME=AUTOSTART VALUE=true></OBJECT><br><OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width=$1><PARAM NAME=SRC VALUE=$3><PARAM NAME=AUTOSTART VALUE=-1><PARAM NAME=CONTROLS VALUE=controlpanel><PARAM NAME=CONSOLE VALUE=Clip1></OBJECT>");
		patternStr = "(\\[flash\\])(.[^\\[]*)(\\[\\/flash\\])";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<a href=\"$2\" TARGET=_blank><IMG SRC=images/pic/swf.gif border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=hhttttpp://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=\"$2\"><PARAM NAME=quality VALUE=high><embed src=\"$2\" quality=high pluginspage='hhttttpp://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400></embed>$2</OBJECT>");
		patternStr = "(\\[flash=*([0-9]*),*([0-9]*)\\])(.[^\\[]*)(\\[\\/flash\\])";

		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<a href=\"$4\" TARGET=_blank><IMG SRC=images/pic/swf.gif border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=hhttttpp://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=$2 height=$3><PARAM NAME=movie VALUE=\"$4\"><PARAM NAME=quality VALUE=high><embed src=\"$4\" quality=high pluginspage='hhttttpp://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=$2 height=$3></embed>$4</OBJECT>");

		patternStr = "\\[img\\](.[^\\[]*)\\[\\/img\\]";
		pattern = Pattern.compile(patternStr, 2);
		matcher = pattern.matcher(content);
		content = matcher
				.replaceAll("<a onfocus=this.blur() href=\"$1\" target=_blank><IMG SRC=\"$1\" border=0 alt=按此在新窗口浏览图片 onmousewheel='return zoomimg(this)' onload=\"javascript:if(this.width>screen.width-333)this.width=screen.width-333\"></a><br>");

		String imgurl = "";
		if (Global.virtualPath.equals(""))
			imgurl = "/forum/images/pic/url.gif";
		else
			imgurl = "/" + Global.virtualPath + "/forum/images/pic/url.gif";
		patternStr = "((http|https|ftp|rtsp|mms):(\\/\\/|\\\\\\\\)[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)";

		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<img align=absmiddle src='" + imgurl
				+ "' border=0><a target=_blank href=$1>$1</a>");

		patternStr = "((http|https|ftp|rtsp|mms):(\\/\\/|\\\\\\\\)[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)$";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<img align=absmiddle src='" + imgurl
				+ "' border=0><a target=_blank href=$1>$1</a>");

		patternStr = "([^>=\"])((http|https|ftp|rtsp|mms):(\\/\\/|\\\\\\\\)[A-Za-z0-9\\./=\\?%\\-&_~`@':+!]+)";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("$1<img align=absmiddle src='" + imgurl
				+ "' border=0><a target=_blank href=$2>$2</a>");

		patternStr = "([^(http://|http:\\\\)])((www|cn)[.](\\w)+[.]{1,}(net|com|cn|org|cc)(((\\/[\\~]*|\\\\[\\~]*)(\\w)+)|[.](\\w)+)*(((([?](\\w)+){1}[=]*))*((\\w)+){1}([\\&](\\w)+[\\=](\\w)+)*)*)";
		pattern = Pattern.compile(patternStr);
		matcher = pattern.matcher(content);
		content = matcher.replaceAll("<img align=absmiddle src='" + imgurl
				+ "' border=0><a target=_blank href=http://$2>$2</a>");

		content = content.replaceAll("hhttttpp", "http");
		content = content.replaceAll("ffttpp", "ftp");
		return content;
	}

	public static boolean isValidIP(String ip) {
		Pattern p = Pattern
				.compile("[0-9\\*]{1,3}\\.[0-9\\*]{1,3}\\.[0-9\\*]{1,3}\\.[0-9\\*]{1,3}");
		Matcher m = p.matcher(ip);
		boolean result = m.find();

		return (result);
	}

	public static boolean IsValidEmail(String email) {
		String input = email;

		Pattern p = Pattern.compile("^\\.|^\\@");
		Matcher m = p.matcher(input);
		if (m.find()) {
			return false;
		}

		p = Pattern.compile("^www\\.");
		m = p.matcher(input);
		if (m.find()) {
			return false;
		}

		p = Pattern.compile("[^A-Za-z0-9\\.\\@_\\-~#]+");
		m = p.matcher(input);
		boolean result = m.find();
		if (result) {
			return false;
		}

		return (email.indexOf("@") != -1);
	}

	public static String ShowStatus(String msg) {
		String str = "";
		str = "<script language=javascript>\n";
		str = str + "<!--\n";
		str = str + "window.status=(\"" + msg + "\")\n";
		str = str + "-->\n";
		str = str + "</script>\n";
		return str;
	}

	public static String getLeft(String str, int length) {
		int k = 0;
		int len = str.length();
		for (int i = 0; i < len; ++i) {
			if (str.charAt(i) > 255)
				k += 2;
			else {
				++k;
			}
			if (k >= length)
				return str.substring(0, i + 1);
		}
		return str;
	}

	public static String HTMLEncode(String text) {
		if (text == null) {
			return "";
		}
		StringBuffer results = null;
		char[] orig = null;
		int beg = 0;
		int len = text.length();
		for (int i = 0; i < len; ++i) {
			char c = text.charAt(i);
			switch (c) {
			case '\0':
			case '"':
			case '&':
			case '<':
			case '>':
				if (results == null) {
					orig = text.toCharArray();
					results = new StringBuffer(len + 10);
				}
				if (i > beg) {
					results.append(orig, beg, i - beg);
				}
				beg = i + 1;
				switch (c) {
				default:
					break;
				case '&':
					results.append("&amp;");
					break;
				case '<':
					results.append("&lt;");
					break;
				case '>':
					results.append("&gt;");
					break;
				case '"':
					results.append("&quot;");
				}
			}

		}

		if (results == null) {
			return text;
		}
		results.append(orig, beg, len - beg);
		return results.toString();
	}

	public static String getFileExt(String fileName) {
		int dotindex = fileName.lastIndexOf(".");
		String extName = fileName.substring(dotindex + 1, fileName.length());
		extName = extName.toLowerCase();
		return extName;
	}

	public static String PadString(String str, char padChar, int length,
			boolean isLeft) {
		int strLen = str.length();
		if (strLen >= length)
			return str;
		int len = length - strLen;
		String pStr = "";
		for (int i = 0; i < len; ++i)
			pStr = pStr + padChar;
		if (isLeft) {
			return pStr + str;
		}
		return str + pStr;
	}
}
