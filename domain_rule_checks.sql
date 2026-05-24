-- =====================================
-- NEGATIVE SCORE CHECK
-- =====================================

SELECT submission_id, score
FROM submissions
WHERE score < 0;

-- =====================================
-- SCORE GREATER THAN 100
-- =====================================

SELECT submission_id, score
FROM submissions
WHERE score > 100;

-- =====================================
-- INVALID DIFFICULTY VALUES
-- =====================================

SELECT problem_id, difficulty
FROM problems
WHERE difficulty NOT IN ('Easy','Medium','Hard');

-- =====================================
-- INVALID SUBMISSION STATUS
-- =====================================

SELECT submission_id, status
FROM submissions
WHERE status NOT IN
('Successful','Failed','Pending');

-- =====================================
-- INVALID PROGRAMMING LANGUAGE
-- =====================================

SELECT submission_id, language
FROM submissions
WHERE language NOT IN
('Python','Java','C++','JavaScript');

-- =====================================
-- INVALID ATTENDANCE STATUS
-- =====================================

SELECT attendance_id, status
FROM attendance
WHERE status NOT IN
('Present','Absent','Late');

-- =====================================
-- END TIME BEFORE START TIME
-- =====================================

SELECT contest_id
FROM contests
WHERE end_time < start_time;

-- =====================================
-- SUBMISSION BEFORE ENROLLMENT
-- =====================================

SELECT s.submission_id
FROM submissions s
JOIN enrollments e
ON s.student_id = e.student_id
WHERE s.submitted_at < e.enrolled_on;

-- =====================================
-- NULL VALUES IN IMPORTANT COLUMNS
-- =====================================

SELECT student_id
FROM students
WHERE full_name IS NULL
OR email IS NULL;
