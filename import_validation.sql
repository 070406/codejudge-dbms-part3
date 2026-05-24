-- =====================================
-- ROW COUNT VALIDATION
-- =====================================

SELECT COUNT(*) AS total_students
FROM students;

SELECT COUNT(*) AS total_courses
FROM courses;

SELECT COUNT(*) AS total_enrollments
FROM enrollments;

SELECT COUNT(*) AS total_submissions
FROM submissions;

SELECT COUNT(*) AS total_problems
FROM problems;

-- =====================================
-- DISTINCT PRIMARY KEY CHECK
-- =====================================

SELECT COUNT(DISTINCT student_id)
FROM students;

SELECT COUNT(DISTINCT course_id)
FROM courses;

SELECT COUNT(DISTINCT submission_id)
FROM submissions;

-- =====================================
-- NULL VALUE CHECKS
-- =====================================

SELECT COUNT(*) AS missing_email
FROM students
WHERE email IS NULL
OR email = '';

SELECT COUNT(*) AS missing_course_name
FROM courses
WHERE course_name IS NULL
OR course_name = '';

SELECT COUNT(*) AS missing_problem_title
FROM problems
WHERE title IS NULL
OR title = '';

-- =====================================
-- EMPTY TABLE CHECK
-- =====================================

SELECT 'students' AS table_name
WHERE NOT EXISTS (SELECT 1 FROM students);

SELECT 'submissions' AS table_name
WHERE NOT EXISTS (SELECT 1 FROM submissions);

-- =====================================
-- CSV IMPORT VALIDATION
-- =====================================

-- Compare imported row count
-- with raw CSV file count manually

SELECT COUNT(*) AS imported_students
FROM students;
