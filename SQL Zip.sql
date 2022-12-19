
--Sum of Black African Americans (BAA) and Hispanic/ Latino populations per ZIP code. And the milage between them and Headlands Orland HQ
SELECT orland_black.Zip_code, SUM(black_pop_count) + SUM(hispanic_pop_count) AS total_pop_count, orland_black.Location, 
orland_black.miles AS miles_from_Orland_HQ , orland_black.avg_time AS avg_time_in_minutes
FROM orland_black
inner join orland_hispanic 
on orland_black.Zip_Code = orland_hispanic.Zip_Code
GROUP BY orland_black.Zip_Code, orland_black.Location, orland_black.miles, orland_black.avg_time

--count BAA and His/Latino ZIP sepereat (ZIP that are not common between both)  
SELECT orland_black.Zip_code AS black_zip_only, orland_black.Location AS BAA_zip_only, round(SUM(black_pop_count),0) AS Black_pop_count, 
orland_black.Miles, orland_black.avg_time, orland_hispanic.zip_code AS hispanic_zip_only, round(SUM(hispanic_pop_count),0) as hispanic_pop_count,
orland_hispanic.Location AS his_lat_zip_only, 
orland_hispanic.miles AS miles_from_Orland_HQ, orland_hispanic.avg_time AS avg_time_in_minutes
FROM orland_black
full outer join orland_hispanic 
on orland_black.Zip_Code = orland_hispanic.Zip_Code
WHERE orland_black.Zip_Code IS NULL or orland_hispanic.Zip_Code is null
GROUP BY orland_black.Zip_Code, orland_hispanic.zip_code, orland_hispanic.Location, orland_hispanic.miles, orland_hispanic.avg_time, 
orland_black.Location, orland_black.Miles, orland_black.avg_time