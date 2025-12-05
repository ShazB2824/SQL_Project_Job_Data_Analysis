/*
    Question: What are the top skills based on salary?
    - Look at the average salaries associated with each skill for Data Analyst positions.
    - Focus on remote roles with specified salaries.
    - Why? It shows how different skills impact salaries for Data Analyst positions, and
    helps job seekers work on developing the most financially rewarding skills.
*/

SELECT 
    skills_dim.skills AS skills,
    ROUND(AVG(job_postings_fact.salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
INNER JOIN 
    skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN 
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_postings_fact.job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    job_postings_fact.salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT
    25;