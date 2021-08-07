-- We want to reward our users who have been around the longest
-- Find the 5 oldest users
SELECT * FROM USERS
ORDER BY created_at LIMIT 0,5;

-- What day of the week do most users register on?
-- We need to figure out when to schedule an ad campgain
SELECT
  DATE_FORMAT(created_at, "%W") AS "day_of_week",
  COUNT(*) AS "count"
FROM users
GROUP BY day_of_week
ORDER BY count DESC
LIMIT 2;
