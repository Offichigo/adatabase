INSERT INTO themes (name, description) VALUES 
    ('Frontend', 'Partie visible et interactive avec laquelle les utilisateurs interagissent directement'),
    ('Backend', 'fait référence aux parties du système qui sont invisibles pour l'' utilisateur final et qui gèrent les tâches de l'' application en arrière-plan'),
    ('Base de données', 'un ensemble d informations qui est organisé de manière à être facilement accessible, géré et mis à jour'),
    ('DevOps', 'permet la coordination et la collaboration des rôles autrefois cloisonnés (développement, opérations informatiques, ingénierie qualité et sécurité) pour créer des produits plus performants et plus fiables');

INSERT INTO skills (name) VALUES
  ('JavaScript'),
  ('React'),
  ('SQL'),
  ('PostgreSQL'),
  ('Node.js');

INSERT INTO resources (title, url, description, type, is_ada, theme_id) VALUES
  ('Introduction à React', 'https://react.dev', 'Guide officiel React', 'guide', false, 1),
  ('SQL pour débutants', 'https://example.com/sql', 'Cours SQL complet', 'video', false, 3),
  ('Exercices JavaScript', 'https://example.com/js', 'Pratique JS', 'exercice', false, 1),
  ('Créer une API en node', 'https://example.com/node', 'Projet node', 'projet', false, 2);

INSERT INTO resources_skills (resources_id, skill_id) VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (2, 4),
  (3, 1),
  (4, 1),
  (4, 5);

SELECT * FROM resources;
