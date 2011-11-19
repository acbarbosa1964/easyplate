--职位表
CREATE TABLE infDeptPostion(
PostGUID		VARCHAR(50) NOT NULL PRIMARY KEY,
PostCName	    VARCHAR(100) NOT NULL, 
PostEName	    VARCHAR(100),
PostTypeGUID    VARCHAR(50) NOT NULL,--岗位类型
DeptGUID		VARCHAR(50) NOT NULL,
PostBasePay     Float DEFAULT 0.0, --岗位基本工资
AssessTypeGUID  VARCHAR(50), --考核方式
PostRankHigh		INT DEFAULT 0,--等级上限
PostRankLow		    INT DEFAULT 0,--等级下限
PersonnelNumbers INT DEFAULT 0, --定编人员数量
IsEnable        bit DEFAULT 1,
OrderNo			INT DEFAULT 0,
Remark          VARCHAR(255)
)

CREATE INDEX index_PostGUID ON infDeptPostion(PostGUID);
CREATE INDEX index_PostCName ON infDeptPostion(PostCName);
CREATE INDEX index_PostDeptGUID ON infDeptPostion(DeptGUID);
--部门GUID外键约束
ALTER TABLE infDeptPostion ADD CONSTRAINT FK_PostDeptGUID FOREIGN KEY(DeptGUID)
 REFERENCES infCompanyDept(DeptGUID)
 
 
 SELECT * FROM vw_infDeptPostion
 
  
 SELECT * FROM vw_infCompanyDept
 
 SELECT * FROM vw_SysDataList WHERE SysDataName LIKE '%出勤%'
 
 SELECT * FROM vw_SysDataList WHERE ParentDataListGUID = '{24E73232-9A89-465B-AE87-3D2510F0E4E5}' ORDER BY OrderNo
 SELECT * FROM vw_SysDataList WHERE ParentDataListGUID = '{2B8E69F4-2D06-4A3B-A9C2-B4B79E698649}' ORDER BY OrderNo
 