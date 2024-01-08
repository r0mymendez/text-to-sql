CREATE TABLE IF NOT EXISTS stage.calendar(
    date           DATE PRIMARY KEY,
    day            INT,
    month          INT,
    year           INT,
    week           INT,
    day_of_week    INT,
    weekday        INT,
    day_of_year    INT,
    quarter        INT,
    month_name     VARCHAR(50),
    day_name       VARCHAR(50),
    job_created_date  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    job_created_user  VARCHAR(50) DEFAULT NULL,
    job_updated_date  TIMESTAMP DEFAULT NULL,
    job_updated_user  VARCHAR(50) DEFAULT NULL
);
COMMENT ON TABLE  stage.calendar IS 'Contains calendar dates';
