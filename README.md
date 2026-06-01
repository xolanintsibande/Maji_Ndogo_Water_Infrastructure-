# Maji Ndogo Water Infrastructure Analysis
### Water Access, Infrastructure Performance, and Data Integrity Assessment

![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Records](https://img.shields.io/badge/Records-60%2C000%2B-blue)
![Tool](https://img.shields.io/badge/Tool-MySQL-orange)
![Dashboard](https://img.shields.io/badge/Dashboard-Power%20BI-yellow)

---

## Key Highlights

- Cleaned and validated 60,000+ water infrastructure records across 7 relational tables using MySQL
- 43% of citizens rely on shared taps serving up to 2,000 people per source
- 45% of home water systems are non-functional; only 28% of wells produce clean water
- Average queue time exceeds 120 minutes nationally; Saturdays record the highest congestion across all 5 provinces
- Survey-to-audit join flagged multiple surveyors with above-average error rates
- $154.5M cumulative investment tracked across 5 provinces; 18M people reached; 100% project completion

---

## Table of Contents

1. [Project Overview](#project-overview)
2. [Project Workflow](#project-workflow)
3. [Dataset](#dataset)
4. [Repository Structure](#repository-structure)
5. [Methodology](#methodology)
6. [SQL Techniques](#sql-techniques)
7. [Key Findings](#key-findings)
8. [Recommendations](#recommendations)
9. [Dashboard](#dashboard)
10. [Skills Demonstrated](#skills-demonstrated)
11. [Limitations and Known Gaps](#limitations-and-known-gaps)
12. [How to Run](#how-to-run)

---

## Project Overview

This project analyzes water access and infrastructure conditions across Maji Ndogo using a 60,000-record national field survey dataset. The objective was to identify access gaps, evaluate infrastructure performance, detect inconsistencies between survey and audit records, and generate evidence-based recommendations for water infrastructure investment across 5 provinces.

**Business questions answered:**

- How do citizens access water across all 5 provinces?
- Which infrastructure types fail most often, and where?
- How severe are queue times, and when do they peak?
- Where do survey and audit records conflict, and which surveyors are responsible?
- Which provinces require urgent intervention?
- How effectively are infrastructure investments improving water access?

---

## Project Workflow

```
Raw Data → Data Validation → Data Cleaning → Data Integrity Analysis
    → Feature Engineering → Exploratory Analysis → Power BI Dashboard → Recommendations
```

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

```
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
```

---

## Methodology

**Step 1 — Data Validation**
Verified primary and foreign key relationships across 7 relational tables. Checked join consistency between survey, location, water quality, and audit datasets before any analysis.

**Step 2 — Error Detection**
Identified invalid "clean" labels where biological contamination exceeded 0.01. Detected repeated source visits incorrectly classified as independent assessments.

**Step 3 — Data Correction**
Corrected pollution classification errors. Standardized inconsistent text values using SQL string functions across related tables.

**Step 4 — Data Integrity Check**
Joined survey records with the independent auditor report. Measured mismatch rates between surveyor and auditor scores. Calculated surveyor error frequency using SQL window functions.

**Step 5 — Feature Engineering**

| Feature | Description |
|---|---|
| `total_served` | Aggregated population per water source |
| `avg_queue_time` | Average waiting time per source in minutes |
| `error_count` | Surveyor error frequency from audit join |
| `rank_usage` | Water source ranked by usage volume per province |
| `improvement_action` | Recommended infrastructure intervention per source |

**Step 6 — Exploratory Analysis**
Assessed water access distribution across provinces. Evaluated infrastructure reliability by source type. Investigated queue time patterns, contamination trends, and provincial performance indicators.

---

## SQL Techniques

- Multi-table JOINs across 7 relational tables
- Common Table Expressions (CTEs)
- Window functions for ranking and error frequency calculation
- Aggregations and grouped calculations
- String standardization with SQL string functions
- Feature engineering and data transformation
- Survey-to-audit comparison queries
- Partition and ranking functions

---

## Key Findings

**Finding 1 — Water Access by Source Type**

- 43% of citizens rely on shared taps; up to 2,000 people share one tap
- 31% have home water systems; 45% of those systems are non-functional
- 18% rely on wells; only 28% of wells produce clean water

**Finding 2 — Queue Times**

- Average queue time exceeds 120 minutes nationally
- Peak usage occurs during morning and evening hours daily
- Saturdays record the highest congestion across all 5 provinces

**Finding 3 — Provincial Distribution**

| Province | Primary Issue | Detail |
|---|---|---|
| Sokoto | River dependency | High share of population relies on unimproved river sources |
| Amareri | Broken home taps | Over 50% of home tap systems are non-functional |
| Atsisi | Queue congestion | Above-national-average queue times at shared taps |
| Hamisi | Well contamination | High proportion of wells with biological or chemical contamination |
| Kimapai | Infrastructure gap | Low tap density relative to population; high shared tap load |
| Capital (Atsisi) | Reference benchmark | Stronger performance than all rural provinces |

**Finding 4 — Infrastructure Investment**

- Cumulative investment: $154.5M across 5 provinces
- Budget goal: $146.74M; actual spend exceeded goal by 5.29% ($7.76M over)
- 18M people reached with basic water access
- 100% project completion; 0 sources remaining in the active queue

**Finding 5 — Data Integrity**

- Multiple surveyors recorded above-average error rates against independent auditor assessments
- Audit text analysis identified a subset of records with patterns consistent with deliberate score manipulation
- Flagged records are a subset of the full dataset; total error population is unknown

---

## Recommendations

| Priority | Condition | Province(s) | Recommended Action |
|---|---|---|---|
| 1 | River dependency | Sokoto | Drill new wells to replace surface water reliance |
| 2 | Biological contamination | Hamisi, Kimapai | Install UV and RO filtration at affected wells |
| 3 | Chemical contamination | Hamisi | Install RO filtration at chemically contaminated wells |
| 4 | Queue times above 120 minutes | Atsisi, Amareri, Kimapai | Install additional shared taps to reduce load per source |
| 5 | Broken home systems | Amareri | Repair existing home tap infrastructure before new builds |
| 6 | Survey-audit discrepancies | All provinces | Re-survey all flagged records using independent surveyors |

---

## Dashboard

Built in Power BI. Tracks cumulative investment, people served, project completion, and infrastructure activity filterable by province.

| KPI | Value |
|---|---|
| Total investment | $154.5M |
| Population served | 18M |
| Project completion | 100% |
| Budget variance | +5.29% |

Open `dashboards/maji_ndogo.pbix` in Power BI Desktop to interact with the completed dashboard locally.

---

## Skills Demonstrated

**Data Analysis**
- Exploratory Data Analysis
- Data validation and cleaning
- Data quality assessment
- Feature engineering
- Root cause analysis

**SQL**
- Multi-table joins
- Window functions
- Common Table Expressions
- Aggregations and ranking functions
- Data transformation and standardization

**Data Visualization**
- Power BI dashboard development
- KPI design and tracking
- Interactive provincial filtering
- Executive reporting

**Business Analysis**
- Infrastructure performance assessment
- Investment tracking and variance analysis
- Data integrity auditing
- Evidence-based recommendation development

---

## Limitations and Known Gaps

| Field | Issue | Analysis Impact |
|---|---|---|
| Pollution classifications | Inconsistent labels required correction before any contamination analysis | Pre-correction figures excluded from all findings |
| Audit mismatch scope | Full error population is unknown | Findings limited to flagged records only |
| Queue time granularity | Source-level averages only; no individual-level data | Peak time analysis is directional |
| Budget overage context | Root cause not analyzed in this project | Cost variance is outside current scope |
| Hamisi and Kimapai depth | Aggregate-level findings only; source-level breakdowns not produced | Provincial findings for these two provinces are directional |

---

## How to Run

1. Clone the repository
2. Load SQL scripts from `sql/` into MySQL in numbered order (01 through 05)
3. Run scripts sequentially; each script depends on the previous output
4. Open `dashboards/maji_ndogo.pbix` in Power BI Desktop
5. Raw data files are in `data/raw/`; the EDA notebook is in `notebooks/`
