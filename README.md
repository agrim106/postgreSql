# postgreSql
# PostgreSQL: A Comprehensive Guide

## Data Types

### Common Data Types
- **Numeric Types**
  - INTEGER: Whole numbers (-2147483648 to +2147483647)
  - BIGINT: Large-range whole numbers
  - DECIMAL/NUMERIC: Exact decimal numbers
  - REAL/DOUBLE PRECISION: Floating-point numbers
  
- **Character Types**
  - CHAR(n): Fixed-length, space-padded
  - VARCHAR(n): Variable-length with limit
  - TEXT: Unlimited length

- **Date/Time Types**
  - DATE: Date only (YYYY-MM-DD)
  - TIME: Time only (HH:MM:SS)
  - TIMESTAMP: Date and time
  - INTERVAL: Time periods

- **Other Types**
  - BOOLEAN: true/false
  - UUID: Universally unique identifiers
  - JSON/JSONB: JSON data (JSONB is binary and indexed)
  - ARRAY: Array of any data type

## Keys and Constraints

### Primary Keys
Primary keys uniquely identify each row in a table.

```sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL
);
```

### Foreign Keys
Foreign keys establish relationships between tables:

```sql
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user
        FOREIGN KEY (user_id)
        REFERENCES users(id)
        ON DELETE CASCADE
);
```

### Constraints
- **NOT NULL**: Column must have a value
- **UNIQUE**: All values in column must be unique
- **CHECK**: Values must meet specific conditions
- **DEFAULT**: Sets default value if none provided
- **EXCLUSION**: Ensures no conflicting rows exist based on specified conditions

```sql
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0),
    stock INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(name)
);
```

## Indexes

### Types of Indexes
- **B-tree** (default): General-purpose balanced tree
- **Hash**: Equality operations only
- **GiST**: Geometric and custom data types
- **SP-GiST**: Space-partitioned data
- **GIN**: Composite values
- **BRIN**: Block Range INdexes for large tables

```sql
-- Basic index
CREATE INDEX idx_user_email ON users(email);

-- Multi-column index
CREATE INDEX idx_order_user_date ON orders(user_id, order_date);

-- Unique index
CREATE UNIQUE INDEX idx_unique_email ON users(lower(email));

-- Partial index
CREATE INDEX idx_active_users ON users(last_login) WHERE active = true;
```

## Views

### Regular Views
Virtual tables based on SELECT queries:

```sql
CREATE VIEW active_users AS
SELECT id, username, email
FROM users
WHERE last_login > CURRENT_TIMESTAMP - INTERVAL '30 days';
```

### Materialized Views
Stored results of a query that can be periodically refreshed:

```sql
CREATE MATERIALIZED VIEW monthly_sales AS
SELECT 
    date_trunc('month', order_date) as month,
    sum(amount) as total_sales
FROM orders
GROUP BY 1
WITH DATA;

-- Refresh when needed
REFRESH MATERIALIZED VIEW monthly_sales;
```

## Transactions

### ACID Properties
- **Atomicity**: All or nothing execution
- **Consistency**: Database remains valid after transaction
- **Isolation**: Transactions are independent
- **Durability**: Committed changes are permanent

```sql
BEGIN;
    UPDATE accounts SET balance = balance - 100 WHERE id = 1;
    UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;

-- Or rollback if needed
ROLLBACK;
```

### Transaction Isolation Levels
- READ UNCOMMITTED
- READ COMMITTED (default)
- REPEATABLE READ
- SERIALIZABLE

```sql
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
-- transaction operations
COMMIT;
```

## Advanced Features

### Inheritance
Tables can inherit from other tables:

```sql
CREATE TABLE cities (
    name text,
    population float,
    elevation int
);

CREATE TABLE capitals (
    state char(2)
) INHERITS (cities);
```

### Partitioning
Divide large tables into smaller, manageable chunks:

```sql
CREATE TABLE measurements (
    city_id int not null,
    logdate date not null,
    peaktemp int,
    unitsales int
) PARTITION BY RANGE (logdate);

CREATE TABLE measurements_y2020 PARTITION OF measurements
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');
```

### Functions and Procedures
Custom functions can be created using various languages:

```sql
CREATE OR REPLACE FUNCTION calculate_age(birthday date)
RETURNS integer AS $$
BEGIN
    RETURN extract(year from age(current_date, birthday));
END;
$$ LANGUAGE plpgsql;
```

### Triggers
Automatic actions based on database events:

```sql
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.modified = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER update_customer_modtime
    BEFORE UPDATE ON customers
    FOR EACH ROW
    EXECUTE FUNCTION update_modified_column();
```

## Performance Optimization

### Query Optimization
- Use EXPLAIN ANALYZE to understand query execution
- Properly index frequently queried columns
- Regular VACUUM and ANALYZE maintenance
- Appropriate configuration of postgresql.conf

```sql
EXPLAIN ANALYZE
SELECT * FROM users
WHERE email LIKE '%@example.com'
AND created_at > '2024-01-01';
```

### Connection Pooling
Use connection poolers like pgBouncer for better resource management:

```ini
[databases]
mydb = host=localhost port=5432 dbname=mydb

[pgbouncer]
pool_mode = transaction
max_client_conn = 100
default_pool_size = 20
```