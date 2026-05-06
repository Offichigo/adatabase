SELECT * FROM themes
ORDER BY updated_at ASC;

SELECT title, url
FROM resources
WHERE type = 'exercice';

SELECT title, description 
FROM resources
WHERE is_ada = true;

SELECT resources.*
FROM resources
JOIN resources_skills ON resources.id = resources_skills.resources_id
JOIN skills ON resources_skills.skill_id = skills.id
WHERE skills.name = 'JavaScript';

SELECT *
FROM resources
WHERE title ILIKE '%react%';
