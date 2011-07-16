INSERT INTO [EasyERP].[dbo].[sysRole]
           ([RoleGUID]
           ,[RoleName]
           ,[DeptGUID]
           ,[ParentRoleGUID]
           ,[Discription]
           ,[iOrder])
     VALUES
           ('{00000000-0000-0000-0000-000000000000}'
           ,'系统管理员'
           ,'{00000000-0000-0000-0000-000000000000}'
           ,'{00000000-0000-0000-0000-000000000000}'
           ,'系统管理员'
           ,0)
           
INSERT INTO [EasyERP].[dbo].[sysRole]
           ([RoleGUID]
           ,[RoleName]
           ,[DeptGUID]
           ,[ParentRoleGUID]
           ,[Discription]
           ,[iOrder])
     VALUES
           ('{00000000-0000-0000-0000-000000000001}'
           ,'普通员工'
           ,'{00000000-0000-0000-0000-000000000000}'
           ,'{00000000-0000-0000-0000-000000000000}'
           ,'普通员工'
           ,1)           
GO


