unit wsLanguage;

interface

implementation
uses wsRes;

const LanguageStr = 
'[strings]' + #13#10 +
'SAttachment=附件         ' + #13#10 +
'SConfirmDeleteItems=确定要删除所选项吗?' + #13#10 +
'SConfirmDeleteAttachments=确定要移除所选的附件吗?' + #13#10 +
'SConfirmOpenMoreThanOneFile=确定同时打开多个文件吗?' + #13#10 +
'SFileName=文件名' + #13#10 +
'SEnterVariableCaption=请输入变量标题' + #13#10 +
'SVariables=变量集' + #13#10 +
'STask=任务' + #13#10 +
'SVariable=变量' + #13#10 +
'SColumnKey=主键' + #13#10 +
'SColumnName=名称' + #13#10 +
'SColumnWorkflow=流程' + #13#10 +
'SColumnSubject=主题' + #13#10 +
'SColumnStatus=状态' + #13#10 +
'SColumnUser=用户' + #13#10 +
'STabFields=字段' + #13#10 +
'STabTask=任务' + #13#10 +
'STabWorkflow=流程' + #13#10 +
'STabLog=日志' + #13#10 +
'SConfirmDeleteWorkDef=确定要删除所选的流程吗?' + #13#10 +
'SConfirmCloseAndDiscard=关闭窗体不保存更改?' + #13#10 +
'SModified=已变更' + #13#10 +
'SAllObjects=所有对象' + #13#10 +
'SConfirmNewDiagramAndDiscard=创建新流程并摒弃已做变更?' + #13#10 +
'SConfirmOpenDiagramAndDiscard=打开新流程并摒弃已做变更?' + #13#10 +
'SWorkflowCorrect=流程图正确.' + #13#10 +
'SWorkflowDefinition=流程定义' + #13#10 +
'STypeWorkDefName=定义流程名称' + #13#10 +
'SErrorParamNotFound=流程图 "%s" 不存在.' + #13#10 +
'STrueOutput=确定' + #13#10 +
'SFalseOutput=取消' + #13#10 +
'SBlockStart=开始' + #13#10 +
'SBlockEnd=结束' + #13#10 +
'SBlockTask=任务区' + #13#10 +
'SBlockApproval=批准区' + #13#10 +
'SBlockScript=脚本区' + #13#10 +
'STaskApprovalName=批准' + #13#10 +
'STaskApprovalSubject=批准' + #13#10 +
'STaskApprovalDescription=请选择 【批准】 或 【拒绝】.' + #13#10 +
'STaskApprovalStatusOpened=已打开' + #13#10 +
'STaskApprovalStatusApproved=已批准' + #13#10 +
'STaskApprovalStatusRejected=已被拒绝' + #13#10 +
'SToolbarStart=开始' + #13#10 +
'SToolbarEnd=结束' + #13#10 +
'SToolbarError=句柄错误' + #13#10 +
'SToolbarSourceConnect=起始对象' + #13#10 +
'SToolbarTargetConnect=目标对象' + #13#10 +
'SToolbarLineJoin=线连接' + #13#10 +
'SToolbarTransition=转换' + #13#10 +
'SToolbarSideTransition=侧面转换' + #13#10 +
'SToolbarArcTransition=弧形转换' + #13#10 +
'SToolbarFork=分叉' + #13#10 +
'SToolbarJoin=连接' + #13#10 +
'SToolbarTask=任务' + #13#10 +
'SToolbarApproval=批准' + #13#10 +
'SToolbarDecision=决定' + #13#10 +
'SToolbarWorkflowCategory=流程' + #13#10 +
'SToolbarScript=脚本' + #13#10 +
'SErrorFileAlreadyOpen=文件已经打开.' + #13#10 +
'SConfirmUpdateModifiedAttachment=文件 "%s" 已被修改. 要同时更新对应的附件吗?' + #13#10 +
'SWarningFieldValueRequired=必须输入 "%s" 的值.' + #13#10 +
'SErrorInsertCannotGetKey=插入 %s 发生错误. 不能重新得到主键.' + #13#10 +
'SErrorRecordNotFoundKey=%s 在数据库中不存在. 主键: %s' + #13#10 +
'SErrorUpdateEmptyKey=更新 %s 发生错误. 空的主键.' + #13#10 +
'SErrorDeleteEmptyKey=删除 %s 发生错误. 空的主键.' + #13#10 +
'SErrorUndefinedVariable=变量 "%s" 不存在.' + #13#10 +
'SErrorScriptBlockCompile=在编译脚本时发生错误.' + #13#10 +
'SLogColOperation=操作' + #13#10 +
'SLogColDate=日期' + #13#10 +
'SLogColTime=时间' + #13#10 +
'SLogColUserId=用户编号' + #13#10 +
'SLogColInfo=信息' + #13#10 +
'STaskLogCreate=创建' + #13#10 +
'STaskLogUpdate=更新' + #13#10 +
'STaskLogStatusChange=状态改变' + #13#10 +
'SStatusChangeInfo=从 "%s" 到 "%s"' + #13#10 +
'SWorkInsExecutionError1=流程执行时发生错误. 流程实例结束.\#13#10\#13#10错误: "%s"' + #13#10 +
'SWorkInsExecutionError2=%s\#13#10\#13#10此区块出错信息:\#13#10类型: %s\#13#10名称: %s\#13#10描述: \#13#10"%s"' + #13#10 +
'SNextBlockUndefined=不能继续下一区块定义.' + #13#10 +
'STaskNotCreatedUserNotFound=此任务不能被正常实例化因为用户/用户组 "%s" 不存在.' + #13#10 +
'' + #13#10 +
'[fApprovalEditor]' + #13#10 +
'fmApprovalEditor.Self.Caption=批准' + #13#10 +
'fmApprovalEditor.tsGeneral.Caption=常规' + #13#10 +
'fmApprovalEditor.lbSubject.Caption=主题' + #13#10 +
'fmApprovalEditor.lbDescription.Caption=描述' + #13#10 +
'fmApprovalEditor.lbAssignment.Caption=分配' + #13#10 +
'fmApprovalEditor.cbMailNotification.Caption=发送邮件通知' + #13#10 +
'fmApprovalEditor.tsStatus.Caption=状态' + #13#10 +
'fmApprovalEditor.lbStatusList.Caption=状态列表 (开始用 "*")' + #13#10 +
'fmApprovalEditor.tsAttachments.Caption=附件' + #13#10 +
'fmApprovalEditor.tsFields.Caption=字段' + #13#10 +
'fmApprovalEditor.btCancel.Caption=取消' + #13#10 +
'fmApprovalEditor.btOk.Caption=确定' + #13#10 +
'' + #13#10 +
'[fAttachmentEditor]' + #13#10 +
'fmAttachmentEditor.Self.Caption=附件' + #13#10 +
'fmAttachmentEditor.tsAttachments.Caption=常规' + #13#10 +
'fmAttachmentEditor.btAdd.Caption=增加' + #13#10 +
'fmAttachmentEditor.btDelete.Caption=删除' + #13#10 +
'fmAttachmentEditor.btCancel.Caption=取消' + #13#10 +
'fmAttachmentEditor.btOk.Caption=确定' + #13#10 +
'' + #13#10 +
'[fAttachmentFrame]' + #13#10 +
'frAttachmentFrame.OpenDialog1.Filter=所有文件(*.*)|*.*' + #13#10 +
'frAttachmentFrame.OpenDialog1.Title=插入附件' + #13#10 +
'frAttachmentFrame.miOpen.Caption=打开附件...' + #13#10 +
'frAttachmentFrame.miInsert.Caption=插入附件...' + #13#10 +
'frAttachmentFrame.miRemove.Caption=移除附件' + #13#10 +
'frAttachmentFrame.acInsert.Hint=插入附件' + #13#10 +
'frAttachmentFrame.acRemove.Hint=移除附件' + #13#10 +
'frAttachmentFrame.acOpen.Hint=打开附件' + #13#10 +
'frAttachmentFrame.acLargeIcons.Caption=大图标' + #13#10 +
'frAttachmentFrame.acLargeIcons.Hint=大图标' + #13#10 +
'frAttachmentFrame.acSmallIcons.Caption=小图标' + #13#10 +
'frAttachmentFrame.acSmallIcons.Hint=小图标' + #13#10 +
'frAttachmentFrame.acList.Caption=列表' + #13#10 +
'frAttachmentFrame.acList.Hint=列表' + #13#10 +
'frAttachmentFrame.acReport.Caption=报表' + #13#10 +
'frAttachmentFrame.acReport.Hint=报表' + #13#10 +
'' + #13#10 +
'[fAttachPermissions]' + #13#10 +
'frAttachPermissions.cbShowAttachments.Caption=显示附件' + #13#10 +
'frAttachPermissions.cbDelAttachment.Caption=允许移除附件' + #13#10 +
'frAttachPermissions.cbInsAttachment.Caption=允许插入附件' + #13#10 +
'frAttachPermissions.cbEditAttachment.Caption=允许编辑附件' + #13#10 +
'' + #13#10 +
'[fDecisionEditor]' + #13#10 +
'fmDecisionEditor.Self.Caption=决定' + #13#10 +
'fmDecisionEditor.TabSheet1.Caption=常规' + #13#10 +
'fmDecisionEditor.Label1.Caption=条件表达式' + #13#10 +
'fmDecisionEditor.btCancel.Caption=取消' + #13#10 +
'fmDecisionEditor.btOk.Caption=确定' + #13#10 +
'' + #13#10 +
'[fFieldFrame]' + #13#10 +
'frFieldFrame.Label1.Caption=文本标题:' + #13#10 +
'frFieldFrame.Label2.Caption=流程变量:' + #13#10 +
'frFieldFrame.cbReadOnly.Caption=只读' + #13#10 +
'frFieldFrame.cbRequired.Caption=必须的' + #13#10 +
'frFieldFrame.btAdd.Caption=增加' + #13#10 +
'frFieldFrame.btDelete.Caption=删除' + #13#10 +
'' + #13#10 +
'[fscripteditor]' + #13#10 +
'fmScriptEditor.Self.Caption=脚本' + #13#10 +
'fmScriptEditor.tsScript.Caption=脚本源码' + #13#10 +
'fmScriptEditor.btCancel.Caption=取消' + #13#10 +
'fmScriptEditor.btOk.Caption=确定' + #13#10 +
'' + #13#10 +
'[fTaskEditor]' + #13#10 +
'fmTaskEditor.Self.Caption=任务' + #13#10 +
'fmTaskEditor.tsGeneral.Caption=常规' + #13#10 +
'fmTaskEditor.Label1.Caption=主题' + #13#10 +
'fmTaskEditor.Label2.Caption=描述' + #13#10 +
'fmTaskEditor.Label3.Caption=分配' + #13#10 +
'fmTaskEditor.cbMailNotification.Caption=发送邮件通知' + #13#10 +
'fmTaskEditor.TabSheet2.Caption=状态' + #13#10 +
'fmTaskEditor.Label4.Caption=状态列表(开始用 "*")' + #13#10 +
'fmTaskEditor.tsAttachment.Caption=附件' + #13#10 +
'fmTaskEditor.tsFields.Caption=字段' + #13#10 +
'fmTaskEditor.btAdd.Caption=增加' + #13#10 +
'fmTaskEditor.btDelete.Caption=删除' + #13#10 +
'fmTaskEditor.btCancel.Caption=取消' + #13#10 +
'fmTaskEditor.btOk.Caption=确定' + #13#10 +
'' + #13#10 +
'[fTaskInstanceView]' + #13#10 +
'frTaskInstanceView.Label1.Caption=主题:' + #13#10 +
'frTaskInstanceView.Label2.Caption=状态:' + #13#10 +
'' + #13#10 +
'[ftasklist]' + #13#10 +
'fmTaskList.Self.Caption=任务列表' + #13#10 +
'fmTaskList.btSaveChanges.Caption=保存更改' + #13#10 +
'fmTaskList.acShowOnlyOpen.Caption=只显示已查看过的任务' + #13#10 +
'fmTaskList.acShowAllTasks.Caption=显示所有任务' + #13#10 +
'fmTaskList.miView.Caption=视图' + #13#10 +
'' + #13#10 +
'[fTransitionEditor]' + #13#10 +
'fmTransitionEditor.Self.Caption=事务' + #13#10 +
'fmTransitionEditor.TabSheet1.Caption=常规' + #13#10 +
'fmTransitionEditor.Label1.Caption=条件表达式' + #13#10 +
'fmTransitionEditor.btCancel.Caption=取消' + #13#10 +
'fmTransitionEditor.btOk.Caption=确定' + #13#10 +
'' + #13#10 +
'[fvariableeditor]' + #13#10 +
'fmVariableEditor.Self.Caption=变量' + #13#10 +
'fmVariableEditor.TabSheet1.Caption=常规' + #13#10 +
'fmVariableEditor.Label1.Caption=值' + #13#10 +
'fmVariableEditor.btAdd.Caption=增加' + #13#10 +
'fmVariableEditor.btDelete.Caption=删除' + #13#10 +
'fmVariableEditor.btCancel.Caption=取消' + #13#10 +
'fmVariableEditor.btOk.Caption=确定' + #13#10 +
'' + #13#10 +
'[fWorkDefManager]' + #13#10 +
'fmWorkDefManager.Self.Caption=流程定义' + #13#10 +
'fmWorkDefManager.btAdd.Caption=增加' + #13#10 +
'fmWorkDefManager.btEdit.Caption=编辑' + #13#10 +
'fmWorkDefManager.btDelete.Caption=删除' + #13#10 +
'fmWorkDefManager.btRefresh.Caption=刷新' + #13#10 +
'fmWorkDefManager.btRunNew.Caption=运行 新建' + #13#10 +
'fmWorkDefManager.acImport.Caption=导入定义...' + #13#10 +
'fmWorkDefManager.acExport.Caption=导出所选择的定义...' + #13#10 +
'fmWorkDefManager.OpenDialog1.Filter=流程定义 (*.wfd)|*.wfd' + #13#10 +
'fmWorkDefManager.OpenDialog1.Title=导入流程定义' + #13#10 +
'fmWorkDefManager.SaveDialog1.Filter=流程定义 (*.wfd)|*.wfd' + #13#10 +
'fmWorkDefManager.SaveDialog1.Title=导出流程定义' + #13#10 +
'' + #13#10 +
'[fWorkflowEditor]' + #13#10 +
'fmWorkflowEditor.Self.Caption=图表编辑器' + #13#10 +
'fmWorkflowEditor.ToolBar1.Caption=工具栏1' + #13#10 +
'fmWorkflowEditor.btCheck.Caption=检查流程' + #13#10 +
'fmWorkflowEditor.ToolBar2.Caption=工具栏2' + #13#10 +
'fmWorkflowEditor.DgrColorSelector1.Hint=形状颜色' + #13#10 +
'fmWorkflowEditor.DgrGradientDirectionSelector1.Hint=渐变色' + #13#10 +
'fmWorkflowEditor.DgrBrushStyleSelector1.Hint=刷子样式' + #13#10 +
'fmWorkflowEditor.DgrShadowSelector1.Hint=阴影' + #13#10 +
'fmWorkflowEditor.DgrPenStyleSelector1.Hint=线条类型' + #13#10 +
'fmWorkflowEditor.DgrPenColorSelector1.Hint=线条颜色' + #13#10 +
'fmWorkflowEditor.DgrPenWidthSelector1.Hint=线条宽度' + #13#10 +
'fmWorkflowEditor.DgrTextColorSelector1.Hint=文本颜色' + #13#10 +
'fmWorkflowEditor.DiagramToolBar2.Category=工作流' + #13#10 +
'fmWorkflowEditor.File1.Caption=文件' + #13#10 +
'fmWorkflowEditor.Edit2.Caption=编辑' + #13#10 +
'fmWorkflowEditor.Copyasimage1.Caption=复制为图像' + #13#10 +
'fmWorkflowEditor.View1.Caption=视图' + #13#10 +
'fmWorkflowEditor.Zoom1.Caption=缩放' + #13#10 +
'fmWorkflowEditor.Edittext1.Caption=对象' + #13#10 +
'fmWorkflowEditor.Sourcearrow2.Caption=箭头起始点' + #13#10 +
'fmWorkflowEditor.Targetarrow2.Caption=箭头目标点' + #13#10 +
'fmWorkflowEditor.Workflow1.Caption=工作流' + #13#10 +
'fmWorkflowEditor.Variables1.Caption=变量...' + #13#10 +
'fmWorkflowEditor.Attachments1.Caption=附件...' + #13#10 +
'fmWorkflowEditor.DiagramCut1.Caption=剪切' + #13#10 +
'fmWorkflowEditor.DiagramCut1.Hint=剪切|剪切到粘贴板' + #13#10 +
'fmWorkflowEditor.DiagramCopy1.Caption=复制' + #13#10 +
'fmWorkflowEditor.DiagramCopy1.Hint=复制|复制到粘贴板' + #13#10 +
'fmWorkflowEditor.DiagramPaste1.Caption=粘贴' + #13#10 +
'fmWorkflowEditor.DiagramPaste1.Hint=粘贴|从粘贴板粘贴' + #13#10 +
'fmWorkflowEditor.DiagramSelectAll1.Caption=全选' + #13#10 +
'fmWorkflowEditor.DiagramSelectAll1.Hint=全选|选择所有对象' + #13#10 +
'fmWorkflowEditor.DiagramDelete1.Caption=删除' + #13#10 +
'fmWorkflowEditor.DiagramDelete1.Hint=删除对象|删除选择的对象' + #13#10 +
'fmWorkflowEditor.DiagramEditText1.Caption=编辑文本' + #13#10 +
'fmWorkflowEditor.DiagramEditText1.Hint=编辑文本' + #13#10 +
'fmWorkflowEditor.DiagramViewLeftRuler1.Caption=左侧标尺' + #13#10 +
'fmWorkflowEditor.DiagramViewLeftRuler1.Hint=显示/隐藏 左侧标尺' + #13#10 +
'fmWorkflowEditor.DiagramViewTopRuler1.Caption=顶部标尺' + #13#10 +
'fmWorkflowEditor.DiagramViewTopRuler1.Hint=显示/隐藏 顶部标尺' + #13#10 +
'fmWorkflowEditor.DiagramShapeColor1.Caption=形状颜色...' + #13#10 +
'fmWorkflowEditor.DiagramShapeColor1.Hint=形状颜色' + #13#10 +
'fmWorkflowEditor.DiagramLineColor1.Caption=线条颜色...' + #13#10 +
'fmWorkflowEditor.DiagramLineColor1.Hint=线条颜色' + #13#10 +
'fmWorkflowEditor.DiagramBlockPicture1.Caption=图像...' + #13#10 +
'fmWorkflowEditor.DiagramBlockPicture1.Hint=区块图像' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape1.Caption=无' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape2.Caption=虚线箭头' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape3.Caption=线条箭头' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape4.Caption=椭圆' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape5.Caption=圆角矩形' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape6.Caption=菱形' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape7.Caption=无' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape8.Caption=虚线箭头' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape9.Caption=线条箭头' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape10.Caption=椭圆' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape11.Caption=圆角矩形' + #13#10 +
'fmWorkflowEditor.DiagramArrowShape12.Caption=菱形' + #13#10 +
'fmWorkflowEditor.DiagramBringToFront1.Caption=前移' + #13#10 +
'fmWorkflowEditor.DiagramBringToFront1.Hint=前移' + #13#10 +
'fmWorkflowEditor.acNewDiagram.Caption=新建流程图...' + #13#10 +
'fmWorkflowEditor.acNewDiagram.Hint=新建流程图|创建一个新的流程图' + #13#10 +
'fmWorkflowEditor.acOpenDiagram.Caption=打开流程图...' + #13#10 +
'fmWorkflowEditor.acOpenDiagram.Hint=打开流程图|打开一个已经存在的流程图' + #13#10 +
'fmWorkflowEditor.acSaveDiagram.Caption=保存流程图...' + #13#10 +
'fmWorkflowEditor.acSaveDiagram.Hint=保存流程图|保存当前流程图' + #13#10 +
'fmWorkflowEditor.acPrintDiagram.Caption=&打印...' + #13#10 +
'fmWorkflowEditor.acPrintDiagram.Hint=打印流程图|打印当前流程图' + #13#10 +
'fmWorkflowEditor.acPreviewDiagram.Caption=打印预览...' + #13#10 +
'fmWorkflowEditor.acPreviewDiagram.Hint=打印预览|打印预览当前流程图' + #13#10 +
'fmWorkflowEditor.DiagramSendToBack1.Caption=后移' + #13#10 +
'fmWorkflowEditor.DiagramSendToBack1.Hint=后移' + #13#10 +
'fmWorkflowEditor.DiagramControlFont1.Caption=字体...' + #13#10 +
'fmWorkflowEditor.DiagramControlFont1.Hint=更改文本字体' + #13#10 +
'fmWorkflowEditor.DiagramGrid1.Caption=网格' + #13#10 +
'fmWorkflowEditor.DiagramGrid1.Hint=显示/隐藏网格' + #13#10 +
'fmWorkflowEditor.DiagramGradientSetting1.Caption=渐变色设置...' + #13#10 +
'fmWorkflowEditor.DiagramGradientSetting1.Hint=选择渐变色' + #13#10 +
'fmWorkflowEditor.DiagramShadow1.Caption=阴影设置...' + #13#10 +
'fmWorkflowEditor.DiagramShadow1.Hint=阴影设置' + #13#10 +
'fmWorkflowEditor.DiagramUndoAction1.Caption=撤销' + #13#10 +
'fmWorkflowEditor.DiagramRedoAction1.Caption=重做' + #13#10 +
'fmWorkflowEditor.acAutomaticNodes.Caption=自动节点' + #13#10 +
'fmWorkflowEditor.DiagramConnectionId1.Caption=变换' + #13#10 +
'fmWorkflowEditor.DiagramConnectionId1.Hint=变换' + #13#10 +
'fmWorkflowEditor.DiagramConnectionId2.Caption=侧面变换' + #13#10 +
'fmWorkflowEditor.DiagramConnectionId2.Hint=侧面变换' + #13#10 +
'fmWorkflowEditor.DiagramConnectionId3.Caption=弧形变换' + #13#10 +
'fmWorkflowEditor.DiagramConnectionId3.Hint=弧形变换' + #13#10 +
'fmWorkflowEditor.OpenDialog1.Filter=流程图(*.dgr)|*.dgr|所有文件 (*.*)|*.*' + #13#10 +
'fmWorkflowEditor.OpenDialog1.Title=选择流程图文件' + #13#10 +
'fmWorkflowEditor.SaveDialog1.Filter=流程图(*.dgr)|*.dgr|所有文件 (*.*)|*.*' + #13#10 +
'fmWorkflowEditor.SaveDialog1.Title=选择流程图文件' + #13#10 +
'fmWorkflowEditor.Sourcearrow1.Caption=起始箭头' + #13#10 +
'fmWorkflowEditor.Targetarrow1.Caption=目标箭头' + #13#10 +
'' + #13#10 +
'';

initialization
  _ResAddStrings(LanguageStr);

end.
