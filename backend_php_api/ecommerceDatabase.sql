-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2025 at 06:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecommerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `address_name` varchar(255) NOT NULL,
  `address_userid` int(11) NOT NULL,
  `address_gover` int(11) NOT NULL,
  `address_city` int(11) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_lat` double NOT NULL,
  `address_long` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `address_name`, `address_userid`, `address_gover`, `address_city`, `address_street`, `address_lat`, `address_long`) VALUES
(37, 'بيتي', 2, 2, 60, 'شارع زعبلاوي', 30.3750519, 31.4097268),
(38, 'شركتي', 2, 10, 210, 'شارع البايهي ', 30.3750519, 31.4097268),
(41, 'الناصية', 2, 18, 290, 'ناصية وقفة زمان', 30.3750519, 31.4097267),
(47, 'دهمشة', 2, 20, 309, 'دهمشاوي', 30.404369141280686, 31.406722995214853);

-- --------------------------------------------------------

--
-- Stand-in structure for view `addressview`
-- (See below for the actual view)
--
CREATE TABLE `addressview` (
`address_id` int(11)
,`address_userid` int(11)
,`name` varchar(255)
,`street` varchar(255)
,`latitude` double
,`longitude` double
,`gover_ar` varchar(50)
,`gover_en` varchar(50)
,`city_ar` varchar(200)
,`city_en` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL,
  `cart_itemid` int(11) NOT NULL,
  `cart_userid` int(11) NOT NULL,
  `cart_orders` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `cart_itemid`, `cart_userid`, `cart_orders`) VALUES
(1258, 9, 2, 97),
(1259, 11, 2, 97),
(1260, 9, 2, 97),
(1261, 7, 2, 98),
(1262, 7, 2, 98),
(1263, 7, 2, 98),
(1264, 7, 2, 98),
(1265, 10, 2, 98),
(1266, 10, 2, 98),
(1267, 10, 2, 98),
(1268, 10, 2, 98),
(1269, 2, 2, 98),
(1270, 2, 2, 98),
(1271, 3, 2, 98),
(1272, 3, 2, 98),
(1273, 10, 2, 98),
(1274, 10, 2, 98),
(1275, 11, 2, 99),
(1276, 11, 2, 99),
(1277, 11, 2, 99),
(1278, 11, 2, 99),
(1279, 11, 2, 99),
(1280, 11, 2, 99),
(1281, 9, 2, 99),
(1282, 9, 2, 99),
(1283, 9, 2, 99),
(1284, 9, 2, 99),
(1285, 9, 2, 99),
(1286, 5, 2, 99),
(1287, 5, 2, 99),
(1288, 5, 2, 99),
(1289, 5, 2, 99),
(1290, 1, 2, 99),
(1291, 1, 2, 99),
(1292, 1, 2, 99),
(1293, 1, 2, 99),
(1294, 10, 2, 99),
(1295, 10, 2, 99),
(1296, 6, 2, 99),
(1297, 7, 2, 99),
(1298, 3, 2, 99),
(1299, 3, 2, 99),
(1300, 10, 2, 100),
(1301, 10, 2, 100),
(1302, 1, 2, 100),
(1303, 1, 2, 100),
(1304, 8, 2, 100),
(1305, 7, 2, 100),
(1306, 7, 2, 100),
(1307, 10, 2, 100),
(1308, 10, 2, 100),
(1309, 5, 2, 100),
(1310, 4, 2, 101),
(1311, 3, 2, 101),
(1312, 3, 2, 101),
(1313, 4, 2, 101),
(1314, 4, 2, 101),
(1315, 9, 2, 102),
(1316, 9, 2, 102),
(1317, 9, 2, 102),
(1318, 2, 2, 0),
(1319, 4, 2, 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `cartview`
-- (See below for the actual view)
--
CREATE TABLE `cartview` (
`totalPrice` double
,`count` bigint(21)
,`cart_id` int(11)
,`cart_itemid` int(11)
,`cart_userid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name_ar` varchar(80)
,`items_name_en` varchar(80)
,`items_name_de` varchar(80)
,`items_name_sp` varchar(80)
,`items_desc_ar` varchar(255)
,`items_desc_en` varchar(255)
,`items_desc_de` varchar(255)
,`items_desc_sp` varchar(255)
,`items_price` float
,`items_discount` smallint(6)
,`items_count` int(11)
,`items_active` int(11)
,`items_image` varchar(255)
,`items_createTime` timestamp
,`items_categories` int(11)
,`categories_id` int(11)
,`categories_name_ar` varchar(50)
,`categories_name_en` varchar(50)
,`categories_name_de` varchar(50)
,`categories_name_sp` varchar(50)
,`categories_image` varchar(255)
,`categories_createTime` timestamp
,`finalPrice` double
);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name_ar` varchar(50) NOT NULL,
  `categories_name_en` varchar(50) NOT NULL,
  `categories_name_de` varchar(50) NOT NULL,
  `categories_name_sp` varchar(50) NOT NULL,
  `categories_image` varchar(255) NOT NULL,
  `categories_createTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name_ar`, `categories_name_en`, `categories_name_de`, `categories_name_sp`, `categories_image`, `categories_createTime`) VALUES
