# 🛠️ Data Cleaning – COVID-19 Analysis (SQL Server)

This document outlines the **data cleaning process** applied to the `CovidDeaths` and `CovidVaccinations` datasets before conducting further analysis.

## 📝 **Why Data Cleaning?**
Cleaning **missing, incorrect, or inconsistent data** ensures:
- More accurate analysis
- Fewer SQL errors due to incorrect data types
- Better performance in queries and reports                          

---

### 🔍 1. Converting Data Types for Numerical Columns
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
**Why?**
These columns were stored as NVARCHAR, causing SQL errors. Converting them to BIGINT ensures correct calculations.

### 🔍 2. Handling NULL Values in Key Columns
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
**Why?**
A NULL value in numerical columns may mean "no data reported" rather than "no cases/tests". We replace NULL with 0 to prevent incorrect results in analysis.

### 🔍 3. Removing Records Where continent is NULL
```sql
DELETE FROM CovidDeaths
WHERE continent IS NULL;

DELETE FROM CovidVaccinations
WHERE continent IS NULL;
```
**Why?**
Records with continent IS NULL represent aggregated data (e.g., "World", "High-income countries"). If focusing only on countries, these records can be removed.

### 🔍 4. Removing Highly Incomplete Columns 
```sql
ALTER TABLE CovidDeaths
DROP COLUMN icu_patients, icu_patients_per_million, 
             hosp_patients, hosp_patients_per_million, 
             weekly_icu_admissions, weekly_icu_admissions_per_million, 
             weekly_hosp_admissions, weekly_hosp_admissions_per_million;

ALTER TABLE CovidVaccinations
DROP COLUMN people_fully_vaccinated, people_fully_vaccinated_per_hundred, 
             people_vaccinated, people_vaccinated_per_hundred, 
             total_vaccinations_per_hundred;
```
**Why?**
Some columns contained too many missing values (85% or more). Removing them helps optimize storage and speed up queries.
