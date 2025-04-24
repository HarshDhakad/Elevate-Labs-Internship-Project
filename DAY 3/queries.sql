-- 1. Filter by Rating, NFC, and Processor
SELECT * 
FROM dml.smartphones_cleaned_v6 
WHERE rating > 75 
  AND has_nfc = 'TRUE' 
  AND processor_brand = 'snapdragon';

-- 2. Filter by Rating, Price, and Battery Capacity
SELECT * 
FROM dml.smartphones_cleaned_v6 
WHERE rating > 75 
  AND price < 20000 
  AND battery_capacity >= 5000 
ORDER BY price DESC;

-- 3. Group by Brand and Processor
SELECT brand_name, processor_brand 
FROM dml.smartphones_cleaned_v6 
WHERE rating > 75 
  AND battery_capacity >= 5000 
GROUP BY brand_name, processor_brand;

-- 4. Average Price Grouped by Brand and Processor
SELECT brand_name, processor_brand, 
       ROUND(AVG(price)) AS average_price 
FROM dml.smartphones_cleaned_v6 
WHERE rating > 75 
  AND battery_capacity >= 5000 
GROUP BY brand_name, processor_brand;

-- 5. Subquery to Filter Phones with Above Average Rating
SELECT brand_name, model, price 
FROM dml.smartphones_cleaned_v6 
WHERE rating > (
  SELECT AVG(rating) 
  FROM dml.smartphones_cleaned_v6
)
ORDER BY price DESC;

-- 6. Create a View for High-Rated Phones by Price
CREATE VIEW high_rated_phones_price AS
SELECT brand_name, model, price 
FROM dml.smartphones_cleaned_v6 
WHERE rating > (
  SELECT AVG(rating) 
  FROM dml.smartphones_cleaned_v6
)
ORDER BY price DESC;

-- 7. Student Attendance Summary Using Joins
SELECT s.student_id, s.student_name, su.subject_name, 
       COUNT(ex.subject_name) AS attended_exams 
FROM Students s 
CROSS JOIN Subjects su 
LEFT JOIN Examinations ex 
  ON s.student_id = ex.student_id 
  AND su.subject_name = ex.subject_name 
GROUP BY s.student_id, s.student_name, su.subject_name 
ORDER BY s.student_id, s.student_name;