(1, 'لابتوب', 'Laptop', 'der Laptop', 'el portátil', 'laptop.svg', '2025-01-23 00:26:00'),
(2, 'موبايل', 'Mobile', 'das Handy', 'el móvil', 'mobile.svg', '2025-01-23 00:26:00'),
(3, 'ملابس', 'Clothes', 'die Kleidung	', 'la ropa', 'clothesHody.svg', '2025-01-23 00:28:11'),
(4, 'إلكترونيات', 'Electronics', 'die Elektronik	', 'la electrónica', 'electronics.svg', '2025-01-23 00:28:11'),
(5, 'كتب', 'books', 'Bücher', 'Libros', 'books.svg', '2025-01-23 14:07:36'),
(6, 'مستلزمات المنزل', 'Home Supplies', 'Haushaltswaren', 'Suministros para el hogar', 'spoon_fork.svg', '2025-01-23 14:07:36'),
(7, 'أحذية', 'shoes', 'shodiusch', 'shdomondo', 'shoes.svg', '2025-01-31 03:27:19');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `cities_id` int(11) NOT NULL,
  `city_name_ar` varchar(200) NOT NULL,
  `city_name_en` varchar(200) NOT NULL,
  `city_gov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`cities_id`, `city_name_ar`, `city_name_en`, `city_gov_id`) VALUES
(1, '15 مايو', '15 May', 1),
(2, 'الازبكية', 'Al Azbakeyah', 1),
(3, 'البساتين', 'Al Basatin', 1),
(4, 'التبين', 'Tebin', 1),
(5, 'الخليفة', 'El-Khalifa', 1),
(6, 'الدراسة', 'El darrasa', 1),
(7, 'الدرب الاحمر', 'Aldarb Alahmar', 1),
(8, 'الزاوية الحمراء', 'Zawya al-Hamra', 1),
(9, 'الزيتون', 'El-Zaytoun', 1),
(10, 'الساحل', 'Sahel', 1),
(11, 'السلام', 'El Salam', 1),
(12, 'السيدة زينب', 'Sayeda Zeinab', 1),
(13, 'الشرابية', 'El Sharabeya', 1),
(14, 'مدينة الشروق', 'Shorouk', 1),
(15, 'الظاهر', 'El Daher', 1),
(16, 'العتبة', 'Ataba', 1),
(17, 'القاهرة الجديدة', 'New Cairo', 1),
(18, 'المرج', 'El Marg', 1),
(19, 'عزبة النخل', 'Ezbet el Nakhl', 1),
(20, 'المطرية', 'Matareya', 1),
(21, 'المعادى', 'Maadi', 1),
(22, 'المعصرة', 'Maasara', 1),
(23, 'المقطم', 'Mokattam', 1),
(24, 'المنيل', 'Manyal', 1),
(25, 'الموسكى', 'Mosky', 1),
(26, 'النزهة', 'Nozha', 1),
(27, 'الوايلى', 'Waily', 1),
(28, 'باب الشعرية', 'Bab al-Shereia', 1),
(29, 'بولاق', 'Bolaq', 1),
(30, 'جاردن سيتى', 'Garden City', 1),
(31, 'حدائق القبة', 'Hadayek El-Kobba', 1),
(32, 'حلوان', 'Helwan', 1),
(33, 'دار السلام', 'Dar Al Salam', 1),
(34, 'شبرا', 'Shubra', 1),
(35, 'طره', 'Tura', 1),
(36, 'عابدين', 'Abdeen', 1),
(37, 'عباسية', 'Abaseya', 1),
(38, 'عين شمس', 'Ain Shams', 1),
(39, 'مدينة نصر', 'Nasr City', 1),
(40, 'مصر الجديدة', 'New Heliopolis', 1),
(41, 'مصر القديمة', 'Masr Al Qadima', 1),
(42, 'منشية ناصر', 'Mansheya Nasir', 1),
(43, 'مدينة بدر', 'Badr City', 1),
(44, 'مدينة العبور', 'Obour City', 1),
(45, 'وسط البلد', 'Cairo Downtown', 1),
(46, 'الزمالك', 'Zamalek', 1),
(47, 'قصر النيل', 'Kasr El Nile', 1),
(48, 'الرحاب', 'Rehab', 1),
(49, 'القطامية', 'Katameya', 1),
(50, 'مدينتي', 'Madinty', 1),
(51, 'روض الفرج', 'Rod Alfarag', 1),
(52, 'شيراتون', 'Sheraton', 1),
(53, 'الجمالية', 'El-Gamaleya', 1),
(54, 'العاشر من رمضان', '10th of Ramadan City', 1),
(55, 'الحلمية', 'Helmeyat Alzaytoun', 1),
(56, 'النزهة الجديدة', 'New Nozha', 1),
(57, 'العاصمة الإدارية', 'Capital New', 1),
(58, 'الجيزة', 'Giza', 2),
(59, 'السادس من أكتوبر', 'Sixth of October', 2),
(60, 'الشيخ زايد', 'Cheikh Zayed', 2),
(61, 'الحوامدية', 'Hawamdiyah', 2),
(62, 'البدرشين', 'Al Badrasheen', 2),
(63, 'الصف', 'Saf', 2),
(64, 'أطفيح', 'Atfih', 2),
(65, 'العياط', 'Al Ayat', 2),
(66, 'الباويطي', 'Al-Bawaiti', 2),
(67, 'منشأة القناطر', 'ManshiyetAl Qanater', 2),
(68, 'أوسيم', 'Oaseem', 2),
(69, 'كرداسة', 'Kerdasa', 2),
(70, 'أبو النمرس', 'Abu Nomros', 2),
(71, 'كفر غطاطي', 'Kafr Ghati', 2),
(72, 'منشأة البكاري', 'Manshiyet Al Bakari', 2),
(73, 'الدقى', 'Dokki', 2),
(74, 'العجوزة', 'Agouza', 2),
(75, 'الهرم', 'Haram', 2),
(76, 'الوراق', 'Warraq', 2),
(77, 'امبابة', 'Imbaba', 2),
(78, 'بولاق الدكرور', 'Boulaq Dakrour', 2),
(79, 'الواحات البحرية', 'Al Wahat Al Baharia', 2),
(80, 'العمرانية', 'Omraneya', 2),
(81, 'المنيب', 'Moneeb', 2),
(82, 'بين السرايات', 'Bin Alsarayat', 2),
(83, 'الكيت كات', 'Kit Kat', 2),
(84, 'المهندسين', 'Mohandessin', 2),
(85, 'فيصل', 'Faisal', 2),
(86, 'أبو رواش', 'Abu Rawash', 2),
(87, 'حدائق الأهرام', 'Hadayek Alahram', 2),
(88, 'الحرانية', 'Haraneya', 2),
(89, 'حدائق اكتوبر', 'Hadayek October', 2),
(90, 'صفط اللبن', 'Saft Allaban', 2),
(91, 'القرية الذكية', 'Smart Village', 2),
(92, 'ارض اللواء', 'Ard Ellwaa', 2),
(93, 'ابو قير', 'Abu Qir', 3),
(94, 'الابراهيمية', 'Al Ibrahimeyah', 3),
(95, 'الأزاريطة', 'Azarita', 3),
(96, 'الانفوشى', 'Anfoushi', 3),
(97, 'الدخيلة', 'Dekheila', 3),
(98, 'السيوف', 'El Soyof', 3),
(99, 'العامرية', 'Ameria', 3),
(100, 'اللبان', 'El Labban', 3),
(101, 'المفروزة', 'Al Mafrouza', 3),
(102, 'المنتزه', 'El Montaza', 3),
(103, 'المنشية', 'Mansheya', 3),
(104, 'الناصرية', 'Naseria', 3),
(105, 'امبروزو', 'Ambrozo', 3),
(106, 'باب شرق', 'Bab Sharq', 3),
(107, 'برج العرب', 'Bourj Alarab', 3),
(108, 'ستانلى', 'Stanley', 3),
(109, 'سموحة', 'Smouha', 3),
(110, 'سيدى بشر', 'Sidi Bishr', 3),
(111, 'شدس', 'Shads', 3),
(112, 'غيط العنب', 'Gheet Alenab', 3),
(113, 'فلمينج', 'Fleming', 3),
(114, 'فيكتوريا', 'Victoria', 3),
(115, 'كامب شيزار', 'Camp Shizar', 3),
(116, 'كرموز', 'Karmooz', 3),
(117, 'محطة الرمل', 'Mahta Alraml', 3),
(118, 'مينا البصل', 'Mina El-Basal', 3),
(119, 'العصافرة', 'Asafra', 3),
(120, 'العجمي', 'Agamy', 3),
(121, 'بكوس', 'Bakos', 3),
(122, 'بولكلي', 'Boulkly', 3),
(123, 'كليوباترا', 'Cleopatra', 3),
(124, 'جليم', 'Glim', 3),
(125, 'المعمورة', 'Al Mamurah', 3),
(126, 'المندرة', 'Al Mandara', 3),
(127, 'محرم بك', 'Moharam Bek', 3),
(128, 'الشاطبي', 'Elshatby', 3),
(129, 'سيدي جابر', 'Sidi Gaber', 3),
(130, 'الساحل الشمالي', 'North Coast/sahel', 3),
(131, 'الحضرة', 'Alhadra', 3),
(132, 'العطارين', 'Alattarin', 3),
(133, 'سيدي كرير', 'Sidi Kerir', 3),
(134, 'الجمرك', 'Elgomrok', 3),
(135, 'المكس', 'Al Max', 3),
(136, 'مارينا', 'Marina', 3),
(137, 'المنصورة', 'Mansoura', 4),
(138, 'طلخا', 'Talkha', 4),
(139, 'ميت غمر', 'Mitt Ghamr', 4),
(140, 'دكرنس', 'Dekernes', 4),
(141, 'أجا', 'Aga', 4),
(142, 'منية النصر', 'Menia El Nasr', 4),
(143, 'السنبلاوين', 'Sinbillawin', 4),
(144, 'الكردي', 'El Kurdi', 4),
(145, 'بني عبيد', 'Bani Ubaid', 4),
(146, 'المنزلة', 'Al Manzala', 4),
(147, 'تمي الأمديد', 'tami al\'amdid', 4),
(148, 'الجمالية', 'aljamalia', 4),
(149, 'شربين', 'Sherbin', 4),
(150, 'المطرية', 'Mataria', 4),
(151, 'بلقاس', 'Belqas', 4),
(152, 'ميت سلسيل', 'Meet Salsil', 4),
(153, 'جمصة', 'Gamasa', 4),
(154, 'محلة دمنة', 'Mahalat Damana', 4),
(155, 'نبروه', 'Nabroh', 4),
(156, 'الغردقة', 'Hurghada', 5),
(157, 'رأس غارب', 'Ras Ghareb', 5),
(158, 'سفاجا', 'Safaga', 5),
(159, 'القصير', 'El Qusiar', 5),
(160, 'مرسى علم', 'Marsa Alam', 5),
(161, 'الشلاتين', 'Shalatin', 5),
(162, 'حلايب', 'Halaib', 5),
(163, 'الدهار', 'Aldahar', 5),
(164, 'دمنهور', 'Damanhour', 6),
(165, 'كفر الدوار', 'Kafr El Dawar', 6),
(166, 'رشيد', 'Rashid', 6),
(167, 'إدكو', 'Edco', 6),
(168, 'أبو المطامير', 'Abu al-Matamir', 6),
(169, 'أبو حمص', 'Abu Homs', 6),
(170, 'الدلنجات', 'Delengat', 6),
(171, 'المحمودية', 'Mahmoudiyah', 6),
(172, 'الرحمانية', 'Rahmaniyah', 6),
(173, 'إيتاي البارود', 'Itai Baroud', 6),
(174, 'حوش عيسى', 'Housh Eissa', 6),
(175, 'شبراخيت', 'Shubrakhit', 6),
(176, 'كوم حمادة', 'Kom Hamada', 6),
(177, 'بدر', 'Badr', 6),
(178, 'وادي النطرون', 'Wadi Natrun', 6),
(179, 'النوبارية الجديدة', 'New Nubaria', 6),
(180, 'النوبارية', 'Alnoubareya', 6),
(181, 'الفيوم', 'Fayoum', 7),
(182, 'الفيوم الجديدة', 'Fayoum El Gedida', 7),
(183, 'طامية', 'Tamiya', 7),
(184, 'سنورس', 'Snores', 7),
(185, 'إطسا', 'Etsa', 7),
(186, 'إبشواي', 'Epschway', 7),
(187, 'يوسف الصديق', 'Yusuf El Sediaq', 7),
(188, 'الحادقة', 'Hadqa', 7),
(189, 'اطسا', 'Atsa', 7),
(190, 'الجامعة', 'Algamaa', 7),
(191, 'السيالة', 'Sayala', 7),
(192, 'طنطا', 'Tanta', 8),
(193, 'المحلة الكبرى', 'Al Mahalla Al Kobra', 8),
(194, 'كفر الزيات', 'Kafr El Zayat', 8),
(195, 'زفتى', 'Zefta', 8),
(196, 'السنطة', 'El Santa', 8),
(197, 'قطور', 'Qutour', 8),
(198, 'بسيون', 'Basion', 8),
(199, 'سمنود', 'Samannoud', 8),
(200, 'الإسماعيلية', 'Ismailia', 9),
(201, 'فايد', 'Fayed', 9),
(202, 'القنطرة شرق', 'Qantara Sharq', 9),
(203, 'القنطرة غرب', 'Qantara Gharb', 9),
(204, 'التل الكبير', 'El Tal El Kabier', 9),
(205, 'أبو صوير', 'Abu Sawir', 9),
(206, 'القصاصين الجديدة', 'Kasasien El Gedida', 9),
(207, 'نفيشة', 'Nefesha', 9),
(208, 'الشيخ زايد', 'Sheikh Zayed', 9),
(209, 'شبين الكوم', 'Shbeen El Koom', 10),
(210, 'مدينة السادات', 'Sadat City', 10),
(211, 'منوف', 'Menouf', 10),
(212, 'سرس الليان', 'Sars El-Layan', 10),
(213, 'أشمون', 'Ashmon', 10),
(214, 'الباجور', 'Al Bagor', 10),
(215, 'قويسنا', 'Quesna', 10),
(216, 'بركة السبع', 'Berkat El Saba', 10),
(217, 'تلا', 'Tala', 10),
(218, 'الشهداء', 'Al Shohada', 10),
(219, 'المنيا', 'Minya', 11),
(220, 'المنيا الجديدة', 'Minya El Gedida', 11),
(221, 'العدوة', 'El Adwa', 11),
(222, 'مغاغة', 'Magagha', 11),
(223, 'بني مزار', 'Bani Mazar', 11),
(224, 'مطاي', 'Mattay', 11),
(225, 'سمالوط', 'Samalut', 11),
(226, 'المدينة الفكرية', 'Madinat El Fekria', 11),
(227, 'ملوي', 'Meloy', 11),
(228, 'دير مواس', 'Deir Mawas', 11),
(229, 'ابو قرقاص', 'Abu Qurqas', 11),
(230, 'ارض سلطان', 'Ard Sultan', 11),
(231, 'بنها', 'Banha', 12),
(232, 'قليوب', 'Qalyub', 12),
(233, 'شبرا الخيمة', 'Shubra Al Khaimah', 12),
(234, 'القناطر الخيرية', 'Al Qanater Charity', 12),
(235, 'الخانكة', 'Khanka', 12),
(236, 'كفر شكر', 'Kafr Shukr', 12),
(237, 'طوخ', 'Tukh', 12),
(238, 'قها', 'Qaha', 12),
(239, 'العبور', 'Obour', 12),
(240, 'الخصوص', 'Khosous', 12),
(241, 'شبين القناطر', 'Shibin Al Qanater', 12),
(242, 'مسطرد', 'Mostorod', 12),
(243, 'الخارجة', 'El Kharga', 13),
(244, 'باريس', 'Paris', 13),
(245, 'موط', 'Mout', 13),
(246, 'الفرافرة', 'Farafra', 13),
(247, 'بلاط', 'Balat', 13),
(248, 'الداخلة', 'Dakhla', 13),
(249, 'السويس', 'Suez', 14),
(250, 'الجناين', 'Alganayen', 14),
(251, 'عتاقة', 'Ataqah', 14),
(252, 'العين السخنة', 'Ain Sokhna', 14),
(253, 'فيصل', 'Faysal', 14),
(254, 'أسوان', 'Aswan', 15),
(255, 'أسوان الجديدة', 'Aswan El Gedida', 15),
(256, 'دراو', 'Drau', 15),
(257, 'كوم أمبو', 'Kom Ombo', 15),
(258, 'نصر النوبة', 'Nasr Al Nuba', 15),
(259, 'كلابشة', 'Kalabsha', 15),
(260, 'إدفو', 'Edfu', 15),
(261, 'الرديسية', 'Al-Radisiyah', 15),
(262, 'البصيلية', 'Al Basilia', 15),
(263, 'السباعية', 'Al Sibaeia', 15),
(264, 'ابوسمبل السياحية', 'Abo Simbl Al Siyahia', 15),
(265, 'مرسى علم', 'Marsa Alam', 15),
(266, 'أسيوط', 'Assiut', 16),
(267, 'أسيوط الجديدة', 'Assiut El Gedida', 16),
(268, 'ديروط', 'Dayrout', 16),
(269, 'منفلوط', 'Manfalut', 16),
(270, 'القوصية', 'Qusiya', 16),
(271, 'أبنوب', 'Abnoub', 16),
(272, 'أبو تيج', 'Abu Tig', 16),
(273, 'الغنايم', 'El Ghanaim', 16),
(274, 'ساحل سليم', 'Sahel Selim', 16),
(275, 'البداري', 'El Badari', 16),
(276, 'صدفا', 'Sidfa', 16),
(277, 'بني سويف', 'Bani Sweif', 17),
(278, 'بني سويف الجديدة', 'Beni Suef El Gedida', 17),
(279, 'الواسطى', 'Al Wasta', 17),
(280, 'ناصر', 'Naser', 17),
(281, 'إهناسيا', 'Ehnasia', 17),
(282, 'ببا', 'beba', 17),
(283, 'الفشن', 'Fashn', 17),
(284, 'سمسطا', 'Somasta', 17),
(285, 'الاباصيرى', 'Alabbaseri', 17),
(286, 'مقبل', 'Mokbel', 17),
(287, 'بورسعيد', 'PorSaid', 18),
(288, 'بورفؤاد', 'Port Fouad', 18),
(289, 'العرب', 'Alarab', 18),
(290, 'حى الزهور', 'Zohour', 18),
(291, 'حى الشرق', 'Alsharq', 18),
(292, 'حى الضواحى', 'Aldawahi', 18),
(293, 'حى المناخ', 'Almanakh', 18),
(294, 'حى مبارك', 'Mubarak', 18),
(295, 'دمياط', 'Damietta', 19),
(296, 'دمياط الجديدة', 'New Damietta', 19),
(297, 'رأس البر', 'Ras El Bar', 19),
(298, 'فارسكور', 'Faraskour', 19),
(299, 'الزرقا', 'Zarqa', 19),
(300, 'السرو', 'alsaru', 19),
(301, 'الروضة', 'alruwda', 19),
(302, 'كفر البطيخ', 'Kafr El-Batikh', 19),
(303, 'عزبة البرج', 'Azbet Al Burg', 19),
(304, 'ميت أبو غالب', 'Meet Abou Ghalib', 19),
(305, 'كفر سعد', 'Kafr Saad', 19),
(306, 'الزقازيق', 'Zagazig', 20),
(307, 'العاشر من رمضان', 'Al Ashr Men Ramadan', 20),
(308, 'منيا القمح', 'Minya Al Qamh', 20),
(309, 'بلبيس', 'Belbeis', 20),
(310, 'مشتول السوق', 'Mashtoul El Souq', 20),
(311, 'القنايات', 'Qenaiat', 20),
(312, 'أبو حماد', 'Abu Hammad', 20),
(313, 'القرين', 'El Qurain', 20),
(314, 'ههيا', 'Hehia', 20),
(315, 'أبو كبير', 'Abu Kabir', 20),
(316, 'فاقوس', 'Faccus', 20),
(317, 'الصالحية الجديدة', 'El Salihia El Gedida', 20),
(318, 'الإبراهيمية', 'Al Ibrahimiyah', 20),
(319, 'ديرب نجم', 'Deirb Negm', 20),
(320, 'كفر صقر', 'Kafr Saqr', 20),
(321, 'أولاد صقر', 'Awlad Saqr', 20),
(322, 'الحسينية', 'Husseiniya', 20),
(323, 'صان الحجر القبلية', 'san alhajar alqablia', 20),
(324, 'منشأة أبو عمر', 'Manshayat Abu Omar', 20),
(325, 'الطور', 'Al Toor', 21),
(326, 'شرم الشيخ', 'Sharm El-Shaikh', 21),
(327, 'دهب', 'Dahab', 21),
(328, 'نويبع', 'Nuweiba', 21),
(329, 'طابا', 'Taba', 21),
(330, 'سانت كاترين', 'Saint Catherine', 21),
(331, 'أبو رديس', 'Abu Redis', 21),
(332, 'أبو زنيمة', 'Abu Zenaima', 21),
(333, 'رأس سدر', 'Ras Sidr', 21),
(334, 'كفر الشيخ', 'Kafr El Sheikh', 22),
(335, 'وسط البلد كفر الشيخ', 'Kafr El Sheikh Downtown', 22),
(336, 'دسوق', 'Desouq', 22),
(337, 'فوه', 'Fooh', 22),
(338, 'مطوبس', 'Metobas', 22),
(339, 'برج البرلس', 'Burg Al Burullus', 22),
(340, 'بلطيم', 'Baltim', 22),
(341, 'مصيف بلطيم', 'Masief Baltim', 22),
(342, 'الحامول', 'Hamol', 22),
(343, 'بيلا', 'Bella', 22),
(344, 'الرياض', 'Riyadh', 22),
(345, 'سيدي سالم', 'Sidi Salm', 22),
(346, 'قلين', 'Qellen', 22),
(347, 'سيدي غازي', 'Sidi Ghazi', 22),
(348, 'مرسى مطروح', 'Marsa Matrouh', 23),
(349, 'الحمام', 'El Hamam', 23),
(350, 'العلمين', 'Alamein', 23),
(351, 'الضبعة', 'Dabaa', 23),
(352, 'النجيلة', 'Al-Nagila', 23),
(353, 'سيدي براني', 'Sidi Brani', 23),
(354, 'السلوم', 'Salloum', 23),
(355, 'سيوة', 'Siwa', 23),
(356, 'مارينا', 'Marina', 23),
(357, 'الساحل الشمالى', 'North Coast', 23),
(358, 'الأقصر', 'Luxor', 24),
(359, 'الأقصر الجديدة', 'New Luxor', 24),
(360, 'إسنا', 'Esna', 24),
(361, 'طيبة الجديدة', 'New Tiba', 24),
(362, 'الزينية', 'Al ziynia', 24),
(363, 'البياضية', 'Al Bayadieh', 24),
(364, 'القرنة', 'Al Qarna', 24),
(365, 'أرمنت', 'Armant', 24),
(366, 'الطود', 'Al Tud', 24),
(367, 'قنا', 'Qena', 25),
(368, 'قنا الجديدة', 'New Qena', 25),
(369, 'ابو طشت', 'Abu Tesht', 25),
(370, 'نجع حمادي', 'Nag Hammadi', 25),
(371, 'دشنا', 'Deshna', 25),
(372, 'الوقف', 'Alwaqf', 25),
(373, 'قفط', 'Qaft', 25),
(374, 'نقادة', 'Naqada', 25),
(375, 'فرشوط', 'Farshout', 25),
(376, 'قوص', 'Quos', 25),
(377, 'العريش', 'Arish', 26),
(378, 'الشيخ زويد', 'Sheikh Zowaid', 26),
(379, 'نخل', 'Nakhl', 26),
(380, 'رفح', 'Rafah', 26),
(381, 'بئر العبد', 'Bir al-Abed', 26),
(382, 'الحسنة', 'Al Hasana', 26),
(383, 'سوهاج', 'Sohag', 27),
(384, 'سوهاج الجديدة', 'Sohag El Gedida', 27),
(385, 'أخميم', 'Akhmeem', 27),
(386, 'أخميم الجديدة', 'Akhmim El Gedida', 27),
(387, 'البلينا', 'Albalina', 27),
(388, 'المراغة', 'El Maragha', 27),
(389, 'المنشأة', 'almunsha\'a', 27),
(390, 'دار السلام', 'Dar AISalaam', 27),
(391, 'جرجا', 'Gerga', 27),
(392, 'جهينة الغربية', 'Jahina Al Gharbia', 27),
(393, 'ساقلته', 'Saqilatuh', 27),
(394, 'طما', 'Tama', 27),
(395, 'طهطا', 'Tahta', 27),
(396, 'الكوثر', 'Alkawthar', 27);

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL,
  `coupon_code` varchar(30) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0,
  `coupon_expired_date` datetime NOT NULL,
  `coupon_count` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `coupon_code`, `coupon_discount`, `coupon_expired_date`, `coupon_count`) VALUES
(0, '', 0, '2035-03-24 03:21:17', 9980),
(1, 'mo', 20, '2025-03-31 03:21:17', 8);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_userid` int(11) NOT NULL,
  `favorite_itemid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`favorite_id`, `favorite_userid`, `favorite_itemid`) VALUES
(1, 1, 10),
(10, 16, 1),
(296, 2, 3),
(297, 2, 10),
(298, 2, 2),
(299, 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `governorates`
--

CREATE TABLE `governorates` (
  `governorates_id` int(11) NOT NULL,
  `governorate_name_ar` varchar(50) NOT NULL,
  `governorate_name_en` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `governorates`
--

INSERT INTO `governorates` (`governorates_id`, `governorate_name_ar`, `governorate_name_en`) VALUES
(1, 'القاهرة', 'Cairo'),
(2, 'الجيزة', 'Giza'),
(3, 'الأسكندرية', 'Alexandria'),
(4, 'الدقهلية', 'Dakahlia'),
(5, 'البحر الأحمر', 'Red Sea'),
(6, 'البحيرة', 'Beheira'),
(7, 'الفيوم', 'Fayoum'),
(8, 'الغربية', 'Gharbiya'),
(9, 'الإسماعلية', 'Ismailia'),
(10, 'المنوفية', 'Menofia'),
(11, 'المنيا', 'Minya'),
(12, 'القليوبية', 'Qaliubiya'),
(13, 'الوادي الجديد', 'New Valley'),
(14, 'السويس', 'Suez'),
(15, 'اسوان', 'Aswan'),
(16, 'اسيوط', 'Assiut'),
(17, 'بني سويف', 'Beni Suef'),
(18, 'بورسعيد', 'Port Said'),
(19, 'دمياط', 'Damietta'),
(20, 'الشرقية', 'Sharkia'),
(21, 'جنوب سيناء', 'South Sinai'),
(22, 'كفر الشيخ', 'Kafr Al sheikh'),
(23, 'مطروح', 'Matrouh'),
(24, 'الأقصر', 'Luxor'),
(25, 'قنا', 'Qena'),
(26, 'شمال سيناء', 'North Sinai'),
(27, 'سوهاج', 'Sohag');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `items_id` int(11) NOT NULL,
  `items_name_ar` varchar(80) NOT NULL,
  `items_name_en` varchar(80) NOT NULL,
  `items_name_de` varchar(80) NOT NULL,
  `items_name_sp` varchar(80) NOT NULL,
  `items_desc_ar` varchar(255) NOT NULL,
  `items_desc_en` varchar(255) NOT NULL,
  `items_desc_de` varchar(255) NOT NULL,
  `items_desc_sp` varchar(255) NOT NULL,
  `items_price` float NOT NULL,
  `items_discount` smallint(6) NOT NULL DEFAULT 0,
  `items_count` int(11) NOT NULL,
  `items_active` int(11) NOT NULL DEFAULT 1,
  `items_image` varchar(255) NOT NULL,
  `items_createTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `items_categories` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`items_id`, `items_name_ar`, `items_name_en`, `items_name_de`, `items_name_sp`, `items_desc_ar`, `items_desc_en`, `items_desc_de`, `items_desc_sp`, `items_price`, `items_discount`, `items_count`, `items_active`, `items_image`, `items_createTime`, `items_categories`) VALUES
