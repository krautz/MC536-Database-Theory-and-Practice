DROP DATABASE IF EXISTS db_ra169477;

CREATE DATABASE db_ra169477;

USE db_ra169477;

DROP TABLE IF EXISTS Product;

CREATE TABLE Product (
    Product_id                                              bigint unsigned not null,
    Product_name                                            varchar(45) not null,
    Quantity                                                varchar(50),
    Serving_size                                            varchar(45),
    EnergyFor100gPer100ml                                   int,
    FatFor100gPer100ml                                      decimal(5,2),
	SaturatedFatFor100gPer100ml								decimal(4,2),
    CarbohydrateFor100gPer100ml                             decimal(4,2),
	SugarsFor100gPer100ml									decimal(4,2),
    DietaryFiberFor100gPer100ml                             decimal(3,2),
    ProteinsFor100gPer100ml                                 decimal(4,2),
    SaltFor100gPer100ml                                     decimal (7,5),
    SodiumFor100gPer100ml                                   decimal(15,12),
	Ingredients_text										varchar(1000),
    
    CONSTRAINT pk_Product
        PRIMARY KEY (Product_id)
);


DROP TABLE IF EXISTS Store;

CREATE TABLE Store (
    Store_id       		 bigint unsigned NOT NULL,
    Store_name           varchar(45) NOT NULL,
    CONSTRAINT pk_Store
	    primary key (Store_id)
);


DROP TABLE IF EXISTS Additive;

CREATE TABLE Additive(
	Additive_id          bigint unsigned not null,
    Additive_name        varchar(1000) NOT NULL,
    CONSTRAINT pk_Additive
	    primary key (Additive_id)
);


drop table if exists Brand;

CREATE TABLE Brand (
	Brand_id          bigint unsigned not null,
    Brand_name        varchar(1000) NOT NULL,

    CONSTRAINT pk_Brand
		primary key (Brand_id)
);


drop table if exists Allergen;

CREATE TABLE Allergen (
	Allergen_id          bigint unsigned not null,
    Allergen_Name        varchar(1000) NOT NULL,

    CONSTRAINT pk_allergen
        PRIMARY KEY (Allergen_id)
);


drop table if exists Packing;

CREATE TABLE Packing (
    Packing_id    		  bigint unsigned NOT NULL,
    Packing_name          varchar(45) NOT NULL,

    CONSTRAINT pk_packing
          PRIMARY KEY (Packing_id)

);


drop table if exists Category;

CREATE TABLE Category (
    Category_id     		bigint unsigned NOT NULL,
    Category_name           varchar(45) NOT NULL,
    
    CONSTRAINT pk_category
          PRIMARY KEY (Category_id)

);


drop table if exists Traces;

CREATE TABLE Traces (
    Traces_id        bigint unsigned NOT NULL,
    Traces_name        varchar(1000) NOT NULL,
    
    CONSTRAINT pk_traces
          PRIMARY KEY (Traces_id)
);


drop table if exists Manufacturing_place;

CREATE TABLE Manufacturing_place (
	Manufacturing_place_id         	bigint unsigned NOT NULL,
	Manufacturing_place_name		varchar(1000),

	CONSTRAINT pk_Manufacturing_place
        	PRIMARY KEY (Manufacturing_place_id)

);

drop table if exists Purchase_place;

create table Purchase_place (
	Purchase_place_id		bigint unsigned NOT NULL,
    Purchase_place_name		varchar(1000),
    
    CONSTRAINT pk_Purchase_place
        primary key (Purchase_place_id)
);

drop table if exists Origin;

create table Origin (
	Origin_id		bigint unsigned NOT NULL,
    Origin_name		varchar(1000),
    
    CONSTRAINT pk_Origin
        primary key (Origin_id)
);


drop table if exists Store_has_Product;

create table Store_has_Product (
	Product_id			bigint unsigned not null,
    Store_id			bigint unsigned not null
);

drop table if exists Brand_has_Product;

create table Brand_has_Product (
	Product_id			bigint unsigned not null,
    Brand_id			bigint unsigned not null
);

drop table if exists Product_has_Packing;

create table Product_has_Packing (
	Product_id			bigint unsigned not null,
    Packing_id			bigint unsigned not null
);

drop table if exists Product_has_Additive;

create table Product_has_Additive (
	Product_id			bigint unsigned not null,
    Additive_id			bigint unsigned not null
);

drop table if exists Product_has_Allergen;

