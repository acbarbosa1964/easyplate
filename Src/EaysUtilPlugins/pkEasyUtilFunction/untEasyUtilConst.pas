unit untEasyUtilConst;

interface

const
  EASY_SYS_ERROR     = '系统错误';
  EASY_SYS_HINT      = '系统提示';
  EASY_SYS_EXCEPTION = '系统异常';
  EASY_SYS_EXIT      = '系统退出';
  EASY_SYS_ABORT     = '系统中断';

//包加载文件不存在
  EASY_BPL_NOTFOUND = '加载指定的文件%s已丢失!';
//数据库连接
  EASY_DB_NOTFILE       = '系统文件丢失,原因：数据模块丢失!';
  EASY_DB_INITERROR     = '数据模块初始化失败,请检查数据连接模块!';
  EASY_DB_LOADERROR     = '数据模块加载失败,原因：数据模块损坏或丢失!';

//闪窗体
  EASY_SPLASH_NOTFILE       = '系统文件丢失,原因：闪窗体(SplashForm.dll)文件丢失!';

//登录窗体
  EASY_LOGIN_NOTFILE        = '系统登录文件丢失!';

//主窗体显示时
  EASY_DISPLAYUSERINFO_WELCOME = '欢迎 ';
  EASY_DISPLAYUSERINFO_DEPT    = '部门 ';
  EASY_DISPLAYUSERINFO_NULL = '此用户未有员工使用,无法登录系统!';
  EASY_DISPLAYUSERINFO_MORE = '此用户有多个员工使用,系统已阻止登录!';
  EASY_STATUBAR_APP = '应用程序类型 ';
  EASY_STATUBAR_DBHOST = ' 数据服务器 ';


  
implementation

end.











