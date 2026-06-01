# Maji Ndogo Water Infrastructure Analysis
### Water Access, Infrastructure, and Data Integrity Assessment



![Status](https://img.shields.io/badge/Status-Complete-brightgreen)




![Records](https://img.shields.io/badge/Records-60%2C000%2B-blue)




![Tool](https://img.shields.io/badge/Tool-MySQL-orange)




![Dashboard](https://img.shields.io/badge/Dashboard-Power%20BI-yellow)



---

## Key Highlights

- 43% of citizens rely on shared taps serving up to 2,000 people per source
- 45% of home water systems are broken; only 28% of wells produce clean water
- Average queue time exceeds 120 minutes nationally, with peak congestion every Saturday
- $154.5M cumulative investment tracked across 5 provinces; 18M people reached; 100% project completion
- Data integrity audit flagged multiple surveyors with above-average error rates after joining survey data with an independent auditor report
- Cleaned and validated 60,000+ records across 7 relational tables using MySQL

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Dataset](#dataset)
3. [Repository Structure](#repository-structure)
4. [Methodology](#methodology)
5. [Key Findings](#key-findings)
6. [Recommendations](#recommendations)
7. [Dashboard](#dashboard)
8. [Tools and Skills](#tools-and-skills)
9. [Limitations and Known Gaps](#limitations-and-known-gaps)
10. [How to Run](#how-to-run)

---

## Project Overview

This project analyzes water access and infrastructure conditions across Maji Ndogo using a 60,000-record national field survey dataset. The goal was to identify access gaps, detect data inconsistencies between surveyor and auditor records, and produce evidence-based infrastructure recommendations across 5 provinces.

**Business questions answered:**

- How do citizens access water across all 5 provinces?
- Which infrastructure types fail most often, and where?
- How severe are queue times, and when do they peak?
- Where do survey and audit records conflict, and which surveyors are responsible?
- Which regions require urgent intervention?

---

## Dataset

| Attribute | Detail |
|---|---|
| Total records | 60,000+ |
| Provincial coverage | Atsisi, Kimapai, Amareri, Sokoto, Hamisi |
| Date range | 31 Dec 2022 – 7 Dec 2027 |
| Source | National field survey + independent auditor report |
| Tables | `water_source`, `visits`, `location`, `water_quality`, `well_pollution`, `employee`, `auditor_report` |

A full data dictionary covering all 7 tables, column definitions, primary and foreign keys, and known data quality issues is in [DATA.md](DATA.md).

All employee names appear only in internal audit error analysis. No personally identifiable data is redistributed publicly.

---

## Repository Structure

maji-ndogo-water-analysis/
│
├── data/
│   ├── raw/                   # Original survey export files (CSV)
│   └── processed/             # Cleaned and validated output tables
│
├── sql/
│   ├── 01_validation.sql      # Table relationship checks and join verification
│   ├── 02_error_detection.sql # Contamination label checks and duplicate visit flags
│   ├── 03_correction.sql      # Pollution reclassification and text standardization
│   ├── 04_integrity.sql       # Survey-to-audit join and mismatch rate calculation
│   └── 05_features.sql        # Feature engineering: total_served, avg_queue_time, rank_usage
│
├── dashboards/
│   └── maji_ndogo.pbix        # Power BI dashboard file
│
├── notebooks/
│   └── eda_summary.ipynb      # Supporting exploratory analysis
│
├── DATA.md                    # Full data dictionary for all 7 tables
└── README.md

---

## Methodology

**Step 1 — Data Validation**
Verified all table relationships across 7 relational tables. Checked data consistency across joins before any analysis.

**Step 2 — Error Detection**
Identified invalid "clean" labels where biological contamination exceeded 0.01. Detected repeated visits to the same water source flagged as independent assessments.

**Step 3 — Data Correction**
Updated incorrect pollution classifications. Standardized text values using SQL string functions to resolve inconsistent labeling.

**Step 4 — Data Integrity Check**
Joined survey data with the independent auditor report. Measured mismatch rates between surveyor scores and auditor scores. Calculated error frequency per employee using window functions.

**Step 5 — Feature Engineering**

| Feature | Description |
|---|---|
| `total_served` | Aggregated population per water source |
| `avg_queue_time` | Average waiting time per source in minutes |
| `error_count` | Surveyor error frequency from audit join |
| `rank_usage` | Water source ranked by usage volume per province |
| `improvement_action` | Recommended infrastructure intervention per source |

---

## Key Findings

**Finding 1 — Water Access by Source Type**

- 43% of citizens rely on shared taps; up to 2,000 people share one tap
- 31% have home water systems; 45% of those systems are broken
- 18% rely on wells; only 28% of wells produce clean water

**Finding 2 — Queue Times**

- Average queue time exceeds 120 minutes nationally
- Peak usage occurs during morning and evening hours daily
- Saturdays show the highest congestion across all 5 provinces

**Finding 3 — Provincial Distribution**

| Province | Primary Issue | Detail |
|---|---|---|
| Sokoto | River dependency | High share of population relies on unimproved river sources |
| Amareri | Broken home taps | Over 50% of home tap systems are non-functional |
| Atsisi | Queue congestion | Above-national-average queue times at shared taps |
| Hamisi | Well contamination | High proportion of wells with biological or chemical contamination |
| Kimapai | Infrastructure gap | Low tap density relative to population; high shared tap load |
| Capital (Atsisi) | Reference benchmark | Stronger infrastructure performance relative to all rural provinces |

Rural provinces hold the highest concentration of failing water sources. The capital records stronger baseline performance but still exceeds the 120-minute queue average at peak hours.

**Finding 4 — Infrastructure Investment**

- Cumulative investment: $154.5M across 5 provinces
- Budget goal: $146.74M; actual spend exceeded goal by 5.29% ($7.76M over)
- 18M people reached with basic water access
- 100% project completion; 0 sources remaining in the active queue

**Finding 5 — Data Integrity**

- Multiple surveyors flagged with above-average error rates after joining survey and auditor datasets
- Audit text analysis identified a subset of records with patterns consistent with deliberate score manipulation
- Flagged records are a subset of the full dataset; the total error population is unknown

---

## Recommendations

| Priority | Condition | Province(s) | Recommended Action |
|---|---|---|---|
| 1 | River dependency | Sokoto | Drill new wells to replace surface water reliance |
| 2 | Biological contamination | Hamisi, Kimapai | Install UV and RO filtration at affected wells |
| 3 | Chemical contamination | Hamisi | Install RO filtration at chemically contaminated wells |
| 4 | Queue times above 120 minutes | Atsisi, Amareri, Kimapai | Install additional shared taps to reduce load per source |
| 5 | Broken home systems | Amareri | Repair existing home tap infrastructure before new builds |
| 6 | Surveyor audit gap | All provinces | Re-survey all records flagged in the integrity analysis using independent surveyors |

---

## Dashboard

Built in Power BI. Tracks cumulative investment, people served, project completion percentage, and infrastructure activity, all filterable by province.

Open `dashboards/maji_ndogo.pbix` in Power BI Desktop to interact with the completed dashboard locally.

---

## Tools and Skills

| Tool / Skill | Application |
|---|---|
| MySQL | Data validation, cleaning, joins, window functions, feature engineering, audit comparison |
| Google Sheets | Pivot tables, regional breakdowns, queue time summaries |
| Power BI | Dashboard design, cumulative cost tracking, provincial filter controls |
| SQL Window Functions | Ranking water sources, calculating error frequency per surveyor |
| Exploratory Data Analysis | Distribution analysis, missing value profiling, structural assessment |
| Data Integrity Analysis | Survey-to-audit join, mismatch rate calculation, error distribution per employee |

---

## Limitations and Known Gaps

| Field | Issue | Analysis Impact |
|---|---|---|
| Pollution classifications | Inconsistent labels required correction before any contamination analysis | Pre-correction figures are unreliable and excluded from all findings |
| Audit mismatch scope | Flagged records are a subset; full error population is unknown | Misconduct analysis applies to flagged records only, not the full dataset |
| Queue time granularity | Figures are averages per source; individual-level wait time data is unavailable | Peak time analysis is directional, not precise |
| Budget overage context | 5.29% over-budget figure comes from the dashboard; root cause not analyzed here | Cost variance analysis is outside current scope |
| Hamisi and Kimapai depth | Provincial findings rely on aggregate figures; source-level breakdowns not produced | Findings for these two provinces are directional |

---

## How to Run

1. Clone the repository
2. Load SQL scripts from `sql/` into MySQL in numbered order (01 through 05)
3. Run queries sequentially; each script depends on the previous output
4. Open `dashboards/maji_ndogo.pbix` in Power BI Desktop to view the completed dashboard
5. Raw data files are in `data/raw/`; the EDA notebook is in `notebooks/`
