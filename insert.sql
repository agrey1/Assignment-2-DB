INSERT INTO  `FootWearShop`.`Brand` (
`id` ,
`brand_name`
)
VALUES (
NULL ,  'New Brand'
);

INSERT INTO  `FootWearShop`.`Category` (
`id` ,
`category_name` ,
`season`
)
VALUES (
NULL ,  'Formal',  'All'
);

INSERT INTO  `FootWearShop`.`Address` (
`id` ,
`first_line` ,
`second_line` ,
`city` ,
`postcode` ,
`country` ,
`userinfo_id`
)
VALUES (
NULL ,  '2 Test Road',  '',  'Dundee',  'DD4 AAA',  'United Kingdom', NULL
);

INSERT INTO  `FootWearShop`.`Delivery` (
`id` ,
`tracking_number` ,
`delivery_type` ,
`delivery_cost` ,
LAST_INSERT_ID()
)
VALUES (
NULL ,  '93AJ2-1',  'Express',  '4.99',  '1'
);

INSERT INTO  `FootWearShop`.`Order` (
`id` ,
`date_placed` ,
`date_dispatched` ,
`status` ,
`user_id` ,
LAST_INSERT_ID()
)
VALUES (
NULL ,  '2015-11-18 13:17:09',  '2015-11-18 15:31:05',  'Out for Delivery',  '1',  '3'
);

INSERT INTO  `FootWearShop`.`Shoe` (
`id` ,
`shoe_name` ,
`size` ,
`color` ,
`quantity` ,
`price` ,
`image_url`
)
VALUES (
NULL ,  'BrandX Shoe A',  '10',  'Black',  '450',  '27.99', 'https://www.chamaripashoes.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/b/l/black-leather-lifted-dress-shoes-for-men-67-2.jpg'
);

INSERT INTO  `FootWearShop`.`Address` (
`id` ,
`first_line` ,
`second_line` ,
`city` ,
`postcode` ,
`country` ,
`userinfo_id`
)
VALUES (
NULL ,  '5 MakeShoe Road',  '',  'Dundee',  'DD4 BBB',  'United Kingdom', NULL
);

INSERT INTO  `FootWearShop`.`Supplier` (
`id` ,
`supplier_name` ,
LAST_INSERT_ID() ,
`phonenumber` ,
`email`
)
VALUES (
NULL ,  'Shoe Manufacturing',  '1',  '01382111111',  'contact@shoemanufacturing.co.uk'
);