(1, 'بلوفر', 'Sweater', 'der Pullover', 'el suéter', 'بلوفر شتوي مريح وأنيق مصنوع من أجود الخامات ليمنحك الدفء والأناقة في جميع المناسبات.', 'A cozy and stylish winter sweater made from high-quality materials, keeping you warm and fashionable for any occasion.', 'Ein gemütlicher und stilvoller Winterpullover aus hochwertigen Materialien, der Sie warm und elegant zu jeder Gelegenheit hält.', 'Un suéter de invierno cómodo y elegante hecho con materiales de alta calidad, que te mantiene abrigado y con estilo en cualquier ocasión.', 450, 5, 25, 1, 'sweater.jpg', '2025-01-23 13:02:22', 3),
(2, 'شاحن', 'charger', 'das Ladegerät', 'el cargador', 'شاحن سريع وعالي الجودة متوافق مع مختلف الأجهزة الإلكترونية لضمان شحن سريع وآمن.', 'A high-quality fast charger compatible with various electronic devices for quick and safe charging.', 'Ein hochwertiges Schnellladegerät, kompatibel mit verschiedenen elektronischen Geräten, für schnelles und sicheres Laden.', 'Un cargador rápido y de alta calidad compatible con varios dispositivos electrónicos para una carga rápida y segura.', 300, 20, 10, 1, 'charger_xiaomi.jpg', '2025-01-23 13:06:05', 4),
(3, 'لابتوب HP', 'HP Laptop', 'HP Laptop', 'Portátil HP', 'لابتوب HP مع شاشة 15.6 بوصة ومعالج i7، مناسب للعمل والترفيه.', 'HP Laptop with a 15.6-inch screen and an i7 processor, perfect for work and entertainment.', 'HP Laptop mit einem 15,6-Zoll-Bildschirm und einem i7-Prozessor, ideal für Arbeit und Unterhaltung.', 'Portátil HP con pantalla de 15,6 pulgadas y procesador i7, perfecto para trabajar y entretenerse.', 15000, 10, 30, 1, 'hp_laptop.jpg', '2025-01-23 15:55:45', 1),
(4, 'موبايل سامسونج', 'Samsung Phone', 'Samsung Handy', 'Teléfono Samsung', 'موبايل سامسونج مع شاشة 6.5 بوصة وكاميرا 48 ميجابكسل.', 'Samsung phone with a 6.5-inch screen and a 48MP camera.', 'Samsung-Handy mit einem 6,5-Zoll-Bildschirm und einer 48-MP-Kamera.', 'Teléfono Samsung con pantalla de 6,5 pulgadas y cámara de 48MP.', 8000, 15, 50, 1, 'samsung.jpg', '2025-01-23 15:55:45', 2),
(5, 'تي شيرت قطن', 'Cotton T-Shirt', 'Baumwoll-T-Shirt', 'Camiseta de algodón', 'تي شيرت قطن مريح بألوان متعددة يناسب جميع الأوقات.', 'Comfortable cotton T-shirt in multiple colors, suitable for all occasions.', 'Bequemes Baumwoll-T-Shirt in verschiedenen Farben, geeignet für alle Anlässe.', 'Camiseta de algodón cómoda en varios colores, adecuada para todas las ocasiones.', 150, 5, 100, 1, 'cotton_shirt.jpg', '2025-01-23 15:55:45', 3),
(6, 'سماعات بلوتوث', 'Bluetooth Headphones', 'Bluetooth Kopfhörer', 'Auriculares Bluetooth', 'سماعات بلوتوث عالية الجودة مع ميكروفون لتجربة صوت ممتازة.', 'High-quality Bluetooth headphones with a microphone for an excellent sound experience.', 'Hochwertige Bluetooth-Kopfhörer mit Mikrofon für ein ausgezeichnetes Klangerlebnis.', 'Auriculares Bluetooth de alta calidad con micrófono para una excelente experiencia sonora.', 500, 20, 200, 1, 'headphonejpg.jpg', '2025-01-23 15:55:45', 4),
(7, 'كتاب عن البرمجة', 'Programming Book', 'Buch über Programmierung', 'Libro sobre programación', 'كتاب تعليمي يشرح أساسيات البرمجة بأسلوب سهل ومبسط.', 'An educational book that explains the basics of programming in a simple and easy-to-understand style.', 'Ein Lehrbuch, das die Grundlagen der Programmierung in einem einfachen und verständlichen Stil erklärt.', 'Un libro educativo que explica los conceptos básicos de la programación de manera simple y fácil de entender.', 100, 10, 150, 1, 'programming_book.jpg', '2025-01-23 15:55:45', 5),
(8, 'طقم أكواب', 'Cup Set', 'Tassen Set', 'Juego de tazas', 'طقم أكواب من السيراميك بتصميم عصري يناسب المطبخ العصري.', 'A ceramic cup set with a modern design, perfect for a contemporary kitchen.', 'Ein Keramik-Tassen-Set mit modernem Design, perfekt für eine zeitgenössische Küche.', 'Juego de tazas de cerámica con diseño moderno, ideal para una cocina contemporánea.', 150, 0, 100, 1, 'cupSet.jpg', '2025-01-23 15:55:45', 6),
(9, 'ساعة ذهبية', 'golden watch', 'ohr golden ', 'wathdelmondo', 'ساعة فاخرة لونها ذهبي ', 'special golden watch', 'ein hor gold deutsch', 'dolamodo watch descriptlmondo', 300, 0, 7, 1, 'goldenWatch.jpg', '2025-01-30 17:43:33', 3),
(10, 'تيشيرت الأهلي', 'el-ahly T-shirt', 'shirt deutsch', 'shirtolmondo', 'تيشيرت قطن لنادي الاهلي المصري', 'a cotton t_shirt for elahly clup ', 'ein rot shirt deutsch', 'dolamodo shirt descriptlmondo', 245, 0, 30, 1, 'elahlyShirt.jpg', '2025-01-30 17:44:03', 3),
(11, 'هودي بني', 'brown hody', 'grun hodustch', 'hody dilomondo', 'هودي بني قطن ضد التوبر والانكماش تم صنعه من خامات عالية الجودة', 'a brown hody agains wabr an enkmash , made with high quality metals', 'hoody discrpdutch deutsch', 'dolamooono hoody discrption', 750, 20, 11, 1, 'brownHody.jpg', '2025-01-30 17:47:41', 3);

