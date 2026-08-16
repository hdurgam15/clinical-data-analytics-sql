# Clinical Data Analytics — SQL Portfolio Project

## Overview
This project applies SQL to synthetic electronic health record (EHR) data to answer real-world clinical and operational questions — patient demographics, disease burden, medication patterns, encounter trends, and care utilization. It was built to demonstrate practical clinical data analysis skills using tools common in health system analytics roles.

## Data Source
- **Synthea** synthetic patient data (no real patient information)
- Loaded into **MySQL Workbench** as a local database: `synthea_clinical_db`
- Tables used: `patients`, `conditions`, `medications`, `encounters`

## Tech Stack
- MySQL / SQL
- MySQL Workbench

## Key Insights
- **Hypertension drives visit frequency, not visit cost.** Patients with hypertension averaged over 2x the encounters of patients without it (57.3 vs. 26.1 avg. encounters per patient), while average cost per encounter was nearly identical (~$128.75) across both groups.
- **Rapid revisits are common in this population.** 96 of 116 patients (82.8%) had at least one repeat encounter within 30 days of a prior visit — a proxy signal for readmission-style utilization patterns.
- *(Add 1-2 more findings here from queries 01-04 once finalized — e.g., top conditions by prevalence, most-prescribed medications, or encounter volume trends over time.)*

## Queries

| # | File | Question Answered |
|---|------|--------------------|
| 01 | [01_demographics.sql](01_demographics.sql) | What does the patient population look like (age, gender, etc.)? |
| 02 | [02_top_conditions.sql](02_top_conditions.sql) | What are the most common diagnosed conditions? |
| 03 | [03_medications.sql](03_medications.sql) | What medications are most frequently prescribed? |
| 04 | [04_encounter_trends.sql](04_encounter_trends.sql) | How do encounter volumes trend over time? |
| 05 | [05_condition_vs_utilization.sql](05_condition_vs_utilization.sql) | Does hypertension correlate with more encounters or higher cost per visit? |
| 06 | [06_readmission_patterns.sql](06_readmission_patterns.sql) | What share of patients had a rapid revisit (proxy for readmission) within 30 days? |

## Results

| # | Result File | Summary |
|---|--------------|---------|
| 01 | [results/01_demographics_results.csv](results/01_demographics_results.csv) | Patient population breakdown by age/gender |
| 02 | [results/02_top_conditions_results.csv](results/02_top_conditions_results.csv) | Most frequently diagnosed conditions |
| 03 | [results/03_medications_results.csv](results/03_medications_results.csv) | Most frequently prescribed medications |
| 04 | [results/04_encounter_trends_results.csv](results/04_encounter_trends_results.csv) | Encounter volume over time |
| 05 | [results/05_condition_vs_utilization_results.csv](results/05_condition_vs_utilization_results.csv) | Hypertension vs. encounter frequency/cost |
| 06 | [results/06_readmission_patterns_results.csv](results/06_readmission_patterns_results.csv) | Rapid revisit rate (82.8% of patients) |

## Data Notes & Limitations
- The `encounters`, `conditions`, and `medications` tables reference 944 unique patient IDs, while the `patients` table contains only 116 known patients. To keep findings verifiable, **all analysis is scoped to the 116 known patients** rather than the full, partially unverifiable ID set.
- Synthea does not include formal admit/discharge flags, so Query 06 uses a 30-day revisit window as a proxy for readmission rather than a true readmission metric.

## How to Run
1. Install MySQL and MySQL Workbench.
2. Load the Synthea CSV export into a database named `synthea_clinical_db` (tables: `patients`, `encounters`, `conditions`, `medications`).
3. Open any file in `queries/` in MySQL Workbench and execute against `synthea_clinical_db`.

## Author
Haritha Durgam — [GitHub](https://github.com/hdurgam28) · [LinkedIn](https://linkedin.com/in/dr-haritha-durgam-725213226)
