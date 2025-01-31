📌 README.md – Data Cleaning for COVID-19 Analysis (SQL Server)
# 🛠️ Data Cleaning – COVID-19 Analysis (SQL Server)

This document outlines the **data cleaning process** applied to the `CovidDeaths` and `CovidVaccinations` datasets before conducting further analysis.

## 📝 **Why Data Cleaning?**
Real-world datasets often contain **missing, incorrect, or inconsistent data**. Cleaning the data ensures:
- More accurate analysis
- Fewer SQL errors due to incorrect data types
- Better performance in queries and reports                           ```sql

---

###🔍 1. Converting Data Types for Numerical Columns
```sql
ALTER TABLE CovidDeaths
ALTER COLUMN total_cases BIGINT;

ALTER TABLE CovidDeaths
ALTER COLUMN total_deaths BIGINT;

ALTER TABLE CovidVaccinations
ALTER COLUMN total_tests BIGINT;

ALTER TABLE CovidVaccinations
ALTER COLUMN total_vaccinations BIGINT;
```
Why?
These columns were stored as NVARCHAR, causing SQL errors. Converting them to BIGINT ensures correct calculations.

###🔍 2. Handling NULL Values in Key Metrics
```sql
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
```
Why?
A NULL value in numerical columns may mean "no data reported" rather than "no cases/tests". We replace NULL with 0 to prevent incorrect results in analysis.

###🔍 3. Removing Records Where continent is NULL
```sql
DELETE FROM CovidDeaths
WHERE continent IS NULL;

DELETE FROM CovidVaccinations
WHERE continent IS NULL;
```
Why?
Records with continent IS NULL represent aggregated data (e.g., "World", "High-income countries"). If focusing only on countries, these records can be removed.




