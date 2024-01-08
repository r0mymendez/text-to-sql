CREATE TABLE IF NOT EXISTS stage.exchange_rates(
    date          DATE,
    currency      VARCHAR(10),
    rate		  FLOAT,
    job_created_date  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    job_created_user  VARCHAR(50) DEFAULT NULL,
    job_updated_date  TIMESTAMP DEFAULT NULL,
    job_updated_user  VARCHAR(50) DEFAULT NULL
);
COMMENT ON TABLE  stage.exchange_rates IS 'Contains data by date, about the currency exchange rates';
