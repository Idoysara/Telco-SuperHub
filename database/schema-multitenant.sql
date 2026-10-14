CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE tenants (
    tenant_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    business_name VARCHAR(150) NOT NULL,
    rif VARCHAR(20) UNIQUE NOT NULL,
    saas_tier VARCHAR(30) DEFAULT 'PLAN_PYME',
    take_rate_pct NUMERIC(4,2) DEFAULT 2.50,
    sponsored_data_balance_mb BIGINT DEFAULT 0,
    odoo_webhook_url TEXT,
    created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE erp_inventory (
    item_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID NOT NULL REFERENCES tenants(tenant_id),
    sku VARCHAR(64) NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    price_usd NUMERIC(12,2) NOT NULL,
    stock_available INT NOT NULL DEFAULT 0,
    updated_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE(tenant_id, sku)
);

CREATE TABLE fintech_ledger (
    tx_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    tenant_id UUID NOT NULL REFERENCES tenants(tenant_id),
    customer_msisdn VARCHAR(20) NOT NULL,
    gross_amount NUMERIC(14,2) NOT NULL,
    telco_fee_amount NUMERIC(14,2) NOT NULL,
    net_merchant_amount NUMERIC(14,2) NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    bank_reference VARCHAR(64),
    kyc_sim_verified BOOLEAN DEFAULT TRUE,
    status VARCHAR(20) DEFAULT 'COMPLETED',
    created_at TIMESTAMPTZ DEFAULT NOW()
);

ALTER TABLE erp_inventory ENABLE ROW LEVEL SECURITY;
ALTER TABLE fintech_ledger ENABLE ROW LEVEL SECURITY;

CREATE POLICY tenant_isolation_inventory ON erp_inventory
    USING (tenant_id = current_setting('app.current_tenant_id')::UUID);

CREATE POLICY tenant_isolation_ledger ON fintech_ledger
    USING (tenant_id = current_setting('app.current_tenant_id')::UUID);
