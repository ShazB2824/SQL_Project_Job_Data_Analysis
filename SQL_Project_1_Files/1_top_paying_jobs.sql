/* 
    Question: What are the top paying Data Analyst roles?
    - Identify the top 10 highest paying Data Analyst roles that are available remotely
    - Focus on job postings with specified salaries (remove NULLs)
    - Why? Highlight the top paying opportunities for Data Analysts, offering insights into the top skills and roles
*/

SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    company_dim.name AS company_name
FROM
    job_postings_fact AS job_postings 
LEFT JOIN company_dim ON job_postings.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    job_schedule_type = 'Full-time' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;