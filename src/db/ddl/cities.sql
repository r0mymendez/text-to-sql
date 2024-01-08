CREATE TABLE IF NOT EXISTS stage.cities(
    icao          VARCHAR(10),
    iata          VARCHAR(10),
    name          VARCHAR(100),
    city          VARCHAR(100),
    state         VARCHAR(100),
    country       VARCHAR(2),
    elevation     INT,
    lat           FLOAT,
    lon           FLOAT,
    tz            VARCHAR(50),
    country_name  VARCHAR(50),
    currency      VARCHAR(10),
    job_created_date  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    job_created_user  VARCHAR(50) DEFAULT NULL,
    job_updated_date  TIMESTAMP DEFAULT NULL,
    job_updated_user  VARCHAR(50) DEFAULT NULL
);
COMMENT ON TABLE  stage.cities IS 'Contains data about cities';