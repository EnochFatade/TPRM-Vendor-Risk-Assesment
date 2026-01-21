{\rtf1\ansi\ansicpg1252\cocoartf2639
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 -- Third-Party Vendor Risk Scoring\
-- This script assigns numeric scores to vendor risk factors and classifies overall risk tier.\
\
SELECT\
  vendor_id,\
  vendor_name,\
  service_type,\
  data_access,\
  access_level,\
  regulatory_impact,\
  incident_history,\
  availability_critical,\
\
  CASE access_level\
    WHEN 'Low' THEN 1\
    WHEN 'Medium' THEN 2\
    WHEN 'High' THEN 3\
    ELSE NULL\
  END AS access_score,\
\
  CASE regulatory_impact\
    WHEN 'Low' THEN 1\
    WHEN 'Medium' THEN 2\
    WHEN 'High' THEN 3\
    ELSE NULL\
  END AS regulatory_score,\
\
  CASE availability_critical\
    WHEN 'Low' THEN 1\
    WHEN 'Medium' THEN 2\
    WHEN 'High' THEN 3\
    ELSE NULL\
  END AS availability_score,\
\
  CASE incident_history\
    WHEN 'No' THEN 1\
    WHEN 'Yes' THEN 3\
    ELSE NULL\
  END AS incident_score,\
\
  (\
    CASE access_level WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
    + CASE regulatory_impact WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
    + CASE availability_critical WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
    + CASE incident_history WHEN 'No' THEN 1 WHEN 'Yes' THEN 3 ELSE 0 END\
  ) AS risk_score,\
\
  CASE\
    WHEN (\
      CASE access_level WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
      + CASE regulatory_impact WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
      + CASE availability_critical WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
      + CASE incident_history WHEN 'No' THEN 1 WHEN 'Yes' THEN 3 ELSE 0 END\
    ) <= 6 THEN 'Low'\
    WHEN (\
      CASE access_level WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
      + CASE regulatory_impact WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
      + CASE availability_critical WHEN 'Low' THEN 1 WHEN 'Medium' THEN 2 WHEN 'High' THEN 3 ELSE 0 END\
      + CASE incident_history WHEN 'No' THEN 1 WHEN 'Yes' THEN 3 ELSE 0 END\
    ) BETWEEN 7 AND 9 THEN 'Medium'\
    ELSE 'High'\
  END AS risk_tier\
\
FROM vendor_data;\
}