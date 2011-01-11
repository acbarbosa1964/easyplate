unit untEasyBaseConst;

interface

uses DB, DBClient;

const
  EasyErrorHint_NRight = '无相应的操作权限!';
  EasyHint_ConfirmDelete = '是否执行删除操作？';
  EasyEditHint_Edit = '编辑操作出错!';
  EasySaveHint_Success = '保存成功!';
  EasySaveHint_Error = '保存失败，原因：';

  ActionStr: array[TReconcileAction] of string = ('忽略', '中断', '合并',
    '正确', '取消', '刷新');
  UpdateKindStr: array[TUpdateKind] of string = ('修改', '插入',
    '删除');
  SCaption = '更新出错 - %s';
  SUnchanged = '<未发生改变>';
  SBinary = '(Binary)';
  SAdt = '(ADT)';
  SArray = '(Array)';
  SFieldName = '字段名';
  SOriginal = '原始值';          //Original Value
  SConflict = '冲突值';          //Conflicting Value
  SValue = '值';                  //Value
  SNoData = '<无记录>';        //No Records
  SNew = 'New';                   //New

implementation

end.