-- --------------------------------------------------------

--
-- Stand-in structure for view `itemsview`
-- (See below for the actual view)
--
CREATE TABLE `itemsview` (
`items_id` int(11)
,`items_name_ar` varchar(80)
,`items_name_en` varchar(80)
,`items_name_de` varchar(80)
,`items_name_sp` varchar(80)
,`items_desc_ar` varchar(255)
,`items_desc_en` varchar(255)
,`items_desc_de` varchar(255)
,`items_desc_sp` varchar(255)
,`items_price` float
,`items_discount` smallint(6)
,`items_count` int(11)
,`items_active` int(11)
,`items_image` varchar(255)
,`items_createTime` timestamp
,`items_categories` int(11)
,`categories_id` int(11)
,`categories_name_ar` varchar(50)
,`categories_name_en` varchar(50)
,`categories_name_de` varchar(50)
,`categories_name_sp` varchar(50)
,`categories_image` varchar(255)
,`categories_createTime` timestamp
,`finalPrice` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `items_view`
-- (See below for the actual view)
--
CREATE TABLE `items_view` (
`items_id` int(11)
,`items_name_ar` varchar(80)
,`items_name_en` varchar(80)
,`items_name_de` varchar(80)
,`items_name_sp` varchar(80)
,`items_desc_ar` varchar(255)
,`items_desc_en` varchar(255)
,`items_desc_de` varchar(255)
,`items_desc_sp` varchar(255)
,`items_price` float
,`items_discount` smallint(6)
,`items_count` int(11)
,`items_active` int(11)
,`items_image` varchar(255)
,`items_createTime` timestamp
,`items_categories` int(11)
,`categories_id` int(11)
,`categories_name_ar` varchar(50)
,`categories_name_en` varchar(50)
,`categories_name_de` varchar(50)
,`categories_name_sp` varchar(50)
,`categories_image` varchar(255)
,`categories_createTime` timestamp
,`finalPrice` double
,`favorite` int(1)
);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `notification_title` varchar(255) NOT NULL,
  `notification_body` varchar(300) NOT NULL,
  `notification_userid` int(11) NOT NULL,
  `notification_time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`notification_id`, `notification_title`, `notification_body`, `notification_userid`, `notification_time`) VALUES
(1, 'done', 'your order is approved successfully', 2, '2025-03-28 21:58:38'),
(2, 'done', 'your order is approved successfully', 2, '2025-03-28 22:47:32'),
(3, 'done', 'your order is approved successfully', 2, '2025-04-06 01:43:45'),
(4, 'done', 'your order is approved successfully', 2, '2025-04-06 01:45:53');

-- --------------------------------------------------------

--
-- Stand-in structure for view `orderdetails`
-- (See below for the actual view)
--
CREATE TABLE `orderdetails` (
`totalPrice` double
,`count` bigint(21)
,`cart_id` int(11)
,`cart_itemid` int(11)
,`cart_userid` int(11)
,`cart_orders` int(11)
,`items_id` int(11)
,`items_name_ar` varchar(80)
,`items_name_en` varchar(80)
,`items_name_de` varchar(80)
,`items_name_sp` varchar(80)
,`items_desc_ar` varchar(255)
,`items_desc_en` varchar(255)
,`items_desc_de` varchar(255)
,`items_desc_sp` varchar(255)
,`items_price` float
,`items_discount` smallint(6)
,`items_count` int(11)
,`items_active` int(11)
,`items_image` varchar(255)
,`items_createTime` timestamp
,`items_categories` int(11)
,`categories_id` int(11)
,`categories_name_ar` varchar(50)
,`categories_name_en` varchar(50)
,`categories_name_de` varchar(50)
,`categories_name_sp` varchar(50)
,`categories_image` varchar(255)
,`categories_createTime` timestamp
,`finalPrice` double
,`orders_id` int(11)
,`orders_userid` int(11)
,`orders_totalPrice` int(11)
,`orders_deliveryPrice` int(11)
,`orders_coupon` int(11)
,`orders_paymentMethod` int(11)
,`orders_deliveryType` int(11)
,`orders_addressId` int(11)
,`orders_dateTime` timestamp
,`orders_status` tinyint(4)
,`address_id` int(11)
,`address_userid` int(11)
,`name` varchar(255)
,`street` varchar(255)
,`latitude` double
,`longitude` double
,`gover_ar` varchar(50)
,`gover_en` varchar(50)
,`city_ar` varchar(200)
,`city_en` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL,
  `orders_userid` int(11) NOT NULL,
  `orders_totalPrice` int(11) NOT NULL,
  `orders_deliveryPrice` int(11) NOT NULL,
  `orders_coupon` int(11) NOT NULL,
  `orders_paymentMethod` int(11) NOT NULL COMMENT '0 => cash ,  1 => card',
  `orders_deliveryType` int(11) NOT NULL COMMENT ' 0 => delivery , 1 => recieve',
  `orders_addressId` int(11) NOT NULL,
  `orders_dateTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `orders_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 0 => pending , 1 => approved , 2 => archived',
  `orders_rating` tinyint(4) NOT NULL,
  `orders_note_rating` varchar(255) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orders_id`, `orders_userid`, `orders_totalPrice`, `orders_deliveryPrice`, `orders_coupon`, `orders_paymentMethod`, `orders_deliveryType`, `orders_addressId`, `orders_dateTime`, `orders_status`, `orders_rating`, `orders_note_rating`) VALUES
