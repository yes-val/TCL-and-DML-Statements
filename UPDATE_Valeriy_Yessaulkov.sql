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
