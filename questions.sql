-- We want to reward our users who have been around the longest
-- Find the 5 oldest users
SELECT * FROM USERS
ORDER BY created_at LIMIT 0,5;

