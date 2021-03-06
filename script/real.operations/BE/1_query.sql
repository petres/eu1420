DROP TABLE IF EXISTS real.operations_be;

CREATE TABLE real.operations_be AS
WITH
"2014BE16RFOP001_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    total_eligible_expenditure_allocated_to_the_operation_in_euros::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN union_cofinancing_rate_as_per_priority_axes_::DECIMAL > 1.0 THEN union_cofinancing_rate_as_per_priority_axes_::DECIMAL
      ELSE union_cofinancing_rate_as_per_priority_axes_::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_1' AS data_source
  FROM raw."2014BE16RFOP001_1"
),

"2014BE16RFOP001_2" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    TO_DATE("operation_start_date", 'DD/MM/YYYY')::DATE AS operation_start_date,
    TO_DATE("operation_end_date", 'DD/MM/YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation_in_euros,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_2' AS data_source
  FROM raw."2014BE16RFOP001_2"
),

"2014BE16RFOP001_3" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    operation_postcode::DECIMAL::INTEGER::TEXT AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_3' AS data_source
  FROM raw."2014BE16RFOP001_3"
),

"2014BE16RFOP001_4" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation_en_euro,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    REPLACE(operation_postcode,'.0','') AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(operation_postcode,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_4' AS data_source
  FROM raw."2014BE16RFOP001_4"
),

