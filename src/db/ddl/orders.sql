CREATE TABLE IF NOT EXISTS stage.orders(
    batch_id              	INT,
    created_date          	TIMESTAMP,
    updated_date          	TIMESTAMP,
    submitted_date        	TIMESTAMP,
    delivery_date         	TIMESTAMP,
    customer_id           	INT,
    order_id               	INT,
    site_code              	VARCHAR(3),
    total					FLOAT,
    total_shipping         	FLOAT,
    tracking_code          	VARCHAR(25),
    order_status           	VARCHAR(10),
    gmv_enabled            	BOOLEAN,
    order_number           	VARCHAR(50),
    shipping_by_tracking	FLOAT,
    latitude               	FLOAT,
    longitude             	FLOAT,
    job_created_date  TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    job_created_user  VARCHAR(50) DEFAULT NULL,
    job_updated_date  TIMESTAMP DEFAULT NULL,
    job_updated_user  VARCHAR(50) DEFAULT NULL
);

COMMENT ON TABLE  stage.orders IS 'Contains request order data';
COMMENT ON COLUMN stage.orders.batch_id              IS 'Process id';
COMMENT ON COLUMN stage.orders.created_date          IS 'Order registration date';
COMMENT ON COLUMN stage.orders.updated_date          IS 'Last date that the order updated';
COMMENT ON COLUMN stage.orders.submitted_date        IS 'Order approval date ';
COMMENT ON COLUMN stage.orders.delivery_date         IS 'Delivery date';
COMMENT ON COLUMN stage.orders.customer_id           IS 'Customer id';
COMMENT ON COLUMN stage.orders.order_id              IS 'Order id';
COMMENT ON COLUMN stage.orders.site_code             IS 'City of registration site';
COMMENT ON COLUMN stage.orders.total				 IS 'The total value of the order';
COMMENT ON COLUMN stage.orders.total_shipping        IS 'Final amount of the order';
COMMENT ON COLUMN stage.orders.tracking_code         IS 'Location code';
COMMENT ON COLUMN stage.orders.order_status          IS 'Last order status';
COMMENT ON COLUMN stage.orders.gmv_enabled           IS 'Enables the order to be used in the GMV calculation';
COMMENT ON COLUMN stage.orders.order_number          IS 'Order number = customer_id + order_number + date (the date is only added if order_status == ARCHIVED)';
COMMENT ON COLUMN stage.orders.shipping_by_tracking  IS 'Shipment tracking';
COMMENT ON COLUMN stage.orders.latitude              IS 'Latitude';
COMMENT ON COLUMN stage.orders.longitude             IS 'Longitude';
COMMENT ON COLUMN stage.orders.job_created_date  IS 'Record creation date';
COMMENT ON COLUMN stage.orders.job_created_user  IS 'User who creation the record';
COMMENT ON COLUMN stage.orders.job_updated_date  IS 'record update date';
COMMENT ON COLUMN stage.orders.job_updated_user  IS 'User who updated the record';