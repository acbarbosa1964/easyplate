{-------------------------------------------------------------------------------
//                       EasyComponents For Delphi 7
//                         一轩软研第三方开发包                         
//                         @Copyright 2010 hehf                      
//                   ------------------------------------                       
//                                                                              
//           本开发包是公司内部使用,作为开发工具使用任何,何海锋个人负责开发,任何
//       人不得外泄,否则后果自负.        
//
//            使用权限以及相关解释请联系何海锋  
//                
//                                                               
//            网站地址：http://www.YiXuan-SoftWare.com                                  
//            电子邮件：hehaifeng1984@126.com 
//                      YiXuan-SoftWare@hotmail.com    
//            QQ      ：383530895
//            MSN     ：YiXuan-SoftWare@hotmail.com                                   
//------------------------------------------------------------------------------}
unit untEasyUtilConst;

interface

const
  EASY_RootGUID = '{00000000-0000-0000-0000-000000000000}';
  
  EASY_OPERATE_ADD   = '增加';
  EASY_OPERATE_EDIT   = '修改';
  EASY_OPERATE_DELETE   = '删除';
  
  EASY_SYS_ERROR     = '系统错误';
  EASY_SYS_HINT      = '系统提示';
  EASY_SYS_EXCEPTION = '系统异常';
  EASY_SYS_EXIT      = '系统退出';
  EASY_SYS_ABORT     = '系统中断';

  EASY_SYS_NOTNULL = '不能为空值!';
  EASY_SYS_DATANOCHANGE = '数据未发生变更,不能进行保存!';

  EASY_SYS_SAVE_SUCCESS = '保存成功!';
  EASY_SYS_SAVE_FAILED = '保存失败,原因:';

//包加载文件不存在
  EASY_BPL_NOTFOUND = '加载指定的文件%s已丢失!';
//数据库连接
  EASY_DB_CONNECT_ERROR = '服务器连接失败, 原因：' ;
  EASY_DB_CONNECT_ERROR1 = '1、请检查应用服务器是否开启;' ;
  EASY_DB_CONNECT_ERROR2 = '2、请检查客户端参数设置是否正确.' ;
  
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

//权限管理
  EASY_RIGHT_TOPARENT = '只能对父节点或根节点进行资源权限分配!';

//系统加密密钥
  EASY_KEY_DB = 'ABC1?*_+23XZY';
  EASY_KEY_FILE = 'acAB13XZ?*_+';
  EASY_KEY_IM = 'ABC_abc*12';
  EASY_KEY_MAIL = 'EASYMAILc*1';
  EASY_KEY_OTERHR = 'EASYOTHER?*KEY';

  EASY_DBCONNECT_SUCCESS = '服务器连接设置成功,重新登录软件生效!';
//插件加载
  EASY_PLUGIN_LOAD_FAILED = '加载插件%s失败，原因：';
  EASY_PLUGIN_CANNOT_LOAD = '不能加载插件:%s 原因：未找到插件入口函数!'; 
type
  //操作数据状态
  TEasyOperateType = (eotAdd, eotEdit, eotDelete);
  
implementation

end.











