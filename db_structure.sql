BEGIN;
DROP SCHEMA IF EXISTS FootWearShop;
CREATE SCHEMA IF NOT EXISTS `FootWearShop` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `FootWearShop` ;

CREATE TABLE `Address` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `first_line` varchar(45) NOT NULL,
    `second_line` varchar(45) NOT NULL,
    `city` varchar(45) NOT NULL,
    `postcode` varchar(45) NOT NULL,
    `country` varchar(45) NOT NULL
)
;
CREATE TABLE `Role` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `role_name` varchar(1) NOT NULL,
    `role_description` varchar(255)
)
;
CREATE TABLE `User` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `email_address` varchar(45) NOT NULL,
    `password` varchar(255) NOT NULL,
    `date_registered` date NOT NULL,
    `role_id` integer NOT NULL
)
;
ALTER TABLE `User` ADD CONSTRAINT `role_id_refs_id_fc5add86` FOREIGN KEY (`role_id`) REFERENCES `Role` (`id`);
CREATE TABLE `UserInfo_address` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `userinfo_id` integer NOT NULL,
    `address_id` integer NOT NULL,
    UNIQUE (`userinfo_id`, `address_id`)
)
;
ALTER TABLE `UserInfo_address` ADD CONSTRAINT `address_id_refs_id_6fb9d1ac` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`);
CREATE TABLE `UserInfo` (
    `user_id` integer NOT NULL PRIMARY KEY,
    `gender` varchar(1) NOT NULL,
    `nationality` varchar(45) NOT NULL,
    `first_name` varchar(45) NOT NULL,
    `last_name` varchar(45) NOT NULL,
    `dob` date
)
;
ALTER TABLE `UserInfo` ADD CONSTRAINT `user_id_refs_id_88493ec0` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);
ALTER TABLE `UserInfo_address` ADD CONSTRAINT `userinfo_id_refs_user_id_860a688e` FOREIGN KEY (`userinfo_id`) REFERENCES `UserInfo` (`user_id`);
CREATE TABLE `Supplier` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `supplier_name` varchar(45) NOT NULL,
    `address_id` integer NOT NULL UNIQUE,
    `phonenumber` varchar(45) NOT NULL,
    `email` varchar(45) NOT NULL
)
;
ALTER TABLE `Supplier` ADD CONSTRAINT `address_id_refs_id_b83469c5` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`);
CREATE TABLE `Brand` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `brand_name` varchar(45) NOT NULL,
    `reputation` varchar(23) NOT NULL
)
;
CREATE TABLE `Category_brand` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `category_id` integer NOT NULL,
    `brand_id` integer NOT NULL,
    UNIQUE (`category_id`, `brand_id`)
)
;
ALTER TABLE `Category_brand` ADD CONSTRAINT `brand_id_refs_id_98411ed8` FOREIGN KEY (`brand_id`) REFERENCES `Brand` (`id`);
CREATE TABLE `Category` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `category_name` varchar(45) NOT NULL,
    `season` varchar(27) NOT NULL
)
;
ALTER TABLE `Category_brand` ADD CONSTRAINT `category_id_refs_id_1b5ecc2a` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`);
CREATE TABLE `Shoe_supplier` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `shoe_id` integer NOT NULL,
    `supplier_id` integer NOT NULL,
    UNIQUE (`shoe_id`, `supplier_id`)
)
;
ALTER TABLE `Shoe_supplier` ADD CONSTRAINT `supplier_id_refs_id_4673cd7f` FOREIGN KEY (`supplier_id`) REFERENCES `Supplier` (`id`);
CREATE TABLE `Shoe_category` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `shoe_id` integer NOT NULL,
    `category_id` integer NOT NULL,
    UNIQUE (`shoe_id`, `category_id`)
)
;
ALTER TABLE `Shoe_category` ADD CONSTRAINT `category_id_refs_id_52531bda` FOREIGN KEY (`category_id`) REFERENCES `Category` (`id`);
CREATE TABLE `Shoe` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `shoe_name` varchar(45) NOT NULL,
    `size` integer NOT NULL,
    `color` varchar(45) NOT NULL,
    `quantity` integer NOT NULL,
    `price` numeric(7, 2) NOT NULL,
    `image_url` varchar(64) NOT NULL
)
;
ALTER TABLE `Shoe_supplier` ADD CONSTRAINT `shoe_id_refs_id_6e8ba624` FOREIGN KEY (`shoe_id`) REFERENCES `Shoe` (`id`);
ALTER TABLE `Shoe_category` ADD CONSTRAINT `shoe_id_refs_id_86e0cd4b` FOREIGN KEY (`shoe_id`) REFERENCES `Shoe` (`id`);
CREATE TABLE `Delivery` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `tracking_number` integer NOT NULL UNIQUE,
    `delivery_type` varchar(45) NOT NULL,
    `delivery_cost` varchar(45) NOT NULL,
    `address_id` integer NOT NULL
)
;
ALTER TABLE `Delivery` ADD CONSTRAINT `address_id_refs_id_ca46d7c7` FOREIGN KEY (`address_id`) REFERENCES `Address` (`id`);
CREATE TABLE `Order_shoe` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `order_id` integer NOT NULL,
    `shoe_id` integer NOT NULL,
    UNIQUE (`order_id`, `shoe_id`)
)
;
ALTER TABLE `Order_shoe` ADD CONSTRAINT `shoe_id_refs_id_fcfea269` FOREIGN KEY (`shoe_id`) REFERENCES `Shoe` (`id`);
CREATE TABLE `Order` (
    `id` integer AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `date_placed` date NOT NULL,
    `date_dispatched` date,
    `status` varchar(45) NOT NULL,
    `user_id` integer NOT NULL,
    `delivery_id` integer NOT NULL
)
;
ALTER TABLE `Order` ADD CONSTRAINT `delivery_id_refs_id_ec47a00e` FOREIGN KEY (`delivery_id`) REFERENCES `Delivery` (`id`);
ALTER TABLE `Order` ADD CONSTRAINT `user_id_refs_id_47d23500` FOREIGN KEY (`user_id`) REFERENCES `User` (`id`);
ALTER TABLE `Order_shoe` ADD CONSTRAINT `order_id_refs_id_0b70d3b7` FOREIGN KEY (`order_id`) REFERENCES `Order` (`id`);




INSERT INTO `FootWearShop`.`Role` (`role_name`, `role_description`) VALUES ('C', 'Customers can order items from the store.');
INSERT INTO `FootWearShop`.`Role` (`role_name`, `role_description`) VALUES ('S', 'Staff perform duties such as tracking stock.');
INSERT INTO `FootWearShop`.`Role` (`role_name`, `role_description`) VALUES ('M', 'Managers are responsible for the staff.');
INSERT INTO `FootWearShop`.`Role` (`role_name`, `role_description`) VALUES ('A', 'Administrators have full access.');


INSERT INTO `FootWearShop`.`User` (`email_address`, `password`, `role_id`) VALUES ('admin@test.com','$2y$10$.bsUkjVZXQZbzbK2j3sM.eIxj7ZHcNTlx2imGHRsNZPyAmNBOTXk2', '4');
INSERT INTO `FootWearShop`.`UserInfo` (`user_id`, `gender`, `nationality`, `first_name`, `last_name`) VALUES (1, 'M', 'British', 'Admin', 'Admin');

INSERT INTO `FootWearShop`.`User` (`email_address`, `password`, `role_id`) VALUES ('manager@test.com','$2y$10$.bsUkjVZXQZbzbK2j3sM.eIxj7ZHcNTlx2imGHRsNZPyAmNBOTXk2', '2');
INSERT INTO `FootWearShop`.`UserInfo` (`user_id`, `gender`, `nationality`, `first_name`, `last_name`) VALUES (2, 'M', 'British', 'Manager', 'Manager');

INSERT INTO `FootWearShop`.`User` (`email_address`, `password`, `role_id`) VALUES ('staff@test.com','$2y$10$.bsUkjVZXQZbzbK2j3sM.eIxj7ZHcNTlx2imGHRsNZPyAmNBOTXk2', '3');
INSERT INTO `FootWearShop`.`UserInfo` (`user_id`, `gender`, `nationality`, `first_name`, `last_name`) VALUES (3, 'M', 'British', 'Staff', 'Staff');

INSERT INTO `FootWearShop`.`User` (`email_address`, `password`, `role_id`) VALUES ('customer@test.com','$2y$10$.bsUkjVZXQZbzbK2j3sM.eIxj7ZHcNTlx2imGHRsNZPyAmNBOTXk2', '1');
INSERT INTO `FootWearShop`.`UserInfo` (`user_id`, `gender`, `nationality`, `first_name`, `last_name`) VALUES (4, 'M', 'British', 'Customer', 'Customer');


COMMIT;
