<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="com.redmoon.forum.person.*"%>
<%@ page import="com.redmoon.forum.plugin.auction.AuctionShopDb"%>
<%@ page import="com.redmoon.forum.*"%>
<%@ page import="com.redmoon.forum.miniplugin.home.*"%>
<%@ page import="cn.js.fan.util.*"%>
<%@ page import="cn.js.fan.module.cms.Document"%>
<%@ page import="cn.js.fan.module.nav.LinkDb"%>
<%@ page import="java.util.*"%>
<%@ page import="cn.js.fan.web.*"%>
<html>
<head>
<title><%=Global.AppName%> - <%=Global.server%></title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="index.css" type="text/css">
<style type="text/css">
<!--
.STYLE1 {
	color: #FF6600;
	font-weight: bold;
}
.STYLE2 {color: #FFFFFF}
.STYLE3 {color: #525152}
-->
</style>
</head>
<body bgcolor="#FFFFFF" text="#000000">
<%@ include file="header.jsp"%>
<jsp:useBean id="dir" scope="page" class="com.redmoon.forum.Directory"/>
<%
HomeDb hd = new HomeDb();
MsgDb md = new MsgDb();
Document doc = new Document();
%>
<TABLE WIDTH=760 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
  <TR>
    <TD height="161" COLSPAN=3 align="center" valign="top"><table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
    <%
		if (doc==null)
			doc = new Document();
		doc = doc.getDocumentByDirCode("photo");
		if (doc!=null)
			out.print(doc.getContent(1));
		%></TD>
    <TD width="11" ROWSPAN=9>&nbsp;</TD>
    <TD COLSPAN=4 rowspan="9" valign="top"><table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td></td>
      </tr>
    </table>
    <table width="87%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/main_7.jpg" width=385 height=23 alt=""></td>
      </tr>
    </table>
      <%
			int[] v = hd.getHotIds();
			int hotlen = v.length;
			int i = 0;
			if (hotlen==0)
			out.print("无热点话题！");
			else {
				String bgcolor="";
				for (int k=0; k<hotlen; k++) {
					i++;
					bgcolor = "";
					md = md.getMsgDb(v[k]);
					if (i==2) {
						i = 0;
						bgcolor = "#F7F7EC";
					}
					if (md.isLoaded()) {
						String color = StrUtil.getNullString(md.getColor());%>
      <table width="98%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=bgcolor%>">
        <tr>
          <td height="20">&nbsp;·
            <%if (color.equals("")) {%>
            <a href="forum/showtopic.jsp?rootid=<%=md.getId()%>"><%=md.getTitle()%></a></td>
          <%}else{%>
          <a href="forum/showtopic.jsp?rootid=<%=md.getId()%>"><font color="<%=color%>"><%=md.getTitle()%></font></a><BR>
          <%}%>
        </tr>
      </table>
      <%}
									else
										out.print("<font color=red>编号：" + v[k] + "的贴子不存在</red><BR>");
								}
							}%>    <table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="94%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/main_13.jpg" width=385 height=23 alt=""></td>
      </tr>
    </table>
	<%	Leaf lf = new Leaf(); %>
    <table width="98%" border="0" cellspacing="0" cellpadding="2">
        <%
		String[] vr = hd.getRecommandBoards();
		int rblen = vr.length;
		for (int k=0; k<rblen; k++) {
			lf = lf.getLeaf(vr[k]);
		%>
        <tr>
          <td width="50%" height="22"><a href="forum/listtopic.jsp?boardcode=<%=StrUtil.UrlEncode(lf.getCode())%>"><font color="#FF8A00"><%=lf.getName()%></font></a> |
            <%
		  md = hd.getMsgDbTopOne(lf.getCode());
		  %>
            <a href="forum/showtopic.jsp?rootid=<%=md.getId()%>" title="<%=md.getTitle()%>"><%=StrUtil.getLeft(md.getTitle(), 18)%></a> </td>
          <td width="50%" height="20"><%
		  	k++;
			if (k<rblen) {
				lf = lf.getLeaf(vr[k]);%>
            <a href="forum/listtopic.jsp?boardcode=<%=StrUtil.UrlEncode(lf.getCode())%>"><font color="#FF8A00"><%=lf.getName()%></font></a> |
            <%
				  md = hd.getMsgDbTopOne(lf.getCode());
				  %>
            <a href="forum/showtopic.jsp?rootid=<%=md.getId()%>" title="<%=md.getTitle()%>"><%=StrUtil.getLeft(md.getTitle(), 18)%></a>
            <%}%>          </td>
        </tr>
        <%}%>
    </table>
    </TD>
    <TD width="180" ROWSPAN=9 valign="top"><table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/weather_title.gif" width="180" height="23"></td>
        </tr>
      </table>
      <table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <TABLE WIDTH=180 BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_1.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
        <TR>
          <TD width="5" height="144" background="images/right_frm_2.jpg"></TD>
          <TD width="172" height="144" bgcolor="D6F7FF"><%@ include file="forum/miniplugin/weather/58248.htm"%></TD>
          <TD width="3" height="144" background="images/right_frm_4.jpg"></TD>
        </TR>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_5.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
      </TABLE>
      <table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/rqph_title.gif" width="180" height="23"></td>
        </tr>
      </table>
      <table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <TABLE WIDTH=180 BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_1.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
        <TR>
          <TD width="5" height="144" background="images/right_frm_2.jpg"></TD>
          <TD width="172" height="144" valign="top" bgcolor="D6F7FF"><%
		  Iterator bir = hd.getBoardsByTodayPost(12).iterator();
		  Leaf plf;
		  while (bir.hasNext()) {
		  	plf = (Leaf)bir.next();%>
            <table width="100%" border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td height="22">&nbsp;&nbsp;<a href="forum/listtopic.jsp?boardcode=<%=StrUtil.UrlEncode(plf.getCode())%>" class="mainA"><%=plf.getName()%>&nbsp;(发贴<%=plf.getTodayCount()%>)</a></td>
              </tr>
            </table>
            <%}%>          </TD>
          <TD width="3" height="144" background="images/right_frm_4.jpg"></TD>
        </TR>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_5.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
      </TABLE>
      <table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>    </TD>
    <TD width="12" rowspan="9"><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=23 ALT=""><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=12 ALT=""><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=2 ALT=""><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=51 ALT=""><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=1 ALT=""><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=63 ALT=""></TD>
  </TR>
  
  <TR>
    <TD COLSPAN=3><IMG SRC="images/main_10.jpg" WIDTH=176 HEIGHT=22 ALT=""></TD>
  </TR>
  <TR>
    <TD COLSPAN=3 valign="top" bgcolor="#FFFBEF"><p style="line-height:180%"><%
							int[] mv = hd.getRecommandMsgs();
							int mlen = mv.length;
							if (mlen==0)
								out.print("无推荐话题！");
							else {
								for (int k=0; k<mlen; k++) {
									md = md.getMsgDb(mv[k]);
									if (md.isLoaded()) {%> 
      &nbsp;&nbsp;·<a href="forum/showtopic.jsp?rootid=<%=md.getId()%>" title="<%=md.getTitle()%>"><%=StrUtil.getLeft(md.getTitle(), 24)%></a><br>
                                      <%}else{%>
&nbsp;&nbsp;·<a href="forum/showtopic.jsp?rootid=<%=md.getId()%>" title="<%=md.getTitle()%>"><%=StrUtil.getLeft(md.getTitle(), 24)%></a><br>
<%}								}
							}%></p></TD>
  </TR>
  
  <TR>
    <TD COLSPAN=3><IMG SRC="images/main_15.jpg" WIDTH=176 HEIGHT=1 ALT=""></TD>
  </TR>
  <TR>
    <TD height="22" COLSPAN=3 bgcolor="#FFFBEF">
      <table width="100%" border="0" cellspacing="5" cellpadding="0">
        <tr>
          <td><%
OnlineInfo oli = new OnlineInfo();
int allcount = oli.getAllCount();
int allusercount = oli.getAllUserCount();
ForumDb forum = new ForumDb();
forum = forum.getForumDb();
%>
            <span class="STYLE3">&nbsp;&nbsp;在线 <%=allcount%>人&nbsp;&nbsp;注册用户 <%=allusercount%>人<br>
&nbsp;&nbsp;今日发帖：<b><%=forum.getTodayCount()%></b> 篇 </span></td>
        </tr>
      </table>    </TD>
  </TR>
  <TR>
    <TD COLSPAN=3 bgcolor="#FFFBEF"><IMG SRC="images/main_15.jpg" WIDTH=176 HEIGHT=1 ALT=""></TD>
  </TR>
  <TR>
    <TD COLSPAN=3 bgcolor="#FFFBEF">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <FORM name=searchform action="forum/search_do.jsp" method=post>
  <tr>
    <td width="27%" height="22" align="right"><span class="STYLE1">搜索：</span></td>
    <td colspan="2">
      <input name=searchwhat class="singleborder" size=15>    </td>
  </tr>
  <tr>
    <td height="22">&nbsp;</td>
    <td width="36%">
      <SELECT size=1 name=searchtype>
        <OPTION 
        value=bykey selected>主题</OPTION>
        <OPTION 
        value=byauthor>作者</OPTION>
      </SELECT></td>
    <td width="37%"><input name="image" type=image src="images/search.gif" width="33" height="20"></td>
  </tr></form>
</table></TD>
  </TR>
  <TR>
    <TD COLSPAN=3><IMG SRC="images/main_15.jpg" WIDTH=176 HEIGHT=1 ALT=""></TD>
  </TR>
  <TR>
    <TD COLSPAN=3 align="center" bgcolor="#FFFBEF">
<table cellSpacing="0" cellPadding="0" width="150" border="0">
  <tbody>
    <tr>
      <td class="wz12_5353" width="77" height="20"><img src="images/iron1.gif" align="absMiddle" width="13" height="13"> 
        <a href="forum/help.htm" target="_blank">社区帮助</a></td>
      <td class="wz12_5353"><img src="images/iron2.gif" align="absMiddle" width="15" height="14"> 
        <a href="http://www.ip138.com/post/" target="_blank">邮编电话</a></td>
    </tr>
    <tr>
      <td class="wz12_5353" height="20"><img src="images/iron3.gif" align="absMiddle" width="13" height="14"> 
        <a href="forum/treasure.jsp" target="_blank">礼物道具</a></td>
      <td class="wz12_5353"><img src="images/iron4.gif" align="absMiddle" width="14" height="14"> 
        <a href="forum/treasure.jsp" target="_blank">社区服务</a></td>
    </tr>
    <tr>
      <td class="wz12_5353" height="20"><img src="images/icon8.gif" align="absMiddle" width="14" height="13"> 
        <a href="http://ip.lk52.com/" target="_blank">IP查看器</a></td>
      <td class="wz12_5353" height="20"><img height="14" src="images/icon7.gif" width="14" align="absMiddle"> 
        <a href="http://www.goldenholiday.com/" target="_blank">航班查询</a></td>
    </tr>
    <tr>
      <td class="wz12_5353" height="20"><img src="images/iron4.gif" align="absMiddle" width="14" height="14">&nbsp;<A href="misce/wnl/wnl.htm">万年历</A></td>
      <td class="wz12_5353" height="20"><img src="images/iron4.gif" align="absMiddle" width="14" height="14">&nbsp;<a href="http://www.hao123.com/haoserver/showjicc.htm">手机位置</a></td>
    </tr>
  </tbody>
</table>	</TD>
  </TR>
  <TR>
    <TD COLSPAN=10 HEIGHT=6><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=6 ALT=""></TD>
  </TR>
  
  
  <TR>
    <TD COLSPAN=9><IMG SRC="images/main_30.jpg" WIDTH=760 HEIGHT=1 ALT=""></TD>
    <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=1 ALT=""></TD>
  </TR>
  <TR>
    <TD width="8"><IMG SRC="images/spacer.gif" WIDTH=8 HEIGHT=1 ALT=""></TD>
    <TD width="2"><IMG SRC="images/spacer.gif" WIDTH=2 HEIGHT=1 ALT=""></TD>
    <TD width="166"><IMG SRC="images/spacer.gif" WIDTH=166 HEIGHT=1 ALT=""></TD>
    <TD><IMG SRC="images/spacer.gif" WIDTH=11 HEIGHT=1 ALT=""></TD>
    <TD width="383"><IMG SRC="images/spacer.gif" WIDTH=383 HEIGHT=1 ALT=""></TD>
    <TD width="2"><IMG SRC="images/spacer.gif" WIDTH=2 HEIGHT=1 ALT=""></TD>
    <TD width="3"><IMG SRC="images/spacer.gif" WIDTH=3 HEIGHT=1 ALT=""></TD>
    <TD width="5"><IMG SRC="images/spacer.gif" WIDTH=5 HEIGHT=1 ALT=""></TD>
    <TD><IMG SRC="images/spacer.gif" WIDTH=180 HEIGHT=1 ALT=""></TD>
    <TD></TD>
  </TR>
</TABLE>
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><TABLE WIDTH=575 BORDER=0 CELLPADDING=0 CELLSPACING=0>
      <TR>
        <TD ROWSPAN=7><IMG SRC="images/shop_1.jpg" WIDTH=38 HEIGHT=227 ALT=""></TD>
        <TD COLSPAN=9><IMG SRC="images/shop_2.jpg" WIDTH=518 HEIGHT=10 ALT=""></TD>
        <TD ROWSPAN=8><IMG SRC="images/shop_3.jpg" WIDTH=19 HEIGHT=254 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=10 ALT=""></TD>
      </TR>
      <TR>
        <TD COLSPAN=2><IMG SRC="images/shop_4.jpg" WIDTH=133 HEIGHT=55 ALT=""></TD>
        <TD ROWSPAN=2 align="center" background="images/shop_5.jpg"><%
		if (doc==null)
			doc = new Document();
		doc = doc.getDocumentByDirCode("recommandAuction1");
		if (doc!=null)
			out.print(doc.getContent(1));
		%></TD>
        <TD ROWSPAN=2><IMG SRC="images/shop_6.jpg" WIDTH=10 HEIGHT=83 ALT=""></TD>
        <TD COLSPAN=2 ROWSPAN=2 align="center" background="images/shop_7.jpg"><%
		if (doc==null)
			doc = new Document();
		doc = doc.getDocumentByDirCode("recommandAuction2");
		if (doc!=null)
			out.print(doc.getContent(1));
		%></TD>
        <TD ROWSPAN=2><IMG SRC="images/shop_8.jpg" WIDTH=11 HEIGHT=83 ALT=""></TD>
        <TD ROWSPAN=2 align="center" background="images/shop_9.jpg"><%
		if (doc==null)
			doc = new Document();
		doc = doc.getDocumentByDirCode("recommandAuction3");
		if (doc!=null)
			out.print(doc.getContent(1));
		%></TD>
        <TD ROWSPAN=6><IMG SRC="images/shop_10.jpg" WIDTH=5 HEIGHT=217 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=55 ALT=""></TD>
      </TR>
      <TR>
        <TD ROWSPAN=5><IMG SRC="images/shop_11.jpg" WIDTH=127 HEIGHT=162 ALT=""></TD>
        <TD ROWSPAN=5><IMG SRC="images/shop_12.jpg" WIDTH=6 HEIGHT=162 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=28 ALT=""></TD>
      </TR>
      <TR>
        <TD ROWSPAN=2><IMG SRC="images/shop_13.jpg" WIDTH=119 HEIGHT=5 ALT=""></TD>
        <TD COLSPAN=2 ROWSPAN=4><IMG SRC="images/shop_14.jpg" WIDTH=11 HEIGHT=134 ALT=""></TD>
        <TD><IMG SRC="images/shop_15.jpg" WIDTH=118 HEIGHT=4 ALT=""></TD>
        <TD ROWSPAN=4><IMG SRC="images/shop_16.jpg" WIDTH=11 HEIGHT=134 ALT=""></TD>
        <TD ROWSPAN=2><IMG SRC="images/shop_17.jpg" WIDTH=121 HEIGHT=5 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=4 ALT=""></TD>
      </TR>
      <TR>
        <TD ROWSPAN=2><IMG SRC="images/shop_18.jpg" WIDTH=118 HEIGHT=28 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=1 ALT=""></TD>
      </TR>
      <TR>
        <TD><IMG SRC="images/shop_19.jpg" WIDTH=119 HEIGHT=27 ALT=""></TD>
        <TD><IMG SRC="images/shop_20.jpg" WIDTH=121 HEIGHT=27 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=27 ALT=""></TD>
      </TR>
      <TR>
        <TD valign="top" background="images/shop_21.jpg"><%
		if (doc==null)
			doc = new Document();
		doc = doc.getDocumentByDirCode("starShop");
		if (doc!=null)
			out.print(doc.getContent(1));
		%></TD>
        <TD valign="top" background="images/shop_22.jpg"><%
		if (doc==null)
			doc = new Document();
		doc = doc.getDocumentByDirCode("recommandShop");
		if (doc!=null)
			out.print(doc.getContent(1));
		%></TD>
        <TD valign="top" background="images/shop_23.jpg"><%
		AuctionShopDb as;
		Iterator shopir = hd.getNewShop(2).iterator();
		while (shopir.hasNext()) {
			as = (AuctionShopDb)shopir.next();%>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="28">&nbsp;<a href="forum/plugin/auction/shop.jsp?userName=<%=StrUtil.UrlEncode(as.getUserName())%>"><%=StrUtil.getLeft(as.getShopName(), 14)%></a></td>
              </tr>
            </table>
          <%}
		%>        </TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=102 ALT=""></TD>
      </TR>
      <TR>
        <TD COLSPAN=10><IMG SRC="images/shop_24.jpg" WIDTH=556 HEIGHT=27 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=27 ALT=""></TD>
      </TR>
      <TR>
        <TD><IMG SRC="images/spacer.gif" WIDTH=38 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=127 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=6 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=119 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=10 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=1 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=118 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=11 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=121 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=5 HEIGHT=1 ALT=""></TD>
        <TD><IMG SRC="images/spacer.gif" WIDTH=19 HEIGHT=1 ALT=""></TD>
        <TD></TD>
      </TR>
    </TABLE>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="5" colspan="3"></td>
              </tr>
            <tr>
              <td width="285" height="23" background="images/title_bg1.jpg">
			  <%
			  lf = dir.getLeaf("trade");
			  %>
			  &nbsp;&nbsp;&nbsp;&nbsp;<a href="forum/listtopic.jsp?boardcode=<%=StrUtil.UrlEncode(lf.getCode())%>"><strong><%=lf.getName()%></strong></a>
			  </td>
              <td>&nbsp;</td>
              <td width="285" background="images/title_bg1.jpg"><%
			  lf = dir.getLeaf("qrl");
			  %>
&nbsp;&nbsp;&nbsp;&nbsp;<a href="forum/listtopic.jsp?boardcode=<%=StrUtil.UrlEncode(lf.getCode())%>"><strong><%=lf.getName()%></strong></a></td>
            </tr>
            <tr>
              <td>
			  <%
			  ThreadBlockIterator irmsg = md.getThreads(SQLBuilder.getListtopicSql("trade", "", "all"), "trade", 0, 10);
			  String bgcolor = "";
			  i = 0;
			  while (irmsg.hasNext()) {
			  	md = (MsgDb)irmsg.next();
				i++;
				bgcolor = "";
				if (i==2) {
					i = 0;
					bgcolor = "#F7F7EC";
				}
				String color = StrUtil.getNullString(md.getColor());
				%>
              <table width="98%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=bgcolor%>">
                <tr>
                  <td height="20">&nbsp;·
                  <%if (color.equals("")) {%>
                    <a title="<%=md.getTitle()%>" href="forum/showtopic.jsp?rootid=<%=md.getId()%>"><%=StrUtil.getLeft(md.getTitle(), 40)%></a></td>
                  <%}else{%>
                  <a title="<%=md.getTitle()%>" href="forum/showtopic.jsp?rootid=<%=md.getId()%>"><font color="<%=color%>"><%=StrUtil.getLeft(md.getTitle(), 40)%></font></a><BR>
                  <%}%>
                </tr>
              </table>
              <%}%>
			  </td>
              <td>&nbsp;</td>
              <td><%
			  irmsg = md.getThreads(SQLBuilder.getListtopicSql("qrl", "", "all"), "qrl", 0, 10);
			  i = 0;
			  while (irmsg.hasNext()) {
			  	md = (MsgDb)irmsg.next();
				i++;
				bgcolor = "";
				if (i==2) {
					i = 0;
					bgcolor = "#F7F7EC";
				}
				String color = StrUtil.getNullString(md.getColor());
				%>
                <table width="98%" border="0" cellpadding="0" cellspacing="0" bgcolor="<%=bgcolor%>">
                  <tr>
                    <td height="20">&nbsp;·
                      <%if (color.equals("")) {%>
                      <a title="<%=md.getTitle()%>" href="forum/showtopic.jsp?rootid=<%=md.getId()%>"><%=StrUtil.getLeft(md.getTitle(), 42)%></a></td>
                    <%}else{%>
                    <a title="<%=md.getTitle()%>" href="forum/showtopic.jsp?rootid=<%=md.getId()%>"><font color="<%=color%>"><%=StrUtil.getLeft(md.getTitle(), 42)%></font></a><BR>
                    <%}%>
                  </tr>
                </table>
                <%}%></td>
            </tr>
          </table>
          <img src="images/main_24.jpg" width=575 height=26 alt=""></td>
        </tr>
        <tr>
          <td colspan="2"><IMG SRC="images/main_26.jpg" WIDTH=575 HEIGHT=47 ALT=""></td>
        </tr>
        <tr>
          <td width="8" background="images/main_27.jpg">&nbsp;</td>
          <td align="left"><TABLE WIDTH=567 BORDER=0 CELLPADDING=0 CELLSPACING=0>
            <TR>
              <TD COLSPAN=3><IMG SRC="images/sqdh_1.jpg" WIDTH=567 HEIGHT=1 ALT=""></TD>
            </TR>
            <TR>
              <TD WIDTH=3 HEIGHT=224 background="images/sqdh_2.jpg"></TD>
              <TD WIDTH=554 HEIGHT=224 valign="top" bgcolor="#F7F3F7"><%
LeafChildrenCacheMgr dlcm = new LeafChildrenCacheMgr("root");
java.util.Vector vt = dlcm.getChildren();
Iterator ir = vt.iterator();
while (ir.hasNext()) {
	Leaf leaf = (Leaf) ir.next();
	String parentCode = leaf.getCode();
%>
                  <table width="100%" height="23" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                      <td width="7%">&nbsp;</td>
                      <td width="11%"><%=leaf.getName()%></td>
                      <td width="82%"><p style="line-height:150%">
                          <%
	LeafChildrenCacheMgr dl = new LeafChildrenCacheMgr(parentCode);
	java.util.Vector fv = dl.getChildren();
	Iterator ir1 = fv.iterator();
	while (ir1.hasNext()) {
		lf = (Leaf) ir1.next();%>
                          <a href="forum/listtopic.jsp?boardcode=<%=StrUtil.UrlEncode(lf.getCode())%>">
                          <%if (lf.getColor().equals("")) {%>
                          <%=lf.getName()%>
                          <%}else{%>
                          <font color="<%=lf.getColor()%>"><%=lf.getName()%></font>
                          <%}%>
                          </a>
                          <%}%>
                      </p></td>
                    </tr>
                  </table>
                <%}%>              </TD>
              <TD WIDTH=10 HEIGHT=224 background="images/sqdh_4.jpg">&nbsp;</TD>
            </TR>
            <TR>
              <TD COLSPAN=3><IMG SRC="images/sqdh_5.jpg" WIDTH=567 HEIGHT=5 ALT=""></TD>
            </TR>
          </TABLE></td>
        </tr>
      </table>    </td>
    <td align="right" valign="top" width="8"></td>
    <td align="right" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="images/sqzx_title.gif" width="180" height="23"></td>
      </tr>
    </table>
      <table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <TABLE WIDTH=180 BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_1.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
        <TR>
          <TD width="5" height="144" background="images/right_frm_2.jpg"></TD>
          <TD width="172" height="144" align="center" bgcolor="D6F7FF"><%
		if (doc==null)
			doc = new Document();
		doc = doc.getDocumentByDirCode("star");
		if (doc!=null)
			out.print(doc.getContent(1));
		%></TD>
          <TD width="3" height="144" background="images/right_frm_4.jpg"></TD>
        </TR>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_5.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
      </TABLE>
      <table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/trade_title.gif" width="180" height="23"></td>
        </tr>
      </table>
      <table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <TABLE WIDTH=180 BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_1.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
        <TR>
          <TD width="5" height="144" background="images/right_frm_2.jpg"></TD>
          <TD width="172" height="144" valign="top" bgcolor="D6F7FF" style="line-height:150%">
		  <%
		  AuctionShopDb asd = new AuctionShopDb();
		  Iterator irshop = asd.list("select userName from " + asd.getTableName() + " order by IS_RECOMMANDED desc, openDate desc", 0, 10).iterator();
		  while (irshop.hasNext()) {
		  	asd = (AuctionShopDb)irshop.next();
		  %>
			&nbsp;&nbsp;<a target=_blank href="forum/plugin/auction/shop.jsp?userName=<%=StrUtil.UrlEncode(asd.getUserName())%>"><%=asd.getShopName()%></a><br>
		  <%}%>
		  </TD>
          <TD width="3" height="144" background="images/right_frm_4.jpg"></TD>
        </TR>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_5.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
      </TABLE>
      <table width="100%" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/bmfu_title.gif" width="180" height="23"></td>
        </tr>
      </table>
      <table width="100%" height="5" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td></td>
        </tr>
      </table>
      <TABLE WIDTH=180 BORDER=0 CELLPADDING=0 CELLSPACING=0>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_1.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
        <TR>
          <TD width="5" height="144" background="images/right_frm_2.jpg"></TD>
          <TD width="172" height="144" valign="top" bgcolor="D6F7FF"><%
		if (doc==null)
			doc = new Document();
		doc = doc.getDocumentByDirCode("bmfu");
		if (doc!=null)
			out.print(doc.getContent(1));
		%></TD>
          <TD width="3" height="144" background="images/right_frm_4.jpg"></TD>
        </TR>
        <TR>
          <TD COLSPAN=3><IMG SRC="images/right_frm_5.jpg" WIDTH=180 HEIGHT=5 ALT=""></TD>
        </TR>
      </TABLE></td>
  </tr>
</table>
<table width="760" border="0" align="center" cellpadding="5" cellspacing="0">
  <tr>
    <td align="center">
	<table width=100% align=center>
                <%
				LinkDb ld = new LinkDb();
				String listsql = "select id from " + ld.getTableName() + " where userName=" + StrUtil.sqlstr(ld.USER_SYSTEM) + " and kind=" + StrUtil.sqlstr(ld.KIND_DEFAULT) + " order by sort";
				Iterator irlink = ld.list(listsql).iterator();
				int m = 0;
				while (irlink.hasNext())
				{
					ld = (LinkDb) irlink.next();
					if (m==0)
						out.print("<tr>");
				%>
					<td align=center><a target="_blank" href="<%=ld.getUrl()%>" title="<%=ld.getTitle()%>">
					<%if (ld.getImage()!=null && !ld.getImage().equals("")) {%>
						<img src="../<%=ld.getImage()%>" border=0>
					<%}else{%>
						<%=ld.getTitle()%>
					<%}%>
					</a></td>
                <%
					m ++;
					if (m==8) {
						out.print("</tr>");
						m = 0;
					}
				}
				if (m!=8)
					out.print("</tr>");
				%>	
	</table>
	</td>
  </tr>
</table>
<jsp:include page="forum/inc/footer.jsp" />
<table align="center" style="display:"><tr><td>
<Script Src="cms/counter/counter.jsp?style=1"></Script>
</td></tr></table>
</body>
</html>
