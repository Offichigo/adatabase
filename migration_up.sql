DROP TYPE IF EXISTS resource_type CASCADE;
CREATE TYPE resource_type AS ENUM ('guide', 'video', 'exercice', 'projet');

CREATE TABLE IF NOT EXISTS themes
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    name text,
    description text,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS resources
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
    type resource_type,
    title text,
    description text,
    url text,
    is_ada boolean,
    theme_id integer,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id),
     CONSTRAINT "key_themes" FOREIGN KEY (theme_id)
        REFERENCES public.themes (id) MATCH SIMPLE
);

CREATE TABLE IF NOT EXISTS skills (
  id integer NOT NULL GENERATED ALWAYS AS IDENTITY,
  name text,
  PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS resources_skills(
  resources_id integer,
  skill_id integer,
         CONSTRAINT "key_resource" FOREIGN KEY (resources_id)
        REFERENCES public.resources (id) MATCH SIMPLE,
        CONSTRAINT "key_skill" FOREIGN KEY (skill_id)
        REFERENCES public.skills (id) MATCH SIMPLE
);