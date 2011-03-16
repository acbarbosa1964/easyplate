<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="cn.easy.js.fan.util.*"%>
<%@ page import="cn.easy.js.fan.web.Global"%>
<%@ page import="com.redmoon.forum.person.UserSet"%>
<%
	String skincode = UserSet.getSkin(request);
	if (skincode.equals(""))
		skincode = UserSet.defaultSkin;
	SkinMgr skm = new SkinMgr();
	Skin skin = skm.getSkin(skincode);
	if (skin == null)
		skin = skm.getSkin(UserSet.defaultSkin);
	String skinPath = skin.getPath();
%>
<html>
	<head>
		<title><%=Global.AppName%> - 注册</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link href="forum/<%=skinPath%>/skin.css" rel="stylesheet"
			type="text/css">
		<script>
function New(para_URL){var URL=new String(para_URL);window.open(URL,'','resizable,scrollbars')}
function CheckRegName(){
	var Name=document.frmAnnounce.RegName.value;
	window.open("checkregname.jsp?RegName="+Name,"","width=200,height=20");
}

function showTableDetail() {
	if (tableDetail.style.display=="none")
		tableDetail.style.display = "";
	else
		tableDetail.style.display = "none";
}
</script>
		<script src="forum/inc/ubbcode.js"></script>
	</head>
	<%@ include file="forum/inc/header.jsp"%>
	<body bgcolor="#FFFFFF" text="#000000">
		<table width=98% align=center cellspacing=0 cellpadding=0 border=0>
			<Form method="POST" action="regist_do.jsp" name="frmAnnounce"
				onSubmit="return VerifyInput()">
			<tr>
				<td bgcolor=#D3D3D3>
					<table width=100% border=0 cellpadding=0 cellspacing=1>
						<tr>
							<td align=center bgcolor="#FFFFFF">
								<table border=0 cellpadding=0 cellspacing=0 width=100%>
									<tr>
										<td width=31 height=20
											background="forum/<%=skinPath%>/images/bg1.gif">
											&nbsp;
										</td>
										<td width=131 background="forum/<%=skinPath%>/images/bg1.gif"
											class="td_title">
											<b> 会员代号及密码</b>
										</td>
										<td height="26"
											background="forum/<%=skinPath%>/images/bg1.gif"
											class="td_title">
											注意：此栏必须填写
										</td>
									</tr>
								</table>
								<table width=100% border=0 cellpadding=0 cellspacing=1
									bgcolor="#CCCCCC">
									<tr>
										<td width="128" height="28" align=left bgcolor="#FFFFFF">
											&nbsp;注册用户
										</td>
										<td align=left bgcolor="#FFFFFF">
											&nbsp;
											<input name=RegName type=text size=20 maxlength="50">
											<font color="#FF0000"> * </font>
											<input name=Button type=button
												onClick="javascript:CheckRegName()" value='检测用户名'>
										</td>
									</tr>
									<tr>
										<td height="28" align=left bgcolor="#FFFFFF">
											&nbsp;登陆密码
										</td>
										<td align=left valign="top" bgcolor="#FFFFFF">
											<img src=/images/c.gif width=1 height=5>
											<br>
											&nbsp;
											<input name=Password type=password size=20 maxlength="20">
											<font color="#FF0000">*</font> 确认密码
											<input name=Password2 type=password size=20 maxlength="20">
											<font color="#FF0000"> *</font>
										</td>
									</tr>
									<tr>
										<td height="28" align=left bgcolor="#FFFFFF">
											&nbsp;密码问题
										</td>
										<td height="25" align=left valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<input name=Question type=text size=20 maxlength=50>
											<font color="#FF0000">* </font>密码答案
											<input name=Answer type=text size=20 maxlength=50>
											<font color="#FF0000">*</font>
										</td>
									</tr>
									<tr>
										<td height="28" align=left bgcolor="#FFFFFF">
											&nbsp;性别
										</td>
										<td height="25" align=left valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<input type=radio name=Gender value=M checked>
											男
											<input type=radio name=Gender value=F>
											女
										</td>
									</tr>
									<tr>
										<td height="28" align=left bgcolor="#FFFFFF">
											&nbsp;Email
										</td>
										<td height="25" align=left valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<input name=Email type=text size=20 maxlength="50">
											<font color="#FF0000">*</font>
										</td>
									</tr>
								</table>
								<table width=100% border=0 cellpadding=0 cellspacing=0>
									<tr>
										<td width=31 height=23
											background="forum/<%=skinPath%>/images/bg1.gif">
											&nbsp;
										</td>
										<td height="23"
											background="forum/<%=skinPath%>/images/bg1.gif"
											class="td_title">
											+&nbsp;
											<a href="javascript:showTableDetail()">点击此处</a>&nbsp;&nbsp;填写详细资料
											<input name="isSecret" value="true" type="checkbox">
											将以下带*号信息保密
										</td>
									</tr>
								</table>
								<table id="tableDetail" name="tableDetail" width=100% border=0
									cellpadding=0 cellspacing=1 style="display:none"
									bgcolor="#CCCCCC">
									<tr>
										<td width=128 align=left height="28" bgcolor="#FFFFFF">
											&nbsp;真实姓名
										</td>
										<td width="188" height="25" bgcolor="#FFFFFF" valign="middle">
											&nbsp;
											<input name=RealName type=text size=12 maxlength=20>
										</td>
										<td width=103 height="25" bgcolor="#FFFFFF" align=left>
											&nbsp;行业
										</td>
										<td height="25" bgcolor="#FFFFFF" align=left>
											&nbsp;
											<select name=Career size=1>
												<option value="0" selected>
													请选...
												</option>
												<option value="政府机关/干部">
													政府机关/干部
												</option>
												<option value="学生">
													学生
												</option>
												<option value="邮电通信">
													邮电通信
												</option>
												<option value="计算机">
													计算机
												</option>
												<option value="网络">
													网络
												</option>
												<option value="商业/贸易">
													商业/贸易
												</option>
												<option value="银行/金融/证券/保险/投资">
													银行/金融/证券/保险/投资
												</option>
												<option value="税务">
													税务
												</option>
												<option value="咨询">
													咨询
												</option>
												<option value="社会服务">
													社会服务
												</option>
												<option value="旅游/饭店">
													旅游/饭店
												</option>
												<option value="健康/医疗服务">
													健康/医疗服务
												</option>
												<option value="房地产">
													房地产
												</option>
												<option value="交通运输">
													交通运输
												</option>
												<option value="法律/司法">
													法律/司法
												</option>
												<option value="文化/娱乐/体育">
													文化/娱乐/体育
												</option>
												<option value="媒介/广告">
													媒介/广告
												</option>
												<option value="科研/教育">
													科研/教育
												</option>
												<option value="农业/渔业/林业/畜牧业">
													农业/渔业/林业/畜牧业
												</option>
												<option value="矿业/制造业">
													矿业/制造业
												</option>
												<option value="自由职业">
													自由职业
												</option>
												<option value="其他">
													其他
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width=128 height="28" align=left bgcolor="#FFFFFF">
											&nbsp;手机号码
										</td>
										<td height="25" bgcolor="#FFFFFF">
											<span class="l15"> &nbsp; <input name=Mobile type=text
													size=16 maxlength="16"> </span>
										</td>
										<td width=103 height="25" bgcolor="#FFFFFF">
											&nbsp;职位
										</td>
										<td height="25" bgcolor="#FFFFFF" class=l15>
											&nbsp;
											<select name=Job size=1>
												<option value="0" selected>
													请选...
												</option>
												<option value="普通职员">
													普通职员
												</option>
												<option value="工程师">
													工程师
												</option>
												<option value="总经理、董事长，CxO">
													总经理、董事长，CxO
												</option>
												<option value="市场部经理">
													市场部经理
												</option>
												<option value="销售部经理">
													销售部经理
												</option>
												<option value="行政主管">
													行政主管
												</option>
												<option value="人事主管">
													人事主管
												</option>
												<option value="财务主管">
													财务主管
												</option>
												<option value="技术主管">
													技术主管
												</option>
												<option value="退休">
													退休
												</option>
												<option value="其他">
													其他
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td width=128 height="28" align=left bgcolor="#FFFFFF">
											&nbsp;出生日期
										</td>
										<td height="28" bgcolor="#FFFFFF">
											&nbsp;
											<select name="BirthYear" class="input1">
												<script language="JavaScript">
	  <!--
		tmpDate = new Date();
		year= tmpDate.getYear();
		month = tmpDate.getMonth()+1;
		date = tmpDate.getDate();
		for (i=-50; i<=100; i++)
			document.write("<option value="+(year+i)+">"+(year+i)+"</option>")
	  //-->
	  </script>
											</select>
											年
											<select name="BirthMonth" class="input1">
												<option value="1" selected>
													1
												</option>
												<option value="2">
													2
												</option>
												<option value="3">
													3
												</option>
												<option value="4">
													4
												</option>
												<option value="5">
													5
												</option>
												<option value="6">
													6
												</option>
												<option value="7">
													7
												</option>
												<option value="8">
													8
												</option>
												<option value="9">
													9
												</option>
												<option value="10">
													10
												</option>
												<option value="11">
													11
												</option>
												<option value="12">
													12
												</option>
											</select>
											月
											<select name="BirthDay" class="input1">
												<option value="1" selected>
													1
												</option>
												<option value="2">
													2
												</option>
												<option value="3">
													3
												</option>
												<option value="4">
													4
												</option>
												<option value="5">
													5
												</option>
												<option value="6">
													6
												</option>
												<option value="7">
													7
												</option>
												<option value="8">
													8
												</option>
												<option value="9">
													9
												</option>
												<option value="10">
													10
												</option>
												<option value="11">
													11
												</option>
												<option value="12">
													12
												</option>
												<option value="13">
													13
												</option>
												<option value="14">
													14
												</option>
												<option value="15">
													15
												</option>
												<option value="16">
													16
												</option>
												<option value="17">
													17
												</option>
												<option value="18">
													18
												</option>
												<option value="19">
													19
												</option>
												<option value="20">
													20
												</option>
												<option value="21">
													21
												</option>
												<option value="22">
													22
												</option>
												<option value="23">
													23
												</option>
												<option value="24">
													24
												</option>
												<option value="25">
													25
												</option>
												<option value="26">
													26
												</option>
												<option value="27">
													27
												</option>
												<option value="28">
													28
												</option>
												<option value="29">
													29
												</option>
												<option value="30">
													30
												</option>
												<option value="31">
													31
												</option>
											</select>
											日
											<script language="JavaScript">
	  <!--
		tmpDate = new Date();
		year= ""+tmpDate.getYear();
		month = tmpDate.getMonth()+1;
		//month = ""+month;
		//if (month.length==1)
		//	month = "0"+month;
		//date = ""+tmpDate.getDate();
		//if (date.length==1)
		//	date = "0"+date;
	  
	  frmAnnounce.BirthYear.value = year;
	  frmAnnounce.BirthMonth.value = month;
	  frmAnnounce.BirthDay.value = date;
	  //-->
	  </script>
										</td>
										<td width=103 height="28" bgcolor="#FFFFFF" align="left">
											&nbsp;婚姻状况
										</td>
										<td height="28" bgcolor="#FFFFFF" class=l15>
											<span class="l15"> &nbsp; <select name=Marriage size=1>
													<option value="0" selected>
														未婚
													</option>
													<option value="2">
														不详
													</option>
													<option value="1">
														已婚
													</option>
												</select>* </span>
										</td>
									</tr>
									<tr>
										<td width=128 height="28" align=left bgcolor="#FFFFFF">
											&nbsp;电话
										</td>
										<td height="19" bgcolor="#FFFFFF" valign="middle">
											&nbsp;
											<input name=Phone type=text size=16 maxlength="20">
										</td>
										<td width=103 height="19" bgcolor="#FFFFFF">
											&nbsp;QQ:
										</td>
										<td height="19" bgcolor="#FFFFFF" class=l15>
											&nbsp;
											<input name=OICQ type=text size=16 maxlength="15">
											*
										</td>
									</tr>
									<tr>
										<td width=128 height="28" align=left bgcolor="#FFFFFF">
											<img src=/images/c.gif width=1 height=5>
											省份
										</td>
										<td valign="middle" height="27" bgcolor="#FFFFFF">
											&nbsp;
											<select name=State size=1>
												<option value="0" selected>
													请选择…
												</option>
												<option value="安徽">
													安徽
												</option>
												<option value="北京">
													北京
												</option>
												<option value="重庆">
													重庆
												</option>
												<option value="福建">
													福建
												</option>
												<option value="甘肃">
													甘肃
												</option>
												<option value="广东">
													广东
												</option>
												<option value="广西">
													广西
												</option>
												<option value="贵州">
													贵州
												</option>
												<option value="海南">
													海南
												</option>
												<option value="河北">
													河北
												</option>
												<option value="黑龙江">
													黑龙江
												</option>
												<option value="河南">
													河南
												</option>
												<option value="湖北">
													湖北
												</option>
												<option value="湖南">
													湖南
												</option>
												<option value="内蒙古">
													内蒙古
												</option>
												<option value="江苏">
													江苏
												</option>
												<option value="江西">
													江西
												</option>
												<option value="吉林">
													吉林
												</option>
												<option value="辽宁">
													辽宁
												</option>
												<option value="宁夏">
													宁夏
												</option>
												<option value="青海">
													青海
												</option>
												<option value="山西">
													山西
												</option>
												<option value="陕西">
													陕西
												</option>
												<option value="山东">
													山东
												</option>
												<option value="上海">
													上海
												</option>
												<option value="四川">
													四川
												</option>
												<option value="天津">
													天津
												</option>
												<option value="西藏">
													西藏
												</option>
												<option value="新疆">
													新疆
												</option>
												<option value="云南">
													云南
												</option>
												<option value="浙江">
													浙江
												</option>
												<option value="其他">
													其他
												</option>
											</select>
										</td>
										<td colspan="2" rowspan="5" valign="middle" bgcolor="#FFFFFF"
											align="left">
											<table width="87%" border="0" cellspacing="0" cellpadding="0"
												align="left">
												<tr>
													<td height="56" bgcolor="#FFFFFF">
														&nbsp;&nbsp;
														<img src="forum/images/face/face.gif" name="tus">
														&nbsp;
														<script>function showimage(){document.images.tus.src="forum/images/face/face"+document.frmAnnounce.RealPic.options[document.frmAnnounce.RealPic.selectedIndex].value+".gif";}</script>
														<select name=RealPic size=1 onChange="showimage()">
															<option value="">
																默认头像
															</option>
															<%
															for (int i = 1; i <= 199; i++) {
															%>
															<option value="<%=i%>">
																<%=i%>
															</option>
															<%
															}
															%>
														</select>
													</td>
												</tr>
												<tr>
													<td height="56" bgcolor="#FFFFFF">
														&nbsp;
														<a href="JavaScript:New('images/index.htm')">查看所有的头像列表</a>
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td width=128 align=left height="28" bgcolor="#FFFFFF">
											&nbsp;城市
										</td>
										<td height="25" valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<input name=City type=text size=10 maxlength="50">
										</td>
									</tr>
									<tr>
										<td width=128 align=left height="28" bgcolor="#FFFFFF">
											&nbsp;地址
										</td>
										<td height="25" valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<input name=Address type=text size=25 maxlength="100">
										</td>
									</tr>
									<tr>
										<td width=128 align=left height="28" bgcolor="#FFFFFF">
											&nbsp;邮政编码
										</td>
										<td height="19" valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<input name=PostCode type=text size=10 maxlength="20">
										</td>
									</tr>
									<tr>
										<td width=128 align=left height="28" bgcolor="#FFFFFF">
											&nbsp;身份证号码
										</td>
										<td height="29" bgcolor="#FFFFFF" valign="middle">
											&nbsp;
											<input name=IDCard type=text size=21 maxlength="50">
										</td>
									</tr>
									<tr>
										<td align=left height="28" bgcolor="#FFFFFF">
											&nbsp;兴趣爱好
										</td>
										<td height="29" colspan="3" valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<input name=Hobbies type=text size=30>
										</td>
									</tr>
									<tr>
										<td align=left height="28" bgcolor="#FFFFFF">
											&nbsp;时区
										</td>
										<td height="29" colspan="3" valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<select name="timeZone">
												<option value="GMT-11:00">
													(GMT-11.00)中途岛，萨摩亚群岛
												</option>
												<option value="GMT-10:00">
													(GMT-10.00)夏威夷
												</option>
												<option value="GMT-09:00">
													(GMT-9.00)阿拉斯加
												</option>
												<option value="GMT-08:00">
													(GMT-8.00)太平洋时间（美国和加拿大）；蒂华纳
												</option>
												<option value="GMT-07:00">
													(GMT-7.00)山地时间（美国和加拿大）
												</option>
												<option value="GMT-06:00">
													(GMT-6.00)中美洲
												</option>
												<option value="GMT-05:00">
													(GMT-5.00)波哥大，利马，基多
												</option>
												<option value="GMT-04:00">
													(GMT-4.00)加拉加斯，拉巴斯
												</option>
												<option value="GMT-03:00">
													(GMT-3.00)格陵兰
												</option>
												<option value="GMT-02:00">
													(GMT-2.00)中大西洋
												</option>
												<option value="GMT-01:00">
													(GMT-1.00)佛得角群岛
												</option>
												<option value="GMT">
													(GMT)格林威治标准时间，都柏林，爱丁堡，伦敦，里斯本
												</option>
												<option value="GMT+01:00">
													(GMT+1.00)阿姆斯特丹，柏林，伯尔尼，罗马，斯德哥尔摩，维也纳
												</option>
												<option value="GMT+02:00">
													(GMT+2.00)雅典，贝鲁特，伊斯坦布尔，明斯克
												</option>
												<option value="GMT+03:00">
													(GMT+3.00)莫斯科，圣彼得堡，伏尔加格勒
												</option>
												<option value="GMT+04:00">
													(GMT+4.00)阿布扎比，马斯喀特
												</option>
												<option value="GMT+04:30">
													(GMT+4.30)喀布尔
												</option>
												<option value="GMT+05:00">
													(GMT+5.00)叶卡捷琳堡
												</option>
												<option value="GMT+05:30">
													(GMT+5.30)马德拉斯，加尔各答，孟买，新德里
												</option>
												<option value="GMT+05:45">
													(GMT+5.45)加德满都
												</option>
												<option value="GMT+06:00">
													(GMT+6.00)阿拉木图，新西伯利亚
												</option>
												<option value="GMT+06:30">
													(GMT+6.30)仰光
												</option>
												<option value="GMT+07:00">
													(GMT+7.00)曼谷，河内，雅加达
												</option>
												<option value="GMT+08:00" selected="selected">
													(GMT+8.00)北京，台北，重庆，香港特别行政区，乌鲁木齐
												</option>
												<option value="GMT+09:00">
													(GMT+9.00)汉城，大坂，东京，札幌
												</option>
												<option value="GMT+09:30">
													(GMT+9.30)达尔文
												</option>
												<option value="GMT+10:00">
													(GMT+10.00)关岛，莫尔兹比港
												</option>
												<option value="GMT+11:00">
													(GMT+11.00)马加丹，索罗门群岛，新喀里多尼亚
												</option>
												<option value="GMT+12:00">
													(GMT+12.00)斐济，堪察加半岛，马绍尔群岛
												</option>
												<option value="GMT+13:00">
													(GMT+13.00)努库阿洛法
												</option>
											</select>
										</td>
									</tr>
									<tr>
										<td rowspan="2" align=left valign="middle" bgcolor="#FFFFFF">
											&nbsp;签名档
											<br>
											<br>
											&nbsp;UBB：
											<%
												com.redmoon.forum.Config cfg = new com.redmoon.forum.Config();
												if (cfg.getBooleanProperty("forum.sign_ubb"))
													out.print("支持");
												else
													out.print("不支持");
											%>
										</td>
										<td colspan=3 valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<%@ include file="forum/inc/getubb.jsp"%>
										</td>
									</tr>
									<tr>
										<td colspan=3 valign="middle" bgcolor="#FFFFFF">
											&nbsp;
											<textarea cols="75" name="Content" rows="5" wrap="VIRTUAL"
												title="签名档"></textarea>
											<font color="#000000"><br> &nbsp;&nbsp;不能超过<%=cfg.getIntProperty("forum.sign_length")%>字</font>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td bgcolor="#FFFFFF">
								<table border=0 cellpadding=0 cellspacing=0 width=100%>
									<tr valign=bottom>
										<td height=41 align="center" valign="middle">
											<font color="#FF0000">&nbsp; </font>
											<input name=Write type=submit value=" 提交 ">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<input name=reset type=reset value=" 重填 ">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</form>
		</table>
		<%@ include file="forum/inc/footer.jsp"%>
	</body>
	<SCRIPT>