(98, 2, 29330, 20, 0, 0, 0, 38, '2025-04-05 16:23:12', 1, 0, 'none'),
(99, 2, 35360, 0, 0, 1, 1, 0, '2025-04-06 00:22:08', 1, 0, 'none'),
(101, 2, 47420, 20, 0, 0, 0, 47, '2025-04-08 23:57:10', 0, 0, 'none');

-- --------------------------------------------------------

--
-- Stand-in structure for view `ordersview`
-- (See below for the actual view)
--
CREATE TABLE `ordersview` (
`orders_id` int(11)
,`orders_userid` int(11)
,`orders_totalPrice` int(11)
,`orders_deliveryPrice` int(11)
,`orders_coupon` int(11)
,`orders_paymentMethod` int(11)
,`orders_deliveryType` int(11)
,`orders_addressId` int(11)
,`orders_dateTime` timestamp
,`orders_status` tinyint(4)
,`address_id` int(11)
,`address_userid` int(11)
,`name` varchar(255)
,`street` varchar(255)
,`latitude` double
,`longitude` double
,`gover_ar` varchar(50)
,`gover_en` varchar(50)
,`city_ar` varchar(200)
,`city_en` varchar(200)
);

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `test_name` varchar(100) NOT NULL,
  `test_label` varchar(100) NOT NULL,
  `test_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `test_name`, `test_label`, `test_user`) VALUES
(1, '0', '0', 1),
(2, 'mohamed', 'fantastic', 2),
(8, 'mohamed', 'fantastic', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(80) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_photo` text NOT NULL,
  `user_verifycode` int(11) NOT NULL,
  `user_approve` tinyint(4) NOT NULL DEFAULT 0,
  `user_createtime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_password`, `user_phone`, `user_photo`, `user_verifycode`, `user_approve`, `user_createtime`) VALUES
