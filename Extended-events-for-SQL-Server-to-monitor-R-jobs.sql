-- from https://docs.microsoft.com/en-us/sql/advanced-analytics/r/extended-events-for-sql-server-r-services?view=sql-server-2017

SELECT o.name AS event_name, o.description
FROM sys.dm_xe_objects o
JOIN sys.dm_xe_packages p
ON o.package_guid = p.guid
WHERE o.object_type = 'event'
AND p.name = 'SQLSatellite';
