# CodeJudge Data Integrity Audit and Repair Plan

This repository contains Part 3 of the DBMS assignment.

In this part, I checked the imported database for:
- duplicate records
- missing foreign key references
- invalid values
- NULL values
- incorrect timestamps
- inconsistent relationships

I also created repair plans and staging repair scripts to safely clean the data without modifying original tables directly.

## Files Included

- import_validation.sql
- integrity_audit.sql
- domain_rule_checks.sql
- repair_plan.md
- staging_repair_scripts.sql
- before_after_evidence.md
