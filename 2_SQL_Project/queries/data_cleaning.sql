
--The dataset stored numbers as text (NVARCHAR), which causes errors when using SUM() or AVG().
--We convert key columns (total_cases, total_deaths, total_tests, etc.) to BIGINT to ensure proper calculations.
ALTER TABLE CovidDeaths
ALTER COLUMN total_cases BIGINT;

ALTER TABLE CovidDeaths
ALTER COLUMN new_cases BIGINT;

ALTER TABLE CovidDeaths
ALTER COLUMN total_deaths BIGINT;

ALTER TABLE CovidDeaths
ALTER COLUMN new_deaths BIGINT;

ALTER TABLE CovidVaccinations
ALTER COLUMN total_tests BIGINT;

ALTER TABLE CovidVaccinations
ALTER COLUMN total_vaccinations BIGINT;

ALTER TABLE CovidVaccinations
ALTER COLUMN new_vaccinations BIGINT;


-- replace null values in key columns with 0 
-- For numerical columns, missing values (NULL) might mean no cases/deaths/tests recorded, not missing data.
-- We replace NULL with 0 to avoid miscalculations in reports.
UPDATE CovidDeaths
SET total_cases = 0
WHERE total_cases IS NULL;

UPDATE CovidDeaths
SET total_deaths = 0
WHERE total_deaths IS NULL;

UPDATE CovidVaccinations
SET total_tests = 0
WHERE total_tests IS NULL;

UPDATE CovidVaccinations
SET total_vaccinations = 0
WHERE total_vaccinations IS NULL;

UPDATE CovidVaccinations
SET new_vaccinations = 0
WHERE new_vaccinations IS NULL;

-- Some columns contain too many missing values (85% or more). 
-- Removing them helps optimize storage and speed up queries.
ALTER TABLE CovidDeaths
DROP COLUMN icu_patients, icu_patients_per_million, 
             hosp_patients, hosp_patients_per_million, 
             weekly_icu_admissions, weekly_icu_admissions_per_million, 
             weekly_hosp_admissions, weekly_hosp_admissions_per_million;

ALTER TABLE CovidVaccinations
DROP COLUMN people_fully_vaccinated, people_fully_vaccinated_per_hundred, 
             people_vaccinated, people_vaccinated_per_hundred, 
             total_vaccinations_per_hundred;



-- This removes non-country data, ensuring you're only working with country-level records.
DELETE FROM CovidDeaths 
WHERE continent IS NULL;

DELETE FROM CovidVaccinations 
WHERE continent IS NULL;











