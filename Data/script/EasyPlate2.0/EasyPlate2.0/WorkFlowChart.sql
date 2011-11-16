--Á÷³ÌÍ¼±í
CREATE TABLE sysWorkFlowChart(
	GUID VARCHAR(50) NOT NULL PRIMARY KEY,
	FlowChartName VARCHAR(255) NOT NULL,
	BGColor INT,
	FlowChart TEXT
)

CREATE UNIQUE INDEX [index_FlowChartName] 
ON sysWorkFlowChart(FlowChartName ASC)

CREATE UNIQUE INDEX [index_FlowChartGUID] 
ON sysWorkFlowChart(GUID ASC)

CREATE VIEW vw_sysWorkFlowChart
AS
	SELECT * FROM sysWorkFlowChart
SELECT * FROM vw_sysWorkFlowChart

INSERT INTO sysWorkFlowChart VALUES(NEWID(), 'TEST', 0, NULL)

SELECT * FROM vw_sysWorkFlowChart

43B84654-DD93-4732-B2EC-8786A82B0053

SELECT * FROM vw_sysWorkFlowChart

DELETE FROM vw_sysWorkFlowChart


ALTER TABLE sysWorkFlowChart DROP COLUMN FlowChart Image
ALTER TABLE sysWorkFlowChart ADD FlowChart Image
