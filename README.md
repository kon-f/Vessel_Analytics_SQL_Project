# Vessel Analytics SQL Project
[![Solidity](https://img.shields.io/badge/Solidity-0.8.0-blue)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)]()

This project is a complete SQL-based analytics workflow for vessel movement data. It includes table creation, data loading, query execution, performance tuning using PostgreSQL settings, and indexing strategies.

## 📘 Project Overview

The goal is to analyze vessel movement data using PostgreSQL, focusing on performance improvements via memory tuning, CPU parallelism, and indexing. Each query explores a different aspect of the dataset — from tracking signals to filtering vessel types and speeds.

## 📊 Schema Description

There are three main tables:

- **Vessels**: Basic info about each vessel (e.g., ID, type, flag).
- **Positions**: Timestamped location and speed info. Positions.csv file contains only a tiny portion of the original data.
- **VesselTypes**: Description of vessel types.

## 🛠️ PostgreSQL Features Used

- `COPY ... WITH CSV HEADER` for bulk data import.
- `VACUUM FULL` for statistics refresh.
- `EXPLAIN` for analyzing execution plans.
- `ALTER SYSTEM SET` to increase RAM and worker parallelism.
- `CREATE INDEX` to enhance performance.

## ⚙️ Performance Tuning Steps

The same queries were run in four different stages:

1. **Baseline** — no system tuning.
2. **Increased RAM** — via `work_mem`.
3. **Increased parallel workers** — via `max_parallel_workers_per_gather`.
4. **With indexes** — manually added indexes based on query patterns.

## 🔍 Analytical Queries

| Query | Description |
|-------|-------------|
| Query 1 | Count of unique positions per date |
| Query 2 | Group count of Greek-flagged vessels by type |
| Query 3 | Count of vessels with speed > 30 by type |
| Query 4 | Daily count of passenger ships |
| Query 5a | Anchored cargo ships during 15-18 Aug (speed = 0 or NULL at least once) |
| Query 5b | Stationary cargo ships for full 12-19 Aug period (no movement at all) |

## 📎 How to Run Locally

1. Start PostgreSQL and create your DB.
2. Run all SQL files in `schema/` and `config/`.
3. Copy `.csv` files into the correct tables using `COPY` commands. Alter Copy_With_CSV_Header.sql file according to your needs.
4. Execute queries from `queries/` and analyze performance with `EXPLAIN`.

## 📂 Folder Structure

```
├── README.md
├── schema/
│   ├── Create_Tables.sql
│   ├── Copy_With_CSV_Header.sql
│   ├── Create_Indexes.sql
│   └── Vacuum_Full.sql
├── config/
│   ├── Alter_System_RAM.sql
│   └── Alter_System_Parallel_Workers.sql
├── queries/
│   ├── Query1_Distinct_Signals.sql
│   ├── Query2_Greece_Flag.sql
│   ├── Query3_Speed_Over_30.sql
│   ├── Query4_Passenger_Ships.sql
│   ├── Query5a_Anchored_Cargo.sql
│   └── Query5b_Stationary_Cargo.sql
├── data/
│   ├── Vessels.csv
│   ├── Positions.csv
│   └── VesselTypes.csv
├── screenshots/

```

## 📈 EXPLAIN Plan Observations

- After indexing and tuning, query execution times reduced by up to **99%**.
- Example: Query 5b dropped from 4.6s to 0.2s.
- Index-only scans and faster joins were used post-optimization.

## 🧩 Future Work

- Add Python or Jupyter notebooks for visualizing query results.
- Automate benchmarking with timing scripts.
- Support real-time ingestion (e.g., via Kafka or streaming pipelines).

## 📸 Screenshots

### 🧰 Creation

#### CreateTables
![CreateTables](screenshots/CreateTables.jpg)

#### AlterDataTypes
![AlterDataTypes](screenshots/AlterDataTypes.jpg)

#### PopulateP
![PopulateP](screenshots/PopulateP.jpg)

#### PopulateV
![PopulateV](screenshots/PopulateV.jpg)

#### PopulateVT
![PopulateVT](screenshots/PopulateVT.jpg)

#### VacuumPositions
![VacuumPositions](screenshots/VacuumPositions.jpg)


---


### 🧩 Query 1

#### 1i
![1i](screenshots/1i.jpg)
![1i Explain](screenshots/1i_Explain.jpg)

#### 1ii
![1ii](screenshots/1ii.jpg)
![1ii Explain](screenshots/1ii_Explain.jpg)

#### 1iii
![1iii](screenshots/1iii.jpg)
![1iii Explain](screenshots/1iii_Explain.jpg)

#### 1iv
![1iv](screenshots/1iv.jpg)
![1iv Explain](screenshots/1iv_Explain.jpg)

#### 1v_a
![1v_a](screenshots/1v_a.jpg)
![1v_a Explain](screenshots/1v_a_Explain.jpg)

#### 1v_b
![1v_b](screenshots/1v_b.jpg)
![1v_b(results)](screenshots/1v_b(results).jpg)
![1v_b Explain](screenshots/1v_b_Explain.jpg)

---

### 🧩 Query 2

#### Alter MEM - We will run queries after altering the ammount of RAM used as buffer by SQL
- ![2AlterMEM](screenshots/2AlterMEM.jpg)

#### 2i
![2i](screenshots/2i.jpg)
![2i Explain](screenshots/2i_Explain.jpg)

#### 2ii
![2ii](screenshots/2ii.jpg)
![2ii Explain](screenshots/2ii_Explain.jpg)

#### 2iii
![2iii](screenshots/2iii.jpg)
![2iii Explain](screenshots/2iii_Explain.jpg)

#### 2iv
![2iv](screenshots/2iv.jpg)
![2iv Explain](screenshots/2iv_Explain.jpg)

#### 2v_a
![2v_a](screenshots/2v_a.jpg)
![2v_a Explain](screenshots/2v_a_Explain.jpg)

#### 2v_b
![2v_b](screenshots/2v_b.jpg)
![2v_b Explain](screenshots/2v_b_Explain.jpg)


---


### 🧩 Query 3

#### Indexes
- ![Index 1](screenshots/Index_1.jpg)
- ![Index 3](screenshots/Index_3.jpg)
- ![Index 4](screenshots/Index_4.jpg)

#### Alter CPU - Allow SQL to use more cpu power
- ![3AlterCPU](screenshots/3AlterCPU.jpg)

#### 3i
![3i](screenshots/3i.jpg)
![3i Explain](screenshots/3i_Explain.jpg)

#### 3ii
![3ii](screenshots/3ii.jpg)
![3ii Explain](screenshots/3ii_Explain.jpg)

#### 3iii
![3iii](screenshots/3iii.jpg)
![3iii Explain](screenshots/3iii_Explain.jpg)

#### 3iv
![3iv](screenshots/3iv.jpg)
![3iv Explain](screenshots/3iv_Explain.jpg)

#### 3v_a
![3v_a](screenshots/3v_a.jpg)
![3v_a Explain](screenshots/3v_a_Explain.jpg)

#### 3v_b
![3v_b](screenshots/3v_b.jpg)
![3v_b Explain](screenshots/3v_b_Explain.jpg)

---

### 🧩 Query 4

#### 4i - Index (Created appropriate index for the query)
- ![Index 1](screenshots/Index_1.jpg)
![4i](screenshots/4i.jpg)
![4i Explain](screenshots/4i_Explain.jpg)

#### 4ii - Index (Created appropriate index for the query)
- CREATE INDEX idx_vessels_flag ON Vessels (flag); (Screenshot not included)
  
![4ii](screenshots/4ii.jpg)

#### 4iii - Index (Created appropriate index for the query)
- ![Index 3](screenshots/Index_3.jpg)
![4iii Explain](screenshots/4iii_Explain.jpg)

#### 4iv - Index (Created appropriate index for the query)
- CREATE INDEX ON Positions (t); (Screenshot not included)

![4iv](screenshots/4iv.jpg)
![4iv Explain](screenshots/4iv_Explain.jpg)

#### 4v - Index (Created appropriate index for the query)
- ![Index 4](screenshots/Index_4.jpg)
![4v_a](screenshots/4v_a.jpg)
![4v_A Explain](screenshots/4v_A_Explain.jpg)

#### 4v_b - Same index as above
![4v_b](screenshots/4v_b.jpg)
![4v_B Explain](screenshots/4v_B_Explain.jpg)

---

© 2025 – Vessel Analytics SQL Demo by kon-f
