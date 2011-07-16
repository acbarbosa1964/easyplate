INSERT INTO [EasyERP].[dbo].[sysPluginsDirectory]
           ([PluginGUID]
           ,[PluginName]
           ,[iOrder]
           ,[PluginParamGUID]
           ,[ImageIndex]
           ,[SelectedImageIndex]
           ,[IsDirectory]
           ,[PluginFileName]
           ,[PluginFile]
           ,[ParentPluginGUID]
           ,[IsEnable])
     VALUES
           ('{00000000-0000-0000-0000-000000000000}'
           ,'表结构维护'
           ,0
           ,NULL
           ,0
           ,1
           ,1
           ,'pkEasyDBTool.bpl'
           ,NULL
           ,'{00000000-0000-0000-0000-000000000000}'
           ,1)
GO