(1, 'moalgouker@gmail.com', 'moalgouker@gmail.com', 'moalgouker@gmail.com', '0', '', 0, 0, '2025-01-07 18:29:21'),
(2, 'mohamedApdelsalam', 'moalgouker@gmail.com', 'cs50html66', '1060324571', '', 0, 0, '2025-01-07 18:30:37'),
(6, 'mohamedApdelsalam', 'moal@gmail.com', 'cs50html66', '88888', '', 0, 0, '2025-01-07 18:42:40'),
(7, 'mohamedApdelsalam', 'jalgouker@gmail.com', 'cs50html66', '106032457', '', 0, 0, '2025-01-07 18:43:29'),
(8, 'mohamedApdelsalam', 'mooooo', 'cs50html66', '1060324', '', 0, 0, '2025-01-07 18:47:31'),
(9, 'moha', 'moalgouker', 'kkkk', '8888', '', 0, 0, '2025-01-07 18:58:56'),
(16, 'adampdelsam', 'adam@gmail.com', 'fvvfvgtbybhy', '555255896', '', 0, 0, '2025-01-07 22:57:23'),
(24, 'arfa', 'moral@hehe.com', 'hhshshshsh', '555', '', 0, 0, '2025-01-14 18:15:00'),
(25, 'arfa', 'moral@hehte.com', 'hhshshshsh', '5553', '', 0, 0, '2025-01-14 18:16:21'),
(27, 'coffeekengston', 'coffeekengston4@gmail.com', 'Nzbzjksjsjs', '2147483647', '', 0, 0, '2025-01-16 14:37:39'),
(28, 'jorgina', 'jorgina@fmail.com', 'hshsgagaga', '2147483647', '', 0, 0, '2025-01-16 14:41:29'),
(29, 'laminyamal', 'laminyamal@gmail.com', 'kkkk', '8743892', '', 0, 0, '2025-01-16 14:46:14'),
(30, 'jorgina', 'jorginag@fmail.com', 'hshsgagaga', '2147483647', '', 0, 0, '2025-01-16 14:47:33'),
(31, 'jorgina', 'jorginagggg@fmail.com', 'hshsgagaga', '2147483647', '', 0, 0, '2025-01-16 14:48:53'),
(32, 'uuuuuuuuu', 'uuuuuuuuu@hjjk.nnj', 'gghuytfghh', '22222222225', '', 0, 0, '2025-01-16 14:53:59'),
(33, 'uuuuuuuuu', 'uuuuuuuup@hjjk.nnj', 'gghuytfghh', '222222222255', '', 0, 0, '2025-01-16 14:54:55'),
(34, 'itstiskdkkgx', 'fhxkgxkgxk@hlfkgd.ghl', 'hdHfzhfsjfs', '567676573735', '', 0, 0, '2025-01-16 14:55:28'),
(35, 'ooooooop', 'oooooop@yyyy.bbb', 'tcyguhjjij', '5882282839', '', 0, 0, '2025-01-16 14:56:44'),
(36, 'llllllkkllk', 'llllllkkl@hmlo.nhg', 'yvyghugut6', '5669358899', '', 0, 0, '2025-01-16 14:59:10'),
(37, 'jjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjj@hhh.nnh', 'rfrftgyhyhyh', '2853386858', '', 0, 0, '2025-01-16 15:11:05'),
(38, 'jjjjjjjjjjjjjjjjj', 'jjjjjjjjjjjjjh@hhh.nnh', 'rfrftgyhyhyh', '285338685862', '', 0, 0, '2025-01-16 15:14:43'),
(39, 'jjjjjjjjjjjjjjgjjj', 'jjjjjjjjhjjjjjh@hhh.nnh', 'rfrftgyhyhyh', '2853386855862', '', 0, 0, '2025-01-16 15:15:24'),
(40, 'jjjjjjjjjjjjjjgjjj', 'jjjjjjjjhgggjjjjjh@hhh.nnh', 'rfrftgyhyhyh', '285338680000', '', 0, 0, '2025-01-16 15:20:06'),
(41, 'jjjjjjjjjjjjjjgjjj', 'jjjjjjjjhxxxxxx@hhh.nnh', 'rfrftgyhyhyh', '2853300008', '', 0, 0, '2025-01-16 15:20:51'),
(42, 'vjhvhvhbjb', 'vjbjvjhjjb@hh.jj', 'cgcgxfhvhv', '6886857585', '', 0, 0, '2025-01-16 16:33:17'),
(43, 'vjhvhvhbjb', 'vjbjvrjhjjb@hh.jj', 'cgcgxfhvhv', '68868575885', '', 0, 0, '2025-01-16 16:34:44'),
(44, 'jfhfjffjfj', 'gufhfhfjf@hhg.mjh', 'xgztstcjcjjc4', '868642728686', '', 0, 0, '2025-01-16 16:45:03'),
(45, 'jfhfjffjfj', 'gufhfhfjf@tyhhg.mjh', 'xgztstcjcjjc4', '86864279628686', '', 0, 0, '2025-01-16 17:38:35'),
(46, 'hosamchaly', 'hosamchaly@gmail.com', 'c7819d32aabe1bf2dc88331107bb38', '582866363652', '', 0, 0, '2025-01-16 23:26:06'),
(47, 'hosammowafy', 'hosammowafy@gmail.com', 'djherjjddh', '5956518461', '', 0, 0, '2025-01-17 12:32:51'),
(48, 'thththhtjfht', 'fbhfhfhfhf@fhfh.gbng', 'dbfbbfhffb', '9559959595', '', 0, 0, '2025-01-19 23:25:43'),
(49, 'moh', 'mo@gg.gf', 'yvvyvhvyy', '555556315666666', '', 0, 0, '2025-01-19 23:55:53');

