SELECT 
	CONCAT([pupil first name], ' ', [pupil last name]) AS [Pupil Name], 
	CONVERT (DATE,[Date of Birth]) AS [Date of Birth], 
	DATEADD(YEAR,2021 - YEAR([Date of Birth]),CONVERT (DATE,[Date of Birth])) AS [This Year's Birthday],
	DATENAME(MONTH,CONVERT(DATE,[Date of Birth])) AS Month, 

CASE
	WHEN DATENAME(WEEKDAY,DATEADD(year,2021 - YEAR([Date of Birth]),CONVERT (DATE,[Date of Birth]))) = 'Saturday' THEN 'Friday'
	WHEN DATENAME(WEEKDAY,DATEADD(year,2021 - YEAR([Date of Birth]),CONVERT (DATE,[Date of Birth]))) = 'Sunday' THEN 'Friday'
	ELSE DATENAME(WEEKDAY,DATEADD(year,2021 - YEAR([Date of Birth]),CONVERT (DATE,[Date of Birth]))) 
END AS [Cake Needed On]

FROM dbo.preppingDataWk2


