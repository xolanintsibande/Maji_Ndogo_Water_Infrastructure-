# Maji_Ndogo_Water_Infrastructure
  
Water Access, Infrastructure, and Data Integrity Assessment  

---

## 📌 Project Summary  

This project analyzes water access and infrastructure conditions in Maji Ndogo using a 60,000 record survey dataset.

The analysis evaluates:

- Water access patterns across populations  
- Infrastructure reliability and failures  
- Queue times and service efficiency  
- Data integrity through audit comparison  

Focus:
- Identify access gaps  
- Detect data inconsistencies  
- Support infrastructure improvement decisions  

---

## Dataset  

Source: Field survey + independent auditor report  

The dataset includes multiple relational tables:

- water_source  
- visits  
- location  
- water_quality  
- well_pollution  
- employee  
- auditor_report  

Scope:
- 60,000 survey records  
- National coverage across provinces and towns  

---

## Dataset Features  

| Feature | Description |
|--------|-------------|
| type_of_water_source | Water source category |
| number_of_people_served | Population served per source |
| queue_time | Time spent waiting for water |
| location | Province and town |
| biological | Contamination level |
| results | Water quality classification |
| employee_name | Surveyor responsible |
| auditor_score | Verified audit score |

---

## Project Objective  

The analysis answers:

- How do citizens access water across regions?  
- Which infrastructure types fail most often?  
- How severe are queue times across locations?  
- Where does data inconsistency occur?  
- Which regions require urgent intervention?  

---

## Data Challenges  

- Inconsistent pollution classifications  
- Duplicate or repeated visits  
- Mismatched survey and audit records  
- Corrupted text values in pollution data  
- Uneven distribution of records across regions  

---

## Data Cleaning Process  

### Step 1 Data Validation  
- Checked table relationships  
- Verified data consistency across joins  

### Step 2 Error Detection  
- Identified invalid “clean” labels with contamination > 0.01  
- Detected repeated visits to the same water source  

### Step 3 Data Correction  
- Updated incorrect pollution classifications  
- Standardized text values using SQL string functions  

### Step 4 Data Integrity Check  
- Compared survey data with auditor dataset  
- Isolated mismatched records  

---

## Feature Engineering  

Created analytical structures:

| Feature | Description |
|--------|-------------|
| total_served | Aggregated population per source |
| avg_queue_time | Average waiting time |
| error_count | Surveyor error frequency |
| rank_usage | Ranking of water sources |
| improvement_action | Recommended intervention |

---

## Analysis  

### Water Access Patterns  

- 43% of citizens rely on shared taps  
- Up to 2000 people share one tap  
- 31% have home water systems  
- 45% of home systems are broken  
- 18% rely on wells  
- Only 28% of wells are clean  

### Queue Time Analysis  

- Average queue time exceeds 120 minutes  
- Peak usage occurs mornings and evenings  
- Saturdays show highest congestion  

### Regional Analysis  

- Rural areas dominate water source distribution  
- Sokoto shows high dependence on river sources  
- Amina shows over 50% broken home taps  
- Capital city shows stronger infrastructure performance  

---

## Data Integrity Analysis  

Process:
- Joined survey data with auditor report  
- Measured mismatch rates  
- Calculated employee error distribution  

Result:
- Multiple employees flagged with above average error rates  
- Audit text analysis revealed links to potential misconduct  

---

## Improvement Logic  

| Condition | Action |
|----------|--------|
| River dependency | Drill wells |
| Biological contamination | Install UV + RO filtration |
| Chemical contamination | Install RO filtration |
| Long queues | Add additional taps |
| Broken home systems | Repair infrastructure |

---

## Data Visualizations  

Created:

- Queue time distribution by hour and day  
- Water source usage ranking  
- Regional water access breakdown  
- Pivot tables for province level analysis  

---

## Key Insights  

- Shared infrastructure serves large populations, causing long wait times  
- High failure rate in home water systems  
- Clean water access from wells remains limited  
- Rural regions face the highest access challenges  
- Data inconsistencies impact decision accuracy  

---

## Tools Used  

- MySQL  
- Google Sheets  

Techniques:

- Data Cleaning  
- SQL Analysis  
- Feature Engineering  
- Aggregations  
- Window Functions  
- Pivot Tables  
- Exploratory Data Analysis  

---

## Conclusion  

The analysis identifies critical gaps in water access and infrastructure.

Key outcomes:

- Clear identification of high risk regions  
- Detection of data integrity issues  
- Actionable recommendations for infrastructure improvement  

The dataset supports targeted interventions to improve water access efficiency and reliability.

---
