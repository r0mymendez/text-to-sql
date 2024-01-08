-- query_analytics_fact_sales
SELECT DISTINCT
		o.order_id,
		CAST(TO_CHAR(created_date, 'YYYYMMDD') AS INT) created_date_id,
		CAST(TO_CHAR(submitted_date, 'YYYYMMDD') AS INT) submitted_date_id,
		CAST(TO_CHAR(delivery_date, 'YYYYMMDD') AS INT) delivery_date_id,
		COALESCE(cu.customer_id, 0) customer_id,
		o.total,
		o.total_shipping,
		drc.site_code_id,
		o.gmv_enabled,
		o.order_number,
		ds.status_id,
		dc.currency_id,
		now() job_created_date,
		'adimin' job_created_user
	FROM stage.orders o
		LEFT JOIN analytics.dim_customer cu ON cu.customer_id = o.customer_id
		INNER JOIN analytics.dim_region_city drc ON drc.site_code = o.site_code
		INNER JOIN  analytics.dim_currency dc ON dc.country_id = drc.country_id
		INNER JOIN  analytics.dim_status ds ON ds.status_name = o.order_status
		WHERE NOT EXISTS (SELECT 1 FROM analytics.fact_sales fs2 WHERE fs2.order_id = o.order_id)