-- =====================================
-- CREATE STAGING TABLES
-- =====================================

CREATE TABLE staging_submissions AS
SELECT *
FROM submissions;

CREATE TABLE staging_problems AS
SELECT *
FROM problems;

CREATE TABLE staging_attendance AS
SELECT *
FROM attendance;

-- =====================================
-- REPAIR 1 : FIX NEGATIVE SCORE
-- =====================================

-- Before Repair
SELECT submission_id, score
FROM staging_submissions
WHERE score < 0;

-- Repair
UPDATE staging_submissions
SET score = 0
WHERE score < 0;

-- After Repair
SELECT submission_id, score
FROM staging_submissions
WHERE score < 0;

-- =====================================
-- REPAIR 2 : FIX INVALID DIFFICULTY
-- =====================================

-- Before Repair
SELECT problem_id, difficulty
FROM staging_problems
WHERE difficulty = 'Very Hard';

-- Repair
UPDATE staging_problems
SET difficulty = 'Hard'
WHERE difficulty = 'Very Hard';

-- After Repair
SELECT problem_id, difficulty
FROM staging_problems
WHERE difficulty = 'Very Hard';

-- =====================================
-- REPAIR 3 : REMOVE DUPLICATE ENROLLMENT
-- =====================================

-- Before Repair
SELECT student_id, course_id, COUNT(*)
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- Repair
DELETE FROM enrollments
WHERE enrollment_id NOT IN
(
    SELECT MIN(enrollment_id)
    FROM enrollments
    GROUP BY student_id, course_id
);

-- After Repair
SELECT student_id, course_id, COUNT(*)
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- =====================================
-- REPAIR 4 : FIX INVALID ATTENDANCE STATUS
-- =====================================

-- Before Repair
SELECT attendance_id, status
FROM staging_attendance
WHERE status = 'Maybe';

-- Repair
UPDATE staging_attendance
SET status = 'Absent'
WHERE status = 'Maybe';

-- After Repair
SELECT attendance_id, status
FROM staging_attendance
WHERE status = 'Maybe';

-- =====================================
-- REPAIR 5 : FIX NULL EMAILS
-- =====================================

-- Before Repair
SELECT student_id
FROM students
WHERE email IS NULL;

-- Repair
UPDATE students
SET email = 'unknown@student.com'
WHERE email IS NULL;

-- After Repair
SELECT student_id
FROM students
WHERE email IS NULL;
