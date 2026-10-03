# Preventive Medicine & Immunization Coverage Analytics

[![Power BI](https://img.shields.io/badge/Power_BI-PL--300_Aligned-F2C811?style=flat&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![ArcGIS](https://img.shields.io/badge/ArcGIS-Spatial_Analytics-0079C1?style=flat&logo=arcgis&logoColor=white)](https://www.esri.com/)
[![SQL](https://img.shields.io/badge/SQL-PostgreSQL-336791?style=flat&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

An end-to-end public health surveillance project tracking immunization coverage, appointment dropouts, on-time adherence, and spatial disparities using Power BI and ArcGIS Maps.

---

## 📌 Project Overview
Preventive immunization programs rely on timely vaccine administration and equitable geographic coverage. This project delivers an executive surveillance dashboard designed to:
- Monitor target immunization coverage rates (Target: >80%) across diverse age cohorts.
- Detect non-compliance and missed appointment rates by vaccine type.
- Map clinic-level throughput and adherence using geospatial spatial clustering (ArcGIS).
- Track post-vaccination safety signals (Adverse Events Following Immunization - AEFI).

---

## 🏗️ Architecture & Star Schema

+-------------------------+
    |       Dim_Clinics       |
    +-------------------------+
    | *clinic_region (PK)     |
    |  city                   |
    |  latitude               |
    |  longitude              |
    +------------+------------+
                 | 1
                 |
                 | *
    +------------+------------+
    |    Fact_Vaccinations    |
    +-------------------------+
    | *record_id (PK)         |
    |  patient_id             |
    |  patient_age_group      |
    |  gender                 |
    |  clinic_region (FK)     |
    |  vaccine_type           |
    |  dose_sequence          |
    |  scheduled_date         |
    |  administered_date      |
    |  status                 |
    |  adverse_reaction       |
    +-------------------------+

---

## 📊 Core Surveillance KPIs (DAX)
- **Coverage Rate %:** Administered doses divided by total scheduled appointments.
- **On-Time Adherence %:** Vaccinations administered strictly on the scheduled date versus overdue administrations.
- **Dropout / Missed Rate %:** Proportion of patients missing critical immunization schedules.
- **AEFI % (Safety Signal):** Percentage of administered doses associated with an adverse reaction report.

---

## 🗺️ Geospatial Integration (ArcGIS for Power BI)
- **Bubble Size:** Total administered doses (throughput).
- **Color Ramp:** Coverage rate % by regional clinic to identify underserviced areas.
- **Interactive Tooltips:** Instant visibility into scheduling bottlenecks per municipal hub.

---

## 🛠️ Tech Stack
- **Business Intelligence & Mapping:** Microsoft Power BI, ArcGIS Maps, DAX
- **Database & Querying:** PostgreSQL (Aggregations, Filtered Metrics, Constraints)
- **Source Code Management:** Git, GitHub

---

## 👤 Author
**Mohamed M. Khallaf**  
- [LinkedIn Profile](https://www.linkedin.com/in/meedakh)
- [GitHub Profile](https://www.github.com/mohdkhallaf)
- [Upwork Freelancer Profile](https://www.upwork.com/freelancers/~014b76f212ed42a70b?mp_source=share)
- **Email:** mohdkhallaf1986@gmail.com
