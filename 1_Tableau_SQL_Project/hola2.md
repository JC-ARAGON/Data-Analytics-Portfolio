# 🌍 Data Exploration – COVID 19 Analysis (SQL Server)

## 📌 Query 1: **top 10 countries with the highest reported COVID-19 cases**

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

- Retrieves the 10 countries with the highest number of total COVID-19 cases.
- Uses MAX() to obtain the peak total cases and total deaths recorded for each country.
- Calculates the death rate using (total_deaths / total_cases) * 100, showing how lethal the virus was in each country.
- Orders the results in descending order of total cases, ensuring the most affected countries appear at the top.
### 📊 Insights

- The United States, India, and Brazil rank among the top three countries with the highest reported cases, mainly due to large populations and extensive testing capacity.
- Death rates vary significantly across countries, reflecting differences in healthcare quality, early intervention strategies, and vaccination rates.

  
## 📌 Query 2: Average Daily COVID-19 Cases and Deaths by Continent

```sql
SELECT 
    continent,
    AVG(new_cases) AS avg_daily_cases,
    AVG(new_deaths) AS avg_daily_deaths,
    (AVG(new_deaths) * 100.0 / NULLIF(AVG(new_cases), 0)) AS avg_death_rate
FROM CovidDeaths
GROUP BY continent
ORDER BY avg_daily_cases DESC;
```
### 🔍 Explanation
- Retrieves the 10 countries with the highest number of total COVID-19 cases.
- Uses MAX() to obtain the peak total cases and total deaths recorded for each country.
- Calculates the death rate using (total_deaths / total_cases) * 100, showing how lethal the virus was in each country.
- Orders the results in descending order of total cases, ensuring the most affected countries appear at the top.

### 📊 Insights
- Europe and the Americas report the highest average daily cases, largely due to higher testing rates, larger populations, and multiple outbreak waves.
- Africa shows a higher death rate compared to cases, likely due to underreporting, limited healthcare resources, and lower testing availability.
  

## 📌 Query 3: **highest recorded total cases and deaths for each country**

```sql
SELECT 
    location,
    MAX(total_cases) AS highest_total_cases,
    MAX(total_deaths) AS highest_total_deaths,
    (MAX(total_deaths) * 100.0 / NULLIF(MAX(total_cases), 0)) AS death_rate
FROM CovidDeaths
GROUP BY location
ORDER BY highest_total_cases DESC;
```
### 🔍 Explanation
- Retrieves the 10 countries with the highest number of total COVID-19 cases.
- Uses MAX() to obtain the peak total cases and total deaths recorded for each country.
- Calculates the death rate using (total_deaths / total_cases) * 100, showing how lethal the virus was in each country.
- Orders the results in descending order of total cases, ensuring the most affected countries appear at the top.

### 📊 Insights
- The United States, India, and Brazil rank among the top three countries with the highest reported cases, mainly due to large populations and extensive testing capacity.
- Death rates vary significantly across countries, reflecting differences in healthcare quality, early intervention strategies, and vaccination rates.
