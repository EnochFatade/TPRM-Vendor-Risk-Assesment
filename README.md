# Third-Party Vendor Risk Assessment & Risk Scoring Model

## Overview
This project simulates a real-world Third-Party Risk Management (TPRM) workflow used by GRC and risk teams to evaluate vendor exposure and prioritize risk treatment.

Vendors are assessed using key risk factors (access level, regulatory impact, business criticality, and incident history). Each factor is scored and aggregated into a total **risk score**, then classified into **Low / Medium / High** risk tiers.

## Objectives
- Build a repeatable vendor risk scoring model
- Classify vendors into risk tiers for prioritization
- Provide a structured dataset and scoring logic usable for reporting and audits
- Demonstrate applied GRC + risk analytics skills using SQL and Excel

## Risk Factors & Scoring
**Access Level**
- Low = 1, Medium = 2, High = 3

**Regulatory Impact**
- Low = 1, Medium = 2, High = 3

**Availability Criticality**
- Low = 1, Medium = 2, High = 3

**Incident History**
- No = 1, Yes = 3

**Risk Score**
Sum of all factor scores

**Risk Tier**
- 4–6 = Low
- 7–9 = Medium
- 10–12 = High

## Tools Used
- Excel / Google Sheets (scoring model, validation)
- SQL (risk scoring and tier classification)
- GitHub (documentation and portfolio publishing)
- Power BI (optional dashboard)

## Repository Structure
- `data/` - vendor dataset in CSV format
- `analysis/` - Excel scoring model
- `sql/` - SQL script for scoring and tier classification
- `screenshots/` - visuals of outputs (Excel/SQL/Power BI)

## Outputs
Screenshots of key outputs are included in `/screenshots`.
