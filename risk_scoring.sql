-- Third Party Vendor Risk Scoring
SELECT
  vendor_id,
  vendor_name,
  service_type,
  data_access,
  access_level,
  regulatory_impact,
  incident_history,
  availability_critical,
  CASE access_level
    WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0
  END AS access_score,
  CASE regulatory_impact
    WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0
  END AS regulatory_score,
  CASE availability_critical
    WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0
  END AS availability_score,
  CASE incident_history
    WHEN 'No' THEN 1 WHEN 'Yes' THEN 3 ELSE 0
  END AS incident_score,
  (
    CASE access_level WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END +
    CASE regulatory_impact WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END +
    CASE availability_critical WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END +
    CASE incident_history WHEN 'No' THEN 1 WHEN 'Yes' THEN 3 ELSE 0 END
  ) AS risk_score
FROM vendor_data;
