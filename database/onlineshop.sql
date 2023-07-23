
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";




DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;



CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'admin@gmail.com', 'Wani1234');



CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Malacca'),
(2, 'Kuala Lumpur'),
(3, 'Johor Bharu'),
(4, 'Terengganu'),
(5, 'Kelantan'),
(6, 'Selangor');



CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(11, 45, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(50, 61, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);



CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Electronics'),
(2, 'Local Bag'),
(3, 'Local Clothes / Fashion'),
(4, 'Accessories'),
(5, 'Perfumes'),
(6, 'Scarf'),
(7, 'Local Shoes / Sandal');



CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'wani@gmail.com'),
(5, 'alisa@gmail.com');



CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');



CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Nursyazwani', 'wani@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234);



CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000);



CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Local Magnetic keyboard', 50, 'Comfortable keyboard', 'electronic1.jpg', 'electronic'),
(2, 1, 3, 'Local Macaron Headphone', 30, 'Macaron Headphone', 'electronic2.jpg', 'headphone'),
(3, 1, 3, 'Local Vintage Camera', 45, 'Vintage Camera', 'electronic3.jpg', 'camera'),
(4, 1, 3, 'Local Portable Rice Cooker', 56, 'Affordadble rice Cooker ', 'electronic4.jpg', 'rice cooker'),
(5, 1, 2, 'Local Nude Hair Dryer', 25, 'Style Hair Dryer', 'electronic5.jpg', 'hair dryer'),
(6, 1, 1, 'Local Mini Refrigerator', 150, 'Mini Refrigerator', 'electronic6.jpg', 'peti'),
(7, 1, 1, 'Local Robot Vacuum', 145, 'Robot Vacum', 'electronic7.jpg', 'vacuum'),
(8, 1, 4, 'Local Electronic Security Camera', 120, 'Security Camera', 'electronic8.jpg', 'camera'),
(10, 2, 6, 'Hermes Local Bag', 100, 'Affordable local bag ', 'bag1..jpg', 'bag'),
(11, 2, 6, 'Local Birkin Bag', 200, 'Elegant Bag', 'bag2..jpg', 'bag'),
(12, 2, 6, 'Sotheby Local Bag', 170, 'Beautiful bag', 'bag3..jpg', 'bag'),
(13, 2, 6, 'Autumn Local Bag', 230, 'Sweet local bag', 'bag4..jpg', 'bag'),
(14, 2, 6, 'Kelly local bag', 350, 'Kelly local brand', 'bag5..jpg', 'bag'),
(15, 2, 6, 'Local bag winter', 233, 'Suitable for beautiful girl', 'bag6..jpg', 'bag'),
(16, 3, 6, 'Vanessa Local Clothes', 89, 'Vanessa Malaysian Brand', 'baju1.jpg', 'baju'),
(17, 3, 6, 'Autumn Local Wear', 90, 'Autumn look', 'baju2.jpg', 'baju'),
(19, 3, 6, 'Luna Local Wear', 49, 'Sweet clothing', 'baju3.jpg', 'baju'),
(20, 3, 6, 'Strawberry Local Sweatshirt Wear', 59, 'Casual wear', 'baju4.jpg', 'baju'),
(21, 3, 6, 'Local Peach Knitwear ', 99, 'Beautiful peach wear', 'baju5.jpg', 'baju'),
(22, 4, 6, 'Cutie Local Scrunchie', 19, 'scrunchie for sweet girl', 'aksesori1.jpg', 'getah rambut'),
(23, 4, 6, 'Local Style Hat', 25, 'hat wearing style', 'aksesori2..jpg', 'topi'),
(24, 4, 6, 'Local Modern Accessories', 10, 'Accessories only for you', 'aksesori3.jpg', 'aksesori'),
(25, 4, 6, 'Local Brand Necklaces', 60, 'Necklaces style for women', 'aksesori4.jpg', 'rantai'),
(27, 4, 6, 'Style Local Bracelet', 65, 'Neat bracelet modern', 'aksesori5.jpg', 'gelang'),
(32, 5, 0, 'Local Miss Dior Eau De', 120, 'Smell good perfume', 'perfume1.jpg', 'perfume'),
(33, 6, 2, 'Narina Local Scarf', 35, 'Elegant shawl', 'tudung1.jpg', 'tudung'),
(34, 6, 4, 'Almira Wanderlust Scarf', 35, 'Scarf hijab and co', 'tudung2.JPG', 'tudung'),
(35, 6, 0, 'Satin Scarves Elina', 40, 'shawl stylish', 'tudung3.jpg', 'tudung'),
(36, 6, 5, 'Sophie Local Scarves', 50, 'Sophie scarf modern hijabista', 'tudung4.JPG', 'tudung'),
(37, 6, 5, 'Luna Satin Scarves', 50, 'Luna hijab satin wear', 'tudung5.jpg', 'tudung'),
(38, 6, 4, 'Imane Satin Scarves', 45, 'Comfortable scarf', 'tudung6.jpg', 'tudung'),
(39, 6, 5, 'Naima Local Scarves', 55, 'Elegant scarf for ceremony', 'tudung7.jpg', 'tudung'),
(40, 2, 6, 'Chanel Local Bag', 300, 'Fashionista bag for you', 'bag7.jpg', 'bag'),
(47, 4, 6, 'Modern Simple Local Necklace', 60, 'A very beautiful neacklace', 'aksesori6..jpg', 'rantai'),
(50, 3, 6, 'Sunflower Local Wear', 46, 'Flower clothes design', 'baju6.JPG', 'baju'),
(51, 3, 6, 'Crop Local Knitwear', 35, 'Elegant knitwear for women', 'baju7.JPG', 'baju'),
(52, 3, 6, 'Local Blue Hoodie', 55, 'Hoodie for cold weather', 'baju8.JPG', 'baju'),
(53, 3, 6, 'Colourful Local Hoodie', 65, 'Beautiful hoodie for young girls', 'baju9.JPG', 'baju'),
(54, 3, 6, 'Local Cat Hoodie', 25, 'Cat design hoodie', 'baju10.JPG', 'baju'),
(55, 3, 6, 'Aesthetic Local Wear', 55, 'Beautiful aesthetic wearing', 'baju11.JPG', 'baju'),
(56, 3, 6, 'Local Greenie Knitwear', 45, 'Green knitwear', 'baju12.JPG', 'baju'),
(57, 3, 6, 'Pink Local Knitwear', 55, 'Comfortable knitwear', 'baju13.JPG', 'baju'),
(58, 3, 6, 'Midnight Local Wear', 57, 'Fashionista wearing stylish', 'baju14.JPG', 'baju'),
(59, 3, 6, 'Peach Red Local Wear', 69, 'fashion comfortable wear', 'baju15.JPG', 'baju'),
(60, 3, 6, 'Ulzang Local Wear', 150, 'Malaysian style wear', 'baju16.JPG', 'baju'),
(61, 3, 6, 'Local Floral Blouse', 99, 'beautiful floral design', 'baju17.JPG', 'baju'),
(62, 3, 6, 'Local Floral Wear', 44, 'elegant wear', 'baju18.JPG', 'baju'),
(63, 3, 6, 'Petite Local Wear', 89, 'Cutie clothes ever', 'baju19.JPG', 'Baju'),
(64, 3, 6, 'Macaron Local Wear', 55, 'Sweet macaron fashion', 'baju20.JPG', 'baju'),
(65, 3, 6, 'White Local Wear', 45, 'Hijabista wearing style', 'baju21.JPG', 'baju'),
(66, 3, 6, 'Peach Local Wear', 25, 'Peach clothes for every girl', 'baju22.JPG', 'baju'),
(67, 3, 6, 'Cross Local Shirt', 36, 'clothes for you', 'baju23.JPG', 'baju'),
(68, 3, 6, 'Local Denim Jeans Jacket', 70, 'Denim jacket suitable for everyone', 'baju24.JPG', 'baju'),
(69, 3, 6, 'Local Maglie Outwear', 49, 'Suitable outwear for any ocassion', 'baju25.JPG', 'baju'),
(70, 3, 6, 'Local White Blouse', 39, 'comfy blouse', 'baju26.JPG', 'baju'),
(71, 1, 2, 'Local Digital Alarm', 150, 'Warranty alarm', 'electronic9.jpg', 'Alarm'),
(72, 7, 2, 'Local White Converse', 200, 'comfortable and long lasting shoes', 'kasut1.jpg', 'kasut'),
(73, 7, 2, 'Local Fairy Style', 59, 'sandal style', 'kasut2.jpg', 'kasut'),
(74, 1, 1, 'Local Mouse', 30, 'Mouse for computer, laptop and other devices use', 'electronic10.jpg', 'mouse'),
(75, 1, 1, 'Local Earphone', 15, 'Earphone to listen the music', 'electronic11.jpg', 'earphone'),
(76, 1, 5, 'Local Smartwatch', 145, 'Smartwatch for you', 'electronic12.jpg', 'jam'),
(77, 1, 4, 'Local Portable Heater', 199, 'Heater for your kitchen', 'electronic13.jpg', 'heater'),
(78, 1, 5, 'Local Powerbank', 50, 'Powerbank to charge your devices', 'electronic14.jpg', 'powerbank'),
(79, 7, 2, 'Local Brownie Sandal', 77, 'comfy sandal', 'kasut3.jpg', 'sandal'),
(80, 1, 1, 'Local Airpod', 90, 'Long lasting airpod', 'electronic15.jpg', 'Airpod'),
(81, 4, 6, 'Peach Local Scrunchie', 30, 'Scrunchie for women', 'aksesori7..jpg', 'getah rambut');
(82, 6, 5, 'Iqraa Local Scarves', 90, 'beautiful scarf pleated', 'tudung8.jpg', 'tudung');
(83, 6, 5, 'Maliqa Local Scarves', 60, 'beautiful local scarf', 'tudung9.jpg', 'tudung');
(84, 2, 6, 'Christian Dior Local Bag', 300, 'pretty bag', 'bag8.jpg', 'bag');
(85, 2, 6, 'Nude Local Bag', 299, 'pretty bag', 'bag9.jpg', 'bag');
(86, 2, 6, 'Monochrome Local Bag', 400, 'pretty bag', 'bag10.jpg', 'bag');
(87, 2, 6, 'Petie Local Bag', 350, 'pretty bag', 'bag11.jpg', 'bag');
(88, 2, 6, 'Sling Local Bag ', 100, 'pretty bag', 'bag12.jpg', 'bag');
(89, 4, 6, 'Midnight Floral Local Scrunchie ', 15, 'Scrunchie floral for everyone', 'aksesori8.jpg', 'getah rambut');
(90, 4, 6, 'Local Butterfly Hat', 79, 'beautiful hat', 'aksesori9.jpg', 'topi');
(93, 5, 0, 'Local Prada Paradox', 250, 'Good smell perfumes ever', 'perfume2.jpg', 'perfume');
(94, 5, 0, 'Local YSL Floral', 199, 'Good smell perfumes ever', 'perfume3.jpg', 'perfume');
(95, 5, 0, 'Local Choco Channel', 99, 'Good smell perfumes ever', 'perfume4.jpg', 'perfume');
(96, 5, 0, 'Local Lancome La Vie', 399, 'Good smell perfumes ever', 'perfume5.jpg', 'perfume');
(97, 5, 0, 'Local Fragrance', 150, 'Good smell perfumes ever', 'perfume6.jpg', 'perfume');
(98, 5, 0, 'Local Jasmine Fragrant', 399, 'Good smell perfumes ever', 'perfume7..jpg', 'perfume');
(99, 5, 0, 'Local Floral Wonderland', 299, 'Good smell perfumes ever', 'perfume8..jpg', 'perfume');
(100, 5, 0, 'Local Floral Citruss', 599, 'Good smell perfumes ever', 'perfume9.jpg', 'perfume');
(102, 7, 2, 'Local Style Shoes', 59, 'shoes for you', 'kasut4..jpg', 'kasut');
(103, 7, 2, 'Local Converse Chuck Taylor', 99, 'shoes for you', 'kasut5.jpg', 'kasut');
(104, 7, 2, 'Local Lilac Shoes', 100, 'shoes for you', 'kasut6.jpg', 'kasut');


CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', 'puneeth', '9448121558', '123456789', 'sdcjns,djc'),
(15, 'hemu', 'ajhgdg', 'puneethreddy951@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');


DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;



CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');



ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);



ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);


ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);


ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);


ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);


ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);


ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);


ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);


ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);


ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);


ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;


ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=147;


ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;


ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;


ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;


ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;


ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;


ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;


ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;



ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);


ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

