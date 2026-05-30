BEGIN;
INSERT INTO film (
  title, description, release_year, 
  language_id, rental_duration, rental_rate, 
  length, replacement_cost, rating, 
  special_features, fulltext
) 
VALUES 
  (
    'FUNNY GAMES', 
    'Two young men take a family hostage in their holiday home', 
    1997, 
    6, 
    14, 
    4.99, 
    108, 
    19.99, 
    'R', 
    ARRAY[ 'Trailers' ], 
    to_tsvector(
      'FUNNY GAMES Two young men...'
    )
  );
SAVEPOINT after_film;
INSERT INTO actor (first_name, last_name) 
VALUES 
  ('SUSANNE', 'LOTHAR'), 
  ('ULRICH', 'MUEHE'), 
  ('ARNO', 'FRISCH'), 
  ('FRANK', 'GIERING');
SAVEPOINT after_actors;
INSERT INTO film_actor (actor_id, film_id) 
SELECT 
  a.actor_id, 
  f.film_id 
FROM 
  actor a, 
  film f 
WHERE 
  a.last_name IN (
    'LOTHAR', 'MUEHE', 'FRISCH', 'GIERING'
  ) 
  AND f.title = 'FUNNY GAMES';
SAVEPOINT after_film_actor;
INSERT INTO inventory (film_id, store_id) 
SELECT 
  f.film_id, 
  1 
FROM 
  film f, 
  generate_series(1, 3) 
WHERE 
  f.title = 'FUNNY GAMES';
SAVEPOINT after_inventory;
COMMIT;
