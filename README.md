# db2BloombergQatar

This repository provides a containerized **IBM Db2 Community Edition** database stack optimized for deployment on modern platforms like **Ubuntu 25**. It features an explicit engine pin to bypass modern glibc x86-64-v2 microarchitecture restrictions, making it compatible with older hardware environments and standard Virtual Machine processors.

The included tracking schema (`db2_database.sql`) contains structural models designed for multi-asset corporate intelligence, historical financial indexing, and global trend forecasting.

---

## 🛠️ Stack Specifications

- **Database Engine:** IBM Db2 Community Edition (v11.5.8.0)
- **Host OS Target:** Ubuntu 25 (Plucky Puffin)
- **Architecture Baseline:** `x86-64-v1` compatible (Bypasses `Fatal glibc error: CPU does not support x86-64-v2` crash)
- **Default Listening Port:** `50000`

---

## 🚀 Deployment Guide

### 1. Initialize the Container Engine
Run the engine with a mapped persistent directory within your user home folder to isolate system file write conflicts:

```bash
docker run -d --name db2server --privileged=true \
  -p 50000:50000 \
  -e LICENSE=accept \
  -e DB2INSTANCE=db2inst1 \
  -e DB2INST1_PASSWORD=your_password_here \
  -e DBNAME=testdb \
  -v ~/db2_data:/database \
  icr.io/db2_community/db2:11.5.8.0
```

### 2. Stream Setup Diagnostics
The database initialization script handles instance creation and schema setups on its initial boot sequence. Watch the real-time initialization pipeline:
```bash
docker logs -f db2server
```
*You can exit the logs stream safely by pressing `Ctrl + C` once the terminal stabilizes.*

---

## 📊 Database Schema Summary

The core data layout inside `db2_database.sql` handles complex multi-asset metrics and institutional investment mapping:

* **`chevron_pdvsa_projections`**: Joint-venture corporate forecasts, monthly operational horizons, planned investments, and target production bounds (BPD).
* **`cvx_historical_financials`**: Complete high-level income statements tracking total revenue, gross profit, SG&A margins, and net corporate values.
* **`cvx_institutional_holdings`**: Equity profiles tracking positions held by major institutional players (Vanguard, BlackRock, Berkshire Hathaway) alongside share value tracking.
* **`global_asset_projections`**: Quantitative modeling horizons tracking pricing targets, alpha indicators, and beta triggers (e.g., MSFT, CVX).
* **`global_asset_registry`**: Core asset tickers, major global exchange listings, and industrial sector taxonomy.

### Ingestion Protocol

To load the compiled SQL schema script into your active database engine container, execute the following operational sequence:

```bash
# 1. Transport the schema file into the container filesystem
docker cp db2_database.sql db2server:/tmp/db2_database.sql

# 2. Parse and execute the file via the Db2 Command Line Processor (CLP)
docker exec -ti db2server bash -c "su - db2inst1 -c 'db2 connect to testdb && db2 -tvf /tmp/db2_database.sql'"
```
*Arguments used: `-t` processes standard semicolons, `-v` outputs command feedback strings, and `-f` executes files.*

---

## 💻 Working with the Interactive Shell

To run ad-hoc queries, check performance optimization logs, or manually check structural tables, enter the container workspace:

```bash
# Enter the interactive terminal context as instance owner
docker exec -ti db2server bash -c "su - db2inst1"

# Connect to the target database
db2 connect to testdb

# Run metadata checks and table verification
db2 list tables
db2 "SELECT * FROM chevron_pdvsa_projections FETCH FIRST 5 ROWS ONLY"
```