function VerifyInput()
{
var newDateObj = new Date()
if (document.frmAnnounce.RegName.value == "")
{
alert("请输入您的用户名");
document.frmAnnounce.RegName.focus();
return false;
}

if (document.frmAnnounce.Password.value == "")
{
alert("请输入您的密码");
document.frmAnnounce.Password.focus();
return false;
}
if (document.frmAnnounce.Password2.value == "")
{
alert("请重复您的密码");
document.frmAnnounce.Password2.focus();
return false;
}
if (document.frmAnnounce.Password.value != document.frmAnnounce.Password2.value)
{
alert("两遍输入的口令不一致");
document.frmAnnounce.Password.focus();
return false;
}

if (document.frmAnnounce.Email.value == "")
{
alert("请输入您的EMAIL地址");
document.frmAnnounce.Email.focus();
return false;
}

if (document.frmAnnounce.Question.value == "")
{
alert("请输入提示问题");
document.frmAnnounce.Question.focus();
return false;
}

if (document.frmAnnounce.Answer.value == "")
{
alert("请输入答案");
document.frmAnnounce.Answer.focus();
return false;
}

if (document.frmAnnounce.BirthYear.value > 0)  {
	if (isNaN(document.frmAnnounce.BirthYear.value) || document.frmAnnounce.BirthYear.value > newDateObj.getFullYear()  || document.frmAnnounce.BirthYear.value < 1900)
	{
		alert("请输入正确的出生年份");
		document.frmAnnounce.BirthYear.focus();
		return false;
	}
}

var signlen = <%=cfg.getIntProperty("forum.sign_length")%>;
if (document.frmAnnounce.Content.value.length>signlen)
{
	alert("签名不能超过" + signlen + "字");
	document.frmAnnounce.Content.focus();
	return false;
}

return true;
}
</SCRIPT>
</html>
