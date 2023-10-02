IF NOT EXISTS (SELECT 1 FROM [dbo].[HostSettings] WHERE [SettingName] = N'SiteLogBuffer')
BEGIN
	INSERT INTO [dbo].[HostSettings] ([SettingName], [SettingValue], [SettingIsSecure], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) 
	VALUES (N'SiteLogBuffer', N'1', 0, -1, GETDATE(), -1, GETDATE());
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[HostSettings] WHERE [SettingName] = N'SiteLogHistory')
BEGIN
	-- update the number of days to be any number you desire
	INSERT INTO [dbo].[HostSettings] ([SettingName], [SettingValue], [SettingIsSecure], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) 
	VALUES (N'SiteLogHistory', N'60', 0, -1, GETDATE(), -1, GETDATE());
END

-- run this query for each portal in your installation you wish to support, changing the PortalID to match, as required
IF NOT EXISTS (SELECT 1 FROM [dbo].[PortalSettings] WHERE [SettingName] = N'SiteLogHistory')
BEGIN
	-- update the number of days to be any number you desire
	INSERT INTO [dbo].[PortalSettings] ([PortalId], [SettingName], [SettingValue], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) 
	VALUES (0, N'SiteLogHistory', N'60', -1, GETDATE(), -1, GETDATE());
END

IF NOT EXISTS (SELECT 1 FROM [dbo].[HostSettings] WHERE [SettingName] = N'SiteLogStorage')
BEGIN
	INSERT INTO [dbo].[HostSettings] ([SettingName], [SettingValue], [SettingIsSecure], [CreatedByUserID], [CreatedOnDate], [LastModifiedByUserID], [LastModifiedOnDate]) 
	VALUES (N'SiteLogStorage', N'D', 0, -1, GETDATE(), -1, GETDATE());
END