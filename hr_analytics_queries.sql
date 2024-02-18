-- Develop a JOIN table
select * from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;

-- Find the healthiest employees for the bonus
select * from Absenteeism_at_work
where Social_drinker = 0 and
Social_smoker = 0 and
Body_mass_index <25 and
Absenteeism_time_in_hours < (select AVG(Absenteeism_time_in_hours) from Absenteeism_at_work)

-- Compensation rate increase for non-smokers // budget $983,221 so 0.68 per hour // 1,414.4 per year
select COUNT(*) as nonsmokers from Absenteeism_at_work
where Social_smoker =0

-- Optimize this query
select
a.ID,
r.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Body_mass_index <18.5 THEN 'UnderWeight'
	 WHEN Body_mass_index between 18.5 and 25 THEN 'HealthyWeight'
	 WHEN Body_mass_index between 25 and 30 THEN 'OverWeight'
	 WHEN Body_mass_index > 30 THEN 'Obese'
	 ELSE 'Unknown' END AS BMI_Category,
CASE WHEN Month_of_absence IN (12,1,2) then 'Winter'
     WHEN Month_of_absence IN (3,4,5) then 'Spring'
     WHEN Month_of_absence IN (6,7,8) then 'Summer'
	 WHEN Month_of_absence IN (9,10,11) then 'Fall'
	 else 'Unknown' END as Season_Names,
Seasons,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
from Absenteeism_at_work a
left join compensation b
on a.ID = b.ID
left join Reasons r on
a.Reason_for_absence = r.Number;