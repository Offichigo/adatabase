-- CREATE TYPE IF NOT EXISTS resource_type AS ENUM ('guide', 'video', 'exercice', 'projet');
CREATE TABLE IF NOT EXISTS themes
(
    id integer ,
    name text,
    description text,
    created_at timestamptz,
    updated_at timestamptz,
    PRIMARY KEY (id)
);