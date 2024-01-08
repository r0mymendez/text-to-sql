CREATE TABLE if not exists stage.customers(
    customer_id           INT NOT NULL PRIMARY KEY,
    email_address         VARCHAR(50) NOT NULL,
    name                  VARCHAR(50) NOT NULL,
    business_type_id      INT NOT NULL,
    site_code             VARCHAR(10) NOT NULL,
    archived              BOOLEAN NOT NULL,
    is_key_account        BOOLEAN NOT NULL,
    date_updated          TIMESTAMP NOT NULL,
    date_created          TIMESTAMP NOT NULL,
    job_created_date  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    job_created_user  varchar(50) default null,
    job_updated_date  TIMESTAMP default null,
    job_updated_user  varchar(50) default null,
    CONSTRAINT fk_business_type_id FOREIGN KEY(business_type_id) REFERENCES stage.business_types (business_type_id)
);

COMMENT ON TABLE  stage.customers IS 'Contains user registration data';
COMMENT ON COLUMN stage.customers.customer_id      IS 'Customer id';
COMMENT ON COLUMN stage.customers.email_address    IS 'Customer registration email';
COMMENT ON COLUMN stage.customers.name             IS 'Customer name';
COMMENT ON COLUMN stage.customers.business_type_id IS 'Business unit id, see data in business_types table';
COMMENT ON COLUMN stage.customers.site_code        IS 'City of registration site';
COMMENT ON COLUMN stage.customers.archived         IS 'Unsubscribed account';
COMMENT ON COLUMN stage.customers.is_key_account   IS 'Account of a key customer';
COMMENT ON COLUMN stage.customers.date_updated     IS 'Last date that the user updated';
COMMENT ON COLUMN stage.customers.date_created     IS 'User registration date';
COMMENT ON COLUMN stage.customers.job_created_date  IS 'Record creation date';
COMMENT ON COLUMN stage.customers.job_created_user  IS 'User who creation the record';
COMMENT ON COLUMN stage.customers.job_updated_date  IS 'record update date';
COMMENT ON COLUMN stage.customers.job_updated_user  IS 'User who updated the record';