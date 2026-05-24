# Before and After Repair Evidence

## Repair 1: Negative Scores

Before:
submission_id 7002 → score = -5

After:
submission_id 7002 → score = 0

---

## Repair 2: Invalid Difficulty

Before:
problem_id 501 → difficulty = Very Hard

After:
problem_id 501 → difficulty = Hard

---

## Repair 3: Duplicate Enrollment

Before:
student_id 101 and course_id 12 existed twice.

After:
Duplicate enrollment removed successfully.

---

## Repair 4: Invalid Attendance Status

Before:
attendance_id 9001 → status = Maybe

After:
attendance_id 9001 → status = Absent

---

## Repair 5: NULL Emails

Before:
Some student records had NULL email values.

After:
Placeholder email values inserted.