-- --------------------------------------------------------

--
-- Structure for view `addressview`
--
DROP TABLE IF EXISTS `addressview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `addressview`  AS SELECT `a`.`address_id` AS `address_id`, `a`.`address_userid` AS `address_userid`, `a`.`address_name` AS `name`, `a`.`address_street` AS `street`, `a`.`address_lat` AS `latitude`, `a`.`address_long` AS `longitude`, `g`.`governorate_name_ar` AS `gover_ar`, `g`.`governorate_name_en` AS `gover_en`, `c`.`city_name_ar` AS `city_ar`, `c`.`city_name_en` AS `city_en` FROM ((`address` `a` join `governorates` `g` on(`g`.`governorates_id` = `a`.`address_gover`)) join `cities` `c` on(`c`.`cities_id` = `a`.`address_city`)) ;

-- --------------------------------------------------------

--
-- Structure for view `cartview`
--
DROP TABLE IF EXISTS `cartview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cartview`  AS SELECT sum(`itemsview`.`finalPrice`) AS `totalPrice`, count(`itemsview`.`items_count`) AS `count`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_itemid` AS `cart_itemid`, `cart`.`cart_userid` AS `cart_userid`, `cart`.`cart_orders` AS `cart_orders`, `itemsview`.`items_id` AS `items_id`, `itemsview`.`items_name_ar` AS `items_name_ar`, `itemsview`.`items_name_en` AS `items_name_en`, `itemsview`.`items_name_de` AS `items_name_de`, `itemsview`.`items_name_sp` AS `items_name_sp`, `itemsview`.`items_desc_ar` AS `items_desc_ar`, `itemsview`.`items_desc_en` AS `items_desc_en`, `itemsview`.`items_desc_de` AS `items_desc_de`, `itemsview`.`items_desc_sp` AS `items_desc_sp`, `itemsview`.`items_price` AS `items_price`, `itemsview`.`items_discount` AS `items_discount`, `itemsview`.`items_count` AS `items_count`, `itemsview`.`items_active` AS `items_active`, `itemsview`.`items_image` AS `items_image`, `itemsview`.`items_createTime` AS `items_createTime`, `itemsview`.`items_categories` AS `items_categories`, `itemsview`.`categories_id` AS `categories_id`, `itemsview`.`categories_name_ar` AS `categories_name_ar`, `itemsview`.`categories_name_en` AS `categories_name_en`, `itemsview`.`categories_name_de` AS `categories_name_de`, `itemsview`.`categories_name_sp` AS `categories_name_sp`, `itemsview`.`categories_image` AS `categories_image`, `itemsview`.`categories_createTime` AS `categories_createTime`, `itemsview`.`finalPrice` AS `finalPrice` FROM (`cart` join `itemsview` on(`itemsview`.`items_id` = `cart`.`cart_itemid`)) WHERE `cart`.`cart_orders` = 0 GROUP BY `cart`.`cart_itemid`, `cart`.`cart_userid` ;

-- --------------------------------------------------------

--
-- Structure for view `itemsview`
--
DROP TABLE IF EXISTS `itemsview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `itemsview`  AS SELECT `items`.`items_id` AS `items_id`, `items`.`items_name_ar` AS `items_name_ar`, `items`.`items_name_en` AS `items_name_en`, `items`.`items_name_de` AS `items_name_de`, `items`.`items_name_sp` AS `items_name_sp`, `items`.`items_desc_ar` AS `items_desc_ar`, `items`.`items_desc_en` AS `items_desc_en`, `items`.`items_desc_de` AS `items_desc_de`, `items`.`items_desc_sp` AS `items_desc_sp`, `items`.`items_price` AS `items_price`, `items`.`items_discount` AS `items_discount`, `items`.`items_count` AS `items_count`, `items`.`items_active` AS `items_active`, `items`.`items_image` AS `items_image`, `items`.`items_createTime` AS `items_createTime`, `items`.`items_categories` AS `items_categories`, `categories`.`categories_id` AS `categories_id`, `categories`.`categories_name_ar` AS `categories_name_ar`, `categories`.`categories_name_en` AS `categories_name_en`, `categories`.`categories_name_de` AS `categories_name_de`, `categories`.`categories_name_sp` AS `categories_name_sp`, `categories`.`categories_image` AS `categories_image`, `categories`.`categories_createTime` AS `categories_createTime`, `items`.`items_price`- `items`.`items_price` * `items`.`items_discount` / 100 AS `finalPrice` FROM (`items` join `categories` on(`items`.`items_categories` = `categories`.`categories_id`)) ;

-- --------------------------------------------------------

--
-- Structure for view `items_view`
--
DROP TABLE IF EXISTS `items_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `items_view`  AS SELECT `itemsview`.`items_id` AS `items_id`, `itemsview`.`items_name_ar` AS `items_name_ar`, `itemsview`.`items_name_en` AS `items_name_en`, `itemsview`.`items_name_de` AS `items_name_de`, `itemsview`.`items_name_sp` AS `items_name_sp`, `itemsview`.`items_desc_ar` AS `items_desc_ar`, `itemsview`.`items_desc_en` AS `items_desc_en`, `itemsview`.`items_desc_de` AS `items_desc_de`, `itemsview`.`items_desc_sp` AS `items_desc_sp`, `itemsview`.`items_price` AS `items_price`, `itemsview`.`items_discount` AS `items_discount`, `itemsview`.`items_count` AS `items_count`, `itemsview`.`items_active` AS `items_active`, `itemsview`.`items_image` AS `items_image`, `itemsview`.`items_createTime` AS `items_createTime`, `itemsview`.`items_categories` AS `items_categories`, `itemsview`.`categories_id` AS `categories_id`, `itemsview`.`categories_name_ar` AS `categories_name_ar`, `itemsview`.`categories_name_en` AS `categories_name_en`, `itemsview`.`categories_name_de` AS `categories_name_de`, `itemsview`.`categories_name_sp` AS `categories_name_sp`, `itemsview`.`categories_image` AS `categories_image`, `itemsview`.`categories_createTime` AS `categories_createTime`, `itemsview`.`finalPrice` AS `finalPrice`, 1 AS `favorite` FROM (`itemsview` join `favorite` on(`favorite`.`favorite_itemid` = `itemsview`.`items_id` and `favorite`.`favorite_userid` = 1))union all select `itemsview`.`items_id` AS `items_id`,`itemsview`.`items_name_ar` AS `items_name_ar`,`itemsview`.`items_name_en` AS `items_name_en`,`itemsview`.`items_name_de` AS `items_name_de`,`itemsview`.`items_name_sp` AS `items_name_sp`,`itemsview`.`items_desc_ar` AS `items_desc_ar`,`itemsview`.`items_desc_en` AS `items_desc_en`,`itemsview`.`items_desc_de` AS `items_desc_de`,`itemsview`.`items_desc_sp` AS `items_desc_sp`,`itemsview`.`items_price` AS `items_price`,`itemsview`.`items_discount` AS `items_discount`,`itemsview`.`items_count` AS `items_count`,`itemsview`.`items_active` AS `items_active`,`itemsview`.`items_image` AS `items_image`,`itemsview`.`items_createTime` AS `items_createTime`,`itemsview`.`items_categories` AS `items_categories`,`itemsview`.`categories_id` AS `categories_id`,`itemsview`.`categories_name_ar` AS `categories_name_ar`,`itemsview`.`categories_name_en` AS `categories_name_en`,`itemsview`.`categories_name_de` AS `categories_name_de`,`itemsview`.`categories_name_sp` AS `categories_name_sp`,`itemsview`.`categories_image` AS `categories_image`,`itemsview`.`categories_createTime` AS `categories_createTime`,`itemsview`.`finalPrice` AS `finalPrice`,0 AS `favorite` from `itemsview` where !(`itemsview`.`items_id` in (select `itemsview`.`items_id` from (`itemsview` join `favorite` on(`favorite`.`favorite_itemid` = `itemsview`.`items_id` and `favorite`.`favorite_userid` = 1))))  ;

