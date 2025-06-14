-- HR Employee Attrition SQL Project
-- Dataset: IBM HR Analytics Employee Attrition & Performance
-- Source: Kaggle

-- 1. Create Table
CREATE TABLE employees (
  EmployeeID INT PRIMARY KEY,
  Age INT,
  Attrition VARCHAR(3),
  BusinessTravel VARCHAR(50),
  Department VARCHAR(50),
  DistanceFromHome INT,
  Education INT,
  EducationField VARCHAR(50),
  Gender VARCHAR(10),
  JobRole VARCHAR(50),
  MaritalStatus VARCHAR(20),
  MonthlyIncome INT,
  OverTime VARCHAR(3),
  DailyRate INT,
  HourlyRate INT,
  MonthlyRate INT,
  NumCompaniesWorked INT,
  PercentSalaryHike INT,
  PerformanceRating INT,
  TotalWorkingYears INT,
  TrainingTimesLastYear INT,
  YearsAtCompany INT,
  YearsInCurrentRole INT,
  YearsSinceLastPromotion INT,
  YearsWithCurrManager INT,
  EnvironmentSatisfaction INT,
  JobSatisfaction INT,
  RelationshipSatisfaction INT,
  WorkLifeBalance INT
);

-- 2. Sample Queries

-- a) Average monthly income by education and attrition
SELECT Education,
       Attrition,
       ROUND(AVG(MonthlyIncome), 2) AS AvgIncome,
       COUNT(*) AS Count
FROM employees
GROUP BY Education, Attrition
ORDER BY Education, Attrition;

-- b) Attrition by age range
SELECT
  CASE
    WHEN Age BETWEEN 18 AND 24 THEN '18-24'
    WHEN Age BETWEEN 25 AND 34 THEN '25-34'
    WHEN Age BETWEEN 35 AND 44 THEN '35-44'
    WHEN Age BETWEEN 45 AND 54 THEN '45-54'
    WHEN Age BETWEEN 55 AND 60 THEN '55-60'
    ELSE '60+'
  END AS AgeRange,
  Attrition,
  COUNT(*) AS Count
FROM employees
GROUP BY AgeRange, Attrition
ORDER BY AgeRange;

-- c) Attrition rate by department
SELECT Department,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS Attrited,
       COUNT(*) AS Total,
       ROUND(100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)/COUNT(*), 2) AS AttritionRatePct
FROM employees
GROUP BY Department
ORDER BY AttritionRatePct DESC;

-- d) Distance from home by JobRole and Attrition
SELECT JobRole,
       Attrition,
       ROUND(AVG(DistanceFromHome),2) AS AvgDistance,
       COUNT(*) AS Count
FROM employees
GROUP BY JobRole, Attrition
ORDER BY JobRole, Attrition;

-- e) JobRole vs average income
SELECT JobRole,
       ROUND(AVG(MonthlyIncome),2) AS AvgIncome,
       ROUND(AVG(MonthlyRate),2) AS AvgRate,
       COUNT(*) AS Count
FROM employees
GROUP BY JobRole
ORDER BY AvgIncome DESC;

