-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-server:3306
-- Generation Time: Oct 29, 2026 at 04:24 AM
-- Server version: 13.0.2-MariaDB-ubu2604
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `chevron_pdvsa_projections`
--

CREATE TABLE `chevron_pdvsa_projections` (
  `projection_id` int(11) NOT NULL,
  `partner_ticker` varchar(10) NOT NULL DEFAULT 'CVX',
  `state_entity` varchar(10) NOT NULL DEFAULT 'PDVSA',
  `target_month_index` int(11) NOT NULL,
  `planned_investment_mil_usd` decimal(10,2) DEFAULT NULL,
  `projected_production_bpd` int(11) DEFAULT NULL,
  `estimated_cost_per_barrel_usd` decimal(10,2) DEFAULT 20.00,
  `last_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `chevron_pdvsa_projections`
--

INSERT INTO `chevron_pdvsa_projections` (`projection_id`, `partner_ticker`, `state_entity`, `target_month_index`, `planned_investment_mil_usd`, `projected_production_bpd`, `estimated_cost_per_barrel_usd`, `last_updated`) VALUES
(1, 'CVX', 'PDVSA', 0, 0.00, 280000, 20.00, '2026-10-27 15:48:51'),
(2, 'CVX', 'PDVSA', 12, 1400.00, 350000, 20.00, '2026-10-27 15:48:51'),
(3, 'CVX', 'PDVSA', 24, 2800.00, 420000, 20.00, '2026-10-27 15:48:51'),
(4, 'CVX', 'PDVSA', 36, 4200.00, 490000, 20.00, '2026-10-27 15:48:51'),
(5, 'CVX', 'PDVSA', 48, 5600.00, 560000, 20.00, '2026-10-27 15:48:51'),
(6, 'CVX', 'PDVSA', 55, 7000.00, 600000, 20.00, '2026-10-27 15:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `cvx_historical_financials`
--

CREATE TABLE `cvx_historical_financials` (
  `entry_id` int(11) NOT NULL,
  `ticker` varchar(10) NOT NULL,
  `period_ending` date NOT NULL,
  `total_revenue` bigint(20) DEFAULT NULL,
  `cost_of_revenue` bigint(20) DEFAULT NULL,
  `gross_profit` bigint(20) DEFAULT NULL,
  `sga_expenses` bigint(20) DEFAULT NULL,
  `non_recurring_items` bigint(20) DEFAULT NULL,
  `other_operating_items` bigint(20) DEFAULT NULL,
  `operating_income` bigint(20) DEFAULT NULL,
  `ebit` bigint(20) DEFAULT NULL,
  `interest_expense` bigint(20) DEFAULT NULL,
  `earnings_before_tax` bigint(20) DEFAULT NULL,
  `income_tax` bigint(20) DEFAULT NULL,
  `minority_interest` bigint(20) DEFAULT NULL,
  `net_income` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `cvx_historical_financials`
--

INSERT INTO `cvx_historical_financials` (`entry_id`, `ticker`, `period_ending`, `total_revenue`, `cost_of_revenue`, `gross_profit`, `sga_expenses`, `non_recurring_items`, `other_operating_items`, `operating_income`, `ebit`, `interest_expense`, `earnings_before_tax`, `income_tax`, `minority_interest`, `net_income`) VALUES
(1, 'CVX', '2025-12-31', 184432000, 136219000, 48213000, 10669000, 1051000, 20132000, 16361000, 20960000, 1217000, 19743000, 7258000, 3000000, 12299000),
(2, 'CVX', '2024-12-31', 193414000, 14667000, 46744000, 9745000, 995000, 17282000, 18722000, 28100000, 594000, 27506000, 9757000, 4596000, 17661000),
(3, 'CVX', '2023-12-31', 196913000, 144083000, 5283000, 8573000, 914000, 17326000, 26017000, 30053000, 469000, 29584000, 8173000, 5131000, 21369000),
(4, 'CVX', '2022-12-31', 235717000, 17013000, 65587000, 8639000, 974000, 16319000, 39655000, 50190000, 516000, 49674000, 14066000, 8585000, 35465000);

-- --------------------------------------------------------

--
-- Table structure for table `cvx_institutional_holdings`
--

CREATE TABLE `cvx_institutional_holdings` (
  `holding_id` int(11) NOT NULL,
  `ticker` varchar(10) NOT NULL DEFAULT 'CVX',
  `owner_name` varchar(150) NOT NULL,
  `reporting_date` date NOT NULL,
  `shares_held` bigint(20) NOT NULL,
  `share_change_intraday` bigint(20) NOT NULL,
  `change_pct` decimal(6,3) NOT NULL,
  `holding_value_usd_thousands` bigint(20) NOT NULL,
  `last_audited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `cvx_institutional_holdings`
--

INSERT INTO `cvx_institutional_holdings` (`holding_id`, `ticker`, `owner_name`, `reporting_date`, `shares_held`, `share_change_intraday`, `change_pct`, `holding_value_usd_thousands`, `last_audited`) VALUES
(1, 'CVX', 'Vanguard Group Inc', '2015-12-31', 182961533, -828495, -0.451, 42448905, '2026-10-27 16:16:34'),
(2, 'CVX', 'Blackrock, Inc.', '2026-06-30', 154824622, 10104591, 6.982, 35920861, '2026-10-27 16:16:34'),
(3, 'CVX', 'State Street Corp', '2026-06-30', 148447634, -4690282, -3.063, 34441336, '2026-10-27 16:16:34'),
(4, 'CVX', 'Vanguard Capital Management Llc', '2026-06-30', 122899830, 415403, 0.339, 28513990, '2026-10-27 16:16:34'),
(5, 'CVX', 'Berkshire Hathaway Inc', '2026-06-30', 84375856, 0, 0.000, 19576042, '2026-10-27 16:16:34'),
(6, 'CVX', 'Geode Capital Management, Llc', '2026-06-30', 44535812, 858710, 1.966, 10332754, '2026-10-27 16:16:34'),
(7, 'CVX', 'Vanguard Portfolio Management Llc', '2026-06-30', 42476901, 163163, 0.386, 9855066, '2026-10-27 16:16:34'),
(8, 'CVX', 'Charles Schwab Investment Management Inc', '2026-06-30', 37714808, 1596328, 4.420, 8750213, '2026-10-27 16:16:34'),
(9, 'CVX', 'Morgan Stanley', '2026-06-30', 36051004, -796017, -2.160, 8364193, '2026-10-27 16:16:34'),
(10, 'CVX', 'Bank Of America Corp /De/', '2026-06-30', 27205457, -424770, -1.537, 6311938, '2026-10-27 16:16:34');

-- --------------------------------------------------------

--
-- Table structure for table `global_asset_projections`
--

CREATE TABLE `global_asset_projections` (
  `id` int(11) NOT NULL,
  `ticker` varchar(10) NOT NULL,
  `projection_date` date NOT NULL,
  `month_index` int(11) NOT NULL,
  `projected_price_baseline` decimal(10,2) NOT NULL,
  `alpha_target_trigger` decimal(10,2) DEFAULT NULL,
  `beta_target_trigger` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `global_asset_projections`
--

INSERT INTO `global_asset_projections` (`id`, `ticker`, `projection_date`, `month_index`, `projected_price_baseline`, `alpha_target_trigger`, `beta_target_trigger`) VALUES
(1, 'MSFT', '2026-10-31', 0, 531.01, 555.00, 559.00),
(2, 'MSFT', '2026-11-30', 1, 531.26, 555.00, 559.00),
(3, 'MSFT', '2027-10-31', 12, 534.02, 555.00, 559.00),
(4, 'MSFT', '2031-01-31', 55, 544.43, 555.00, 559.00),
(5, 'MSFT', '2031-06-30', 60, 549.63, 555.00, 559.00),
(6, 'MSFT', '2031-12-31', 66, 555.87, 555.00, 559.00),
(7, 'MSFT', '2032-03-31', 69, 559.00, 555.00, 559.00),
(8, 'CVX', '2026-10-31', 0, 228.23, 229.00, 230.00),
(9, 'CVX', '2026-11-30', 1, 228.35, 229.00, 230.00),
(10, 'CVX', '2027-06-30', 8, 229.10, 229.00, 230.00),
(11, 'CVX', '2027-10-31', 12, 230.00, 229.00, 230.00),
(12, 'CVX', '2031-01-31', 55, 235.45, 229.00, 230.00),
(13, 'CVX', '2031-06-30', 60, 236.10, 229.00, 230.00),
(14, 'CVX', '2032-03-31', 69, 237.25, 229.00, 230.00);

-- --------------------------------------------------------

--
-- Table structure for table `global_asset_registry`
--

CREATE TABLE `global_asset_registry` (
  `ticker` varchar(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `primary_exchange` varchar(20) NOT NULL,
  `macro_sector` varchar(100) NOT NULL,
  `industry_group` varchar(100) NOT NULL,
  `last_close_price` decimal(10,2) NOT NULL,
  `after_hours_price` decimal(10,2) NOT NULL,
  `absolute_market_cap` bigint(20) NOT NULL,
  `one_year_wall_target` decimal(10,2) DEFAULT NULL,
  `daily_share_volume` bigint(20) NOT NULL,
  `fifty_two_week_high` decimal(10,2) NOT NULL,
  `fifty_two_week_low` decimal(10,2) NOT NULL,
  `ingestion_timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `global_asset_registry`
--

INSERT INTO `global_asset_registry` (`ticker`, `company_name`, `primary_exchange`, `macro_sector`, `industry_group`, `last_close_price`, `after_hours_price`, `absolute_market_cap`, `one_year_wall_target`, `daily_share_volume`, `fifty_two_week_high`, `fifty_two_week_low`, `ingestion_timestamp`) VALUES
('CVX', 'Chevron Corporation', 'NYSE', 'Energy', 'Integrated Oil Companies', 228.23, 230.29, 453004837703, 230.00, 6337793, 234.08, 146.49, '2026-10-28 21:25:46'),
('MSFT', 'Microsoft Corporation', 'NASDAQ', 'Technology', 'Packaged Software', 531.01, 543.20, 3329001000000, 555.00, 25143440, 553.72, 349.20, '2026-10-28 21:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `global_continuous_projections`
--

CREATE TABLE `global_continuous_projections` (
  `id` int(11) NOT NULL,
  `ticker` varchar(10) NOT NULL DEFAULT 'MSFT',
  `projection_date` date NOT NULL COMMENT 'Calculated forecast date horizon',
  `month_index` int(11) NOT NULL COMMENT 'Months out from baseline (55 to 69)',
  `projected_price_baseline` decimal(10,2) NOT NULL,
  `target_milestone_alpha` decimal(10,2) DEFAULT NULL COMMENT 'Dynamic Milestone Alpha (MSFT: 555 / CVX: 229)',
  `target_milestone_beta` decimal(10,2) DEFAULT NULL COMMENT 'Dynamic Milestone Beta (MSFT: 559 / CVX: 230)',
  `model_run_timestamp` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `global_continuous_projections`
--

INSERT INTO `global_continuous_projections` (`id`, `ticker`, `projection_date`, `month_index`, `projected_price_baseline`, `target_milestone_alpha`, `target_milestone_beta`, `model_run_timestamp`) VALUES
(1, 'MSFT', '2026-10-31', 0, 531.01, 555.00, 559.00, '2026-10-28 21:14:50'),
(2, 'MSFT', '2026-11-30', 1, 531.26, 555.00, 559.00, '2026-10-28 21:14:50'),
(3, 'MSFT', '2026-12-31', 2, 531.51, 555.00, 559.00, '2026-10-28 21:14:50'),
(4, 'MSFT', '2027-01-31', 3, 531.76, 555.00, 559.00, '2026-10-28 21:14:50'),
(5, 'MSFT', '2027-02-28', 4, 532.01, 555.00, 559.00, '2026-10-28 21:14:50'),
(6, 'MSFT', '2027-03-31', 5, 532.26, 555.00, 559.00, '2026-10-28 21:14:50'),
(7, 'MSFT', '2027-04-30', 6, 532.51, 555.00, 559.00, '2026-10-28 21:14:50'),
(8, 'MSFT', '2027-05-31', 7, 532.76, 555.00, 559.00, '2026-10-28 21:14:50'),
(9, 'MSFT', '2027-06-30', 8, 533.01, 555.00, 559.00, '2026-10-28 21:14:50'),
(10, 'MSFT', '2027-07-31', 9, 533.26, 555.00, 559.00, '2026-10-28 21:14:50'),
(11, 'MSFT', '2027-08-31', 10, 533.51, 555.00, 559.00, '2026-10-28 21:14:50'),
(12, 'MSFT', '2027-09-30', 11, 533.76, 555.00, 559.00, '2026-10-28 21:14:50'),
(13, 'MSFT', '2027-10-31', 12, 534.02, 555.00, 559.00, '2026-10-28 21:14:50'),
(14, 'MSFT', '2027-11-30', 13, 534.27, 555.00, 559.00, '2026-10-28 21:14:50'),
(15, 'MSFT', '2027-12-31', 14, 534.52, 555.00, 559.00, '2026-10-28 21:14:50'),
(16, 'MSFT', '2028-01-31', 15, 534.77, 555.00, 559.00, '2026-10-28 21:14:50'),
(17, 'MSFT', '2028-02-29', 16, 535.02, 555.00, 559.00, '2026-10-28 21:14:50'),
(18, 'MSFT', '2028-03-31', 17, 535.27, 555.00, 559.00, '2026-10-28 21:14:50'),
(19, 'MSFT', '2028-04-30', 18, 535.52, 555.00, 559.00, '2026-10-28 21:14:50'),
(20, 'MSFT', '2028-05-31', 19, 535.77, 555.00, 559.00, '2026-10-28 21:14:50'),
(21, 'MSFT', '2028-06-30', 20, 536.02, 555.00, 559.00, '2026-10-28 21:14:50'),
(22, 'MSFT', '2028-07-31', 21, 536.27, 555.00, 559.00, '2026-10-28 21:14:50'),
(23, 'MSFT', '2028-08-31', 22, 536.52, 555.00, 559.00, '2026-10-28 21:14:50'),
(24, 'MSFT', '2028-09-30', 23, 536.78, 555.00, 559.00, '2026-10-28 21:14:50'),
(25, 'MSFT', '2028-10-31', 24, 537.03, 555.00, 559.00, '2026-10-28 21:14:50'),
(26, 'MSFT', '2028-11-30', 25, 537.28, 555.00, 559.00, '2026-10-28 21:14:50'),
(27, 'MSFT', '2028-12-31', 26, 537.53, 555.00, 559.00, '2026-10-28 21:14:50'),
(28, 'MSFT', '2029-01-31', 27, 537.78, 555.00, 559.00, '2026-10-28 21:14:50'),
(29, 'MSFT', '2029-02-28', 28, 538.03, 555.00, 559.00, '2026-10-28 21:14:50'),
(30, 'MSFT', '2029-03-31', 29, 538.28, 555.00, 559.00, '2026-10-28 21:14:50'),
(31, 'MSFT', '2029-04-30', 30, 538.53, 555.00, 559.00, '2026-10-28 21:14:50'),
(32, 'MSFT', '2029-05-31', 31, 538.78, 555.00, 559.00, '2026-10-28 21:14:50'),
(33, 'MSFT', '2029-06-30', 32, 539.04, 555.00, 559.00, '2026-10-28 21:14:50'),
(34, 'MSFT', '2029-07-31', 33, 539.29, 555.00, 559.00, '2026-10-28 21:14:50'),
(35, 'MSFT', '2029-08-31', 34, 539.54, 555.00, 559.00, '2026-10-28 21:14:50'),
(36, 'MSFT', '2029-09-30', 35, 539.79, 555.00, 559.00, '2026-10-28 21:14:50'),
(37, 'MSFT', '2029-10-31', 36, 540.04, 555.00, 559.00, '2026-10-28 21:14:50'),
(38, 'MSFT', '2029-11-30', 37, 540.29, 555.00, 559.00, '2026-10-28 21:14:50'),
(39, 'MSFT', '2029-12-31', 38, 540.54, 555.00, 559.00, '2026-10-28 21:14:50'),
(40, 'MSFT', '2030-01-31', 39, 540.79, 555.00, 559.00, '2026-10-28 21:14:50'),
(41, 'MSFT', '2030-02-28', 40, 541.04, 555.00, 559.00, '2026-10-28 21:14:50'),
(42, 'MSFT', '2030-03-31', 41, 541.30, 555.00, 559.00, '2026-10-28 21:14:50'),
(43, 'MSFT', '2030-04-30', 42, 541.55, 555.00, 559.00, '2026-10-28 21:14:50'),
(44, 'MSFT', '2030-05-31', 43, 541.80, 555.00, 559.00, '2026-10-28 21:14:50'),
(45, 'MSFT', '2030-06-30', 44, 542.05, 555.00, 559.00, '2026-10-28 21:14:50'),
(46, 'MSFT', '2030-07-31', 45, 542.30, 555.00, 559.00, '2026-10-28 21:14:50'),
(47, 'MSFT', '2030-08-31', 46, 542.55, 555.00, 559.00, '2026-10-28 21:14:50'),
(48, 'MSFT', '2030-09-30', 47, 542.80, 555.00, 559.00, '2026-10-28 21:14:50'),
(49, 'MSFT', '2030-10-31', 48, 543.05, 555.00, 559.00, '2026-10-28 21:14:50'),
(50, 'MSFT', '2030-11-30', 49, 543.30, 555.00, 559.00, '2026-10-28 21:14:50'),
(51, 'MSFT', '2030-12-31', 50, 543.56, 555.00, 559.00, '2026-10-28 21:14:50'),
(52, 'MSFT', '2031-01-31', 55, 544.43, 555.00, 559.00, '2026-10-28 21:14:50'),
(53, 'MSFT', '2031-02-28', 56, 545.47, 555.00, 559.00, '2026-10-28 21:14:50'),
(54, 'MSFT', '2031-03-31', 57, 546.51, 555.00, 559.00, '2026-10-28 21:14:50'),
(55, 'MSFT', '2031-04-30', 58, 547.55, 555.00, 559.00, '2026-10-28 21:14:50'),
(56, 'MSFT', '2031-05-31', 59, 548.59, 555.00, 559.00, '2026-10-28 21:14:50'),
(57, 'MSFT', '2031-06-30', 60, 549.63, 555.00, 559.00, '2026-10-28 21:14:50'),
(58, 'MSFT', '2031-07-31', 61, 550.67, 555.00, 559.00, '2026-10-28 21:14:50'),
(59, 'MSFT', '2031-08-31', 62, 551.71, 555.00, 559.00, '2026-10-28 21:14:50'),
(60, 'MSFT', '2031-09-30', 63, 552.75, 555.00, 559.00, '2026-10-28 21:14:50'),
(61, 'MSFT', '2031-10-31', 64, 553.79, 555.00, 559.00, '2026-10-28 21:14:50'),
(62, 'MSFT', '2031-11-30', 65, 554.83, 555.00, 559.00, '2026-10-28 21:14:50'),
(63, 'MSFT', '2031-12-31', 66, 555.87, 555.00, 559.00, '2026-10-28 21:14:50'),
(64, 'MSFT', '2032-01-31', 67, 556.91, 555.00, 559.00, '2026-10-28 21:14:50'),
(65, 'MSFT', '2032-02-29', 68, 557.95, 555.00, 559.00, '2026-10-28 21:14:50'),
(66, 'MSFT', '2032-03-31', 69, 559.00, 555.00, 559.00, '2026-10-28 21:14:50'),
(67, 'CVX', '2026-10-31', 0, 228.23, 229.00, 230.00, '2026-10-28 21:22:00'),
(68, 'CVX', '2026-11-30', 1, 228.35, 229.00, 230.00, '2026-10-28 21:22:00'),
(69, 'CVX', '2026-12-31', 2, 228.48, 229.00, 230.00, '2026-10-28 21:22:00'),
(70, 'CVX', '2027-06-30', 8, 229.10, 229.00, 230.00, '2026-10-28 21:22:00'),
(71, 'CVX', '2027-10-31', 12, 230.00, 229.00, 230.00, '2026-10-28 21:22:00'),
(72, 'CVX', '2031-01-31', 55, 235.45, 229.00, 230.00, '2026-10-28 21:22:00'),
(73, 'CVX', '2031-06-30', 60, 236.10, 229.00, 230.00, '2026-10-28 21:22:00'),
(74, 'CVX', '2031-12-31', 66, 236.88, 229.00, 230.00, '2026-10-28 21:22:00'),
(75, 'CVX', '2032-03-31', 69, 237.25, 229.00, 230.00, '2026-10-28 21:22:00');

-- --------------------------------------------------------

--
-- Table structure for table `global_energy_pipeline_matrix`
--

CREATE TABLE `global_energy_pipeline_matrix` (
  `matrix_id` int(11) NOT NULL,
  `index_ticker` varchar(10) NOT NULL,
  `index_value` decimal(10,2) NOT NULL,
  `index_daily_change_pct` decimal(5,2) NOT NULL,
  `latam_anchor` varchar(10) NOT NULL DEFAULT 'PBR',
  `fiscal_year_ending` date NOT NULL,
  `historical_net_income_usd` bigint(20) NOT NULL,
  `opec_partner` varchar(10) NOT NULL DEFAULT 'PDVSA',
  `growth_timeline` varchar(20) NOT NULL,
  `projected_jv_output_bpd` int(11) NOT NULL,
  `cumulative_capex_usd_mil` decimal(10,2) NOT NULL,
  `production_cost_floor_usd` decimal(5,2) DEFAULT 20.00,
  `last_synchronized` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `global_energy_pipeline_matrix`
--

INSERT INTO `global_energy_pipeline_matrix` (`matrix_id`, `index_ticker`, `index_value`, `index_daily_change_pct`, `latam_anchor`, `fiscal_year_ending`, `historical_net_income_usd`, `opec_partner`, `growth_timeline`, `projected_jv_output_bpd`, `cumulative_capex_usd_mil`, `production_cost_floor_usd`, `last_synchronized`) VALUES
(1, 'NDX', 29650.03, 1.29, 'PBR', '2025-12-31', 19634000, 'PDVSA', 'Month +0', 280000, 0.00, 20.00, '2026-10-27 15:54:59'),
(2, 'NDX', 29650.03, 1.29, 'PBR', '2025-12-31', 19634000, 'PDVSA', 'Month +12', 350000, 1400.00, 20.00, '2026-10-27 15:54:59'),
(3, 'NDX', 29650.03, 1.29, 'PBR', '2025-12-31', 19634000, 'PDVSA', 'Month +24', 420000, 2800.00, 20.00, '2026-10-27 15:54:59'),
(4, 'NDX', 29650.03, 1.29, 'PBR', '2025-12-31', 19634000, 'PDVSA', 'Month +55', 600000, 7000.00, 20.00, '2026-10-27 15:54:59'),
(5, 'COMP', 26481.14, 1.19, 'PBR', '2025-12-31', 19634000, 'PDVSA', 'Month +0', 280000, 0.00, 20.00, '2026-10-27 15:54:59'),
(6, 'COMP', 26481.14, 1.19, 'PBR', '2025-12-31', 19634000, 'PDVSA', 'Month +55', 600000, 7000.00, 20.00, '2026-10-27 15:54:59'),
(7, 'NDX', 29650.03, 1.29, 'PBR', '2024-12-31', 7528000, 'PDVSA', 'Month +0', 280000, 0.00, 20.00, '2026-10-27 15:54:59'),
(8, 'NDX', 29650.03, 1.29, 'PBR', '2024-12-31', 7528000, 'PDVSA', 'Month +55', 600000, 7000.00, 20.00, '2026-10-27 15:54:59'),
(9, 'COMP', 26481.14, 1.19, 'PBR', '2024-12-31', 7528000, 'PDVSA', 'Month +0', 280000, 0.00, 20.00, '2026-10-27 15:54:59'),
(10, 'COMP', 26481.14, 1.19, 'PBR', '2024-12-31', 7528000, 'PDVSA', 'Month +55', 600000, 7000.00, 20.00, '2026-10-27 15:54:59');

-- --------------------------------------------------------

--
-- Table structure for table `global_ownership_summary`
--

CREATE TABLE `global_ownership_summary` (
  `ticker` varchar(10) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `exchange` varchar(10) NOT NULL,
  `sector` varchar(100) NOT NULL,
  `industry` varchar(100) NOT NULL,
  `current_price` decimal(10,2) NOT NULL,
  `after_hours_price` decimal(10,2) NOT NULL,
  `market_cap` bigint(20) NOT NULL,
  `one_year_target` decimal(10,2) DEFAULT NULL,
  `volume` bigint(20) NOT NULL,
  `fifty_two_week_high` decimal(10,2) NOT NULL,
  `fifty_two_week_low` decimal(10,2) NOT NULL,
  `last_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `global_ownership_summary`
--

INSERT INTO `global_ownership_summary` (`ticker`, `company_name`, `exchange`, `sector`, `industry`, `current_price`, `after_hours_price`, `market_cap`, `one_year_target`, `volume`, `fifty_two_week_high`, `fifty_two_week_low`, `last_updated`) VALUES
('CVX', 'Chevron Corporation', 'NYSE', 'Energy', 'Integrated Oil Companies', 228.23, 230.29, 453004837703, 230.00, 6337793, 234.08, 146.49, '2026-10-28 21:21:33'),
('MSFT', 'Microsoft Corporation', 'NASDAQ', 'Technology', 'Packaged Software', 531.01, 543.20, 3329001000000, 555.00, 25143440, 553.72, 349.20, '2026-10-28 21:21:33');

-- --------------------------------------------------------

--
-- Table structure for table `investor_dividend_yields`
--

CREATE TABLE `investor_dividend_yields` (
  `investor_id` int(11) NOT NULL,
  `investor_name` varchar(100) NOT NULL,
  `b3_ticker` varchar(10) NOT NULL,
  `shares_allocated` int(11) NOT NULL,
  `estimated_annual_yield_pct` decimal(5,2) NOT NULL,
  `gross_payout_currency` varchar(5) NOT NULL DEFAULT 'BRL',
  `calculated_annual_income` decimal(12,2) NOT NULL,
  `last_audited` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `investor_dividend_yields`
--

INSERT INTO `investor_dividend_yields` (`investor_id`, `investor_name`, `b3_ticker`, `shares_allocated`, `estimated_annual_yield_pct`, `gross_payout_currency`, `calculated_annual_income`, `last_audited`) VALUES
(1, 'Investor Pool Alpha (Retail Tier)', 'PETR4', 45000, 11.00, 'BRL', 185229.00, '2026-10-27 16:37:57'),
(2, 'Global Yield Fund 01 (Institutional Block)', 'PETR4', 250000, 11.00, 'BRL', 1029050.00, '2026-10-27 16:37:57'),
(3, 'Investor Pool Beta (Core Equity)', 'PETR3', 35000, 10.50, 'BRL', 147543.75, '2026-10-27 16:37:57'),
(4, 'XP Arbitrage Liquidity Portfolio', 'PETR3', 180000, 10.50, 'BRL', 758790.00, '2026-10-27 16:37:57'),
(5, 'Cross-Border Diversified Income Fund', 'CHVX34', 65000, 3.14, 'BRL', 262441.00, '2026-10-27 16:37:57'),
(6, 'Offshore Private Wealth Management', 'CHVX34', 120000, 3.14, 'BRL', 484507.20, '2026-10-27 16:37:57');

-- --------------------------------------------------------

--
-- Table structure for table `macro_pipeline_validation`
--

CREATE TABLE `macro_pipeline_validation` (
  `matrix_id` int(11) NOT NULL,
  `latam_anchor` varchar(10) NOT NULL,
  `opec_partner` varchar(10) NOT NULL,
  `growth_timeline` varchar(20) NOT NULL,
  `projected_output` varchar(30) NOT NULL,
  `cumulative_capex` varchar(30) NOT NULL,
  `cost_baseline` varchar(20) NOT NULL,
  `production_scaling_pct` decimal(5,2) DEFAULT 114.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `macro_pipeline_validation`
--

INSERT INTO `macro_pipeline_validation` (`matrix_id`, `latam_anchor`, `opec_partner`, `growth_timeline`, `projected_output`, `cumulative_capex`, `cost_baseline`, `production_scaling_pct`) VALUES
(1, 'PBR', 'PDVSA', 'Month +0', '280,000 BPD', '$0.00 M', '$20.00 / bbl', 114.00),
(2, 'PBR', 'PDVSA', 'Month +12', '350,000 BPD', '$1,400.00 M', '$20.00 / bbl', 114.00),
(3, 'PBR', 'PDVSA', 'Month +24', '420,000 BPD', '$2,800.00 M', '$20.00 / bbl', 114.00),
(4, 'PBR', 'PDVSA', 'Month +55', '600,000 BPD', '$7,000.00 M', '$20.00 / bbl', 114.00);

-- --------------------------------------------------------

--
-- Table structure for table `msft_historical_financials`
--

CREATE TABLE `msft_historical_financials` (
  `period_ending` date NOT NULL,
  `total_revenue` bigint(20) NOT NULL,
  `cost_of_revenue` bigint(20) NOT NULL,
  `gross_profit` bigint(20) NOT NULL,
  `research_and_development` bigint(20) NOT NULL,
  `sales_general_and_admin` bigint(20) NOT NULL,
  `operating_income` bigint(20) NOT NULL,
  `addl_income_expense` bigint(20) DEFAULT 0,
  `earnings_before_tax` bigint(20) NOT NULL,
  `income_tax` bigint(20) NOT NULL,
  `net_income` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `msft_historical_financials`
--

INSERT INTO `msft_historical_financials` (`period_ending`, `total_revenue`, `cost_of_revenue`, `gross_profit`, `research_and_development`, `sales_general_and_admin`, `operating_income`, `addl_income_expense`, `earnings_before_tax`, `income_tax`, `net_income`) VALUES
('2023-06-30', 211915000, 65863000, 146052000, 27195000, 30334000, 88523000, 788000, 89311000, 16950000, 72361000),
('2024-06-30', 245122000, 74114000, 171008000, 29510000, 32065000, 109433000, -1646000, 107787000, 19651000, 88136000),
('2025-06-30', 281724000, 87831000, 193893000, 32488000, 32877000, 128528000, -4901000, 123627000, 21795000, 101832000),
('2026-06-30', 331839000, 106374000, 225465000, 35562000, 34666000, 155237000, 10697000, 165934000, 32185000, 133749000);

-- --------------------------------------------------------

--
-- Table structure for table `msft_income_statement`
--

CREATE TABLE `msft_income_statement` (
  `period_ending` date NOT NULL,
  `total_revenue` bigint(20) NOT NULL,
  `cost_of_revenue` bigint(20) NOT NULL,
  `gross_profit` bigint(20) NOT NULL,
  `research_and_development` bigint(20) NOT NULL,
  `sales_general_and_admin` bigint(20) NOT NULL,
  `operating_income` bigint(20) NOT NULL,
  `addl_income_expense` bigint(20) DEFAULT 0,
  `earnings_before_tax` bigint(20) NOT NULL,
  `income_tax` bigint(20) NOT NULL,
  `net_income` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `msft_income_statement`
--

INSERT INTO `msft_income_statement` (`period_ending`, `total_revenue`, `cost_of_revenue`, `gross_profit`, `research_and_development`, `sales_general_and_admin`, `operating_income`, `addl_income_expense`, `earnings_before_tax`, `income_tax`, `net_income`) VALUES
('2023-06-30', 211915000, 65863000, 146052000, 27195000, 30334000, 88523000, 788000, 89311000, 16950000, 72361000),
('2024-06-30', 245122000, 74114000, 171008000, 29510000, 32065000, 109433000, -1646000, 107787000, 19651000, 88136000),
('2025-06-30', 281724000, 87831000, 193893000, 32488000, 32877000, 128528000, -4901000, 123627000, 21795000, 101832000),
('2026-06-30', 331839000, 106374000, 225465000, 35562000, 34666000, 155237000, 10697000, 165934000, 32185000, 133749000);

-- --------------------------------------------------------

--
-- Table structure for table `msft_insider_summary`
--

CREATE TABLE `msft_insider_summary` (
  `metric_category` varchar(100) NOT NULL,
  `timeframe_3_months` bigint(20) NOT NULL,
  `timeframe_12_months` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `msft_insider_summary`
--

INSERT INTO `msft_insider_summary` (`metric_category`, `timeframe_3_months`, `timeframe_12_months`) VALUES
('Net Activity Volume', 93478, -22336),
('Number of Open Market Buys', 14, 28),
('Number of Sells', 17, 50),
('Number of Shares Bought', 391234, 402800),
('Number of Shares Sold', 297756, 425136),
('Total Insider Trades', 31, 78),
('Total Shares Traded', 688990, 827936);

-- --------------------------------------------------------

--
-- Table structure for table `msft_insider_transactions`
--

CREATE TABLE `msft_insider_transactions` (
  `id` int(11) NOT NULL,
  `ticker` varchar(10) NOT NULL DEFAULT 'MSFT',
  `insider_name` varchar(150) NOT NULL,
  `relation` varchar(100) NOT NULL,
  `transaction_date` date NOT NULL,
  `transaction_type` varchar(100) NOT NULL,
  `ownership_type` enum('Direct','Indirect') NOT NULL DEFAULT 'Direct',
  `shares_traded` int(11) NOT NULL,
  `execution_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shares_held_post_transaction` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `msft_insider_transactions`
--

INSERT INTO `msft_insider_transactions` (`id`, `ticker`, `insider_name`, `relation`, `transaction_date`, `transaction_type`, `ownership_type`, `shares_traded`, `execution_price`, `shares_held_post_transaction`) VALUES
(1, 'MSFT', 'COLEMAN AMY', 'Officer', '2026-10-15', 'Disposition (Non Open Market)', 'Direct', 32, 533.69, 50925),
(2, 'MSFT', 'HOOD AMY', 'Officer', '2026-10-13', 'Sell', 'Direct', 7305, 544.80, 555396),
(3, 'MSFT', 'COLEMAN AMY', 'Officer', '2026-09-15', 'Disposition (Non Open Market)', 'Direct', 36, 505.41, 44451),
(4, 'MSFT', 'JOLLA ALICE L.', 'Officer', '2026-09-15', 'Disposition (Non Open Market)', 'Direct', 123, 505.41, 81119),
(5, 'MSFT', 'ALTHOFF JUDSON', 'Officer', '2026-09-15', 'Acquisition (Non Open Market)', 'Direct', 29077, 0.00, 141168),
(6, 'MSFT', 'COLEMAN AMY', 'Officer', '2026-09-15', 'Acquisition (Non Open Market)', 'Direct', 6506, 0.00, 50957),
(7, 'MSFT', 'HOOD AMY', 'Officer', '2026-09-15', 'Acquisition (Non Open Market)', 'Direct', 29077, 0.00, 562701),
(8, 'MSFT', 'NUMOTO TAKESHI', 'Officer', '2026-09-15', 'Acquisition (Non Open Market)', 'Direct', 11569, 0.00, 59412),
(9, 'MSFT', 'SMITH BRADFORD L', 'Officer', '2026-09-15', 'Acquisition (Non Open Market)', 'Direct', 29077, 0.00, 473793),
(10, 'MSFT', 'HOOD AMY', 'Officer', '2026-09-14', 'Sell', 'Direct', 41674, 495.97, 533624);

-- --------------------------------------------------------

--
-- Table structure for table `msft_institutional_holdings`
--

CREATE TABLE `msft_institutional_holdings` (
  `id` int(11) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `report_date` date NOT NULL,
  `shares_held` bigint(20) NOT NULL DEFAULT 0,
  `change_shares` bigint(20) NOT NULL DEFAULT 0,
  `change_percent` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `value_usd_thousands` bigint(20) NOT NULL DEFAULT 0,
  `status` enum('Active','New','Sold Out') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `msft_institutional_holdings`
--

INSERT INTO `msft_institutional_holdings` (`id`, `owner_name`, `report_date`, `shares_held`, `change_shares`, `change_percent`, `value_usd_thousands`, `status`) VALUES
(1, 'Vanguard Group Inc', '2025-12-31', 717942580, 15955898, 2.2730, 381464431, 'Active'),
(2, 'Blackrock, Inc.', '2026-06-30', 607367113, 14038542, 2.3660, 322712368, 'Active'),
(3, 'Vanguard Capital Management Llc', '2026-06-30', 485192007, 2633921, 0.5460, 257797069, 'Active'),
(4, 'State Street Corp', '2026-06-30', 315653206, 8944917, 2.9160, 167716018, 'Active'),
(5, 'Geode Capital Management, Llc', '2026-06-30', 189632090, 1130172, 0.6000, 100757218, 'Active'),
(6, 'Fmr Llc', '2026-06-30', 185960066, -4251301, -2.2350, 98806162, 'Active'),
(7, 'Vanguard Portfolio Management Llc', '2026-06-30', 168407641, 916793, 0.5470, 89480032, 'Active'),
(8, 'Jpmorgan Chase & Co', '2026-06-30', 135173516, 8044517, 6.3280, 71821744, 'Active'),
(9, 'Morgan Stanley', '2026-06-30', 127674661, 2793373, 2.2370, 67837378, 'Active'),
(10, 'Norges Bank', '2026-06-30', 102732956, -2028285, -1.9360, 54585102, 'Active'),
(11, 'Jupiter Topco Llc', '2026-06-30', 18575933, 18575933, 0.0000, 9869950, 'New'),
(12, 'Pershing Square Inc.', '2026-06-30', 6206730, 6206730, 0.0000, 3297822, 'New'),
(13, 'Pershing Square Capital Management, L.P.', '2026-03-31', 5654078, 5654078, 0.0000, 3004181, 'New'),
(14, 'Starlite Capital Inc', '2026-06-30', 2104879, 2104879, 0.0000, 1118385, 'New'),
(15, 'Nykredit A/S', '2026-06-30', 2080860, 2080860, 0.0000, 1105623, 'New'),
(16, 'Wt Asset Management Ltd', '2026-09-30', 1183456, 1183456, 0.0000, 628806, 'New'),
(17, 'Evelyn Partners Group Ltd', '2026-06-30', 934190, 934190, 0.0000, 496363, 'New'),
(18, 'Torno Capital, Llc', '2026-06-30', 870000, 870000, 0.0000, 462257, 'New'),
(19, 'Gqg Partners Llc', '2026-06-30', 848548, 848548, 0.0000, 450859, 'New'),
(20, 'Bsn Capital Partners Ltd', '2026-09-30', 816767, 816767, 0.0000, 433973, 'New'),
(21, 'Trb Advisors Lp', '2026-06-30', 0, -125000, 0.0000, 0, 'Sold Out'),
(22, 'Trivest Advisors Ltd', '2026-06-30', 0, -18450, 0.0000, 0, 'Sold Out'),
(23, 'True Blue Financial, Llc', '2026-09-30', 0, -553, 0.0000, 0, 'Sold Out'),
(24, 'Truxt Investmentos Ltda.', '2026-06-30', 0, -26904, 0.0000, 0, 'Sold Out'),
(25, 'Two Creeks Capital Management, Lp', '2026-06-30', 0, -158604, 0.0000, 0, 'Sold Out'),
(26, 'University Of Wisconsin Foundation', '2026-06-30', 0, -25842, 0.0000, 0, 'Sold Out'),
(27, 'Varenne Capital Partners', '2026-06-30', 0, -51818, 0.0000, 0, 'Sold Out'),
(28, 'Verus Wealth Management, Llc', '2026-09-30', 0, -2457, 0.0000, 0, 'Sold Out'),
(29, 'Whale Rock Capital Management Llc', '2026-06-30', 0, -53850, 0.0000, 0, 'Sold Out'),
(30, 'Y-Intercept (Hong Kong) Ltd', '2026-09-30', 0, -119407, 0.0000, 0, 'Sold Out');

-- --------------------------------------------------------

--
-- Table structure for table `msft_ownership_summary`
--

CREATE TABLE `msft_ownership_summary` (
  `ticker` varchar(10) NOT NULL,
  `institutional_ownership_pct` decimal(5,2) NOT NULL,
  `total_shares_outstanding_millions` int(11) NOT NULL,
  `total_value_held_millions` bigint(20) NOT NULL,
  `increased_holders` int(11) NOT NULL,
  `increased_shares` bigint(20) NOT NULL,
  `decreased_holders` int(11) NOT NULL,
  `decreased_shares` bigint(20) NOT NULL,
  `held_holders` int(11) NOT NULL,
  `held_shares` bigint(20) NOT NULL,
  `total_institutional_holders` int(11) NOT NULL,
  `total_institutional_shares` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `msft_ownership_summary`
--

INSERT INTO `msft_ownership_summary` (`ticker`, `institutional_ownership_pct`, `total_shares_outstanding_millions`, `total_value_held_millions`, `increased_holders`, `increased_shares`, `decreased_holders`, `decreased_shares`, `held_holders`, `held_shares`, `total_institutional_holders`, `total_institutional_shares`) VALUES
('MSFT', 84.38, 7426, 3329001, 3413, 253311984, 2809, 186440860, 388, 5825659345, 6610, 6265412189);

-- --------------------------------------------------------

--
-- Table structure for table `pbr_etf_holdings`
--

CREATE TABLE `pbr_etf_holdings` (
  `etf_id` int(11) NOT NULL,
  `symbol` varchar(10) NOT NULL,
  `etf_name` varchar(150) NOT NULL,
  `hundred_day_price_change_pct` decimal(5,2) DEFAULT NULL,
  `weighting_pct` decimal(5,2) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `pbr_etf_holdings`
--

INSERT INTO `pbr_etf_holdings` (`etf_id`, `symbol`, `etf_name`, `hundred_day_price_change_pct`, `weighting_pct`, `last_updated`) VALUES
(1, 'ILF', 'iShares Latin America 40 ETF', -1.53, 6.92, '2026-10-27 15:38:48'),
(2, 'NDIV', 'Amplify Energy & Natural Resources Covered Call ETF', 2.62, 5.05, '2026-10-27 15:38:48'),
(3, 'NRES', 'Xtrackers RREEF Global Natural Resources ETF', -0.46, 4.01, '2026-10-27 15:38:48'),
(4, 'IDVO', 'Amplify CWP International Enhanced Dividend Income ETF', -6.00, 2.79, '2026-10-27 15:38:48'),
(5, 'JEMA', 'JPMorgan ActiveBuilders Emerging Markets Equity ETF', -11.08, 1.12, '2026-10-27 15:38:48');

-- --------------------------------------------------------

--
-- Table structure for table `pbr_historical_financials`
--

CREATE TABLE `pbr_historical_financials` (
  `entry_id` int(11) NOT NULL,
  `ticker` varchar(10) NOT NULL,
  `period_ending` date NOT NULL,
  `total_revenue` bigint(20) DEFAULT NULL,
  `cost_of_revenue` bigint(20) DEFAULT NULL,
  `gross_profit` bigint(20) DEFAULT NULL,
  `rd_expenses` bigint(20) DEFAULT NULL,
  `sga_expenses` bigint(20) DEFAULT NULL,
  `non_recurring_items` bigint(20) DEFAULT NULL,
  `operating_income` bigint(20) DEFAULT NULL,
  `ebit` bigint(20) DEFAULT NULL,
  `interest_expense` bigint(20) DEFAULT NULL,
  `earnings_before_tax` bigint(20) DEFAULT NULL,
  `income_tax` bigint(20) DEFAULT NULL,
  `net_income` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `pbr_historical_financials`
--

INSERT INTO `pbr_historical_financials` (`entry_id`, `ticker`, `period_ending`, `total_revenue`, `cost_of_revenue`, `gross_profit`, `rd_expenses`, `sga_expenses`, `non_recurring_items`, `operating_income`, `ebit`, `interest_expense`, `earnings_before_tax`, `income_tax`, `net_income`) VALUES
(1, 'PBR', '2025-12-31', 89195000, 46736000, 42459000, 864000, 12746000, 2736000, 26113000, 31109000, 4314000, 26795000, 7075000, 19634000),
(2, 'PBR', '2024-12-31', 91416000, 45444000, 45972000, 789000, 15863000, 2444000, 26876000, 17099000, 5957000, 11142000, 3537000, 7528000),
(3, 'PBR', '2023-12-31', 102409000, 48435000, 53974000, 726000, 11553000, 3662000, 38033000, 39318000, 3922000, 35396000, 10401000, 24884000),
(4, 'PBR', '2022-12-31', 124474000, 59486000, 64988000, 792000, 488000, 2202000, 57114000, 57025000, 3500000, 53525000, 1677000, 36623000);

-- --------------------------------------------------------

--
-- Table structure for table `petrobras_3t26_projections`
--

CREATE TABLE `petrobras_3t26_projections` (
  `projection_id` int(11) NOT NULL,
  `ticker` varchar(10) NOT NULL DEFAULT 'PETR4',
  `source_institution` varchar(50) NOT NULL,
  `report_date` date NOT NULL,
  `ebitda_projected_usd_billions` decimal(5,2) DEFAULT NULL,
  `production_projected_bpd_millions` decimal(4,2) DEFAULT NULL,
  `min_dividends_usd_billions` decimal(5,2) DEFAULT NULL,
  `max_dividends_usd_billions` decimal(5,2) DEFAULT NULL,
  `base_scenario_dividends_usd_billions` decimal(5,2) DEFAULT NULL,
  `quarterly_dividend_yield_min_pct` decimal(4,2) DEFAULT NULL,
  `quarterly_dividend_yield_max_pct` decimal(4,2) DEFAULT NULL,
  `official_release_date` date DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `petrobras_3t26_projections`
--

INSERT INTO `petrobras_3t26_projections` (`projection_id`, `ticker`, `source_institution`, `report_date`, `ebitda_projected_usd_billions`, `production_projected_bpd_millions`, `min_dividends_usd_billions`, `max_dividends_usd_billions`, `base_scenario_dividends_usd_billions`, `quarterly_dividend_yield_min_pct`, `quarterly_dividend_yield_max_pct`, `official_release_date`, `last_updated`) VALUES
(1, 'PETR4', 'BTG Pactual', '2026-10-19', 20.00, 2.84, 3.80, 4.20, 4.00, 2.40, 2.70, '2026-10-28', '2026-10-27 16:43:23'),
(2, 'PETR4', 'Consenso de Mercado', '2026-10-19', 17.10, NULL, 3.20, 3.20, 3.20, NULL, NULL, '2026-10-28', '2026-10-27 16:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `petrobras_nasdaq_info`
--

CREATE TABLE `petrobras_nasdaq_info` (
  `metric_id` int(11) NOT NULL,
  `ticker` varchar(10) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `last_trade_price_usd` decimal(10,2) DEFAULT NULL,
  `todays_open` decimal(10,2) DEFAULT NULL,
  `todays_high` decimal(10,2) DEFAULT NULL,
  `todays_low` decimal(10,2) DEFAULT NULL,
  `previous_close` decimal(10,2) DEFAULT NULL,
  `share_volume` bigint(20) DEFAULT NULL,
  `bid_price` decimal(10,2) DEFAULT NULL,
  `ask_price` decimal(10,2) DEFAULT NULL,
  `one_year_target` decimal(10,2) DEFAULT NULL,
  `market_cap_usd` bigint(20) DEFAULT NULL,
  `fifty_two_week_high` decimal(10,2) DEFAULT NULL,
  `fifty_two_week_low` decimal(10,2) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `petrobras_nasdaq_info`
--

INSERT INTO `petrobras_nasdaq_info` (`metric_id`, `ticker`, `company_name`, `last_trade_price_usd`, `todays_open`, `todays_high`, `todays_low`, `previous_close`, `share_volume`, `bid_price`, `ask_price`, `one_year_target`, `market_cap_usd`, `fifty_two_week_high`, `fifty_two_week_low`, `last_updated`) VALUES
(1, 'PBR', 'Petroleo Brasileiro S.A. Petrobras ADS', 22.62, 22.48, 22.97, 22.44, 22.50, 10643710, 22.62, 22.63, 24.00, 145803789370, 26.39, 11.43, '2026-10-27 15:38:02');

-- --------------------------------------------------------

--
-- Table structure for table `rj1_system_report_layers`
--

CREATE TABLE `rj1_system_report_layers` (
  `layer_id` int(11) NOT NULL,
  `report_name` varchar(100) NOT NULL DEFAULT 'RJ1 Globo MariaDB Cluster Pipeline Report',
  `layer_name` varchar(100) NOT NULL,
  `layer_description` text NOT NULL,
  `last_updated` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `rj1_system_report_layers`
--

INSERT INTO `rj1_system_report_layers` (`layer_id`, `report_name`, `layer_name`, `layer_description`, `last_updated`) VALUES
(1, 'RJ1 Globo MariaDB Cluster Pipeline Report', 'Production Schema Audit Layer', 'Explicit structural diagnostics reflecting your indexed keys, auto-increments, attributes, allocations (int(11), varchar, decimal(10,2)), and current timestamps.', '2026-10-27 16:03:42'),
(2, 'RJ1 Globo MariaDB Cluster Pipeline Report', 'Global Asset Matrix Layer', 'Hardens the relational cross-join records mapping your live index trackers (NDX at 29,650.03 / COMP at 26,481.14) alongside your active multi-year Petrobras financial history and forward 55-month Chevron-PDVSA project trajectories.', '2026-10-27 16:03:42'),
(3, 'RJ1 Globo MariaDB Cluster Pipeline Report', 'ETL Query Engine Layer', 'Full technical documentation of the standardized SQL scripts used to drive this transactional view on top of the cluster instance.', '2026-10-27 16:03:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_boardvantage_logs`
--

CREATE TABLE `tbl_boardvantage_logs` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `functional_category` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `ibm_middleware_pairing` varchar(255) NOT NULL,
  `sync_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `tbl_boardvantage_logs`
--

INSERT INTO `tbl_boardvantage_logs` (`id`, `product_name`, `functional_category`, `product_description`, `ibm_middleware_pairing`, `sync_timestamp`) VALUES
(1, 'Nasdaq Boardvantage®', 'Board Portal & Meeting Management', 'Secure board portal for directors and leadership to manage meetings and collaborate on sensitive materials with enterprise-grade security.', 'IBM Cloud Satellite', '2026-10-29 03:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_governance_evals`
--

CREATE TABLE `tbl_governance_evals` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `functional_category` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `ibm_middleware_pairing` varchar(255) NOT NULL,
  `sync_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `tbl_governance_evals`
--

INSERT INTO `tbl_governance_evals` (`id`, `product_name`, `functional_category`, `product_description`, `ibm_middleware_pairing`, `sync_timestamp`) VALUES
(1, 'Nasdaq Board Advisory Services', 'Board, CEO, & Management Evaluation', 'Expert board advisors providing structured performance evaluations to turn governance into strategic assets.', 'IBM Cognos Analytics', '2026-10-29 03:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ibm_middleware_registry`
--

CREATE TABLE `tbl_ibm_middleware_registry` (
  `middleware_id` int(11) NOT NULL,
  `pairing_key` varchar(255) NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `deployment_tier` enum('SaaS','Hybrid','On-Premise','Satellite') NOT NULL,
  `compliance_scope` varchar(255) DEFAULT NULL,
  `last_api_heartbeat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `tbl_ibm_middleware_registry`
--

INSERT INTO `tbl_ibm_middleware_registry` (`middleware_id`, `pairing_key`, `service_name`, `deployment_tier`, `compliance_scope`, `last_api_heartbeat`) VALUES
(1, 'IBM watsonx.ai', 'watsonx.ai Studio & Orchestrate', 'Hybrid', 'EU AI Act, NIST AI RMF', '2026-10-29 03:55:03'),
(2, 'IBM Cloud Satellite', 'Cloud Satellite with Hyper Protect Crypto Services', 'Satellite', 'FIPS 140-2 Level 4, HIPAA', '2026-10-29 03:55:03'),
(3, 'IBM Environmental Intelligence Suite', 'EIS Carbon Performance Engine', 'SaaS', 'CSRD, GHG Protocol', '2026-10-29 03:55:03'),
(4, 'IBM Cognos Analytics', 'Cognos Analytics Enterprise Edition', 'SaaS', 'SOC 2 Type II', '2026-10-29 03:55:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_migration_sync_audit`
--

CREATE TABLE `tbl_migration_sync_audit` (
  `audit_id` bigint(20) NOT NULL,
  `source_table` varchar(64) NOT NULL,
  `record_id` int(11) NOT NULL,
  `pairing_key` varchar(255) NOT NULL,
  `sync_status` enum('SUCCESS','FAILED','DEGRADED','IN_PROGRESS') NOT NULL,
  `error_payload` text DEFAULT NULL,
  `execution_time_ms` int(11) NOT NULL,
  `event_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `tbl_migration_sync_audit`
--

INSERT INTO `tbl_migration_sync_audit` (`audit_id`, `source_table`, `record_id`, `pairing_key`, `sync_status`, `error_payload`, `execution_time_ms`, `event_timestamp`) VALUES
(1, 'tbl_nasdaq_lens', 1, 'IBM watsonx.ai', 'SUCCESS', NULL, 142, '2026-10-29 03:55:04'),
(2, 'tbl_boardvantage_logs', 1, 'IBM Cloud Satellite', 'SUCCESS', NULL, 89, '2026-10-29 03:55:04'),
(3, 'tbl_puro_earth_registry', 1, 'IBM Environmental Intelligence Suite', 'SUCCESS', NULL, 210, '2026-10-29 03:55:04'),
(4, 'tbl_governance_evals', 1, 'IBM Cognos Analytics', 'SUCCESS', NULL, 65, '2026-10-29 03:55:04');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_nasdaq_lens`
--

CREATE TABLE `tbl_nasdaq_lens` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `functional_category` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `ibm_middleware_pairing` varchar(255) NOT NULL,
  `sync_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `tbl_nasdaq_lens`
--

INSERT INTO `tbl_nasdaq_lens` (`id`, `product_name`, `functional_category`, `product_description`, `ibm_middleware_pairing`, `sync_timestamp`) VALUES
(1, 'Nasdaq Lens™ (AI Platform)', 'AI Assistant for Legal, Finance, & Sustainability', 'Transforms manual research, benchmarking, and disclosure drafting using purpose-built enterprise AI.', 'IBM watsonx.ai', '2026-10-29 03:55:03');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_puro_earth_registry`
--

CREATE TABLE `tbl_puro_earth_registry` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `functional_category` varchar(255) NOT NULL,
  `product_description` text NOT NULL,
  `ibm_middleware_pairing` varchar(255) NOT NULL,
  `sync_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `tbl_puro_earth_registry`
--

INSERT INTO `tbl_puro_earth_registry` (`id`, `product_name`, `functional_category`, `product_description`, `ibm_middleware_pairing`, `sync_timestamp`) VALUES
(1, 'Puro.earth', 'Carbon Removal Registry & Carbon Academy', 'Connects verified CO2 removal suppliers and buyers through transparent standards and voluntary carbon market infrastructure.', 'IBM Environmental Intelligence Suite', '2026-10-29 03:55:04');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_critical_incident_investigator`
-- (See below for the actual view)
--
CREATE TABLE `vw_critical_incident_investigator` (
`Incident_Reference` bigint(20)
,`Failure_Time` timestamp
,`Affected_Component` varchar(64)
,`Source_Row_ID` int(11)
,`Target_Middleware` varchar(255)
,`Failure_Latency_ms` int(11)
,`Exception_Payload` mediumtext
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_middleware_performance_analytics`
-- (See below for the actual view)
--
CREATE TABLE `vw_middleware_performance_analytics` (
`IBM_Middleware` varchar(255)
,`Service_Identity` varchar(255)
,`Deployment_Model` enum('SaaS','Hybrid','On-Premise','Satellite')
,`Total_Sync_Attempts` bigint(21)
,`Successful_Transactions` decimal(23,0)
,`Failed_Transactions` decimal(23,0)
,`Availability_Percentage` decimal(29,2)
,`Average_Latency_ms` decimal(12,1)
,`Peak_Latency_ms` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_nasdaq_source_distribution`
-- (See below for the actual view)
--
CREATE TABLE `vw_nasdaq_source_distribution` (
`Nasdaq_Data_Source` varchar(64)
,`Total_Records_Processed` bigint(21)
,`Source_Avg_Latency_ms` decimal(13,2)
,`Degraded_SLA_Events` decimal(23,0)
,`Last_Synchronization_Event` timestamp
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_supermajor_performance`
-- (See below for the actual view)
--
CREATE TABLE `v_supermajor_performance` (
`Fiscal_Year` int(5)
,`PBR_Revenue` varchar(27)
,`CVX_Revenue` varchar(27)
,`PBR_Net_Margin_Pct` decimal(25,2)
,`CVX_Net_Margin_Pct` decimal(25,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `xp_b3_integration`
--

CREATE TABLE `xp_b3_integration` (
  `integration_id` int(11) NOT NULL,
  `global_ticker` varchar(10) NOT NULL,
  `b3_ticker` varchar(10) NOT NULL,
  `asset_class` varchar(100) NOT NULL DEFAULT 'Ações Ordinárias',
  `last_b3_closing_brl` decimal(10,2) NOT NULL,
  `xp_liquidity_score_mil` decimal(12,2) DEFAULT NULL,
  `last_synchronized` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

--
-- Dumping data for table `xp_b3_integration`
--

INSERT INTO `xp_b3_integration` (`integration_id`, `global_ticker`, `b3_ticker`, `asset_class`, `last_b3_closing_brl`, `xp_liquidity_score_mil`, `last_synchronized`) VALUES
(1, 'PBR', 'PETR4', 'PN de Saldo Preferencial', 37.42, 1450.85, '2026-10-27 16:30:12'),
(2, 'PBR', 'PETR3', 'ON de Controle Ordinário', 40.15, 890.40, '2026-10-27 16:30:12'),
(3, 'CVX', 'CHVX34', 'BDR (Brazilian Depositary Receipt)', 128.60, 45.25, '2026-10-27 16:30:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chevron_pdvsa_projections`
--
ALTER TABLE `chevron_pdvsa_projections`
  ADD PRIMARY KEY (`projection_id`),
  ADD UNIQUE KEY `unq_month_index` (`target_month_index`);

--
-- Indexes for table `cvx_historical_financials`
--
ALTER TABLE `cvx_historical_financials`
  ADD PRIMARY KEY (`entry_id`),
  ADD UNIQUE KEY `unq_cvx_period` (`ticker`,`period_ending`);

--
-- Indexes for table `cvx_institutional_holdings`
--
ALTER TABLE `cvx_institutional_holdings`
  ADD PRIMARY KEY (`holding_id`),
  ADD UNIQUE KEY `owner_name` (`owner_name`),
  ADD KEY `fk_cvx_holdings_ticker` (`ticker`);

--
-- Indexes for table `global_asset_projections`
--
ALTER TABLE `global_asset_projections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_ticker_month_horizon` (`ticker`,`month_index`);

--
-- Indexes for table `global_asset_registry`
--
ALTER TABLE `global_asset_registry`
  ADD PRIMARY KEY (`ticker`),
  ADD KEY `idx_sector_search` (`macro_sector`);

--
-- Indexes for table `global_continuous_projections`
--
ALTER TABLE `global_continuous_projections`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uidx_ticker_horizon` (`ticker`,`month_index`),
  ADD KEY `idx_date_search` (`projection_date`);

--
-- Indexes for table `global_energy_pipeline_matrix`
--
ALTER TABLE `global_energy_pipeline_matrix`
  ADD PRIMARY KEY (`matrix_id`),
  ADD UNIQUE KEY `unq_index_year_timeline` (`index_ticker`,`fiscal_year_ending`,`growth_timeline`);

--
-- Indexes for table `global_ownership_summary`
--
ALTER TABLE `global_ownership_summary`
  ADD PRIMARY KEY (`ticker`);

--
-- Indexes for table `investor_dividend_yields`
--
ALTER TABLE `investor_dividend_yields`
  ADD PRIMARY KEY (`investor_id`),
  ADD KEY `fk_dividend_b3_ticker` (`b3_ticker`);

--
-- Indexes for table `macro_pipeline_validation`
--
ALTER TABLE `macro_pipeline_validation`
  ADD PRIMARY KEY (`matrix_id`),
  ADD UNIQUE KEY `unq_timeline` (`growth_timeline`);

--
-- Indexes for table `msft_historical_financials`
--
ALTER TABLE `msft_historical_financials`
  ADD PRIMARY KEY (`period_ending`);

--
-- Indexes for table `msft_income_statement`
--
ALTER TABLE `msft_income_statement`
  ADD PRIMARY KEY (`period_ending`);

--
-- Indexes for table `msft_insider_summary`
--
ALTER TABLE `msft_insider_summary`
  ADD PRIMARY KEY (`metric_category`);

--
-- Indexes for table `msft_insider_transactions`
--
ALTER TABLE `msft_insider_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_insider_lookup` (`insider_name`(50)),
  ADD KEY `idx_trans_date` (`transaction_date`);

--
-- Indexes for table `msft_institutional_holdings`
--
ALTER TABLE `msft_institutional_holdings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_owner` (`owner_name`(50)),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `msft_ownership_summary`
--
ALTER TABLE `msft_ownership_summary`
  ADD PRIMARY KEY (`ticker`);

--
-- Indexes for table `pbr_etf_holdings`
--
ALTER TABLE `pbr_etf_holdings`
  ADD PRIMARY KEY (`etf_id`),
  ADD UNIQUE KEY `symbol` (`symbol`);

--
-- Indexes for table `pbr_historical_financials`
--
ALTER TABLE `pbr_historical_financials`
  ADD PRIMARY KEY (`entry_id`),
  ADD UNIQUE KEY `unq_ticker_period` (`ticker`,`period_ending`);

--
-- Indexes for table `petrobras_3t26_projections`
--
ALTER TABLE `petrobras_3t26_projections`
  ADD PRIMARY KEY (`projection_id`),
  ADD KEY `fk_projections_b3_ticker` (`ticker`);

--
-- Indexes for table `petrobras_nasdaq_info`
--
ALTER TABLE `petrobras_nasdaq_info`
  ADD PRIMARY KEY (`metric_id`),
  ADD UNIQUE KEY `ticker` (`ticker`);

--
-- Indexes for table `rj1_system_report_layers`
--
ALTER TABLE `rj1_system_report_layers`
  ADD PRIMARY KEY (`layer_id`),
  ADD UNIQUE KEY `layer_name` (`layer_name`);

--
-- Indexes for table `tbl_boardvantage_logs`
--
ALTER TABLE `tbl_boardvantage_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_boardvantage_middleware_lookup` (`ibm_middleware_pairing`);

--
-- Indexes for table `tbl_governance_evals`
--
ALTER TABLE `tbl_governance_evals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_governance_middleware_lookup` (`ibm_middleware_pairing`);

--
-- Indexes for table `tbl_ibm_middleware_registry`
--
ALTER TABLE `tbl_ibm_middleware_registry`
  ADD PRIMARY KEY (`middleware_id`),
  ADD UNIQUE KEY `idx_pairing_key` (`pairing_key`);

--
-- Indexes for table `tbl_migration_sync_audit`
--
ALTER TABLE `tbl_migration_sync_audit`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `idx_source_lookup` (`source_table`,`record_id`),
  ADD KEY `fk_audit_middleware` (`pairing_key`);

--
-- Indexes for table `tbl_nasdaq_lens`
--
ALTER TABLE `tbl_nasdaq_lens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lens_middleware_lookup` (`ibm_middleware_pairing`);

--
-- Indexes for table `tbl_puro_earth_registry`
--
ALTER TABLE `tbl_puro_earth_registry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_puro_middleware_lookup` (`ibm_middleware_pairing`);

--
-- Indexes for table `xp_b3_integration`
--
ALTER TABLE `xp_b3_integration`
  ADD PRIMARY KEY (`integration_id`),
  ADD UNIQUE KEY `b3_ticker` (`b3_ticker`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chevron_pdvsa_projections`
--
ALTER TABLE `chevron_pdvsa_projections`
  MODIFY `projection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `cvx_historical_financials`
--
ALTER TABLE `cvx_historical_financials`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cvx_institutional_holdings`
--
ALTER TABLE `cvx_institutional_holdings`
  MODIFY `holding_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `global_asset_projections`
--
ALTER TABLE `global_asset_projections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `global_continuous_projections`
--
ALTER TABLE `global_continuous_projections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `global_energy_pipeline_matrix`
--
ALTER TABLE `global_energy_pipeline_matrix`
  MODIFY `matrix_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `investor_dividend_yields`
--
ALTER TABLE `investor_dividend_yields`
  MODIFY `investor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `macro_pipeline_validation`
--
ALTER TABLE `macro_pipeline_validation`
  MODIFY `matrix_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `msft_insider_transactions`
--
ALTER TABLE `msft_insider_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `msft_institutional_holdings`
--
ALTER TABLE `msft_institutional_holdings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `pbr_etf_holdings`
--
ALTER TABLE `pbr_etf_holdings`
  MODIFY `etf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pbr_historical_financials`
--
ALTER TABLE `pbr_historical_financials`
  MODIFY `entry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `petrobras_3t26_projections`
--
ALTER TABLE `petrobras_3t26_projections`
  MODIFY `projection_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `petrobras_nasdaq_info`
--
ALTER TABLE `petrobras_nasdaq_info`
  MODIFY `metric_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rj1_system_report_layers`
--
ALTER TABLE `rj1_system_report_layers`
  MODIFY `layer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_boardvantage_logs`
--
ALTER TABLE `tbl_boardvantage_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_governance_evals`
--
ALTER TABLE `tbl_governance_evals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_ibm_middleware_registry`
--
ALTER TABLE `tbl_ibm_middleware_registry`
  MODIFY `middleware_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_migration_sync_audit`
--
ALTER TABLE `tbl_migration_sync_audit`
  MODIFY `audit_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_nasdaq_lens`
--
ALTER TABLE `tbl_nasdaq_lens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_puro_earth_registry`
--
ALTER TABLE `tbl_puro_earth_registry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xp_b3_integration`
--
ALTER TABLE `xp_b3_integration`
  MODIFY `integration_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

-- --------------------------------------------------------

--
-- Structure for view `vw_critical_incident_investigator`
--
DROP TABLE IF EXISTS `vw_critical_incident_investigator`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vw_critical_incident_investigator`  AS SELECT `a`.`audit_id` AS `Incident_Reference`, `a`.`event_timestamp` AS `Failure_Time`, `a`.`source_table` AS `Affected_Component`, `a`.`record_id` AS `Source_Row_ID`, `a`.`pairing_key` AS `Target_Middleware`, `a`.`execution_time_ms` AS `Failure_Latency_ms`, ifnull(`a`.`error_payload`,'Engine Timeout / Hard Disconnect') AS `Exception_Payload` FROM `tbl_migration_sync_audit` AS `a` WHERE `a`.`sync_status` = 'FAILED' ORDER BY `a`.`event_timestamp` DESC ;

-- --------------------------------------------------------

--
-- Structure for view `vw_middleware_performance_analytics`
--
DROP TABLE IF EXISTS `vw_middleware_performance_analytics`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vw_middleware_performance_analytics`  AS SELECT `m`.`pairing_key` AS `IBM_Middleware`, `m`.`service_name` AS `Service_Identity`, `m`.`deployment_tier` AS `Deployment_Model`, count(`a`.`audit_id`) AS `Total_Sync_Attempts`, sum(case when `a`.`sync_status` = 'SUCCESS' then 1 else 0 end) AS `Successful_Transactions`, sum(case when `a`.`sync_status` = 'FAILED' then 1 else 0 end) AS `Failed_Transactions`, round(sum(case when `a`.`sync_status` = 'SUCCESS' then 1 else 0 end) / count(`a`.`audit_id`) * 100,2) AS `Availability_Percentage`, round(avg(`a`.`execution_time_ms`),1) AS `Average_Latency_ms`, max(`a`.`execution_time_ms`) AS `Peak_Latency_ms` FROM (`tbl_ibm_middleware_registry` `m` left join `tbl_migration_sync_audit` `a` on(`m`.`pairing_key` = `a`.`pairing_key`)) GROUP BY `m`.`pairing_key`, `m`.`service_name`, `m`.`deployment_tier` ;

-- --------------------------------------------------------

--
-- Structure for view `vw_nasdaq_source_distribution`
--
DROP TABLE IF EXISTS `vw_nasdaq_source_distribution`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `vw_nasdaq_source_distribution`  AS SELECT `a`.`source_table` AS `Nasdaq_Data_Source`, count(`a`.`audit_id`) AS `Total_Records_Processed`, round(avg(`a`.`execution_time_ms`),2) AS `Source_Avg_Latency_ms`, sum(case when `a`.`sync_status` = 'DEGRADED' then 1 else 0 end) AS `Degraded_SLA_Events`, max(`a`.`event_timestamp`) AS `Last_Synchronization_Event` FROM `tbl_migration_sync_audit` AS `a` GROUP BY `a`.`source_table` ;

-- --------------------------------------------------------

--
-- Structure for view `v_supermajor_performance`
--
DROP TABLE IF EXISTS `v_supermajor_performance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_supermajor_performance`  AS SELECT year(`c`.`period_ending`) AS `Fiscal_Year`, concat('$',format(`p`.`total_revenue` * 1000,0)) AS `PBR_Revenue`, concat('$',format(`c`.`total_revenue` * 1000,0)) AS `CVX_Revenue`, round(`p`.`net_income` / `p`.`total_revenue` * 100,2) AS `PBR_Net_Margin_Pct`, round(`c`.`net_income` / `c`.`total_revenue` * 100,2) AS `CVX_Net_Margin_Pct` FROM (`cvx_historical_financials` `c` join `pbr_historical_financials` `p` on(`c`.`period_ending` = `p`.`period_ending`)) ORDER BY year(`c`.`period_ending`) DESC ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cvx_institutional_holdings`
--
ALTER TABLE `cvx_institutional_holdings`
  ADD CONSTRAINT `fk_cvx_holdings_ticker` FOREIGN KEY (`ticker`) REFERENCES `cvx_historical_financials` (`ticker`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `global_asset_projections`
--
ALTER TABLE `global_asset_projections`
  ADD CONSTRAINT `fk_projection_ticker` FOREIGN KEY (`ticker`) REFERENCES `global_asset_registry` (`ticker`) ON DELETE CASCADE;

--
-- Constraints for table `investor_dividend_yields`
--
ALTER TABLE `investor_dividend_yields`
  ADD CONSTRAINT `fk_dividend_b3_ticker` FOREIGN KEY (`b3_ticker`) REFERENCES `xp_b3_integration` (`b3_ticker`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pbr_historical_financials`
--
ALTER TABLE `pbr_historical_financials`
  ADD CONSTRAINT `fk_pbr_financials_ticker` FOREIGN KEY (`ticker`) REFERENCES `petrobras_nasdaq_info` (`ticker`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `petrobras_3t26_projections`
--
ALTER TABLE `petrobras_3t26_projections`
  ADD CONSTRAINT `fk_projections_b3_ticker` FOREIGN KEY (`ticker`) REFERENCES `xp_b3_integration` (`b3_ticker`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_boardvantage_logs`
--
ALTER TABLE `tbl_boardvantage_logs`
  ADD CONSTRAINT `fk_boardvantage_middleware` FOREIGN KEY (`ibm_middleware_pairing`) REFERENCES `tbl_ibm_middleware_registry` (`pairing_key`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_governance_evals`
--
ALTER TABLE `tbl_governance_evals`
  ADD CONSTRAINT `fk_governance_middleware` FOREIGN KEY (`ibm_middleware_pairing`) REFERENCES `tbl_ibm_middleware_registry` (`pairing_key`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_migration_sync_audit`
--
ALTER TABLE `tbl_migration_sync_audit`
  ADD CONSTRAINT `fk_audit_middleware` FOREIGN KEY (`pairing_key`) REFERENCES `tbl_ibm_middleware_registry` (`pairing_key`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_nasdaq_lens`
--
ALTER TABLE `tbl_nasdaq_lens`
  ADD CONSTRAINT `fk_lens_middleware` FOREIGN KEY (`ibm_middleware_pairing`) REFERENCES `tbl_ibm_middleware_registry` (`pairing_key`) ON UPDATE CASCADE;

--
-- Constraints for table `tbl_puro_earth_registry`
--
ALTER TABLE `tbl_puro_earth_registry`
  ADD CONSTRAINT `fk_puro_middleware` FOREIGN KEY (`ibm_middleware_pairing`) REFERENCES `tbl_ibm_middleware_registry` (`pairing_key`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
