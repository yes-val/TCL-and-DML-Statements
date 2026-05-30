DELETE FROM 
  inventory 
WHERE 
  film_id = (
    SELECT 
      film_id 
    FROM 
      film 
    WHERE 
      title = 'FUNNY GAMES'
  );
SAVEPOINT after_inventory_delete;
DELETE FROM 
  payment 
WHERE 
  customer_id = 148;
SAVEPOINT after_payment_delete;
DELETE FROM 
  rental 
WHERE 
  customer_id = 148;
SAVEPOINT after_rental_delete;
