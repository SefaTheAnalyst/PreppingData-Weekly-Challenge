SELECT a.[Passed Subjects],b.[Student's Avg Score],a.[Student ID],Gender
	FROM
--converting columns to rows using unpivot function
	(SELECT [Student ID],COUNT([Student ID]) AS [Passed Subjects] from
	(SELECT [Student ID], Maths,English,Spanish,Science,Art,History,Geography
FROM PreppingData.dbo.preppingDataWk3) Scores

 UNPIVOT
	(Marks FOR Subject IN (Maths,English,Spanish,Science,Art,History,Geography)
	) as Unpivt_marks
	WHERE Marks >=75
GROUP BY [Student ID]) a,


(SELECT 
	ROUND((Maths+English+Spanish+Science+Art+History+Geography)/7,1) AS [Student's Avg Score],id,
	[Student ID], Gender
FROM PreppingData.dbo.preppingDataWk2 AS wk1
	JOIN PreppingData.dbo.preppingDataWk3 AS wk3
	ON wk1.id = wk3.[Student ID]
	WHERE (Maths+English+Spanish+Science+Art+History+Geography)/7 >=75 ) b
WHERE a.[Student ID] = b.id