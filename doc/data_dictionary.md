# Data Dictionary

## water_source

| Column | Description |
|--------|-------------|
| source_id | Unique identifier for water source |
| type_of_water_source | Type of water source |
| number_of_people_served | Population served |

---

## visits

| Column | Description |
|--------|-------------|
| visit_id | Unique visit identifier |
| location_id | Linked location |
| time_of_record | Timestamp of visit |
| queue_time | Time spent waiting |

---

## location

| Column | Description |
|--------|-------------|
| location_id | Unique location identifier |
| province | Province name |
| town | Town name |

---

## well_pollution

| Column | Description |
|--------|-------------|
| pollution_id | Unique pollution record |
| biological | Contamination level |
| results | Water quality classification |

---

## employee

| Column | Description |
|--------|-------------|
| employee_id | Unique employee identifier |
| employee_name | Surveyor name |

---

## auditor_report

| Column | Description |
|--------|-------------|
| auditor_id | Unique audit record |
| location_id | Linked location |
| auditor_score | Verified score |
| statements | Auditor notes |
