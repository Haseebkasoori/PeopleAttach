-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2021 at 08:55 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `socialdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_token`
--

CREATE TABLE `auth_token` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `auth_token`
--

INSERT INTO `auth_token` (`id`, `token`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY2OTAyNzUsIm5iZiI6MTYzNjY5MDI4NSwiZXhwIjoxNjM2NjkyMDc1LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJzdW1haWxhQGdtYWlsLmNvbSIsIm5hbWUiOiJzdW1haWxhIiwiaWQiOjN9fQ.DzSBBJSQg2HoW9S-Onmm2m9T4LfABvWGobvUD6WKcQE', 3, NULL, NULL),
(2, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY2OTA2NDIsIm5iZiI6MTYzNjY5MDY1MiwiZXhwIjoxNjM2NjkyNDQyLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJzdW1haWxhYUBnbWFpbC5jb20iLCJuYW1lIjoic3VtYWlsYSIsImlkIjo0fX0.TC-Uf1Cx7E9EmrZbQiNFG0N_KIdcIhURwgK0xupbE8Y', 4, NULL, NULL),
(12, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MDI5ODMsIm5iZiI6MTYzNjcwMjk5MywiZXhwIjoxNjM2NzA0NzgzLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.WlJDJDtJqKN9T7h96u2j8s5EKK5P5ANFdaQk15qvRvo', 5, NULL, NULL),
(13, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTAzODcsIm5iZiI6MTYzNjcxMDM5NywiZXhwIjoxNjM2NzEyMTg3LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.rjZyw4ZdEXe8_WMKlIoIS_0XQTy5SmdnyhZ5tYVRd9Y', 5, NULL, NULL),
(14, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTE0NDcsIm5iZiI6MTYzNjcxMTQ1NywiZXhwIjoxNjM2NzEzMjQ3LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.HLzmc0snsH5n-DjDeT8UZLUL-K2u9rBZLylxNX92nHI', 5, NULL, NULL),
(15, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTQxMzQsIm5iZiI6MTYzNjcxNDE0NCwiZXhwIjoxNjM2NzE1OTM0LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.I0FoJLmxUQRuAj5IIBsYw73i17LdiD9iw0t4HE_DPfc', 5, NULL, NULL),
(16, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTQxNjQsIm5iZiI6MTYzNjcxNDE3NCwiZXhwIjoxNjM2NzE1OTY0LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.ZCbLjIOHuLe1n7_xvy1R2lGXl8DdC7tdbInfJPK_RXc', 5, NULL, NULL),
(17, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTQ0OTcsIm5iZiI6MTYzNjcxNDUwNywiZXhwIjoxNjM2NzE2Mjk3LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.nsQL49bZkXuYrM4ycKQII6YDt2hHfW3HoDWzJvQFP70', 5, NULL, NULL),
(18, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTUyNDEsIm5iZiI6MTYzNjcxNTI1MSwiZXhwIjoxNjM2NzE3MDQxLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.x9ZVOjPQK3ikEVrqqLXMtgilNiQvJk1UWN4sC2PC_I4', 5, NULL, NULL),
(19, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTY3ODUsIm5iZiI6MTYzNjcxNjc5NSwiZXhwIjoxNjM2NzE4NTg1LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.zXuTMUHaP-PQmLt6nXuR0I60wP-GrjC6dVsr8Of7eac', 5, NULL, NULL),
(20, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTc3NTQsIm5iZiI6MTYzNjcxNzc2NCwiZXhwIjoxNjM2NzE5NTU0LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.dHC0WVMZVqKPkyrAtqA8_ahtx8eE7cbdxc2VglZIvoE', 5, NULL, NULL),
(21, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTc3NzEsIm5iZiI6MTYzNjcxNzc4MSwiZXhwIjoxNjM2NzE5NTcxLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.jQNffNMgFIJJtJOOjG-1pWKdn9o7-GhwOjSyXfAMG58', 5, NULL, NULL),
(22, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTgwMjksIm5iZiI6MTYzNjcxODAzOSwiZXhwIjoxNjM2NzE5ODI5LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.h7350F0i06Hl6oh6W-IzJAMwdNECRAbAbDGnfEKLkE0', 5, NULL, NULL),
(23, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTgyOTEsIm5iZiI6MTYzNjcxODMwMSwiZXhwIjoxNjM2NzIwMDkxLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.cWszznBNBQCFv9ulzR6iZiOIb3kAIKom02BCJ0S0z-w', 5, NULL, NULL),
(24, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MTg4NDYsIm5iZiI6MTYzNjcxODg1NiwiZXhwIjoxNjM2NzIwNjQ2LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.wa3CUTCqqC40iIIj5pWSFbw98ooqMqhUt7LmOozChAU', 5, NULL, NULL),
(25, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MjAzNjgsIm5iZiI6MTYzNjcyMDM3OCwiZXhwIjoxNjM2NzIyMTY4LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.7sYWXcnnUsRD6R5p3mKUGzIAwKYJw6yga5DHu7EoPdk', 5, NULL, NULL),
(26, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3MzYzNDYsIm5iZiI6MTYzNjczNjM1NiwiZXhwIjoxNjM2NzM4MTQ2LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.NblYn7K6M2rHOXkA5YomijT92AeC3wkqjSyBaRGlE40', 5, NULL, NULL),
(27, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3OTUxNDcsIm5iZiI6MTYzNjc5NTE1NywiZXhwIjoxNjM2Nzk2OTQ3LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.tWcCgINz7SwJOLz0UfVOck4YFBG4FKKhwt2dlC6luK0', 5, NULL, NULL),
(28, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3OTcwNzMsIm5iZiI6MTYzNjc5NzA4MywiZXhwIjoxNjM2Nzk4ODczLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.SweBX8sJtprInTLRkE9Bs_emYQO3iIRXPNVAemIn-W8', 5, NULL, NULL),
(29, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3OTcxMTMsIm5iZiI6MTYzNjc5NzEyMywiZXhwIjoxNjM2Nzk4OTEzLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.fjFIOqURn4pH-CQw7GrMdhmtH8_ex0tm2prnJCKNFHs', 5, NULL, NULL),
(30, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3OTc0MjksIm5iZiI6MTYzNjc5NzQzOSwiZXhwIjoxNjM2Nzk5MjI5LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.BLfXKOSeQgxKBiNY_6DsAJDTJBHUNQ6bUzdalTZ8pA0', 5, NULL, NULL),
(31, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3OTc0NDUsIm5iZiI6MTYzNjc5NzQ1NSwiZXhwIjoxNjM2Nzk5MjQ1LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.empHbFKR7Z1GiOzIdHwR-t8Lt4WuT94FD5Mi3g1MBoM', 5, NULL, NULL),
(32, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY3OTk2MDYsIm5iZiI6MTYzNjc5OTYxNiwiZXhwIjoxNjM2ODAxNDA2LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.YSAG1KV4a5Xs-YFTgAzrc3fijmGh7BXCOEuHWfdHqj4', 5, NULL, NULL),
(33, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MDMyMDgsIm5iZiI6MTYzNjgwMzIxOCwiZXhwIjoxNjM2ODA1MDA4LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.Ut71Kwn6qHMeSgtw_1SbUm9ERdl9mKfpo0oWP3MWZP0', 5, NULL, NULL),
(34, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MDQ3NDcsIm5iZiI6MTYzNjgwNDc1NywiZXhwIjoxNjM2ODA2NTQ3LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.lcv6FQ7lRA5bXDM2xUW2kkPjqNg7H0RWbDRDAXY_-ZY', 5, NULL, NULL),
(35, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MDUwODIsIm5iZiI6MTYzNjgwNTA5MiwiZXhwIjoxNjM2ODA2ODgyLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.1Szj34bWdubOASMMEM0U1N-o6_Z8K3DklkNlJR64xbI', 5, NULL, NULL),
(36, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MDY4NTMsIm5iZiI6MTYzNjgwNjg2MywiZXhwIjoxNjM2ODA4NjUzLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.hVm8-bca6RvtV_1hab1Oqhb3KGFDYDme-wHugvoxrJY', 5, NULL, NULL),
(37, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MTU4NzEsIm5iZiI6MTYzNjgxNTg4MSwiZXhwIjoxNjM2ODE3NjcxLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.NGfGvQyC1rYeNB0PF_SfRwOvlREdX9_VulYJPnP8lpc', 5, NULL, NULL),
(38, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MTc3MTEsIm5iZiI6MTYzNjgxNzcyMSwiZXhwIjoxNjM2ODE5NTExLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0._F_U755-5fkmjkxDopWy2_F_kBDLgJNQZj8W139iDtA', 5, NULL, NULL),
(39, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MjQzNjEsIm5iZiI6MTYzNjgyNDM3MSwiZXhwIjoxNjM2ODI2MTYxLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.D5JglrOg4LOUGDvOxRtk4plN6U37jqpZBAsj4NPJpv4', 5, NULL, NULL),
(40, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MjU1NDMsIm5iZiI6MTYzNjgyNTU1MywiZXhwIjoxNjM2ODI3MzQzLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.2cjUFEsYMstCeAaJUF3eq9heEcacCFAF_tAo23atpHI', 5, NULL, NULL),
(41, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MjU1ODIsIm5iZiI6MTYzNjgyNTU5MiwiZXhwIjoxNjM2ODI3MzgyLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.T35OSrMHdm4lfyLHjGOjgBSZP8LQh-Um1U12A_lwtTM', 5, NULL, NULL),
(42, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MjYxNjgsIm5iZiI6MTYzNjgyNjE3OCwiZXhwIjoxNjM2ODI3OTY4LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.BrmkXAebzvg6ZBsY6xCNf42L0Pn8tlFLWGxiNQ1SkTQ', 5, NULL, NULL),
(43, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4MjY4NDAsIm5iZiI6MTYzNjgyNjg1MCwiZXhwIjoxNjM2ODI4NjQwLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.Id2ypI4wR-bEjvg7bBL96PckZQM9y0ZupZNbBoTc-WU', 5, NULL, NULL),
(44, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY4OTc2NDMsIm5iZiI6MTYzNjg5NzY1MywiZXhwIjoxNjM2ODk5NDQzLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.Gb6dmN2RetRArZzPRPuJpfevcq0YqNe6LrLaGDhc_Lc', 5, NULL, NULL),
(45, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MDM4OTksIm5iZiI6MTYzNjkwMzkwOSwiZXhwIjoxNjM2OTA1Njk5LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.09-6NhpwJtj6K6hp6UAX917iOFwawSWul8BH1rSHb4g', 5, NULL, NULL),
(46, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MDU3NjYsIm5iZiI6MTYzNjkwNTc3NiwiZXhwIjoxNjM2OTA3NTY2LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.BAjEz0gk5TYsGf_mxCO5ANy4MkCt2_xHsmxw6Tg0Miw', 5, NULL, NULL),
(47, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MDY1MDAsIm5iZiI6MTYzNjkwNjUxMCwiZXhwIjoxNjM2OTA4MzAwLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.DSTdU1MG8-HkjkjfcigjUJ8A2R9I5vUEuzaWS7cB8l4', 5, NULL, NULL),
(48, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MDkxNzYsIm5iZiI6MTYzNjkwOTE4NiwiZXhwIjoxNjM2OTEwOTc2LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.rfOrnh6-qt4N1enl4zz0r7lZLiyDiEo8M78qS5kVW4U', 5, NULL, NULL),
(49, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MDk2MTAsIm5iZiI6MTYzNjkwOTYyMCwiZXhwIjoxNjM2OTExNDEwLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.8NIPCF871RIQZuLm68NElxXgCnFb2qQ5flalGQU1b-A', 5, NULL, NULL),
(50, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MTAwMTQsIm5iZiI6MTYzNjkxMDAyNCwiZXhwIjoxNjM2OTExODE0LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.Z0dRALJwQfIxoaIKw1HL-vq6ctyWSrGRZoeRigzBwxk', 5, NULL, NULL),
(51, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MTI0NzUsIm5iZiI6MTYzNjkxMjQ4NSwiZXhwIjoxNjM2OTE0Mjc1LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.6vg4_wELc5q21EOKXuTTVMLodYc36ChKoBfI6P_Zc-k', 5, NULL, NULL),
(52, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MTQyMDYsIm5iZiI6MTYzNjkxNDIxNiwiZXhwIjoxNjM2OTE2MDA2LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.VkwtepvlTMhiguPoYtKsjamP4kjMdqBwW_y2F1l7vkA', 5, NULL, NULL),
(53, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MTYxOTMsIm5iZiI6MTYzNjkxNjIwMywiZXhwIjoxNjM2OTE3OTkzLCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJpcmFtaWphekBnbWFpbC5jb20iLCJuYW1lIjoiaXJhbSIsImlkIjo1fX0.8R9J_XWzaxgVh5_ZuSVTJCfpvWmTeSX7HPIlIbqb4hA', 5, NULL, NULL),
(54, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MTYzNjYsIm5iZiI6MTYzNjkxNjM3NiwiZXhwIjoxNjM2OTE4MTY2LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJzdW1haWxhMkBnbWFpbC5jb20iLCJuYW1lIjoic3VtYWlsYSIsImlkIjoxOX19.DnSkNxRhmWUJ00RH2IUn_x6tTAYNFJ7d-7CheSQF3Js', 19, NULL, NULL),
(55, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MTgyMzcsIm5iZiI6MTYzNjkxODI0NywiZXhwIjoxNjM2OTIwMDM3LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJjaG9paWlpNjI4QGdtYWlsLmNvbSIsIm5hbWUiOiJpcmFtIiwiaWQiOjV9fQ.g9f8Y7WzCpmDOOKC5-eqx7fSsXCNJMh_JszDl8DP2m8', 5, NULL, NULL),
(56, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJTb2NpYWxBcHAiLCJpYXQiOjE2MzY5MTkzMjcsIm5iZiI6MTYzNjkxOTMzNywiZXhwIjoxNjM2OTIxMTI3LCJhdWQiOiJBcHAgVXNlciIsImRhdGEiOnsiZW1haWwiOiJjaG9paWlpNjI4QGdtYWlsLmNvbSIsIm5hbWUiOiJpcmFtIiwiaWQiOjV9fQ.jwNG3b_7zwOLscWpXnHIUdIAVt4zSIQUxxjZMcK0F0M', 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `attachment`, `text`, `user_id`, `post_id`, `created_at`, `updated_at`) VALUES
(2, 'marguerite-729510__340.jpg', 'hello', 5, 0, '2021-11-12 01:06:17', '2021-11-12 01:06:17'),
(4, 'marguerite-729510__340.jpg', 'hello', 5, 0, '2021-11-12 01:07:44', '2021-11-12 01:07:44'),
(7, 'marguerite-729510__340.jpg', 'hello', 5, 4, '2021-11-12 02:44:05', '2021-11-12 02:44:05'),
(8, '618ffea6c615d.jpeg', 'hey update', 5, 4, '2021-11-12 04:49:31', '2021-11-13 13:06:30'),
(9, '618ffb0d60381.jpeg', 'Hello', 5, 5, '2021-11-13 12:51:09', '2021-11-13 12:51:09'),
(10, '618ffc43c4f92.jpeg', 'hey update', 5, 4, '2021-11-13 12:54:26', '2021-11-13 12:56:19'),
(11, '6191542bc4245.jpeg', 'Hello', 5, 4, '2021-11-14 13:23:39', '2021-11-14 13:23:39'),
(12, '619154abf2379.jpeg', 'Hello', 5, 4, '2021-11-14 13:25:48', '2021-11-14 13:25:48'),
(13, '6191550446c36.jpeg', 'Hello', 5, 4, '2021-11-14 13:27:16', '2021-11-14 13:27:16'),
(14, '6191559ce1978.jpeg', 'Hello', 5, 4, '2021-11-14 13:29:48', '2021-11-14 13:29:48'),
(15, '6191564f2e296.jpeg', 'Hello', 5, 4, '2021-11-14 13:32:47', '2021-11-14 13:32:47'),
(16, '61915670e42f5.jpeg', 'Hello', 5, 7, '2021-11-14 13:33:20', '2021-11-14 13:33:20'),
(17, '6191569c3f19f.jpeg', 'Hello', 5, 7, '2021-11-14 13:34:04', '2021-11-14 13:34:04'),
(18, '619156b482b96.jpeg', 'Hello', 5, 7, '2021-11-14 13:34:28', '2021-11-14 13:34:28'),
(19, '619156cc9cad1.jpeg', 'Hello', 5, 7, '2021-11-14 13:34:52', '2021-11-14 13:34:52'),
(20, '6191572ea4b3b.jpeg', 'Hello', 5, 7, '2021-11-14 13:36:30', '2021-11-14 13:36:30'),
(21, '61915820c6521.jpeg', 'Hello', 5, 7, '2021-11-14 13:40:32', '2021-11-14 13:40:32'),
(22, '619158aac1d0a.jpeg', 'Hello', 5, 7, '2021-11-14 13:42:50', '2021-11-14 13:42:50'),
(23, '619158b72a9b3.jpeg', 'Hello', 5, 7, '2021-11-14 13:43:03', '2021-11-14 13:43:03'),
(24, '619158c3670fe.jpeg', 'Hello', 5, 7, '2021-11-14 13:43:15', '2021-11-14 13:43:15'),
(25, '6191591b9aa84.jpeg', 'Hello', 5, 7, '2021-11-14 13:44:43', '2021-11-14 13:44:43'),
(26, '61915a40d8ccb.jpeg', 'Hello', 5, 7, '2021-11-14 13:49:36', '2021-11-14 13:49:36'),
(27, '61915bec229bd.jpeg', 'Hello', 5, 7, '2021-11-14 13:56:44', '2021-11-14 13:56:44'),
(28, '61915c9d43ff6.jpeg', 'Hello', 19, 7, '2021-11-14 13:59:41', '2021-11-14 13:59:41'),
(29, '619162827ea0f.jpeg', 'Hello', 19, 7, '2021-11-14 14:24:50', '2021-11-14 14:24:50'),
(30, '619163f744fcf.jpeg', 'Hello', 5, 7, '2021-11-14 14:31:03', '2021-11-14 14:31:03');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `friend_request`
--

CREATE TABLE `friend_request` (
  `id` int(255) NOT NULL,
  `sender` int(255) NOT NULL,
  `reciever` int(255) NOT NULL,
  `status` enum('pending','approved','cancel') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `friend_request`
--

INSERT INTO `friend_request` (`id`, `sender`, `reciever`, `status`, `created_at`, `updated_at`) VALUES
(3, 5, 5, 'approved', '2021-11-14 12:13:49', '2021-11-14 13:02:29'),
(4, 5, 6, '', '2021-11-14 12:16:46', '2021-11-14 12:16:46'),
(5, 5, 6, 'pending', '2021-11-14 12:58:30', '2021-11-14 12:58:30'),
(6, 5, 6, 'pending', '2021-11-14 12:59:39', '2021-11-14 12:59:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(8, '2014_10_12_000000_create_users_table', 1),
(9, '2014_10_12_100000_create_password_resets_table', 1),
(10, '2019_08_19_000000_create_failed_jobs_table', 1),
(11, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(12, '2021_11_10_114558_create_post_table', 1),
(13, '2021_11_11_054233_create_comments_table', 1),
(14, '2021_11_11_115612_create_auth_token_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `attachment`, `text`, `visibility`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'marguerite-729510__340.jpg', 'hello', 'public', 4, '2021-11-11 23:22:08', '2021-11-11 23:22:08'),
(3, '61900029b8eb1.jpeg', 'hey update', 'public', 5, '2021-11-12 00:46:24', '2021-11-13 13:12:57'),
(4, 'marguerite-729510__340.jpg', 'hello', 'private', 5, '2021-11-12 01:15:58', '2021-11-12 01:15:58'),
(5, 'marguerite-729510__340.jpg', 'Flow', 'private', 5, '2021-11-12 02:52:43', '2021-11-12 02:52:43'),
(6, 'marguerite-729510__340.jpg', 'Flow', 'public', 5, '2021-11-13 06:59:29', '2021-11-13 06:59:29'),
(7, 'marguerite-729510__340.jpg', 'Flow', 'private', 5, '2021-11-13 07:34:26', '2021-11-13 07:34:26'),
(8, '618ff7c8a4d45.jpeg', 'Hello', 'Public', 5, '2021-11-13 12:37:12', '2021-11-13 12:37:12'),
(9, '618ff9f9b0e70.jpeg', 'Hello', 'Public', 5, '2021-11-13 12:46:33', '2021-11-13 12:46:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(250) NOT NULL,
  `gender` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_image` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verification_token` varchar(355) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `age`, `gender`, `date_of_birth`, `email_verified_at`, `password`, `profile_image`, `verification_token`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 'isma', 'isma iftikhar', 32, 'Female', '3 sep 1980', '2021-11-11 23:10:44', 'sum12345', '618de8e8935dd.jpeg', NULL, NULL, '2021-11-11 23:09:13', '2021-11-12 05:20:33'),
(4, 'sumaila', 'sumailaa@gmail.com', 29, 'Female', '9 july 1999', '2021-11-11 23:17:11', '$2y$10$kd2/fMlhp3L4OjOZ3e1mLeCXmFAsGkhxktfpAVj6snBqS.M4cafCu', '618deab7baf57.jpeg', NULL, NULL, '2021-11-11 23:16:55', '2021-11-11 23:17:11'),
(5, 'iram', 'choiiii628@gmail.com', 25, 'Female', '2 jan 1997', '2021-11-11 23:50:40', '$2y$10$aYsyYm69itLW5sbQ/wqykOQdaYp2p7Mg/ow7ELwYzmcF8And0EFVm', '618df25d7381d.jpeg', NULL, NULL, '2021-11-11 23:49:33', '2021-11-11 23:50:40'),
(6, 'iram', 'arslann@gmail.com', 25, 'Male', '2 jan 1997', NULL, '$2y$10$WxhwSrCWJ8GIngJo56FaIOzzVDtvXxerpYvonnMjBHjVyaPQ5.Zv6', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:01:22', '2021-11-13 12:01:22'),
(7, 'iram', 'arslaann@gmail.com', 25, 'Male', '2 jan 1997', NULL, '$2y$10$w8bRXQhIPE01kyVnUETFk.dyOfR1FgZ.Db.BoWD7WE0BTDNDZ5.Ya', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:04:24', '2021-11-13 12:04:24'),
(8, 'iram', 'arslaann2@gmail.com', 25, 'Male', '2 jan 1997', NULL, '$2y$10$b0YEK0VelOGGcQpyPxPnXea22kHGymwCSs.qkhcFJe9iKJhVCJNme', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:08:13', '2021-11-13 12:08:13'),
(9, 'iram', 'arsl12ann@gmail.com', 25, 'Male', '2 jan 1997', NULL, '$2y$10$w3xByRruoU8zoiMLmrR4aO9uilRTUlnXyEk5S.5tbA2nCCAXqpgU2', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:09:17', '2021-11-13 12:09:17'),
(10, 'iram', 'arsl1232ann@gmail.com', 25, 'Male', '2 jan 1997', NULL, '$2y$10$dJ3lsAy.9a6MoZQwN2oxz.7cfedc3G8MjMKfPjxES9E/ALmwLsrKm', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:10:09', '2021-11-13 12:10:09'),
(11, 'iram', 'ismaaa@gmail.com', 25, 'Female', '2 jan 1997', NULL, '$2y$10$zTqxJ9csrbIsl5XyMqQs5uZNjTAlDnWPdfC7FpctB/uGVytk.zt2.', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:11:08', '2021-11-13 12:11:08'),
(12, 'iram', 'ismaaa1@gmail.com', 25, 'Female', '2 jan 1997', NULL, '$2y$10$IIKuOmM8YKUXDl6AZ7lk2eBFlD9Y/1aOstMuoIrthw1xHSftRntdu', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:13:11', '2021-11-13 12:13:11'),
(13, 'iram', 'ismaaa31@gmail.com', 25, 'Female', '2 jan 1997', NULL, '$2y$10$WqgARfJrkOYHDrORIAYbJuqGiPylTYW2G45iZLwYbbzbbqo8y5RA2', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:13:51', '2021-11-13 12:13:51'),
(14, 'iram', 'isma12aa31@gmail.com', 25, 'Female', '2 jan 1997', NULL, '$2y$10$KiitqZjzYuYEXjKHW6D.j.kcq87oW2d/g6hmF72zElv.sTH3Ro7Ee', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:17:00', '2021-11-13 12:17:00'),
(15, 'iram', 'isma1as2aa31@gmail.com', 25, 'Female', '2 jan 1997', NULL, '$2y$10$DjrsRCqyohjyxsZ3Pn.mCe6pUzD..aqS.RMjY2IpKWh6y8k5THqfW', NULL, '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 12:17:47', '2021-11-13 12:17:47'),
(16, 'iram', 'ismaa1as2aa31@gmail.com', 25, 'Female', '2 jan 1997', '2021-11-13 01:23:13', '$2y$10$gG.nn7GMitpP7rrDVs3DpuF5WLmlEA8hzahFYkOCWu/kbycdkPYG2', NULL, NULL, NULL, '2021-11-13 12:19:41', '2021-11-13 13:23:13'),
(17, 'iram', 'ismaa12as2aa31@gmail.com', 25, 'Female', '2 jan 1997', '2021-11-13 01:23:07', '$2y$10$ybbFZQpFhpBXEcfvC/6q2OIdqFbKM.hjBOyAVo07wv1JWjT1X2LxW', 'iram618ff3da22110.jpeg', NULL, NULL, '2021-11-13 12:20:26', '2021-11-13 13:23:07'),
(18, 'iram', 'choiii628@gmail.com', 10, 'Female', '2 jan 1997', NULL, '$2y$10$ybbFZQpFhpBXEcfvC/6q2OIdqFbKM.hjBOyAVo07wv1JWjT1X2LxW', 'iram6190095e11907.jpeg', '2045b6865a7ada5d10b8840b6ee97938', NULL, '2021-11-13 13:52:14', '2021-11-13 13:52:14'),
(19, 'sumaila', 'sumaila2@gmail.com', 21, 'Female', '9 jan 1999', '2021-11-14 01:59:16', '$2y$10$iHYolAFUb1NKNE71I/qYF.WaifaSwC3NBsavy7BLwaJvTDNxB0btW', 'sumaila61915c7759b34.jpeg', NULL, NULL, '2021-11-14 13:59:03', '2021-11-14 13:59:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_token`
--
ALTER TABLE `auth_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_token_user_id_foreign` (`user_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `friend_request`
--
ALTER TABLE `friend_request`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_token`
--
ALTER TABLE `auth_token`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `friend_request`
--
ALTER TABLE `friend_request`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_token`
--
ALTER TABLE `auth_token`
  ADD CONSTRAINT `auth_token_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `post_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
