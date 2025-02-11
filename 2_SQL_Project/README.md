# COVID-19 Data Analysis with SQL  

## Project Overview  
This project analyzes **COVID-19 data using SQL Server**, focusing on **global and regional trends** in cases, deaths, and vaccinations. The analysis includes:  
- **Data Cleaning:** Handling missing values, removing invalid records, and ensuring data consistency.  
- **Exploratory Data Analysis (EDA):** Examining case growth, mortality rates, vaccination coverage, and trends over time.  
- **Advanced SQL Queries:** Using **JOINs, CTEs, window functions, and aggregations** to extract meaningful insights.  

The dataset comes from [Our World in Data](https://ourworldindata.org/coronavirus) and contains global COVID-19 statistics.  

---

## 📂 Accessing the Data Cleaning Script  
To ensure **data integrity and consistency**, a **Data Cleaning** process was performed before analysis.  

📌 **To access the script, follow these steps:**   
1. Open the file - **[Data_Cleaning.md](Data_Cleaning.md)** to view the cleaning steps applied.  
2. This script includes:  
   - Handling **missing values** in population and vaccination data.   
   - Replacing NULLs in key numerical fields with **zero** where appropriate.
   - Removing Highly Incomplete Columns
   - Removing Records Where continent is NULL



📌 **Run the script in your SQL environment before performing any analysis** to ensure you work with a **clean and structured dataset**.  

---

## 📂 Accessing the Data Exploration Script  
After cleaning the data, **exploratory analysis** was conducted to uncover trends in **cases, deaths, and vaccinations**.  

📌 **To access the script, follow these steps:**    
1. Open the file - **[Data_Exploration.md](Data_Exploration.md)** to view the queries used for analysis.  
2. This script includes:  
   - **Global COVID-19 case and death trends**.  
   - **Vaccination coverage and rollout timing** by country.  
   - **Mortality rate analysis using window functions and CTEs**.  
   - **Comparisons of infection rates across continents**.  


---

**This project showcases SQL skills in real-world data analysis.** 

