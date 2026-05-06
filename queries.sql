--**Recupération des donées

--**1_Récupérer la liste des thèmes
SELECT * FROM themes;

--**2_Récupérer toutes les ressources triées par date de mise à jour
SELECT * FROM resources
ORDER BY updated_at ASC;

--**3_Récupérer uniquement le nom et l'url des ressources de type exercice
SELECT title, url
FROM resources
WHERE type = 'exercice';

--**4_Récupérer le titre et la description des ressources d'Ada uniquement
SELECT title, description 
FROM resources
WHERE is_ada = true;

--**5_Récupérer les ressources qui ont la compétence JavaScript associée
SELECT resources.*
FROM resources
JOIN resources_skills ON resources.id = resources_skills.resources_id
JOIN skills ON resources_skills.skill_id = skills.id
WHERE skills.name = 'JavaScript';

--**6_Récupérer les ressources dont le titre contient le mot "react" (insensible à la casse)
SELECT *
FROM resources
WHERE title ILIKE '%react%';

--!BONUS

--**liste des thèmes avec le nombre de ressources par thème

SELECT t.name, COUNT(r.id) AS total_resources
FROM themes t
LEFT JOIN resources r ON t.id = r.theme_id
GROUP BY t.id, t.name
ORDER BY t.id;

--**Récupérer le nom et l'url de toutes les ressources r avec un tableau/liste ARRAY_AGG contenant l'ensemble de leurs skills s associés

SELECT
    r.title,
    r.url,
    ARRAY_AGG(s.name) AS skills
FROM resources r
JOIN resources_skills rs ON r.id = rs.resources_id
JOIN skills s ON rs.skill_id = s.id
GROUP BY r.id, r.title, r.url;

--**les 5 ressources les plus récentes avec leur thème
SELECT
    r.title,
    r.updated_at,
    t.name AS theme
FROM resources r
JOIN themes t ON r.theme_id = t.id
ORDER BY r.updated_at DESC
LIMIT 5;

--**compétences non associées à aucune ressource
SELECT s.*
FROM skills s
LEFT JOIN resources_skills rs ON s.id = rs.skill_id
WHERE rs.skill_id IS NULL;

