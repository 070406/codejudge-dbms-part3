# Repair Plan

## Issue 1: Duplicate Student Email

Example:
student_id = 101 and 145 have same email.

Repair:
Ask for manual verification because email should be unique.

---

## Issue 2: Enrollment Linked to Missing Student

Example:
enrollment_id = 2201 references student_id = 9999.

Repair:
Move record to rejected staging table because referenced student does not exist.

---

## Issue 3: Invalid Difficulty Value

Example:
problem_id = 501 has difficulty = 'Very Hard'.

Repair:
Update value to nearest valid category after manual review.

---

## Issue 4: Negative Score

Example:
submission_id = 7002 has score = -5.

Repair:
Correct score to 0 because negative marks are invalid.

---

## Issue 5: Invalid Attendance Status

Example:
attendance_id = 9001 has status = 'Maybe'.

Repair:
Move record for manual verification.

---

## Issue 6: Contest End Time Before Start Time

Example:
contest_id = 301.

Repair:
Swap timestamps after verification.

---

## Issue 7: Missing Course Reference

Example:
problem_id = 601 references missing course_id = 888.

Repair:
Move record to staging table until correct course is identified.

---

## Issue 8: Duplicate Enrollment Record

Example:
student_id = 101 and course_id = 12 repeated twice.

Repair:
Delete duplicate record and keep one valid row.
