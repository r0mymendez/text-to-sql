	--query_analytics_dim_customer
    SELECT
		customer_id,
		email_address,
		name,
		business_type_id,
		drc.site_code_id,
		archived,
		is_key_account,
		CAST(TO_CHAR(c.date_created, 'YYYYMMDD') AS INT) date_created_id,
		now() job_created_date,
		'admin' job_created_user
	FROM stage.customers c
		INNER JOIN analytics.dim_region_city drc ON drc.site_code = c.site_code
		WHERE NOT EXISTS (SELECT 1 FROM analytics.dim_customer dc WHERE dc.customer_id = c.customer_id);