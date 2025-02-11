-- top 10 countries with the highest reported COVID-19 cases
SELECT TOP 10
    location,
    MAX(total_cases) AS highest_total_cases,
    MAX(total_deaths) AS highest_total_deaths,
    FORMAT((MAX(total_deaths) * 100.0 / NULLIF(MAX(total_cases), 0)), 'N2') + ' %' AS death_rate
FROM CovidDeaths
GROUP BY location
ORDER BY highest_total_cases DESC;


-- average daily new cases and deaths per continent
SELECT 
    continent,
    AVG(new_cases) AS avg_daily_cases,
    AVG(new_deaths) AS avg_daily_deaths,
    FORMAT((AVG(new_deaths) * 100.0 / NULLIF(AVG(new_cases), 0)), 'N2') + ' %' AS avg_death_rate
FROM CovidDeaths
GROUP BY continent
ORDER BY avg_daily_cases DESC;


-- highest recorded total cases and deaths for each country
SELECT 
    location,
    MAX(total_cases) AS highest_total_cases,
    MAX(total_deaths) AS highest_total_deaths,
    FORMAT((MAX(total_deaths) * 100.0 / NULLIF(MAX(total_cases), 0)), 'N2') + ' %' AS death_rate
FROM CovidDeaths
GROUP BY location
ORDER BY highest_total_cases DESC;


-- Ranking Countries by COVID-19 Death Rate
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
    FORMAT(death_rate, 'N2') + ' %' AS death_rate,
    RANK() OVER (ORDER BY death_rate DESC) AS death_rate_rank
FROM CountryDeathRates;



-- Countries with the Highest Infection Rate
SELECT 
    location,
    MAX(population) AS total_population,
    MAX(total_cases) AS highest_total_cases,
    FORMAT((MAX(total_cases) * 100.0 / NULLIF(MAX(population), 0)), 'N2') + ' %' AS infection_rate
FROM CovidDeaths
GROUP BY location
HAVING (MAX(total_cases) * 100.0 / NULLIF(MAX(population), 0)) > 10
ORDER BY infection_rate DESC;



-- Countries with the Highest COVID-19 Deaths per Million People
SELECT 
    location,
    MAX(population) AS total_population,
    MAX(total_deaths) AS highest_total_deaths,
    (MAX(total_deaths) * 1000000.0 / NULLIF(MAX(population), 0)) AS deaths_per_million
FROM CovidDeaths
GROUP BY location
ORDER BY deaths_per_million DESC;

-- COVID-19 Vaccination Coverage by Country
SELECT 
    v.location,
    MAX(d.population) AS total_population,
    MAX(v.total_vaccinations) AS total_vaccinations,
    (MAX(v.total_vaccinations) * 100.0 / NULLIF(MAX(d.population), 0)) AS vaccination_coverage
FROM CovidVaccinations v
JOIN CovidDeaths d 
    ON v.iso_code = d.iso_code
    AND v.date = d.date
GROUP BY v.location
ORDER BY vaccination_coverage DESC;

-- Vaccination Rollout by Country
WITH VaccineRollout AS (
    SELECT 
        v.location,
        MIN(v.date) AS first_vaccine_date,
        MAX(TRY_CAST(v.total_vaccinations AS BIGINT)) AS total_vaccinations,
        MAX(TRY_CAST(d.population AS BIGINT)) AS total_population
    FROM CovidVaccinations v
    JOIN CovidDeaths d 
        ON v.iso_code = d.iso_code
    GROUP BY v.location
)
SELECT 
    location,
    first_vaccine_date,
    total_vaccinations,
    (total_vaccinations * 100.0 / NULLIF(total_population, 0)) AS vaccination_coverage
FROM VaccineRollout
ORDER BY first_vaccine_date DESC;

-- Countries with Above-Average COVID-19 Death Rates
WITH CountryDeathRates AS (
    SELECT 
        location,
        MAX(total_cases) AS highest_total_cases,
        MAX(total_deaths) AS highest_total_deaths,
        (MAX(total_deaths) * 100.0 / NULLIF(MAX(total_cases), 0)) AS death_rate
    FROM CovidDeaths
    WHERE continent IS NOT NULL
    GROUP BY location
),
GlobalAvg AS (
    SELECT AVG(death_rate) AS avg_death_rate FROM CountryDeathRates
)
SELECT 
    c.location, 
    c.highest_total_cases, 
    c.highest_total_deaths, 
    c.death_rate,
    (SELECT avg_death_rate FROM GlobalAvg) AS global_avg_death_rate
FROM CountryDeathRates c
WHERE c.death_rate > (SELECT avg_death_rate FROM GlobalAvg)
ORDER BY c.death_rate DESC;

-- Mortality Rate Over Time in South America
WITH SouthAmericaData AS (
    SELECT 
        location,
        date,
        total_cases,
        total_deaths,
        SUM(total_cases) OVER (PARTITION BY location ORDER BY date) AS cumulative_cases,
        SUM(total_deaths) OVER (PARTITION BY location ORDER BY date) AS cumulative_deaths
    FROM CovidDeaths 
    WHERE continent = 'South America'
)
SELECT 
    location,
    date,
    cumulative_cases,
    cumulative_deaths,
    (cumulative_deaths * 100.0 / NULLIF(cumulative_cases, 0)) AS mortality_rate
FROM SouthAmericaData
ORDER BY location, date;