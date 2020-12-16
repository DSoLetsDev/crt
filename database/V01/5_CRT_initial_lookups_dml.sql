-- =============================================
-- Author:		
-- Create date: 
-- Updates: 
-- 	2020-12-04: Initial script (YC)
-- Description:	DML to set initial lookup values.
-- =============================================

USE CRT_DEV; -- uncomment appropriate instance
--USE CRT_TST;
--USE CRT_UAT;
--USE CRT_PRD;
GO


/* Load user context variables.  Redeclared further below for subsequent executions */

DECLARE @utcdate DATETIME = (SELECT getutcdate() AS utcdate)
DECLARE @app_guid UNIQUEIDENTIFIER = (SELECT CASE WHEN SUSER_SID() IS NOT NULL THEN SUSER_SID() ELSE (SELECT CONVERT(uniqueidentifier,STUFF(STUFF(STUFF(STUFF('B00D00A0AC0A0D0C00DD00F0D0C00000',9,0,'-'),14,0,'-'),19,0,'-'),24,0,'-'))) END AS  app_guid)
DECLARE @app_user VARCHAR(30) = (SELECT CASE WHEN SUBSTRING(SUSER_NAME(),CHARINDEX('\',SUSER_NAME())+1,LEN(SUSER_NAME())) IS NOT NULL THEN SUBSTRING(SUSER_NAME(),CHARINDEX('\',SUSER_NAME())+1,LEN(SUSER_NAME())) ELSE CURRENT_USER END AS app_user)
DECLARE @app_user_dir VARCHAR(12) = (SELECT CASE WHEN LEN(SUBSTRING(SUSER_NAME(),0,CHARINDEX('\',SUSER_NAME(),0)))>1 THEN SUBSTRING(SUSER_NAME(),0,CHARINDEX('\',SUSER_NAME(),0)) ELSE 'WIN AUTH' END AS app_user_dir)

/* Insert Roles and Permissions */

INSERT INTO CRT_PERMISSION (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('CODE_W', 'Code Write',@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_PERMISSION (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('CODE_R', 'Code Read',@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_PERMISSION (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('USER_W', 'User Write',@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_PERMISSION (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('USER_R', 'User Read',@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_PERMISSION (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('ROLE_W', 'Role Write',@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_PERMISSION (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('ROLE_R', 'Role Read',@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_PERMISSION (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('FILE_W', 'File Upload Write',@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_PERMISSION (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('FILE_R', 'File Upload Read',@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);

INSERT INTO CRT_ROLE (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('SYSTEM_ADMIN', 'System Administrator', @app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('DISTRICT_ADMIN', 'District Administrator', @app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('STAFF', 'Staff', @app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('MANAGER_OPERATION', 'Manager/Operations', @app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE (NAME,DESCRIPTION,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ('MAINT_CONTRACTOR', 'Maintenance Contractor', @app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);


INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'SYSTEM_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'CODE_W'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'SYSTEM_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'CODE_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'SYSTEM_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'USER_W'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'SYSTEM_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'USER_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'SYSTEM_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'ROLE_W'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'SYSTEM_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'ROLE_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'DISTRICT_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'CODE_W'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'DISTRICT_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'CODE_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'DISTRICT_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'USER_W'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'DISTRICT_ADMIN'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'USER_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'STAFF'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'CODE_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'MANAGER_OPERATION'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'CODE_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'MANAGER_OPERATION'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'USER_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'MANAGER_OPERATION'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'ROLE_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'MAINT_CONTRACTOR'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'FILE_W'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);
INSERT INTO CRT_ROLE_PERMISSION (ROLE_ID,PERMISSION_ID,APP_CREATE_USERID,APP_CREATE_TIMESTAMP,APP_CREATE_USER_GUID,APP_CREATE_USER_DIRECTORY,APP_LAST_UPDATE_USERID,APP_LAST_UPDATE_TIMESTAMP,APP_LAST_UPDATE_USER_GUID,APP_LAST_UPDATE_USER_DIRECTORY) VALUES ((SELECT ROLE_ID FROM CRT_ROLE WHERE NAME = 'MAINT_CONTRACTOR'), (SELECT PERMISSION_ID FROM CRT_PERMISSION WHERE NAME = 'FILE_R'),@app_user,@utcdate,@app_guid,@app_user_dir,@app_user,@utcdate,@app_guid,@app_user_dir);

GO

/* Insert Initial Code Lookup values */

INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'dollars', 'dollars',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'each ', 'ea',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'hours ', 'hours',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'km ', 'km',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'lane km', 'lkm',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'line km', 'line km',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'lineal metres ', 'lin m',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'litre ', 'litre',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'm2 ', 'm2',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'm3 ', 'm3',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'pass km', 'pk',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'road km', 'rd km',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'shoulder km ', 'sh km',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'site ', 'site',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'site/number ', 'site/num',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'tonne ', 'tonne',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('UOM', 'number ', 'num',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Deer', '','1', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Moose', '','2', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Elk', '','3', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Bear', '','4', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Sheep', '','5', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Caribou', '','6', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Coyote', '','7', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Porcupine', '','8', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Cougar', '','9', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Raccoon', '','10', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Bobcat', '','11', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Skunk', '','12', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Wolf', '','13', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Fox', '','14', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Beaver', '','15', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Horned Owl', '','16', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Muskrat', '','17', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Eagle', '','18', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Buffalo', '','19', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Badger', '','20', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Possum', '','21', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Otter', '','22', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Lynx', '','23', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Marten', '','24', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Rabbit', '','25', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Other', '','26', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Unknown', '','27', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'White Tail Deer', '','28', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Mule Deer', '','29', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Black Bear', '','30', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SPECIES', 'Grizzly Bear', '','31', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_TIME', 'Dawn', '','1', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_TIME', 'Dusk', '','2', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_TIME', 'Day', '','3', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_TIME', 'Dark', '','4', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_TIME', 'Unknown', '','5', NULL, 'NUMBER');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SIGN_IND', 'Yes', 'Y',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SIGN_IND', 'No', 'N',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SIGN_IND', 'Unknown', 'U',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SEX', 'Male', 'M',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SEX', 'Female', 'F',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_SEX', 'Unknown', 'U',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_AGE', 'Adult', 'A',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_AGE', 'Young', 'Y',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_AGE', 'Unknown', 'U',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WRK_RPT_MAINT_TYPE', 'Quantified', 'Q',NULL, '2', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WRK_RPT_MAINT_TYPE', 'Routine', 'R',NULL, '1', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WRK_RPT_MAINT_TYPE', 'Major Event', 'E',NULL, '4', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WRK_RPT_MAINT_TYPE', 'Additional', 'A',NULL, '3', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('VOLUME_RANGE1', '< 0.03 m'+NCHAR(0xb3)+'', '<0.03',NULL, '1', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('VOLUME_RANGE1', '0.03 m'+NCHAR(0xb3)+' to 0.1 m'+NCHAR(0xb3)+' ', '0.03-0.1',NULL, '2', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('VOLUME_RANGE1', '0.1 m'+NCHAR(0xb3)+' to 0.3 m'+NCHAR(0xb3)+' ', '0.1-0.3',NULL, '3', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('VOLUME_RANGE1', '0.3 m'+NCHAR(0xb3)+' to 0.5 m'+NCHAR(0xb3)+' ', '0.3-0.5',NULL, '4', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('VOLUME_RANGE1', '0.5 m'+NCHAR(0xb3)+' to 1.0 m'+NCHAR(0xb3)+' ', '0.5-1.0',NULL, '5', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('VOLUME_RANGE1', '1.0 m'+NCHAR(0xb3)+' to 5.0 m'+NCHAR(0xb3)+'', '1.0-5.0',NULL, '6', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('VOLUME_RANGE1', '>5.0 m'+NCHAR(0xb3)+' ', '>5.0',NULL, '7', 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_RPT_RECORD_TYPE', 'WARS', 'W',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_RPT_SIGN', 'Yes', 'Y',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_RPT_SIGN', 'No', 'N',NULL, NULL, 'STRING');
GO
INSERT INTO CRT_CODE_LOOKUP (CODE_SET, CODE_NAME, CODE_VALUE_TEXT, CODE_VALUE_NUM, DISPLAY_ORDER, CODE_VALUE_FORMAT) VALUES ('WARS_RPT_SIGN', 'Unknown', 'U',NULL, NULL, 'STRING');
GO

