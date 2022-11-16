USE StudiesDashboard1;

SELECT
CONCAT([URL], + [Project ID]) as 'EDGE Link',
[R&I Number],
[Short Title],
CASE 
	WHEN [Clinical Service Unit] = '' THEN '*Not Known*'
	else [Clinical Service Unit]
	end as [Clinical Service Unit CASED],
CASE 
	WHEN [Main Speciality] = '' THEN '*Not Known*'
	else [Main Speciality]
	end as [Speciality CASED],
CASE 
	WHEN [Name of Department] = '' THEN '*Not Recorded*'
	else [Name of Department]
	end as [Name of Department CASED],
[Date Site Invited],
[Date Site Selected],
[Date Open to Recruitment],
[Planned Recruitment End Date],
CASE 
	WHEN [Site Status] = '' THEN '*Not Known*'
	else [Site Status]
	end as [Site Status CASED],
CASE 
	WHEN [Principal Investigator] = '' THEN '*Not Known*'
	WHEN [Principal Investigator] = ',' THEN '*Not Known*'
	else [Principal Investigator]
	end as [Principal Investigator CASED],
--[Study Type],
CASE 
	WHEN [Study Type] = '' THEN '*Not Known*'
	else [Study Type]
	end as [Study Type CASED],
[Target Participants(Local Sum)] AS [Target Participants],
[Actual Participants Recruited],

CASE 
	WHEN [Sponsors] = '' THEN '*Not Known*'
	else [Sponsors]
	end as [Sponsors CASED],


CASE 
	WHEN [NIHR Organisation] = '' THEN '*Not Known*'
	else [NIHR Organisation]
	end as [NIHR Organisation CASED],

CASE 
	WHEN [IRAS Categories] = 'Clinical trial of an investigational medicinal product' THEN '01. CTIMP'
	WHEN [IRAS Categories] =  'Clinical investigation or other study of a medical device' THEN '02. Medical Device'
	WHEN [IRAS Categories] = 'Combined trial of an investigational medicinal product and an investigational medical device' THEN '03. CTIMP and Medical Device Combined'
	WHEN [IRAS Categories] = 'Other clinical trial to study a novel intervention or randomised clinical trial to compare interventions in clinical practice' THEN '04. Other Clinical Trial'
	WHEN [IRAS Categories] = 'Basic science study involving procedures with human participants' THEN '05. Basic Science'
	WHEN [IRAS Categories] = 'Study administering questionnaires/interviews for quantitative analysis, or using mixed quantitative/qualitative methodology' THEN '06. Questionnaire'
	WHEN [IRAS Categories] = 'Study involving qualitative methods only' THEN '07. Qualitative'
	WHEN [IRAS Categories] = 'Study limited to working with human tissue samples (or other human biological samples) and data (specific project only)' THEN '08. Human Tissue Samples'
	WHEN [IRAS Categories] = 'Study limited to working with data (specific project only)' THEN '09. Study Limited to Data'
	WHEN [IRAS Categories] = 'Research tissue bank' THEN '10. Research Tissue Bank'
	WHEN [IRAS Categories] = 'Research database' THEN '11. Research Database'
    WHEN [IRAS Categories] = 'Other research' THEN '12. Other'
	WHEN [IRAS Categories] = 'Other Study' THEN 'Other Study'	
	ELSE '*Not Known*'
END AS [IRAS Categories CASED]
FROM dbo.AllStudies_2022
WHERE CONCAT([URL], + [Project ID]) != ''
--AND [IRAS Categories] = 'Research database'
--AND [R&I Number] = 'RR18/109549'

--CASE
--1.CSU x
--2. Name of Department x
--3. Speciality x
--4. Study Type x
--5. Iras Category x
--6. Site Status x
--7. Principle Investigator x
--8. NIHR Orginastion x
--9. Sponsor