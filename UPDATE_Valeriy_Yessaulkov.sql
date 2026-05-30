UPDATE 
  film 
SET 
  rental_duration = 21, 
  rental_rate = 9.99, 
  last_update = NOW() 
WHERE 
  title = 'FUNNY GAMES';
SAVEPOINT after_film_update;
UPDATE 
  customer 
SET 
  first_name = 'VALERIY', 
  last_name = 'YESSAULKOV', 
  email = 'yessaulkov.val@gmail.com', 
  address_id = 1, 
  last_update = NOW() 
WHERE 
  customer_id = 148;
SAVEPOINT after_customer_update;
UPDATE 
  customer 
SET 
  create_date = CURRENT_DATE 
WHERE 
  customer_id = 148;
SAVEPOINT after_create_date_update;
