📌 README.md – Data Cleaning for COVID-19 Analysis (SQL Server)
md
Copy
Edit
# 🛠️ Data Cleaning – COVID-19 Analysis (SQL Server)

This document outlines the **data cleaning process** applied to the `CovidDeaths` and `CovidVaccinations` datasets before conducting further analysis.

## 📝 **Why Data Cleaning?**
Real-world datasets often contain **missing, incorrect, or inconsistent data**. Cleaning the data ensures:
- More accurate analysis
- Fewer SQL errors due to incorrect data types
- Better performance in queries and reports

---

## 🔍 **1. Removing Invalid Country Codes**
```sql
DELETE FROM CovidDeaths
WHERE iso_code IN ('OWID_INT', 'OWID_CYN');

DELETE FROM CovidVaccinations
WHERE iso_code IN ('OWID_INT', 'OWID_CYN');
Why?
These codes (OWID_INT, OWID_CYN) represent non-country entities (e.g., international reports) and should be removed for country-level analysis.

🔍 2. Filling Missing population Values
sql
Copy
Edit
UPDATE d
SET d.population = p.population
FROM CovidDeaths d
JOIN (
    SELECT iso_code, MAX(population) AS population
    FROM CovidDeaths
    WHERE population IS NOT NULL
    GROUP BY iso_code
) p ON d.iso_code = p.iso_code
WHERE d.population IS NULL;

UPDATE v
SET v.population = p.population
FROM CovidVaccinations v
JOIN (
    SELECT iso_code, MAX(population) AS population
    FROM CovidDeaths
    WHERE population IS NOT NULL
    GROUP BY iso_code
) p ON v.iso_code = p.iso_code
WHERE v.population IS NULL;
Why?
Some rows have NULL in population. We replace them with the most recent known population value for the same country.

🔍 3. Converting Data Types for Numerical Columns
sql
Copy
Edit
ALTER TABLE CovidDeaths
ALTER COLUMN total_cases BIGINT;

ALTER TABLE CovidDeaths
ALTER COLUMN total_deaths BIGINT;

ALTER TABLE CovidVaccinations
ALTER COLUMN total_tests BIGINT;

ALTER TABLE CovidVaccinations
ALTER COLUMN total_vaccinations BIGINT;
Why?
These columns were stored as NVARCHAR, causing SQL errors. Converting them to BIGINT ensures correct calculations.

🔍 4. Handling NULL Values in Key Metrics
sql
Copy
Edit
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
Why?
A NULL value in numerical columns may mean "no data reported" rather than "no cases/tests". We replace NULL with 0 to prevent incorrect results in analysis.

🔍 5. Keeping new_vaccinations for Trend Analysis
sql
Copy
Edit
UPDATE CovidVaccinations
SET new_vaccinations = 0
WHERE new_vaccinations IS NULL;
Why?
Unlike other vaccination columns, new_vaccinations is useful for tracking daily vaccination trends. We replace NULL with 0 for consistency.

🔍 6. (Optional) Removing Records Where continent is NULL
sql
Copy
Edit
DELETE FROM CovidDeaths
WHERE continent IS NULL;

DELETE FROM CovidVaccinations
WHERE continent IS NULL;
Why?
Records with continent IS NULL represent aggregated data (e.g., "World", "High-income countries"). If focusing only on countries, these records can be removed.

✅ Final Check
After cleaning, run this query to ensure there are no remaining issues:

sql
Copy
Edit
SELECT * FROM CovidDeaths WHERE population IS NULL;
SELECT * FROM CovidVaccinations WHERE new_vaccinations IS NULL;
If these return zero rows, the cleaning process was successful! 🎯
