USE CRT_DEV;
GO


/* Load user context variables. */
DECLARE @utcdate DATETIME = (SELECT getutcdate() AS utcdate)
DECLARE @app_guid UNIQUEIDENTIFIER = (SELECT CASE WHEN SUSER_SID() IS NOT NULL THEN SUSER_SID() ELSE (SELECT CONVERT(uniqueidentifier,STUFF(STUFF(STUFF(STUFF('B00D00A0AC0A0D0C00DD00F0D0C00000',9,0,'-'),14,0,'-'),19,0,'-'),24,0,'-'))) END AS  app_guid)
DECLARE @app_user VARCHAR(30) = (SELECT CASE WHEN SUBSTRING(SUSER_NAME(),CHARINDEX('\',SUSER_NAME())+1,LEN(SUSER_NAME())) IS NOT NULL THEN SUBSTRING(SUSER_NAME(),CHARINDEX('\',SUSER_NAME())+1,LEN(SUSER_NAME())) ELSE CURRENT_USER END AS app_user)
DECLARE @app_user_dir VARCHAR(12) = (SELECT CASE WHEN LEN(SUBSTRING(SUSER_NAME(),0,CHARINDEX('\',SUSER_NAME(),0)))>1 THEN SUBSTRING(SUSER_NAME(),0,CHARINDEX('\',SUSER_NAME(),0)) ELSE 'WIN AUTH' END AS app_user_dir)


DELETE [dbo].[CRT_ELEMENT]
WHERE EXISTS
(
	SELECT *
	FROM  [dbo].[CRT_ELEMENT] E
--	WHERE E.CODE IN ('CAP_INDX','RC','NEARST_TWN')
)


INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sw-DFAA', 'Slides and Washouts under a DFAA claim', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Tc', 'Transit - Capital', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Ts', 'Transit - Operating', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('At', 'Transportation Policy & Programs - Active Transportation', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Ca', 'Climate Adaptation', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Rr', 'Remote & Rural Community Access', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Ce', 'Community Safety Enhancement Program', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Ho', 'Natural Gas', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bc', 'Bridge Coatings', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bd', 'Bridge Deck Resurfacing', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bi', 'Bridge Inspections', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bj', 'Bridge Joints', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bl', 'Lifeline Structures', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bm', 'Bridge Repair and Maintenance', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bn', 'Bridge Replacement', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Br', 'Bridge Rehabilitation', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bs', 'Bridge Scour ', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Qb', 'Seismic Upgrade', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Si', 'Enhanced Bridge Inspections', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Rb', 'Road Minor Betterments Hwys', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Rn', '1st Time Hard Surfacing', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Rs', 'Road Resurfacing', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('P3', 'P3', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Dr', 'Durable Pavement Markings', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Fe', 'Wildlife Fencing', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Gr', 'Guardrail', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('If', 'Inland Ferries', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sa', 'Avalanche Weather Network & Mitigation', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sf', 'Wildlife Accident Record Sys', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sg', 'Signs', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sp', 'Safety Program', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sx', 'Railway Crossings', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Ns', 'Ehhanced Sideroad - Surfacing', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Nu', 'Enhanced Sideroad - Upgrades', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Pts', 'Painting - Transverse Sideroads', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sc', 'Fish Culverts', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sd', 'Noxious Weeds', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sh', 'Capital Maintenance', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sm', 'CHRIS & HPMA & BMIS', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sn', 'Electrical Installation', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('So', 'Recoverable Rehab Operations', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sr', 'Sideroad Resurfacing', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Ss', 'Seasonal Strength Loss Contracts', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('St', 'Traffic Data Program', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Su', 'Sideroad Upgrading', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Mo', 'Re-Profiled Projects', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Not Applicable', 'Blank Element', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sw', 'Slides and Washouts', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('CC', 'Cariboo Connector', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Ex', 'Expansion - General', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Lr', 'Rest Areas', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Bb', 'Bike BC', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Cn', 'Program Contingency', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Cv', 'Community Volunteer', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Dd', 'Emergency Contingency', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('En', 'Unknown', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Hf', 'High Friction Surface Treatment', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Mc', 'Unknown', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Mp', 'Mountain Pine Beetle', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Ogi', 'Unknown', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Sb', 'Unknown', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
INSERT INTO [dbo].[CRT_ELEMENT] (CODE, DESCRIPTION, APP_CREATE_USERID, APP_CREATE_TIMESTAMP, APP_CREATE_USER_GUID, APP_LAST_UPDATE_USERID, APP_LAST_UPDATE_TIMESTAMP, APP_LAST_UPDATE_USER_GUID) VALUES ('Unknown', 'Unknown', @app_user, @utcdate, @app_guid, @app_user, @utcdate, @app_guid);