-- --------------------------------------------------------

--
-- Structure for view `orderdetails`
--
DROP TABLE IF EXISTS `orderdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `orderdetails`  AS SELECT sum(`itemsview`.`finalPrice`) AS `totalPrice`, count(`itemsview`.`items_id`) AS `count`, `cart`.`cart_id` AS `cart_id`, `cart`.`cart_itemid` AS `cart_itemid`, `cart`.`cart_userid` AS `cart_userid`, `cart`.`cart_orders` AS `cart_orders`, `itemsview`.`items_id` AS `items_id`, `itemsview`.`items_name_ar` AS `items_name_ar`, `itemsview`.`items_name_en` AS `items_name_en`, `itemsview`.`items_name_de` AS `items_name_de`, `itemsview`.`items_name_sp` AS `items_name_sp`, `itemsview`.`items_desc_ar` AS `items_desc_ar`, `itemsview`.`items_desc_en` AS `items_desc_en`, `itemsview`.`items_desc_de` AS `items_desc_de`, `itemsview`.`items_desc_sp` AS `items_desc_sp`, `itemsview`.`items_price` AS `items_price`, `itemsview`.`items_discount` AS `items_discount`, `itemsview`.`items_count` AS `items_count`, `itemsview`.`items_active` AS `items_active`, `itemsview`.`items_image` AS `items_image`, `itemsview`.`items_createTime` AS `items_createTime`, `itemsview`.`items_categories` AS `items_categories`, `itemsview`.`categories_id` AS `categories_id`, `itemsview`.`categories_name_ar` AS `categories_name_ar`, `itemsview`.`categories_name_en` AS `categories_name_en`, `itemsview`.`categories_name_de` AS `categories_name_de`, `itemsview`.`categories_name_sp` AS `categories_name_sp`, `itemsview`.`categories_image` AS `categories_image`, `itemsview`.`categories_createTime` AS `categories_createTime`, `itemsview`.`finalPrice` AS `finalPrice`, `ordersview`.`orders_id` AS `orders_id`, `ordersview`.`orders_userid` AS `orders_userid`, `ordersview`.`orders_totalPrice` AS `orders_totalPrice`, `ordersview`.`orders_deliveryPrice` AS `orders_deliveryPrice`, `ordersview`.`orders_coupon` AS `orders_coupon`, `ordersview`.`orders_paymentMethod` AS `orders_paymentMethod`, `ordersview`.`orders_deliveryType` AS `orders_deliveryType`, `ordersview`.`orders_addressId` AS `orders_addressId`, `ordersview`.`orders_dateTime` AS `orders_dateTime`, `ordersview`.`orders_status` AS `orders_status`, `ordersview`.`address_id` AS `address_id`, `ordersview`.`address_userid` AS `address_userid`, `ordersview`.`name` AS `name`, `ordersview`.`street` AS `street`, `ordersview`.`latitude` AS `latitude`, `ordersview`.`longitude` AS `longitude`, `ordersview`.`gover_ar` AS `gover_ar`, `ordersview`.`gover_en` AS `gover_en`, `ordersview`.`city_ar` AS `city_ar`, `ordersview`.`city_en` AS `city_en` FROM ((`cart` join `itemsview` on(`cart`.`cart_itemid` = `itemsview`.`items_id`)) join `ordersview` on(`ordersview`.`orders_id` = `cart`.`cart_orders`)) WHERE `cart`.`cart_orders` <> 0 GROUP BY `cart`.`cart_itemid`, `cart`.`cart_userid`, `cart`.`cart_orders` ;

-- --------------------------------------------------------

--
-- Structure for view `ordersview`
--
DROP TABLE IF EXISTS `ordersview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `ordersview`  AS SELECT `orders`.`orders_id` AS `orders_id`, `orders`.`orders_userid` AS `orders_userid`, `orders`.`orders_totalPrice` AS `orders_totalPrice`, `orders`.`orders_deliveryPrice` AS `orders_deliveryPrice`, `orders`.`orders_coupon` AS `orders_coupon`, `orders`.`orders_paymentMethod` AS `orders_paymentMethod`, `orders`.`orders_deliveryType` AS `orders_deliveryType`, `orders`.`orders_addressId` AS `orders_addressId`, `orders`.`orders_dateTime` AS `orders_dateTime`, `orders`.`orders_status` AS `orders_status`, `addressview`.`address_id` AS `address_id`, `addressview`.`address_userid` AS `address_userid`, `addressview`.`name` AS `name`, `addressview`.`street` AS `street`, `addressview`.`latitude` AS `latitude`, `addressview`.`longitude` AS `longitude`, `addressview`.`gover_ar` AS `gover_ar`, `addressview`.`gover_en` AS `gover_en`, `addressview`.`city_ar` AS `city_ar`, `addressview`.`city_en` AS `city_en` FROM (`orders` left join `addressview` on(`orders`.`orders_addressId` = `addressview`.`address_id`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `address_city` (`address_city`),
  ADD KEY `address_gover` (`address_gover`),
  ADD KEY `address_userid` (`address_userid`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_item` (`cart_itemid`),
  ADD KEY `cart_user` (`cart_userid`),
  ADD KEY `cart_orders` (`cart_orders`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cities_id`),
  ADD KEY `city_gov_id` (`city_gov_id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_itemid` (`favorite_itemid`),
  ADD KEY `favorite_userid` (`favorite_userid`);

--
-- Indexes for table `governorates`
--
ALTER TABLE `governorates`
  ADD PRIMARY KEY (`governorates_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`items_id`),
  ADD KEY `items_categories` (`items_categories`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orders_id`),
  ADD UNIQUE KEY `orders_id` (`orders_id`),
  ADD KEY `orders_coupon` (`orders_coupon`),
  ADD KEY `orders_userid` (`orders_userid`),
  ADD KEY `orders_addressId` (`orders_addressId`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_user` (`test_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1320;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `cities_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=397;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=300;

--
-- AUTO_INCREMENT for table `governorates`
--
ALTER TABLE `governorates`
  MODIFY `governorates_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `items_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orders_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_city`) REFERENCES `cities` (`cities_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `address_ibfk_2` FOREIGN KEY (`address_gover`) REFERENCES `governorates` (`governorates_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `address_ibfk_3` FOREIGN KEY (`address_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_itemid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`city_gov_id`) REFERENCES `governorates` (`governorates_id`);

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_itemid`) REFERENCES `items` (`items_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_categories` FOREIGN KEY (`items_categories`) REFERENCES `categories` (`categories_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`orders_coupon`) REFERENCES `coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`orders_userid`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test`
--
ALTER TABLE `test`
  ADD CONSTRAINT `test_ibfk_1` FOREIGN KEY (`test_user`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