"2014BE16RFOP001_5" AS (
SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation_in_euros,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    REPLACE(operation_postcode,'.0','') AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(operation_postcode,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_5' AS data_source
  FROM raw."2014BE16RFOP001_5"
),

"2014BE16RFOP001_6" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    REPLACE(operation_postcode,'.0','') AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(operation_postcode,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_6' AS data_source
  FROM raw."2014BE16RFOP001_6"
),

"2014BE16RFOP001_7" AS (
SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    TO_DATE("operation_start_date", 'DD/MM/YYYY')::DATE AS operation_start_date,
    TO_DATE("operation_end_date", 'DD/MM/YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    REPLACE(total_eligible_expenditure_allocated_to_the_operation,' ','')::DECIMAL AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL > 1.0 THEN REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate_as_per_priority_axes_,' ','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    country AS country,
    REPLACE(operation_postcode,'.0','') AS operation_location,
    REPLACE(code_of_category_of_intervention_of_the_operation,'.0','') AS code_of_category_intervention,
    name_of_category_of_intervention_of_the_operation AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    REPLACE(operation_postcode,'.0','') AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    NULL::DECIMAL AS eu_subsidy_value,
    NULL AS beneficiary_id,
    NULL AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP001' AS cci,
    '2014BE16RFOP001_7' AS data_source
  FROM raw."2014BE16RFOP001_7"
),

"2014BE16RFOP002_1" AS (
  SELECT
    operation_name AS operation_name,
    beneficiary_name AS beneficiary_name,
    operation_summary AS operation_summary,
    to_timestamp_from_excel(TO_NUMBER("operation_start_date", '99999D9')::INTEGER)::DATE AS operation_start_date,
    to_timestamp_from_excel(TO_NUMBER("operation_end_date", '99999D9')::INTEGER)::DATE AS operation_end_date,
    'EUR' AS currency,
    CASE
      WHEN total_eligible_expenditure LIKE '%?%' THEN REPLACE(REPLACE(REPLACE(REPLACE(total_eligible_expenditure,'?',''),' ',''),'.',''),',','.')::DECIMAL
      ELSE total_eligible_expenditure::DECIMAL
    END AS operation_total_expenditure,
    CASE
      WHEN REPLACE(union_cofinancing_rate,'%','')::DECIMAL > 1.00 THEN REPLACE(union_cofinancing_rate,'%','')::DECIMAL
      ELSE REPLACE(union_cofinancing_rate,'%','')::DECIMAL*100.0
    END AS eu_cofinancing_rate,
    NULL AS country,
    city operation_location,
    REPLACE(category_of_intervention,'.0','') AS code_of_category_intervention,
    category_of_intervention_2 AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    city AS operation_city,
    NULL AS operation_district,
    postcode AS operation_zip_code,
    NULL::DECIMAL AS member_state_value,
    CASE
      WHEN efrosteun LIKE '%?%' THEN REPLACE(REPLACE(REPLACE(REPLACE(efrosteun,'?',''),' ',''),'.',''),',','.')::DECIMAL
      ELSE efrosteun::DECIMAL
    END AS eu_subsidy_value,
    NULL AS beneficiary_id,
    REPLACE(projectnumber, '.0', '') AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP002' AS cci,
    '2014BE16RFOP002_1' AS data_source
  FROM raw."2014BE16RFOP002_1"
),

"2014BE16RFOP003_1" AS (
  SELECT
    projet_operation_nameproject AS operation_name,
    beneficiaire_final_beneficiary_name AS beneficiary_name,
    resume_de_loperation_operation_summary AS operation_summary,
    TO_DATE("date_debut_de_loperation_operation_start_date", 'DD/MM/YYYY')::DATE AS operation_start_date,
    TO_DATE("date_de_fin_de_loperation_operation_end_date", 'DD/MM/YYYY')::DATE AS operation_end_date,
    'EUR' AS currency,
    (REPLACE(REPLACE(montant_des_aides_decidees__feder_40_union_cofinancing_rate_40,'.',''),',','.')::DECIMAL) + (REPLACE(REPLACE(montant_des_aides_decidees__part_wallonne_member_state_cofinan,'.',''),',','.')::DECIMAL) AS operation_total_expenditure,
    (REPLACE(REPLACE(montant_des_aides_decidees__feder_40_union_cofinancing_rate_40,'.',''),',','.')::DECIMAL) / ((REPLACE(REPLACE(montant_des_aides_decidees__feder_40_union_cofinancing_rate_40,'.',''),',','.')::DECIMAL) + (REPLACE(REPLACE(montant_des_aides_decidees__part_wallonne_member_state_cofinan,'.',''),',','.')::DECIMAL))*100.0 AS eu_cofinancing_rate,
    -- TODO: THIS ^ NEEDS TO BE SUPERVISED:
    -- THERE IS A 'montant_des_aides_decidees__cout_total'
    -- column provided, but the 40 % cofinancing rate does
    -- does not apply to that column
    pays_country AS country,
    code_postal_operation_postcode AS operation_location,
    numero_de_ci_number_of_ci AS code_of_category_intervention,
    categorie_dintervention_ci_category_of_intervention_ci AS name_of_category_intervention,
    NULL::DATE AS date_of_last_update,
    'BE' AS operation_nuts0,
    NULL AS operation_nuts1_code,
    NULL AS operation_nuts1_name,
    NULL AS operation_nuts2_code,
    NULL AS operation_nuts2_name,
    NULL AS operation_nuts3_code,
    NULL AS operation_nuts3_name,
    NULL AS operation_lau1_code,
    NULL AS operation_lau1_name,
    NULL AS operation_lau2_code,
    NULL AS operation_lau2_name,
    NULL AS operation_city,
    NULL AS operation_district,
    NULL AS operation_zip_code,
    (REPLACE(REPLACE(montant_des_aides_decidees__part_wallonne_member_state_cofinan,'.',''),',','.')::DECIMAL) AS member_state_value,
    (REPLACE(REPLACE(montant_des_aides_decidees__feder_40_union_cofinancing_rate_40,'.',''),',','.')::DECIMAL) AS eu_subsidy_value,
    NULL AS beneficiary_id,
    ndeg_de_dossier AS operation_id,
    NULL AS priority_axis,
    NULL AS form_of_finance,
    NULL AS territorial_dimension,
    NULL AS territorial_delivery_mechanism,
    NULL AS esf_secondary_theme,
    NULL AS economic_dimension,
    '2014BE16RFOP003' AS cci,
    '2014BE16RFOP003_1' AS data_source
  FROM raw."2014BE16RFOP003_1"
),

vw AS (
  SELECT * FROM "2014BE16RFOP001_1"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_2"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_3"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_4"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_5"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_6"
  UNION ALL
  SELECT * FROM "2014BE16RFOP001_7"
  UNION ALL
  SELECT * FROM "2014BE16RFOP002_1"
  UNION ALL
  SELECT * FROM "2014BE16RFOP003_1"
)

SELECT
  *
FROM vw;