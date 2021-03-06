-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 27, 2021 at 01:55 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `androidh_election`
--

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL,
  `score` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`, `image`, `score`) VALUES
(1, 'สมชาย1', '/city/image1.jpeg', '4'),
(2, 'สมชาย2', '/city/image2.jpeg', '4'),
(3, 'สมชาย3', '/city/image3.jpeg', '4'),
(4, 'สมชาย4', '/city/image4.jpeg', '4'),
(5, 'สมชาย5', '/city/image5.jpeg', '4'),
(6, 'สมชาย6', '/city/image6.jpeg', '0'),
(7, 'สมชาย7', '/city/image7.jpeg', '0');

-- --------------------------------------------------------

--
-- Table structure for table `eletionDate`
--

CREATE TABLE `eletionDate` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `day` int(11) NOT NULL,
  `hour` int(11) NOT NULL,
  `minus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `eletionDate`
--

INSERT INTO `eletionDate` (`id`, `name`, `year`, `month`, `day`, `hour`, `minus`) VALUES
(1, 'การเลือกตั้ง ผู้ใหญ่บ้าน หน่องบ้านโพธ์', 2021, 9, 30, 16, 25);

-- --------------------------------------------------------

--
-- Table structure for table `foodTABLE`
--

CREATE TABLE `foodTABLE` (
  `id` int(11) NOT NULL,
  `category` text COLLATE utf8_unicode_ci NOT NULL,
  `nameFood` text COLLATE utf8_unicode_ci NOT NULL,
  `price` text COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `foodTABLE`
--

INSERT INTO `foodTABLE` (`id`, `category`, `nameFood`, `price`, `detail`, `image`) VALUES
(1, 'อาหารจานด่วน', 'กระเพาหมู', '45', 'เนื้อหมูสะอาด สดจากฟาร์มที่ผ่านการตรวจสอบและมีรสชาติดี', '/fluttertraining/food/food1.jpeg'),
(2, 'อาหารจานด่วน', 'ข้าวผัด', '60', 'ข้าวหอมมะลิที่คัดสรรเมล็ดพันธุื์ มีคุณภาพของไทย ', '/fluttertraining/food/food2.jpeg'),
(3, 'อาหารจานด่วน', 'ผัดพริกแกงหมู', '45', 'พริกแกง สด ใหม่ สะอาด เริศรส', '/fluttertraining/food/food3.jpeg'),
(4, 'อาหารจานด่วน', 'คะน้าหมูกรอบ', '65', 'หมูกรอบ ทอดใหม่ทุกวัน สด กรอบนอกนุ่มใน ', '/fluttertraining/food/food4.jpeg'),
(5, 'อาหารจานด่วน', 'ปลาทอด', '120', 'ปลาสด ตาใส เนื้อแน่น หวาน หอม', '/fluttertraining/food/food5.jpeg'),
(6, 'แกง', 'ขนมจีนนำ้เงี้ยว', '75', 'ขนมจีน หรือเข้าหนมเส้น หรือเข้าเส้น ชาวล้านนานิยมมารับประทานเป็น ขนมจีนน้ำเงี้ยว หรือเข้าหนมเส้นน้ำเงี้ยว ( รัตนา พรหมพิชัย , 2542 , 825-826 ) น้ำเงี้ยวเป็นน้ำแกงที่รับประทานกับขนมจีนหรือเส้นก๋วยเตี๋ยว ถ้าเป็นก๋วยเตี๋ยว เรียกก๋วยเตี๋ยวน้ำเงี้ยว บางสูตรใช้ถั่วเน่าแข็บหรือถั่วเน่าแผ่นย่างไฟ โขลกลงในเครื่องแกง แทนการใส่เต้าเจี้ยว ชาวไทใหญ่ หรือเงี้ยว เรียกว่า เข้าเส้นน้ำหมากเขือส้ม ( รัตนา พรหมพิชัย , 2542 , 3221 )', '/fluttertraining/food/food6.jpeg'),
(7, 'แกง', 'แกงผักเซียงดา', '85', 'แกงผักเซียงดา หรือแกงผักเซง มีวิธีการแกงเช่นเดียวกับแกงผักหวานบ้าน และแกงผักหวานป่า แต่ไม่ใส่วุ้นเส้น นิยมใส่ปลาย่าง หรือปลาแห้ง (ประทุม อุ่นศรี, สัมภาษณ์, 25 มิถุนายน 2550) บางสูตรแกงร่วมกับผักเสี้ยวและผักชะอม หรือร่วมกับผักชะอมอย่างเดียว', '/fluttertraining/food/food7.jpeg'),
(8, 'แกง', 'แกงผักแว่น', '60', 'แกงผักแว่น นิยมแกงง่ายๆ ใส่เห็ดฟาง ไม่ใส่เนื้อปลา หรือเนื้อสัตว์ใดๆ กลิ่นหอมชวนรับประทานของแกงมาจากพริกหนุ่มย่างถ่านไม้ บางสูตรใส่ปลา เช่นเดียวกับแกงผักกาด แกงผักปลัง บางสูตรใส่แต่พริกหนุ่มย่างไฟ ไม่ใช้พริกหนุ่มเป็นเครื่องแกง (เสาวภา ทาแก้ว, สัมภาษณ์, 4 กรกฎาคม 2550)', '/fluttertraining/food/food8.jpeg'),
(9, 'แกง', 'แกงหน่อไม้', '65', 'แกงหน่อไม้ มักเรียกกันว่า แกงหน่อ ใช้หน่อไม้สดในการปรุง หน่อไม้ที่นิยมนำมาแกง ได้แก่ หน่อไม้ไผ่ตง หน่อไม้บง หน่อไม้ไล่ หน่อไม้ไผ่สีสุก บางแห่งนิยมแกงใส่กระดูกหมู หรือปลาดุก หรือปลาช่อน หรือปลาย่าง หรือแคบหมู และบางแห่งนิยมใส่น้ำปูลงไปในถ้วยแกง เพื่อเพิ่มรสชาติของน้ำแกง (สิรวิชญ์ จำรัส, สัมภาษณ์, 15 มิถุนายน 2550; รัตนา พรหมพิชัย, 2542, หน้า 487)', '/fluttertraining/food/food9.jpeg'),
(10, 'แกง', 'แกงปลี', '70', 'แกงปลี คือแกงปลีกล้วย เป็นแกงผักชนิดหนึ่ง นิยมแกงกับเนื้อหมู ส่วนผสมผักที่ขาดไม่ได้ คือมะเขือเทศลูกเล็ก ใบชะพลู และชะอม', '/fluttertraining/food/food10.jpeg'),
(11, 'แกง', 'แกงหยวก', '70', 'หยวกหรือต้นกล้วย ส่วนที่นำมาแกง คือใจกลางต้นที่ยังอ่อนอยู่ นิยมแกงใส่ไก่บ้าน และวุ้นเส้น บ้างแกงใส่ปลาแห้ง มีวิธีการแกงเช่นเดียวกับแกงอ่อมเนื้อต่างๆ อีกแบบหนึ่งมีวิธีการแกงเช่นเดียวกับแกงผักหวาน สูตรที่แกงแบบเดียวกับแกงอ่อมเนื้อต่างๆ นั้น นิยมใช้เลี้ยงแขกในงานบุญต่างๆ หรืองานอื่นๆ เมื่อทำหม้อใหญ่ ไม่นิยมใส่วุ้นเส้น (ประทุม อุ่นศรี, สัมภาษณ์, 25 มิถุนายน 2550)', '/fluttertraining/food/food11.jpeg'),
(12, 'แกง', 'แกงอ่อมหมู', '70', 'แกงอ่อมหมู นิยมใช้เนื้อหมูและเครื่องในหมูเป็นส่วนผสมหลัก บ้างใช้แต่เครื่องใน เรียก แกงอ่อมเครื่องในหมู มีวิธีการแกงเช่นเดียวกับแกงเนื้อสัตว์อื่นๆ แกงอ่อม ถือเป็นอาหารชั้นดีอย่างหนึ่งของชาวล้านนา นิยมใช้เลี้ยงแขกในเทศกาลงานเลี้ยงต่างๆ (เทียนชัย สุทธนิล, สัมภาษณ์, 19 มิถุนายน 2550)', '/fluttertraining/food/food12.jpeg'),
(13, 'ปิ้ง/ย่าง/ทอด', 'ข้าวจี่', '75', 'เข้าจี่ นับเป็นของกินเล่นอย่างหนึ่ง จัดได้อยู่ในประแภทอาหารที่มีวิธีการทำแบบปิ้งหรือย่าง สมัยก่อนนิยมใช้ข้าวเย็นหรือข้าวที่เหลือจากการกินมื้อเย็นวันก่อนมาปั้น เอาไม้เสียบตรงกลาง และนำไปปิ้งกับถ่านไฟแดง เมื่อผิวของก้อนข้าวเกรียมเล็กน้อย ก็ถือว่าข้าวจี่นั้นใช้ได้แล้ว ปกติใช้เป็นอาหารสำหรับเด็กๆ ที่ตื่นแต่เช้าพร้อมแม่ ช่วยแก้หิวในขณะที่นึ่งข้าวยังไม่สุก (รัตนา พรหมพิชัย, 2542, หน้า 809) ถ้าจะให้มีรสชาติดีขึ้น ให้นำกระทิผสมเกลือ คลุกกับข้าว ปั้นข้าวและเสียบไม้ นำไปปิ้งให้เกรียมนิดหน่อย จึงนำมาชุบไข่ แล้วนำไปปิ้งอีกที (ลัดดา กันทะจีน, สัมภาษณ์, 29 มิถุนายน 2550) ในวันเพ็ญเดือนสี่ (ประมาณเดือนมกราคม) เป็นช่วงที่ชาวล้านนามีการทำบุญ เรียกว่า ทานข้าวล้นบาตร หรือทานข้าวใหม่ มักจะมีการนำเข้าจี่และข้าวหลามไปทำบุญ เรียกว่า ทานข้าวจี่ข้าวหลาม (รัตนา พรหมพิชัย, 2542, หน้า 809)', '/fluttertraining/food/food13.jpeg'),
(14, 'ปิ้ง/ย่าง/ทอด', 'ข้าวบ่ายนำ้มัน', '80', 'ข้าวบ่าย หมายถึงอาหารประเภทกินด่วนแบบโบราณ มีข้าวเหนียวนึ่งและไส้ ซึ่งอาจจะเป็นปลาทูนึ่ง นำมาย่างไฟ หรือทอด หมูเค็ม จิ๊นแห้ง (จิ๊นเกื๋อ) นํ้าพริกแดง ผักกาดดอง อย่างใดอย่างหนึ่ง หรือจะใส่ตามชอบก็ได้ ส่วนใหญ่นิยมไส้จิ๊นแห้งกับน้ำพริกตาแดง หรือไส้ปลาทูย่างหรือทอด นำไปย่างกับเตาถ่าน หรือไม่ย่างก็ได้ อาจเรียกชื่อตามไส้ เช่น ข่าวบ่ายปลาทู ข้าวบ่ายจิ๊นแห้ง ถ้าใช้ไส้เป็นน้ำพริกผสมกับน้ำมันพืชหรือน้ำมันหมูเล็กน้อย นำไปย่างไฟ เรียกว่า ข้าวบ่ายน้ำมัน จะใช้นำพริกตาแดง หรือทำน้ำพริก โดยใช้พริกขี้หนูแห้ง กระเทียม หอมแดง นำมาย่างไฟ โขลกให้ละเอียด ใส่เกลือและน้ำมันพืชหรือน้ำมันหมู แล้วนำไปย่างไฟ (นงเยาว์ วิริยะ, สัมภาษณ์, 3 กรกฎาคม 2550)', '/fluttertraining/food/food14.jpeg'),
(15, 'ปิ้ง/ย่าง/ทอด', 'จิ๊นส้มหมก', '85', 'จิ๊นส้ม หรือ แหนม ทำมาจากเนื้อสัตว์ เช่น เนื้อหมู เนื้อวัว เนื้อควาย เรียกชื่อตามเนื้อสัตว์ เช่น จิ๊นส้มหมู จิ๊นส้มงัว จิ๊นส้มก้าง ปัจุจุบัน นิยมใช้เนื้อหมู บางแห่งเรียก หมูส้ม สามารถนำมารับประทานเป็นกับข้าว โดยนำไปย่างไฟทั้งห่อ เรียกว่า จิ๊นส้มหมก หรือนำไปปรุงอาหารได้หลายชนิด เช่น คั่วจิ๊นส้มใส่ไข่ เจียวผักปลัง และคั่วฟักเพกาอ่อน (อุดม รุ่งเรืองศรี, 2542, หน้า 1879; เสาวภา ทาแก้ว, สัมภาษณ์, 2 กรกฎาคม 2550)', '/fluttertraining/food/food15.jpeg'),
(16, 'ปิ้ง/ย่าง/ทอด', 'ปูอ่อง', '120', 'ปูอ่อง เป็นอาหารพื้นบ้านของชาวล้านนา ชาวไทลื้อ ชาวไทเขิน แม้แต่ในภาคเหนือของลาว ปูอ่องจะอร่อยที่สุดช่วงฤดูเกี่ยวข้าว เนื่องจากปูมีมันมาก การปรุงโดยใส่ต้นหอมซอย จะทำให้ปูอ่องเพิ่มกลิ่นหอม และน่ารับประทานยิ่งขึ้น (เสาวภา ทาแก้ว, สัมภาษณ์, 2 กรกฎาคม 2550; อากิก, 2548)', '/fluttertraining/food/food16.jpeg'),
(17, 'ปิ้ง/ย่าง/ทอด', 'ไส้อั่ว', '130', 'คำว่า อั่ว หมายถึง แทรก หรือยัดไว้ตรงกลาง ไส้อั่ว จึงหมายถึงไส้ที่มีการนำสิ่งของยัดไว้ การทำไส้อั่ว นิยมใช้ไส้หมูและเนื้อหมู การทำไส้อั่ว เป็นวิธีการถนอมอาหาร ให้สามารถรับประทานได้นานขึ้น คือประมาณ 1-2 วัน (รัตนา พรหมพิชัย, 2542, 7257) แต่ถ้าเก็บไว้ในที่เย็น หรือปัจจุบัน มีการบรรจุถุงแบบสูญญากาศ ก็เก็บไว้ได้นานมากยิ่งขึ้น การทำให้ไส้อั่วสุก จะใช้วิธีปิ้ง หรือทอดก็ได้ (ศรีนวล อภิวงศ์, สัมภาษณ์, 9 กรกฎาคม 2550)', '/fluttertraining/food/food17.jpeg'),
(18, 'ปิ้ง/ย่าง/ทอด', 'แคบหมู', '120', 'แคบหมู เป็นอาหารขึ้นชื่อของชาวล้านนา ใช้รับประทานร่วมกับอาหารอื่นๆ เช่น น้ำพริก ขนมจีนน้ำเงี้ยว ใช้เป็นส่วนผสมในการตำน้ำพริก หรือแกง เช่น แกงบอน แกงผักตำลึง (แกงผักแคบ) แกงหน่อไม้ แคบหมูมีทั้งชนิดติดมัน และไม่ติดมัน ที่เรียกกันว่า แคบหมูไร้มัน ชาวล้านนาดั้งเดิม นิยมรับประทานแคบหมูเป็นอาหาร มากกว่าเป็นเครื่องแนม (รัตนา พรหมพิชัย, 2542, หน้า 1345; บุญธรรม ไพรบูลย์, สัมภาษณ์, 3 กรกฎาคม 2550)', '/fluttertraining/food/food18.jpeg'),
(19, 'ปิ้ง/ย่าง/ทอด', 'ไก่ทอด', '200', 'ไก่ทอด ทำง่ายจะทำทานหรือทำขายก็สะดวก ไก่ทอดเป็นอาหารทำงายแต่ก็มีเทคนิกแตกต่างกันไป บางคนทำออกมาได้นุ่น บางคนทำออกมาได้กอบไม่อมน้ำมัน ทุกท่านชอบสูตรไหนก็ลองทำกันดูครับ ปรับเปลียนได้ตามความเหมาะสม ', '/fluttertraining/food/food19.jpeg'),
(20, 'อาหารชุด', 'ข้าวต้มทรงเครื่อง', '450', 'ตักข้าวต้มใส่ชาม วางกุ้ง และหมูสับรวนลงไป โรยหน้าด้วย ต้นหอมซอย ผักชี ขึ้นฉ่าย และกระเทียมเจียว รับรองอร่อยครบเครื่องสุดๆ', '/fluttertraining/food/food20.jpeg'),
(21, 'อาหารชุด', 'ตำถาด', '350', 'เมนูยอดฮิตที่กำลังมาแรงในขณะนี้ คงหนีไม่พ้น ” ส้มตำถาด “ ซึ่งกำลังฮิตมากๆในหมู่วัยรุ่นและวัยทำงาน ที่มักจะรวมตัวเพื่อนๆไปทานส้มตำถาดกันหลังเลิกเรียนหรือเลิกงาน แรกๆ ส้มตำถาด มีขายอยู่ไม่กี่ร้าน แต่มีคนที่ไปทานถ่ายรูปลงสังคมโซเชียล ทำให้เกิดกระแสเพราะความแปลกแหวกแนว ทำให้ร้านส้มตำหลายๆร้าน เริ่มเพิ่มเมนู ส้มตำถาด เข้ามาเป็นเมนูแนะนำกันเลยทีเดียว', '/fluttertraining/food/food21.jpeg'),
(22, 'อาหารชุด', 'ข้าวผัดปู', '500', 'ข้าวผัดอาหารง่ายๆที่ใครๆต่างก็ชอบรับประทาน เวลาไปเที่ยวทะเลต้องสั่งข้าวผัดปูมาทานกันเกือบทุกครั้ง ไม่รู้คนอื่นเป็นเหมือนผมรึป่าว ด้วยราคาที่ไม่แพงบวกกับทานแล้วอิ่ม วันนี้เรามาดูกันหน่อยสิว่าการทำข้าวผัดปูให้อร่อย นั้นต้องทำอย่างไร ก็ไม่ยากครับเหมือนกับเมนูข้าวผัดทั่วๆไป แต่เพิ่มเนื้อปูไปนั่นเอง', '/fluttertraining/food/food22.jpeg'),
(23, 'เส้น', 'ก๋วยเตี๋ยวต้มยำ', '75', 'เตี๋ยวต้มยำ ร.ศ.229 ขึ้นชื่อว่าก๋วยเตี๋ยวต้องกินง่ายและอร่อย ยิ่งถ้ารสแซ่บซี้ดคงได้ซดกันหมดชาม สำหรับคนชอบรสชาติของต้มยำน้ำข้น', '/fluttertraining/food/food23.jpeg'),
(24, 'เส้น', 'ผัดไทย', '90', 'อาหารของไทยมีชื่อเสียงดังไปไกลถึงต่างประเทศหลากหลายเมนู ดังเห็นจากมีร้านอาหารไทยในต่างแดนผุดขึ้นมากมาย และมีชาวต่างชาติมาเที่ยวในไทยต่างต้องแวะทานอาหารขึ้นชื่อของบ้านเราโดยเฉพาะเมนูผัดไทย', '/fluttertraining/food/food24.jpeg'),
(25, 'เส้น', 'ผัดซีอิ๋ว', '100', 'เมนูยอดฮิตที่หลายๆคนต้องเคยสั่งในร้าน เส้นใหญ่ที่นำไปผัดกับเครื่องต่างๆ ไม่ว่าจะเป็นหมูหรือกุ้ง ใส่ผักคะน้าลงไป ได้เป็นผัดซีอิ้วที่แสนอร่อย เมนูง่ายๆ แต่ได้รับสารอาหารครบถ้วน เหมาะกับทุกๆคน', '/fluttertraining/food/food25.jpeg'),
(27, 'เส้น', 'ราดหน้า', '125', 'ราดหน้าเป็นอีกเมนูที่เหมาะกับการทานเป็นมื้อกลางวัน เพราะสะดวก ได้สารอาหารครบถ้วน ทั้งยังอิ่มท้อง ให้พลังงานในการทำงานช่วงบ่ายที่เหลือได้อย่างเพียงพอเลย แต่ถ้าจะให้ดีต้องทานกับหมูหมักนะ อร่อยเหาะ', '/fluttertraining/food/food26.jpeg'),
(28, 'เส้น', 'ยำวุ้นเส้น', '300', 'ยำวุ้นเส้น\r\n\r\nเป็นหนึ่งเมนูในดวงใจของสาวๆ หลายคน และเป็นเมนูที่นิยมมากที่สุดเมนูนึงในหมวดอาหารประเภทเส้น\r\n ด้วยรสชาติที่จัดจ้าน รสเปรี้ยวและรสเผ็ดที่เข้ากันอย่างพอดี ยำวุ้นเส้นจึงเป็นกับแกล้มชั้นดีอีกด้วย', '/fluttertraining/food/food27.jpeg'),
(29, 'นำ้พริก', 'นำ้พริกข่า', '225', 'น้ำพริกข่า เป็นน้ำพริกที่มีลักษณะค่อนข้างแห้ง ชนิดของพริกที่นิยมใช้คือ พริกขี้หนูแห้ง หรือใช้พริกเม็ดใหญ่แห้ง แล้วแต่ชอบ นิยมใช้รับประทานกับอาหารประเภทเนื้อย่างหรือนึ่ง เช่น รกวัวรกควายนึ่ง เนื้อนึ่ง เนื้อย่าง เห็ดนึ่ง เป็นต้น (สุมาลี ทะบุญ, สัมภาษณ์, 27 มิถุนายน 2550)', '/fluttertraining/food/food28.jpeg'),
(30, 'นำ้พริก', 'นำ้พริกหนุ่ม', '200', 'พริกหนุ่ม คือพริกสดที่ยังไม่แก่จัด น้ำพริกหนุ่ม เป็นน้ำพริกที่มีลักษณะข้น เป็นอาหารพื้นบ้านล้านนาที่รู้จักกันทั่วไป มีจำหน่ายแพร่หลายแก่นักท่องเที่ยว นิยมซื้อเป็นของฝาก รับประทานกับแคบหมู บางสูตรใส่ปลาร้าสับ และกะปิห่อใบตองย่างไฟ บางสูตรใส่น้ำปลากับเกลือ แล้วแต่ชอบ(เสาวภา ศักยพันธ์ และยุพยง วิจิตรศิลป์, 2538, หน้า 84; รัตนา พรหมพิชัย, 2542, หน้า 3257, ศรีวรรณ จำรัส, สัมภาษณ์, 14 มิถุนายน 2550)', '/fluttertraining/food/food29.jpeg'),
(31, 'นำ้พริก', 'นำ้พริกอ่อง', '230', 'น้ำพริกอ่อง นับเป็นน้ำพริกพื้นบ้านล้านนาที่รู้จักกันอย่างแพร่หลายพอๆ กับน้ำพริกหนุ่ม ลักษณะเด่นของน้ำพริกอ่อง คือมีสีส้มของสีมะเขือเทศและพริกแห้ง ที่เคี่ยวจนเป็นน้ำขลุกขลิก มีน้ำมันลอยหน้าเล็กน้อย มีสามรส คือ เปรี้ยว เค็ม เผ็ด เล็กน้อย และรสหวานตาม นิยมรับประทานกับผักสดหรือผักต้มก็ได้ (รัตนา พรหมพิชัย, 2542, หน้า 3258; อัมพร โมฬีพันธ์, สัมภาษณ์, 6 กรกฎาคม 2550) บางสูตร ผัดหมูก่อนแล้ว จึงตามด้วยเครื่องปรุงและมะเขือเทศภายหลัง บางสูตร โขลกเนื้อหมู เครื่องปรุงและมะเขือเทศให้เข้ากันก่อน จึงนำไปผัดกับน้ำมันพืช บางสูตร ใส่ถั่วเน่าแข็บหรือใส่เต้าเจี้ยว ในการปรุงรส (อัมพร โมฬีพันธ์, สัมภาษณ์, 6 กรกฎาคม 2550)', '/fluttertraining/food/food30.jpeg'),
(32, 'นำ้พริก', 'นำ้พริกตาแดง', '160', 'น้ำพริกตาแดง อ่านว่า น้ำพิกต๋าแดง บ้างเรียก น้ำพริกแดง เป็นน้ำพริกที่มีลักษณะข้นเหนียว มีส่วนผสมหลักคือ พริกแห้ง ปลาร้า ถั่วเน่าแข็บ ปลาแห้ง บางสูตรไม่นิยมใส่ถั่วเน่าแข็บ และปลาแห้ง(สุมาลี ทะบุญ, สัมภาษณ์, 27 มิถุนายน 2550)\r\n\r\n', '/fluttertraining/food/food31.jpeg'),
(33, 'นำ้พริก', 'นำ้พริกแคบหมู', '250', 'น้ำพริกแคบหมู เป็นน้ำพริกที่มีลักษณะค่อนข้างแห้ง ชนิดของพริกที่นิยมใช้คือ พริกหนุ่ม หรือพริกดิบ บ้างใส่พริกขี้หนูด้วย แล้วแต่ชอบ บ้างนิยมนำกระเทียมย่างไฟก่อนนำมาปรุง (สุมาลี ทะบุญ, สัมภาษณ์, 27 มิถุนายน 2550)', '/fluttertraining/food/food32.jpeg'),
(34, 'นำ้พริก', 'นำ้พริกเห็ดหล่ม', '245', 'น้ำพริกเห็ดหล่ม เป็นน้ำพริกที่มีลักษณะค่อนข้างแห้งถึงข้น ชนิดของพริกที่นิยมใช้คือ พริกดิบ จะเป็นพริกชี้ฟ้า หรือพริกดิบพันธุ์ใดก็ได้ ถ้าชอบเผ็ด ให้ใช้พริกชี้ฟ้า (ศิริพร โปร่งคำ, สัมภาษณ์, 21 มิถุนายน 2550)', '/fluttertraining/food/food33.jpeg'),
(35, 'นำ้พริก', 'นำ้พริกนำ้ผัก', '230', 'น้ำพริกน้ำผัก เป็นน้ำพริกที่มีลักษณะข้นถึงขลุกขลิก เป็นอาหารที่ทำมาจากผักกาดเขียวแก่ทั้งต้น นำมาดองสัก 2 วัน ให้มีรสเปรี้ยว นิยมรับประทานกับแคบหมูและผักขี้หูด (อินทร วงค์กุฎ, สัมภาษณ์, 26 มิถุนายน 2550)', '/fluttertraining/food/food34.jpeg'),
(36, 'นึ่ง', 'ข้าวนึ่ง', '500', 'ชาวล้านนารับประทานข้าวนึ่ง หรือเข้าหนึ้ง เป็นอาหารหลัก ทำมาจากข้าวเหนียว นำมาแช่ให้ข้าวอ่อนตัว ประมาณ 1 คืน หรือ 2-3 ชั่วโมงก็ได้ แล้วนำมานึ่งจนสุก ใช้รับประทานกับอาหารทั้ง 3 มื้อ ถ้าต้องการเก็บข้าวให้อุ่นทั้งวัน ให้เก็บในภาชนะที่เก็บความร้อน เช่น กระติกน้ำแข็ง โดยใช้ผ้าขาวรองพื้นก่อน (นงเยาว์ วิริยะ, สัมภาษณ์, 3 กรกฎาคม 2550)', '/fluttertraining/food/food35.jpeg'),
(37, 'นึ่ง', 'ห่อนึ่งปลา', '630', 'ห่อนึ่งปลา เป็นอาหารปรุงด้วยเนื้อปลา เป็นส่วนผสมหลัก นำมาคลุกเคล้ากับเครื่องปรุง ห่อด้วยใบตอง และนึ่งจนสุก (รัตนา พรหมพิชัย, 2542, หน้า 7521) บางสูตรใช้วิธีนำเครื่องแกงลงผัดกับน้ำมันให้หอมก่อน แล้วจึงใส่เนื้อปลาลงไปผัดให้เข้ากัน นำไปห่อใบตอง และนึ่งเป็นลำดับต่อไป (อัมพร โมฬีพันธ์, สัมภาษณ์, 6 กรกฎาคม 2550)\r\n\r\n', '/fluttertraining/food/food36.jpeg'),
(38, 'นึ่ง', 'ห่อนึึ่งหน่อไม้', '210', 'ห่อนึ่งหน่อไม้ เป็นอาหารปรุงด้วยหน่อไม้ดอง และเนื้อไก่บ้าน เป็นส่วนผสมหลัก นำมาคลุกเคล้ากับเครื่องปรุง ห่อด้วยใบตอง และนึ่งจนสุก (รัตนา พรหมพิชัย, 2542, หน้า 7521) บางสูตรใช้วิธีนำเครื่องแกงลงผัดกับน้ำมันให้หอมก่อน แล้วจึงใส่เนื้อไก่ หน่อไม้ดองลงไปผัดให้เข้ากัน นำไปห่อใบตอง และนึ่งเป็นลำดับต่อไป (อัมพร โมฬีพันธ์, สัมภาษณ์, 6 กรกฎาคม 2550)', '/fluttertraining/food/food37.jpeg'),
(39, 'นึ่ง', 'ห่อนึ่งไก่', '260', 'ห่อนึ่งไก่ เป็นอาหารปรุงด้วยเนื้อไก่ เป็นส่วนผสมหลัก นำมาคลุกเคล้ากับเครื่องปรุง ห่อด้วยใบตอง และนึ่งจนสุก (รัตนา พรหมพิชัย, 2542, หน้า 7521) บางสูตรใช้วิธีนำเครื่องแกงลงผัดกับน้ำมันให้หอมก่อน แล้วจึงใส่เนื้อไก่ลงไปผัดให้เข้ากัน นำไปห่อใบตอง และนึ่งเป็นลำดับต่อไป (อัมพร โมฬีพันธ์, สัมภาษณ์, 6 กรกฎาคม 2550)', '/fluttertraining/food/food38.jpeg'),
(40, 'อาหารว่าง/ขนม', 'ขนมเทียน', '56', 'ขนมเทียน หรือ เข้าหนมเตียน มีวิธีการทำคล้ายขนมเกลือ แต่ขนมสุกแล้วจะมีสีน้ำตาลจากสีของน้ำอ้อย รับประทานกับมะพร้าวขูดฝอย สำหรับวิธีการห่อขนม อาจใช้วิธีห่อแบบเดียวกับขนมเกลือ (ทักษนันท์ อนรรฆพฤฒ,สัมภาษณ์, 5 กรกฎาคม 2550; รัตนา พรหมพิชัย, 2542, 822)', '/fluttertraining/food/food39.jpeg'),
(41, 'อาหารว่าง/ขนม', 'ขนมใส่ไส้', '230', '“ ขนมใส่ไส้ ” หรือบางทีเรียกว่า “ขนมสอดไส้” ขนมไทยสุดคลาสสิก หอมหวาน เริศ\r\n\r\n', '/fluttertraining/food/food40.jpeg'),
(42, 'อาหารว่าง/ขนม', 'ขนมกล้วย', '236', 'ขนมกล้วย หรือเข้าหนมกล้วย เป็นขนมชนิดหนึ่งที่ทำจากแป้งข้าวเจ้า ส่วนผสมหลักมีกล้วยน้ำว้าสุกงอม แป้งข้าวเจ้า และน้ำตาลทราย นำมาคลุกเคล้าและนวดให้เข้ากัน (ทักษนันท์ อนรรฆพฤฒ, สัมภาษณ์, 5 กรกฎาคม 2550)', '/fluttertraining/food/food41.jpeg'),
(43, 'อาหารว่าง/ขนม', 'ขนมวง', '255', 'ขนมวง คือขนมที่ทำด้วยแป้งเป็นรูปวงกลมแบบเดียวกับขนมโดนัท มีน้ำอ้อยหยอดไปโดยรอบตามกึ่งกลางด้านบน ปัจจุบัน ไม่คอยมีขายในท้องตลาดในเมือง แต่มักจะพบในตลาดแถวชานเมือง (รัตนา พรหมพิชัย, 2542, หน้า 824)\r\n\r\n', '/fluttertraining/food/food42.jpeg'),
(44, 'อาหารว่าง/ขนม', 'ข้าวแต๋น', '200', 'ข้าวแต๋น เป็นขนมที่นิยมทำกันในเทศกาลปีใหม่เมือง หรือสงกรานต์ งานปอยลูกแก้ว และงานปอยหลวง ปัจจุบัน นิยมผสมน้ำแตงโมลงในข้าวเหนียวที่นึ่งแล้ว ก่อนนำมากดลงพิมพ์ เพื่อเพิ่มกลิ่นหอมและความหวานอร่อย (บัวจันทร์ นนทวาสี, สัมภาษณ์, 10 กรกฎาคม 2550)', '/fluttertraining/food/food1.jpeg'),
(45, 'อาหารว่าง/ขนม', 'ข้าวควบ', '310', 'ข้าวควบ หรือ ข้าวเกรียบว่าว บ้างเรียก ข้าวปอง เป็นขนมพื้นบ้านที่มีมาช้านาน มีกล่าวไว้ในวรรณกรรมล้านนา เรื่อง นางอุทรา ว่า นางร้าย คือแม่เลี้ยงนางอุทรา แกล้งป่วย โดยใช้ข้าวควบวางไว้ใต้ที่นอน เมื่อขยับจะเสียงดัง ให้เข้าใจว่ากระดูกนางผิดปกติ (รัตนา พรหมพิชัย, 2542, หน้า 809)', '/fluttertraining/food/food2.jpeg'),
(46, 'อาหารว่าง/ขนม', 'ข้าวแคบ', '340', 'ข้าวแคบ เป็นอาหารว่างชนิดหนึ่ง ที่มีวิธีทำคล้ายข้าวเกรียบปากหม้อ แต่การทำข้าวแคบ เป็นการนำเอาแผ่นแป้งไปตากแดดให้แห้ง ทำให้สุกโดยปิ้งหรือทอด นิยมเก็บไว้รับประทานในงานเทศกาลสำคัญ เช่น ปีใหม่เมือง งานบวชลูกแก้ว งานปอยหลวง (รัตนา พรหมพิชัย, 2542, หน้า 809) ปัจจุบัน ยังนิยมรับประทานกันอยู่ มีขายทั่วไปในท้องตลาดในภาคเหนือตอนบน (ลัดดา กันทะจีน, สัมภาษณ์, 29 มิถุนายน 2550)', '/fluttertraining/food/food3.jpeg'),
(47, 'ผลไม้', 'แตงโม', '60', ' ผลไม้ที่ขึ้นชื่อว่าเป็นสัญลักษณ์หน้าร้อน\r\nเหมาะกับคนที่กำลังควบคุมน้ำหนัก เพราะเป็นผลไม้ที่น้ำตาลต่ำ แคลอรี่ต่ำ', '/fluttertraining/food/food4.jpeg'),
(48, 'ผลไม้', 'มะม่วง', '200', 'สามารถนำมารับประทานแก้คลื่นไส้ วิงเวียน กระหายน้ำได้   มะม่วงน้ำดอกไม้ผลสุก นอกจากจะได้ทานเนื้อมะม่วงแล้ว เมล็ดตากแห้งนำมาต้ม แล้วเอามาดื่ม สามารถแก้อาการท้องอืด ท้องเฟ้อ เหมาะกับหลากหลายอายุ เพราะมีประโยชน์ต่อตัวเราทั้งนั้นเลย', '/fluttertraining/food/food5.jpeg'),
(49, 'ผลไม้', 'มะละกอสุก', '80', 'มะละกอ ผลไม้ที่สามารถทานได้ทั้งดิบและสุก ซึ่งก็มีรสชาติอร่อย และสามารถนำมาใช้ประโยชน์ได้อย่างหลากหลาย ไม่ว่าจะเป็นการทานแบบสดๆ ', '/fluttertraining/food/food6.jpeg'),
(50, 'ผลไม้', 'องุ่น', '360', 'ผลมีรสหวาน เปรี้ยวเล็กน้อย เป็นยาสุขุม ออกฤทธิ์ต่อปอ ม้าม และไต ใช้เป็นบำรุงโลหิต ', '/fluttertraining/food/food7.jpeg'),
(51, 'ผลไม้', 'แก้วมังกร', '500', ' แก้วมังกรขึ้นชื่อว่าเป็นผลไม้ที่มีไฟเบอร์สูง ซึ่งไฟเบอร์เป็นสารอาหารสำคัญที่ช่วยในการควบคุมระดับน้ำตาลในเลือด และช่วยลดภาวะระดับน้ำตาลในเลือดผกผัน เหมาะจะเป็นผลไม้สำหรับผู้ป่วยโรคเบาหวานอย่างยิ่ง', '/fluttertraining/food/food8.jpeg'),
(52, 'ผลไม้', 'ส้ม', '357', 'ส้มเขียวหวาน พื้นที่ปลูกเดิมอยู่ในจังหวัดราชบุรี เป็นส้มที่มีลำต้นขนาดใหญ่ ออกดอกติดผลค่อนข้างยาก ขนาดผลปานกลาง และมีรสชาติหวานจัด ส้มบางมด เป็นพันธุ์ที่นิยมปลูกกันทั่วไป ติดผลดกขนาดผลปานกลาง ทรงผลค่อนข้างกลมถึงแป้นเล็กน้อย ผิวผลสีเขียวอมเหลือง แต่เมื่อปลูกทางภาคเหนือผิวผลจะมีสีเหลืองเข้ม ผิวเรียบ ก้นผลราบถึงเว้าเล็กน้อย กลีบแยกออกจากกันง่าย เนื้อผลสีส้ม ชานนิ่ม ฉ่ำน้ำ รสชาติหวาน อมเปรี้ยว ส้มโชกุน ', '/fluttertraining/food/food9.jpeg'),
(53, 'ผลไม้', 'แอปเปิ้ล', '690', 'ดีต่อระบบขับถ่าย เปลือกของแอปเปิ้ลนั้น จะมีเส้นใยอาหารที่เราเรียกกันว่า “เพคติน” ซึ่งจะมีคุณสมบัติในการพองตัว และเพิ่มกากใยในทางเดินอาหาร ให้ระบบทางเดินอาหารนั้น ทำงานตามปกติ เพิ่มประสิทธิภาพในการขับถ่าย ซึ่งจะสามารถช่วยป้องกันมะเร็งในลำไส้ใหญ่ได้ นอกจากนี้ ยังมีส่วนช่วยในการช่วยจับคอเลสเตอรอล ไม่ให้ถูกดูดซึมเข้าสู่ร่างกาย ช่วยป้องกันโรคคอเลสเตอรอลในเลือดสูง โรคหัวใจ และโรคความดันโลหิตสูงได้อีกด้วย', '/fluttertraining/food/food10.jpeg'),
(54, 'เครื่องดื่ม', 'โค๊ก', '35', 'แคมเปญใหญ่ปีนี้ของโค้ก “ฉลอง 100 ปีโค้กขวดแก้ว” (Contour Bottle) ขวดดีไซน์ทรงโค้งเว้าที่ผลิตขึ้นครั้งแรกตั้งแต่ปี 1915 “โค้กขวดแก้ว”', '/fluttertraining/food/food11.jpeg'),
(55, 'เครื่องดื่ม', 'นำ้ส้ม', '300', 'น้ำส้มที่ผ่านกรรมวิธีได้จากการคั้นโดยตรงจากส่วนที่บริโภคได้ของผลส้มที่แก่สุก และสด เช่น ส้มเกลี้ยง ส้มเช้ง ส้มเขียวหวาน ส้มโชกุน ส้มสายน้ำผึ้ง ส้มสีทอง ส้มผิวทอง ส้มสีทับทิมหรือพันธุ์อื่นๆที่เหมาะสม ที่อยู่ในลักษณะพร้อมบริโภค', '/fluttertraining/food/food12.jpeg'),
(56, 'เครื่องดื่ม', 'นำ้แดง', '50', 'หวาน สด ชื่นใจ คลายร้อน', '/fluttertraining/food/food13.jpeg'),
(57, 'เครื่องดื่ม', 'นำ้เขียวโซดา', '32', 'สดชื่น ชุ่มคอ คลายร้อน', '/fluttertraining/food/food14.jpeg'),
(58, 'เครื่องดื่ม', 'นำ้องุ่น', '150', 'เปรี้ยว หวาน สดชื่น ชุ่มคอ', '/fluttertraining/food/food15.jpeg'),
(59, 'นึ่ง', 'ข้าวกั๊นจิ๊น', '150', 'ข้าวกั๊นจิ๊น หรือข้าวเงี้ยว หรือจิ๊นส้มเงี้ยว เชื่อว่าเป็นอาหารของชาวไทใหญ่หรือเงี้ยว ใช้ใบตองห่อเช่นเดียวกับแหนม (จิ๊นส้ม) จึงเรียกว่า ข้าวเงี้ยว หรือจิ๊นส้มเงี้ยว บางสูตรไม่ใส่เนื้อสับ แต่ใส่เลือดคลุกเคล้ากับข้าวอย่างเดียว (สุรีพร ศรีสวัสดิ์, สัมภาษณ์, 9 กรกฎาคม 2550; รัตนา พรหมพิชัย, 2542, หน้า807)', '/fluttertraining/food/food16.jpeg'),
(60, 'เครื่องดื่ม', 'นำ้เปล่า', '15', 'นำ้สะอาด ผ่านการตรวจสอบ ชุ่มคอ คลายร้อน', '/fluttertraining/food/food17.jpeg'),
(61, 'ปิ้ง/ย่าง/ทอด', 'หมูทอดกระเทียม', '150', 'สด ใหม่ หอม น่ารับประทาน', '/fluttertraining/food/food18.jpeg'),
(62, 'ปิ้ง/ย่าง/ทอด', 'น้ำหนัง', '200', 'น้ำหนัง เป็นอาหารที่ได้จากหนังวัวหรือหนังควายต้มจนเละและเป็นวุ้น นำมาทาลงบนใบตอง หรือกาบไม้ไผ่ ปัจจุบัน นิยมใช้พลาสติกแทน สำหรับการผลิตจำนวนมาก ทิ้งไว้ให้แห้ง ทำให้สุกโดยนำมาปิ้งไฟให้สุกก่อน นิยมกินร่วมกับอาหารประเภทน้ำพริก (บุญยัง ชุมศรี, 2542, หน้า 3267-3268; เอื้อมพร วรรณแดง, สัมภาษณ์, 4 กรกฎาคม 2550)', '/fluttertraining/food/food19.jpeg'),
(63, 'ปิ้ง/ย่าง/ทอด', 'หนังปอง\r\n', '580', 'หนังปอง เป็นอาหารที่ได้จากหนังควาย นำมาทอดกรอบ เพื่อใช้รับประทานร่วมกับอาหารชนิดอื่น นิยมกินร่วมกับอาหารประเภทน้ำพริก ยำผัก ตำมะเขือ ขนมจีนน้ำเงี้ยว ชาวล้านนาดั้งเดิม นิยมรับประทานกับข้าวเปล่าๆ แบบเดียวกับแคบหมู (บุญยัง ชุมศรี, 2542, หน้า 7308; ไพเศษ อินพรหม, สัมภาษณ์, 4 กรกฎาคม 2550)', '/fluttertraining/food/food11.jpeg'),
(64, 'ปิ้ง/ย่าง/ทอด', 'ไข่คว่ำ', '135', 'อาหารพื้บ้านชาวล้านนา ที่เรียกว่า ไข่คว่ำ เพราะมีกรรมวิธีในการทอดคว่ำหน้าลงเพื่อทอดนั้นเอง มีความหอม สด ใหม่ และใส่ใจในการปรุงรสอย่างดี', '/fluttertraining/food/food12.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `otp`
--

CREATE TABLE `otp` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `otp` text COLLATE utf8_unicode_ci NOT NULL,
  `amount` text COLLATE utf8_unicode_ci NOT NULL,
  `status` text COLLATE utf8_unicode_ci NOT NULL,
  `choiceChooseIds` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `otp`
--

INSERT INTO `otp` (`id`, `name`, `otp`, `amount`, `status`, `choiceChooseIds`) VALUES
(1, 'Doramon', '123456', '5', 'false', '[]'),
(2, 'Nobita', '654321', '5', 'false', '[]'),
(3, 'Kamthorn', '112233', '5', 'false', '[]'),
(4, 'มาสเตอร์ อึ่ง', '123654', '5', 'false', '[]'),
(5, 'Super Man', '111222', '5', 'false', '[]');

-- --------------------------------------------------------

--
-- Table structure for table `otpAdmin`
--

CREATE TABLE `otpAdmin` (
  `id` int(11) NOT NULL,
  `otp` text COLLATE utf8_unicode_ci NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `school`
--

CREATE TABLE `school` (
  `id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `image` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `school`
--

INSERT INTO `school` (`id`, `name`, `image`) VALUES
(1, 'สมชาย เข็มกลัด', '/school/image1.jpeg'),
(2, 'สมชาย2 เข็มกลัด', '/school/image2.jpeg'),
(3, 'สมชาย3 เข็มกลัด', '/school/image3.jpeg'),
(4, 'สมชาย4 เข็มกลัด', '/school/image4.jpeg'),
(5, 'สมชาย5 เข็มกลัด', '/school/image5.jpeg'),
(6, 'สมชาย6 เข็มกลัด', '/school/image6.jpeg'),
(7, 'สมชาย7 เข็มกลัด', '/school/image7.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `showResult`
--

CREATE TABLE `showResult` (
  `id` int(11) NOT NULL,
  `showElection` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `showResult`
--

INSERT INTO `showResult` (`id`, `showElection`) VALUES
(1, 'true');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `eletionDate`
--
ALTER TABLE `eletionDate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodTABLE`
--
ALTER TABLE `foodTABLE`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `otp`
--
ALTER TABLE `otp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `school`
--
ALTER TABLE `school`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `showResult`
--
ALTER TABLE `showResult`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `eletionDate`
--
ALTER TABLE `eletionDate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `foodTABLE`
--
ALTER TABLE `foodTABLE`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `otp`
--
ALTER TABLE `otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `school`
--
ALTER TABLE `school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `showResult`
--
ALTER TABLE `showResult`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
