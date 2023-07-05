CREATE TABLE COVIDDEATH 
   (ISO_CODE VARCHAR2(10), 
	CONTINENT VARCHAR2(20), 
	LOC VARCHAR2(50), 
	OBSERVED_DATE  VARCHAR2(20), 
	POPULATION VARCHAR2(10), 
	TOTAL_CASES VARCHAR2(20), 
	NEW_CASES VARCHAR2(20), 
	NEW_CASES_SMOOTHED VARCHAR2(20), 
	TOTAL_DEATHS VARCHAR2(20), 
	NEW_DEATHS VARCHAR2(20), 
	NEW_DEATHS_SMOOTHED VARCHAR2(20), 
	TOTAL_CASES_PER_MILLION VARCHAR2(20), 
	NEW_CASES_PER_MILLION VARCHAR2(20), 
	NEW_CASES_SMOOTHED_PER_MILLION VARCHAR2(20), 
	TOTAL_DEATHS_PER_MILLION VARCHAR2(20), 
	NEW_DEATHS_PER_MILLION" VARCHAR2(20), 
	NEW_DEATHS_SMOOTHED_PER_MILLION VARCHAR2(20), 
	REPRODUCTION_RATE VARCHAR2(20), 
	ICU_PATIENTS VARCHAR2(20), 
	ICU_PATIENTS_PER_MILLION VARCHAR2(20), 
	HOSP_PATIENTS VARCHAR2(20), 
	HOSP_PATIENTS_PER_MILLION VARCHAR2(20), 
	WEEKLY_ICU_ADMISSIONS VARCHAR2(20), 
	WEEKLY_ICU_ADMISSIONS_PER_MILLION VARCHAR2(20), 
	WEEKLY_HOSP_ADMISSIONS VARCHAR2(20), 
	WEEKLY_HOSP_ADMISSIONS_PER_MILLION VARCHAR2(20)
   );



CREATE TABLE COVIDVACCIN 
   (ISO_CODE VARCHAR2(10), 
	CONTINENT VARCHAR2(20), 
	LOC VARCHAR2(50), 
	OBSERVED_DATE VARCHAR2(20), 
	NEW_TESTS VARCHAR(20),
	TOTAL_TESTS VARCHAR(20),
	TOTAL_TESTS_PER_THOUSAND VARCHAR(50),
    NEW_TESTS_PER_THOUSAND VARCHAR(20),
	NEW_TESTS_SMOOTHED VARCHAR(20),
	NEW_TESTS_SMOOTHED_PER_THOUSAND VARCHAR(50),
	POSITIVE_RATE VARCHAR(20),
	TESTS_PER_CASE VARCHAR(20),
	TESTS_UNITS VARCHAR(20),
	TOTAL_VACCINATION VARCHAR(20),
	PEOPLE_VACCINATED VARCHAR(20),
	PEOPLE_FULLY_VACCINATED VARCHAR(50),
	NEW_VACCINATIONS VARCHAR(20),
	NEW_VACCINATIONS_SMOOTHED VARCHAR(50),
	TOTAL_VACCINATIONS_PER_HUNDRED VARCHAR(50),
	PEOPLE_VACCINATED_PER_HUNDRED VARCHAR(50),
	PEOPLE_FULLY_VACCINATED_PER_HUNDRED VARCHAR(50),
	NEW_VACCINATIONS_SMOOTHED_PER_MILLION VARCHAR(50),
	STRINGENCY_INDEX VARCHAR(20),
	POPULATION VARCHAR(20),
	POPULATION_DENSITY VARCHAR(50),
	MEDIAN_AGE VARCHAR(20),
	AGED_65_OLDER VARCHAR(50),
	AGED_70_OLDER VARCHAR(50),
	GDP_PER_CAPITA VARCHAR(50),
	EXTREME_POVERTY VARCHAR(50),
	CARDIOVASC_DEATH_RATE VARCHAR(50),
	DIABETES_PREVALENCE VARCHAR(50),
	FEMALE_SMOKERS VARCHAR(20),
	MALE_SMOKERS VARCHAR(20),
	HANDWASHING_FACILITIES VARCHAR(50),
	HOSPITAL_BEDS_PER_THOUSAND VARCHAR(50),
	LIFE_EXPECTANCY VARCHAR(20),
	HUMAN_DEVELOPMENT_INDEX VARCHAR(50)
	);
    
