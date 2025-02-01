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

## 📌 Query 4: Ranking Countries by COVID-19 Death Rate  
This query ranks countries based on **COVID-19 death rates**, allowing for a comparison of **mortality impact** across nations.

```sql
WITH CountryDeathRates AS (
    SELECT 
        location,
        MAX(total_cases) AS highest_total_cases,
        MAX(total_deaths) AS highest_total_deaths,
        (MAX(total_deaths) * 100.0 / NULLIF(MAX(total_cases), 0)) AS death_rate
    FROM CovidDeaths
    GROUP BY location
)
SELECT 
    location, 
    highest_total_cases,
    highest_total_deaths,
    death_rate,
    RANK() OVER (ORDER BY death_rate DESC) AS death_rate_rank
FROM CountryDeathRates;
```
### 🔍 Explanation
This query:

- Uses a Common Table Expression (CTE) (CountryDeathRates) to calculate:
Highest recorded total cases and deaths per country.
Death rate as (total_deaths / total_cases) * 100.
- Applies RANK() OVER (ORDER BY death_rate DESC) to rank countries based on their COVID-19 death rates.
- Countries with higher death rates receive lower numerical ranks (i.e., 1 is the highest death rate).
### 📊 Insights
- Countries like Peru, Mexico, and some Eastern European nations rank highest in death rates (~8-10%), likely due to healthcare system strain and underreported cases.
- Developed nations with advanced medical infrastructure (e.g., Germany, Canada) rank lower (~1-2%), demonstrating the effectiveness of medical response and vaccination campaigns.
  

## 📌 Query 5: Countries with the Highest Infection Rate (Percentage of Population Infected) 
This query identifies **countries where more than 10% of the population was infected with COVID-19**, highlighting the most affected nations relative to their population size.

```sql
SELECT 
    location,
    MAX(population) AS total_population,
    MAX(total_cases) AS highest_total_cases,
    (MAX(total_cases) * 100.0 / NULLIF(MAX(population), 0)) AS infection_rate
FROM CovidDeaths
GROUP BY location
HAVING (MAX(total_cases) * 100.0 / NULLIF(MAX(population), 0)) > 10
ORDER BY infection_rate DESC;
```
### 🔍 Explanation
This query:

1. Groups data by country (location) and retrieves:
- The total population (MAX(population)).
- The highest recorded number of total cases (MAX(total_cases)).
- The infection rate, calculated as (total_cases / population) * 100.
2. Uses HAVING to filter out countries with an infection rate below 10%, focusing only on those heavily impacted.
3. Orders results by infection_rate in descending order, showing the hardest-hit countries first
### 📊 Insights
- Some smaller countries (e.g., Andorra, Montenegro, San Marino) show infection rates above 15%, likely due to high population density and testing efforts.
- Larger nations (e.g., the United States, Brazil, and India) show high total cases but lower infection rates, since their large populations dilute the percentage.


## 📌 Query 6: Countries with the Highest COVID-19 Deaths per Million People

```sql
SELECT 
    location,
    MAX(population) AS total_population,
    MAX(total_deaths) AS highest_total_deaths,
    (MAX(total_deaths) * 1000000.0 / NULLIF(MAX(population), 0)) AS deaths_per_million
FROM CovidDeaths
GROUP BY location
ORDER BY deaths_per_million DESC;
```
### 🔍 Explanation
This query:

- Groups data by country (location) and retrieves:
Total population (MAX(population)).
Highest recorded total deaths (MAX(total_deaths)).
- Deaths per million people, calculated as (total_deaths / population) * 1,000,000, which allows for fair comparisons between countries of different sizes.
- Orders results by deaths_per_million in descending order, displaying the hardest-hit nations first.
### 📊 Insights
-Peru, Belgium, and Italy have some of the highest deaths per million, reflecting severe outbreaks and healthcare system strain.
- Larger countries like India and China have lower deaths per million, despite high total deaths, due to large populations diluting the per capita impact.
