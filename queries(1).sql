-- Purpose: Find all restaurants that offer online ordering
SELECT restaurant_name, rating, avg_cost_for_two
FROM restaurant
WHERE online_order = 'Yes';

-- Purpose: Count number of restaurants by restaurant type
SELECT restaurant_type, COUNT(*) AS total_restaurants
FROM restaurant
GROUP BY restaurant_type;

-- Purpose: Find average rating for each area and sort by highest rated areas
SELECT area, AVG(rating) AS avg_rating
FROM restaurant
GROUP BY area
ORDER BY avg_rating DESC;

-- Purpose: Find restaurant types that have more than 20 restaurants
SELECT restaurant_type, COUNT(*) AS total_restaurants
FROM restaurant
GROUP BY restaurant_type
HAVING COUNT(*) > 20;

-- Purpose: Find mid-range restaurants with cost between 300 and 700
SELECT restaurant_name, avg_cost_for_two, rating
FROM restaurant
WHERE avg_cost_for_two BETWEEN 300 AND 700;

-- Purpose: Find top 5 high-rated restaurants with table booking and high engagement
SELECT restaurant_name,
       rating,
       num_of_ratings,
       avg_cost_for_two
FROM restaurant
WHERE table_booking = 'Yes'
  AND rating >= 4.0
ORDER BY num_of_ratings DESC
LIMIT 5;

-- Purpose: Identify areas with high restaurant density and strong average ratings
SELECT area,
       COUNT(*) AS total_restaurants,
       ROUND(AVG(rating), 2) AS avg_rating,
       ROUND(AVG(avg_cost_for_two), 0) AS avg_cost
FROM restaurant
WHERE rating IS NOT NULL
GROUP BY area
HAVING COUNT(*) >= 10
ORDER BY avg_rating DESC, total_restaurants DESC;


-- Purpose: Find restaurants that offer high ratings at lower costs (best value for money)
SELECT restaurant_name,
       rating,
       avg_cost_for_two,
       num_of_ratings
FROM restaurant
WHERE rating >= 4.0
  AND avg_cost_for_two <= (
      SELECT AVG(avg_cost_for_two)
      FROM restaurant
  )
ORDER BY rating DESC, num_of_ratings DESC;
