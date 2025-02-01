# 🌍 Data Exploration – COVID 19 Analysis (SQL Server)

## 📌 Query 1:  
This query retrieves the **top 10 countries with the highest reported COVID-19 cases**, along with their total deaths and death rates.

```sql
SELECT TOP 10
    location,
    MAX(total_cases) AS highest_total_cases,
    MAX(total_deaths) AS highest_total_deaths,
    (MAX(total_deaths) * 100.0 / NULLIF(MAX(total_cases), 0)) AS death_rate
FROM CovidDeaths
GROUP BY location
ORDER BY highest_total_cases DESC;
```
### 🔍 Explanation

Retrieves the 10 countries with the highest number of total COVID-19 cases.
Uses MAX() to obtain the peak total cases and total deaths recorded for each country.
Calculates the death rate using (total_deaths / total_cases) * 100, showing how lethal the virus was in each country.
Orders the results in descending order of total cases, ensuring the most affected countries appear at the top.
### 📊 Insights

The United States, India, and Brazil rank among the top three countries with the highest reported cases, mainly due to large populations and extensive testing capacity.
Death rates vary significantly across countries, reflecting differences in healthcare quality, early intervention strategies, and vaccination rates.