create table Product_has_Allergen (
	
    Product_id			bigint unsigned not null,
	Allergen_id			bigint unsigned not null
);

drop table if exists Product_has_Category;

create table Product_has_Category (
	Product_id			bigint unsigned not null,
    Category_id			bigint unsigned not null
);

drop table if exists Product_has_Traces;

create table Product_has_Traces (
	Product_id			bigint unsigned not null,
    Traces_id			bigint unsigned not null
);

drop table if exists Product_has_Manufacturing_place;

create table Product_has_Manufacturing_place (
	Product_id			bigint unsigned not null,
    Manufacturing_place_id		bigint unsigned not null
);

drop table if exists Product_has_Purchase_place;

create table Product_has_Purchase_place (
	Product_id			bigint unsigned not null,
    Purchase_place_id	bigint unsigned not null
);
drop table if exists Packing_has_Origin;

create table Product_has_Origin (
	Product_id			bigint unsigned not null,
    Origin_id			bigint unsigned not null
);

ALTER TABLE Store_has_Product
    ADD CONSTRAINT fk_store_id
        FOREIGN KEY (Store_id)
		REFERENCES Store (Store_id);

ALTER TABLE Store_has_Product
    ADD CONSTRAINT fk_store_product_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);

ALTER TABLE Brand_has_Product
    ADD CONSTRAINT fk_brand_id
        FOREIGN KEY (Brand_id)
		REFERENCES Brand (Brand_id);

ALTER TABLE Brand_has_Product
    ADD CONSTRAINT fk_brand_product_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);

ALTER TABLE Product_has_Packing
    ADD CONSTRAINT fk_packing_id
        FOREIGN KEY (Packing_id)
		REFERENCES Packing (Packing_id);

ALTER TABLE Product_has_Packing
    ADD CONSTRAINT fk_packing_product_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);
             
ALTER TABLE Product_has_Additive
    ADD CONSTRAINT fk_additive_id
        FOREIGN KEY (Additive_id)
		REFERENCES Additive (Additive_id);

ALTER TABLE Product_has_Additive
    ADD CONSTRAINT fk_product_additive_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);
        
ALTER TABLE Product_has_Allergen
    ADD CONSTRAINT fk_allergen_id
        FOREIGN KEY (Allergen_id)
		REFERENCES Allergen (Allergen_id);
        
ALTER TABLE Product_has_Category
    ADD CONSTRAINT fk_category_id
        FOREIGN KEY (Category_id)
		REFERENCES Category (Category_id);

ALTER TABLE Product_has_Category
    ADD CONSTRAINT fk_product_category_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);
        
ALTER TABLE Product_has_Traces
    ADD CONSTRAINT fk_traces_id
        FOREIGN KEY (Traces_id)
		REFERENCES Traces (Traces_id);

ALTER TABLE Product_has_Traces
    ADD CONSTRAINT fk_product_traces_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);
        
ALTER TABLE Product_has_Manufacturing_place
    ADD CONSTRAINT fk_manufacturing_place_id
        FOREIGN KEY (Manufacturing_place_id)
		REFERENCES Manufacturing_place (Manufacturing_place_id);

ALTER TABLE Product_has_Manufacturing_place
    ADD CONSTRAINT fk_product_manufacturing_place_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);
        
ALTER TABLE Product_has_Purchase_place
    ADD CONSTRAINT fk_purchase_place_id
        FOREIGN KEY (Purchase_place_id)
		REFERENCES Purchase_place (Purchase_place_id);

ALTER TABLE Product_has_Purchase_place
    ADD CONSTRAINT fk_product_purchase_place_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);
        
ALTER TABLE Product_has_Origin
    ADD CONSTRAINT fk_Origin_id
        FOREIGN KEY (Origin_id)
		REFERENCES Origin (Origin_id);

ALTER TABLE Product_has_Origin
    ADD CONSTRAINT fk_product_id
        FOREIGN KEY (Product_id)
		REFERENCES Product (Product_id);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product.csv'
	INTO TABLE Product
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(	Product_id, Product_name, Quantity, Serving_size, EnergyFor100gPer100ml, FatFor100gPer100ml,
		SaturatedFatFor100gPer100ml, CarbohydrateFor100gPer100ml, SugarsFor100gPer100ml, DietaryFiberFor100gPer100ml,
		ProteinsFor100gPer100ml,SaltFor100gPer100ml, SodiumFor100gPer100ml, Ingredients_text);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Store.csv'
	INTO TABLE Store
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Store_id, Store_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Additive.csv'
	INTO TABLE Additive
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Additive_id, Additive_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Brand.csv'
	INTO TABLE Brand
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Brand_id, Brand_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Allergen.csv'
	INTO TABLE Allergen
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Allergen_id, Allergen_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Packing.csv'
	INTO TABLE Packing
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Packing_id, Packing_name);
    
LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Category.csv'
	INTO TABLE Category
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Category_id, Category_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Traces.csv'
	INTO TABLE Traces
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Traces_id, Traces_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Manufacturing_place.csv'
	INTO TABLE Manufacturing_place
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Manufacturing_place_id, Manufacturing_place_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Purchase_place.csv'
	INTO TABLE Purchase_place
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Purchase_place_id, Purchase_place_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Origin.csv'
	INTO TABLE Origin
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Origin_id, Origin_name);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Additive.csv'
	INTO TABLE Product_has_Additive
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Product_id, Additive_id);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Allergen.csv'
	INTO TABLE Product_has_Allergen
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Product_id, Allergen_id);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Brand.csv'
	INTO TABLE Brand_has_Product
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Brand_id, Product_id);
    
LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Category.csv'
	INTO TABLE Product_has_Category
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Product_id, Category_id);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Manufacturing_place.csv'
	INTO TABLE Product_has_Manufacturing_place
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Manufacturing_Place_id, Product_id);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Origin.csv'
	INTO TABLE Product_has_Origin
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Origin_id, Product_id);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Purchase_Place.csv'
	INTO TABLE Product_has_Purchase_place
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Purchase_Place_id, Product_id);
    
LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Traces.csv'
	INTO TABLE Product_has_Traces
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Traces_id, Product_id);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Store_has_Product.csv'
	INTO TABLE Store_has_Product
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Store_id, Product_id);

LOAD DATA LOCAL INFILE 'C:\\Users\\ra169477\\Desktop\\BD-projeto\\Product_has_Packing.csv'
	INTO TABLE Product_has_Packing
	CHARACTER SET 'UTF8'
	FIELDS TERMINATED BY '\t'
	IGNORE 1 LINES
	(Product_id, Packing_id);

SELECT * FROM Product;
SELECT * FROM Product_has_Allergen;

#Products and where to buy them
SELECT 	trim(Purchase_place_name),
		Product_name
FROM Product P 
INNER JOIN Product_has_Purchase_place PPP
ON P.Product_id = PPP.Product_id
INNER JOIN Purchase_place PP
ON PP.Purchase_place_id = PPP.Purchase_place_id
ORDER BY (Product_name);

#All Stores and all products that it sells, ordered by name
SELECT 	trim(Store_name), 
		Product_name
FROM Product P
INNER JOIN Store_has_Product SP
ON SP.Product_id = P.Product_id
INNER JOIN Store S
ON S.Store_id = SP.Store_id
ORDER BY (Store_name);

#number of products of each brand
SELECT 	COUNT(Product_name) AS Number_of_Products, 
		Brand_name
FROM Product P
INNER JOIN Brand_has_Product BP
ON P.Product_id = BP.Product_id
INNER JOIN Brand B
ON B.Brand_id = BP.Brand_id
GROUP BY Brand_name
ORDER BY Number_of_Products desc;

#Count number of products with allergerns per brand
SELECT 	COUNT(P.Product_id) AS Number_of_Allergens, 
		Brand_name
FROM Product P
INNER JOIN Brand_has_Product BP
ON P.Product_id = BP.Product_id
INNER JOIN Product_has_Allergen PA
ON P.Product_id = PA.Product_id
INNER JOIN Allergen A
ON A.Allergen_id = PA.Allergen_id
INNER JOIN Brand B
ON B.Brand_id = BP.Brand_id
GROUP BY Brand_name
ORDER BY Number_of_Allergens desc;

#Calculates the average of carbohydrates in each brand, excluding those with an amount equal to 0
SELECT 	round(AVG(P.CarbohydrateFor100gPer100ml), 2) AS AVG_Carbohydrate,
		Brand_name
FROM Product P
INNER JOIN Brand_has_Product BP
ON P.Product_id = BP.Product_id
INNER JOIN Brand B
ON B.Brand_id = BP.Brand_id
GROUP BY Brand_name
HAVING AVG_Carbohydrate > 0
ORDER BY AVG_Carbohydrate desc;