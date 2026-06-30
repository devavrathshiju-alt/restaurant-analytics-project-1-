SELECT restaurant_name, rating
FROM restaurant
WHERE rating > 4;

SELECT rating_category, COUNT(*) AS total_restaurants
FROM restaurant
GROUP BY rating_category;

SELECT area, ROUND(AVG(avg_cost_for_two), 2) AS avg_cost_for_two
FROM restaurant
GROUP BY area;

SELECT restaurant_name, online_order
FROM restaurant
WHERE online_order = 'Yes';

SELECT restaurant_name, table_booking
FROM restaurant
WHERE table_booking = 'Yes';

SELECT restaurant_name, rating
FROM restaurant
ORDER BY rating DESC
LIMIT 10;

SELECT area, COUNT(*) AS restaurant_count
FROM restaurant
GROUP BY area
ORDER BY restaurant_count DESC;