select * from coviddeath;
select * from covidvaccin;


select * from coviddeath order by 3,4;
select * from covidvaccin order by 3,4;
    
select loc,observed_date,total_cases,new_cases,total_deaths,population
from coviddeath
order by 1,2;

--total_caases vs total_deaths
select loc,observed_date,total_cases,new_cases,total_deaths,(total_deaths/total_cases)*100 as Death_Percentage
from coviddeath
where loc='India'
order by 1,2;

--total_cases vs population
select loc,observed_date,population,total_cases,(total_cases/population)*100 as Covid_Percentage
from coviddeath
where loc='India'
order by 1,2;

--countries with Highest Infection Rate comapred to Population
select loc,population,max(total_cases) as HighestInfectionCount,max((total_cases/population)*100) as PercentPopulationInfected
from coviddeath
--where loc='India'
Group by  loc,population
order by PercentPopulationInfected DESC;

--countries with highest death count per population
select loc,max(cast(total_deaths as int)) as TotalDeathCount
from coviddeath
--where loc='India'
Where continent is null
Group by  loc
order by TotalDeathCount DESC;

--showing continents with highest death count per population
select continent,max(cast(total_deaths as int)) as TotalDeathCount
from coviddeath
--where loc='India'
Where continent is not null
Group by  continent
order by TotalDeathCount DESC;

--global numbers
select sum(new_cases) as total_Cases,sum(new_deaths) as total_deaths,(sum(new_cases)/sum(new_deaths))*100 as death_percentage      
from coviddeath
--where loc='India'
where continent is not null
--Group by observed_date
order by 1,2;

select * from covidvaccin;

--total population vs vaccination
select dea.loc,dea.continent,dea.observed_date,dea.population,vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.loc Order by dea.loc,dea.observed_date) as RollingPeopleVaccinated
from coviddeath dea 
JOIN covidvaccin vac on dea.loc=vac.loc and dea.observed_date=vac.observed_date
where dea.continent is not null
order by 2,3

--using CTE
WITH PopvsVac  
AS
(
    SELECT
        dea.loc,
        dea.continent,
        dea.observed_date,
        dea.population,
        vac.new_vaccinations,
        SUM(vac.new_vaccinations) OVER (PARTITION BY dea.loc ORDER BY dea.loc, dea.observed_date) AS RollingPeopleVaccinated
    FROM
        coviddeath dea
    JOIN
        covidvaccin vac ON dea.loc = vac.loc AND dea.observed_date = vac.observed_date
    WHERE
        dea.continent IS NOT NULL
    --and vac.new_vaccinations is not null
    ORDER BY 
        2, 3 asc
)
SELECT
    x.*,
    ((RollingPeopleVaccinated / Population) * 100) AS VaccinationPercentage
FROM
    PopvsVac x;

--Temp Table
Drop Table if exists PercentagePopulationVaccinated
Create Table PercentagePopulationVaccinated (
    Loc varchar2(50),
    Continent varchar2(20),
    Observed_date varchar2(20),
    Population varchar2(20),
    New_Vaccinations varchar2(20),
    RollingPeopleVaccinated varchar2(25)
);
Insert into PercentagePopulationVaccinated (Loc,Continent,Observed_date,Population,New_Vaccinations,RollingPeopleVaccinated)
Select substr(dea.loc,1,20),dea.continent,dea.observed_date,dea.population,vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.loc Order by dea.loc,dea.observed_date) as RollingPeopleVaccinated
from coviddeath dea 
JOIN covidvaccin vac on dea.loc=vac.loc and dea.observed_date=vac.observed_date;
--where dea.continent is not null
--order by 2,3;

SELECT
    y.*,
    ((RollingPeopleVaccinated / Population) * 100) AS VaccinationPercentage
FROM
    PercentagePopulationVaccinated y;


select * from PercentagePopulationVaccinated;

--Creating view to store data for later visualization
--Drop view if exists PercentagePopulationVaccinatedView;
Create View PercentagePopulationVaccinatedView  as
Select dea.loc,dea.continent,dea.observed_date,dea.population,vac.new_vaccinations,
sum(vac.new_vaccinations) over (partition by dea.loc Order by dea.loc,dea.observed_date) as RollingPeopleVaccinated
from coviddeath dea 
JOIN covidvaccin vac on dea.loc=vac.loc and dea.observed_date=vac.observed_date
where dea.continent is not null;
--order by 2,3;






