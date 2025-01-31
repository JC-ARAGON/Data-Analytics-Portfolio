📌 README.md – Data Cleaning for COVID-19 Analysis (SQL Server)
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
```
**Why?**
These codes (OWID_INT, OWID_CYN) represent non-country entities (e.g., international reports) and should be removed for country-level analysis.
