CREATE TABLE IF NOT EXISTS stage.business_types(
	initcap           TEXT,
	business_type_id  INT PRIMARY KEY,
	active            BOOLEAN,
    job_created_date  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    job_created_user  varchar(50) default null,
    job_updated_date  TIMESTAMP default null,
    job_updated_user  varchar(50) default null
);
COMMENT ON TABLE  stage.business_types IS 'Contains business type classification';
COMMENT ON COLUMN stage.business_types.business_type_id      IS 'Business type id';
COMMENT ON COLUMN stage.business_types.initcap               IS 'Description of business type';
COMMENT ON COLUMN stage.business_types.active                IS 'Status of business type';
COMMENT ON COLUMN stage.business_types.job_created_date  IS 'Record creation date';
COMMENT ON COLUMN stage.business_types.job_created_user  IS 'User who creation the record';
COMMENT ON COLUMN stage.business_types.job_updated_date  IS 'record update date';
COMMENT ON COLUMN stage.business_types.job_updated_user  IS 'User who updated the record';

/*
Docuemntation
This table contains the business type classification for the business types, the businn
*/