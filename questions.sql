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

-- We want to target our inactive users with an email campgain
-- Find the users who have never posted a photo
SELECT username AS "inactive_users" FROM users
LEFT JOIN photos
  ON users.id = photos.user_id
WHERE photos.user_id IS NULL;

-- We're running a new contest to see who can get the most likes on a single photo
-- Find the user with the most likes on a single photo
SELECT username, photo_id, image_url, COUNT(*) AS "total_likes" FROM photos
INNER JOIN likes
  ON likes.photo_id = photos.id
INNER JOIN users
  ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total_likes DESC
LIMIT 1;

-- Our investors want to know 
-- How many times does the average user post?
SELECT 
  (SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users) AS avg;

-- A brand wants to know which hastags to use in a post
-- What are the top 5 most commonly used hashtags?
SELECT tags.tag_name, COUNT(*) AS "count" FROM tags
INNER JOIN photo_tags
  ON tags.id = photo_tags.tag_id
GROUP BY photo_tags.tag_id
ORDER BY count DESC LIMIT 5;