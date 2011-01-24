function load_xml(obj, xmlobj, xslobj) {
	try {
		hiddenxml = xmlobj.innerHTML;
		hiddenxsl = xslobj.xml;
		var myxml = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
		myxml.async = false;		
		myxml.loadXML(hiddenxml);
		var myxsl = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
		myxsl.async = false;		
		myxsl.loadXML(hiddenxsl);
		html = myxml.transformNode(myxsl);
		obj.innerHTML = html;
		title = myxml.selectSingleNode("/DFWML/@title");
		if (title!=null) document.title = title.text;
	}
	catch (exception) {
		alert(exception.description);
		obj.innerHTML = exception.description;
	}	
}

function load_xmln(obj, xmlobj, xslfn) {
	try {
		hiddenxml = xmlobj.innerHTML;
		var myxml = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
		myxml.async = false;		
		myxml.loadXML(hiddenxml);
		var myxsl = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
		myxsl.async = false;		
		myxsl.load(xslfn);
		html = myxml.transformNode(myxsl);
		obj.innerHTML = html;
		title = myxml.selectSingleNode("/DFWML/@title");
		if (title!=null) document.title = title.text;
	}
		catch (exception) {
		alert(exception.description);
		obj.innerHTML = exception.description;
	}	
}

function load_xls(xslfn){
	try {
		var xsl = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
		xsl.async = false;
		xsl.load(xslfn);
		return xsl;
	}
	catch (exception) {
		alert(exception.description);
	}	
}

function load_xmlx(obj, xmlobj, xsl) {
	try {
		var myxml = new ActiveXObject("MSXML2.FreeThreadedDOMDocument");
		myxml.async = false;		
		myxml.loadXML(xmlobj.innerHTML);
		html = myxml.transformNode(xsl);
		obj.innerHTML = html;
		title = myxml.selectSingleNode("/DFWML/@title");
		if (title!=null) document.title = title.text;
	}
	catch (exception) {
		alert(exception.description);
		obj.innerHTML = exception.description;
	}	
}

function insertCode2(ss) {
	if (ss=='') return;
	var s1 = document.getElementById("S1");
	s1.focus();
	var rr = document.selection.createRange();
	rr.text = '[' + ss+ ']' + rr.text + '[/' + ss+ ']';
}

function insertCode(ss) {
	if (ss=='') return;
	var s1 = document.getElementById("S1");
	s1.focus();
	var rr = document.selection.createRange();
	rr.text += ss;
}

var msg = "";	
function showMsg() {
	if (msg!="") alert(msg.replace(/\<br\>/gi, "\n"));
}	

function DelBadChar(s){
var p1,s2,a;
  p1=0;
  S2="";
  for(i=0;i<s.length;i++){
    a=s.charCodeAt(i);
    if(a>=0 && a<32 && a!=09 && a!=10 && a!=13){
	  S2+=s.substr(p1,i-p1);
      p1=i+1
	 }
  }
  S2=S2+s.substr(p1,s.length-p1);
  return S2;
}

function SaveAs(){
	html="";
	t=document.all.item(0,0);
	while(t!=null){
		html+=t.outerHTML;
		t=t.nextSibling;
	}
	document.open("text/html","gb2312");
	document.write(html);
	document.execCommand ("SaveAs",true,document.title+"1.htm");
}

function prestr(){
	  //return;
    i=0;
    el=document.all.item("prestr",0)
    while(el!=null)
      {
        s=el.innerHTML;
        s=s+" ";

		s = s.replace(/(^|[^\"\'])(http|ftp|mms|rstp|news|https)(\:\/\/\S+)/gi,"$1<a href='$2$3' target='_blank'>$2$3<\/a>");
		s = s.replace(/(^|[^\/])(www\.\S+)/gi,"$1<a href='http:\/\/$2' target='_blank'>$2</a>");
		//s = s.replace(/([\w+\-\'\#\%\.\_\,\$\!\+\*]+@[\w+\.?\-\'\#\%\~\_\.\;\,\$\!\+\*]*)/gi, "<a href='mailto\:$1'>$1</a>");
       
				s=s.replace(/ firstchar=""> /g,">&nbsp;");
				s=s.replace(/\r\n /g,"<br>&nbsp;");
				s=s.replace(/  |\t/g," &nbsp;");
        s=s.replace(/\r\n/g,"<br>");
        
        el.outerHTML="<p style='margin:4 2 0 2' class='content'>"+s+"</p>";
        el=document.all.item("prestr",0);
        }
}
