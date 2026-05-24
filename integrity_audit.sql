-- =====================================
-- DUPLICATE PRIMARY KEY CHECKS
-- =====================================

SELECT student_id, COUNT(*)
FROM students
GROUP BY student_id
HAVING COUNT(*) > 1;

SELECT course_id, COUNT(*)
FROM courses
GROUP BY course_id
HAVING COUNT(*) > 1;

-- =====================================
-- DUPLICATE EMAIL CHECK
-- =====================================

SELECT email, COUNT(*)
FROM students
GROUP BY email
HAVING COUNT(*) > 1;

-- =====================================
-- DUPLICATE ENROLLMENTS
-- =====================================

SELECT student_id, course_id, COUNT(*)
FROM enrollments
GROUP BY student_id, course_id
HAVING COUNT(*) > 1;

-- =====================================
-- DUPLICATE CONTEST-PROBLEM MAPPINGS
-- =====================================

SELECT contest_id, problem_id, COUNT(*)
FROM contest_problems
GROUP BY contest_id, problem_id
HAVING COUNT(*) > 1;

-- =====================================
-- FOREIGN KEY CHECKS
-- =====================================

-- Students linked to missing batches
SELECT s.student_id
FROM students s
LEFT JOIN batches b
ON s.batch_id = b.batch_id
WHERE b.batch_id IS NULL;

-- Enrollments linked to missing students
SELECT e.enrollment_id
FROM enrollments e
LEFT JOIN students s
ON e.student_id = s.student_id
WHERE s.student_id IS NULL;

-- Enrollments linked to missing courses
SELECT e.enrollment_id
FROM enrollments e
LEFT JOIN courses c
ON e.course_id = c.course_id
WHERE c.course_id IS NULL;

-- Problems linked to missing courses
SELECT p.problem_id
FROM problems p
LEFT JOIN courses c
ON p.course_id = c.course_id
WHERE c.course_id IS NULL;

-- Test cases linked to missing problems
SELECT t.test_case_id
FROM test_cases t
LEFT JOIN problems p
ON t.problem_id = p.problem_id
WHERE p.problem_id IS NULL;

-- Submissions linked to missing students
SELECT s.submission_id
FROM submissions s
LEFT JOIN students st
ON s.student_id = st.student_id
WHERE st.student_id IS NULL;

-- Test results linked to missing submissions
SELECT tr.result_id
FROM test_results tr
LEFT JOIN submissions s
ON tr.submission_id = s.submission_id
WHERE s.submission_id IS NULL;

-- Attendance linked to missing students
SELECT a.attendance_id
FROM attendance a
LEFT JOIN students s
ON a.student_id = s.student_id
WHERE s.student_id IS NULL;
