
CREATE DATABASE pCare


CREATE TABLE PRODUCT (
			id int IDENTITY(1,1),
			name varchar(50) NOT NULL,
			brand varchar(50),
			description varchar(150),
			tag float(5),
			categoryId int NOT NULL,
			packageId int,
			storeId int,
			orderId int,
CONSTRAINT productId_PK PRIMARY KEY(id),
CONSTRAINT product_FK1 FOREIGN KEY(categoryId) REFERENCES CATEGORY (id),
CONSTRAINT product_FK2 FOREIGN KEY(packageId) REFERENCES PACKAGE(id),
CONSTRAINT product_FK3 FOREIGN KEY(storeId) REFERENCES STORE(id),
CONSTRAINT product_FK4 FOREIGN KEY(orderId) REFERENCES pORDER(id))

CREATE TABLE CATEGORY (
			id int IDENTITY(1,1),
			name varchar(50) CHECK(name IN('Face','Eye','Lip','Accessories','Nail','Skin Care','Hair','Perfume')), 
CONSTRAINT category_PK PRIMARY KEY(id))


CREATE TABLE pORDER (
			id int IDENTITY(1,1),
			order_date DATE,
			delivery_date DATE,
			customerId int,
			storeId int,
CONSTRAINT pORDER_PK PRIMARY KEY(id),
CONSTRAINT pORDER_FK1 FOREIGN KEY (customerId) REFERENCES CUSTOMER(id),
CONSTRAINT pORDER_FK2 FOREIGN KEY (storeId) REFERENCES STORE(id));

ALTER TABLE pORDER ADD canceled BIT


CREATE TABLE STORE (
			id int IDENTITY(1,1),
			name varchar(50),
			city varchar(50) DEFAULT 'Ýstanbul',
			town varchar(50),
			district varchar(50),
			no int ,
CONSTRAINT store_PK PRIMARY KEY(id));

ALTER TABLE STORE DROP COLUMN name

INSERT INTO STORE(town,district,no) VALUES ('Beþiktaþ','Ortaköy',19)

CREATE TABLE CUSTOMER (
			id int IDENTITY(1,1),
			name varchar(50) NOT NULL,
			surname varchar(50) NOT NULL,
			email varchar(50),
			phoneNumber varchar(50) NOT NULL,
CONSTRAINT customer_PK PRIMARY KEY(id))

CREATE TABLE PACKAGE (
			id int IDENTITY(1,1),
			name varchar(50),
			description varchar(200),
			brand varchar(50),
			tag float(5),
			customerId int,
			storeId int,
CONSTRAINT package_PK PRIMARY KEY(id),
CONSTRAINT package_FK1 FOREIGN KEY(customerId)REFERENCES CUSTOMER(id),
CONSTRAINT package_FK2 FOREIGN KEY(storeId)REFERENCES STORE(id))

ALTER TABLE PACKAGE DROP COLUMN description


CREATE TABLE SELLING (
			count int,
			orderId int,
			productId int,
CONSTRAINT selling_FK1 FOREIGN KEY(orderId)REFERENCES pORDER(id),
CONSTRAINT selling_FK2 FOREIGN KEY(productId)REFERENCES PRODUCT(id))

ALTER TABLE SELLING DROP COLUMN orderId
ALTER TABLE SELLING DROP COLUMN productId

ALTER TABLE SELLING DROP selling_FK1
ALTER TABLE SELLING DROP selling_FK2

ALTER TABLE SELLING ADD productName varchar(50)

DROP TABLE SELLING


INSERT INTO CATEGORY VALUES ('Face')
INSERT INTO CATEGORY VALUES ('Eye')
INSERT INTO CATEGORY VALUES ('Lip')
INSERT INTO CATEGORY VALUES ('Accessories')
INSERT INTO CATEGORY VALUES ('Nail')
INSERT INTO CATEGORY VALUES ('Skin Care')
INSERT INTO CATEGORY VALUES ('Hair')
INSERT INTO CATEGORY VALUES ('Perfume')

INSERT INTO CUSTOMER VALUES ('Büþra','Yaðcý','busrayagci@gmail.com','05554443322')
INSERT INTO CUSTOMER VALUES ('Sevda','Durdu','sevdadurdu@gmail.com','05443332211')
INSERT INTO CUSTOMER VALUES ('Alperen','Bayar','alperenbayar@gmail.com','05599456789')
INSERT INTO CUSTOMER VALUES ('Emre Barkýn','Bozdað','ebarkinbozdag@gmail.com','022277449302')
INSERT INTO CUSTOMER VALUES ('Nuri','Yýldýz','nuriyildiz@gmail.com','01234567893')
INSERT INTO CUSTOMER VALUES ('Oðuzhan','Yiðit','oguzhanyigit@gmail.com','09876543216')
INSERT INTO CUSTOMER VALUES ('Ýbrahim','Aycan','ibrahimaycan@gmail.com','12345678903')
INSERT INTO CUSTOMER VALUES ('Ayþe','Yýlmaz','ayseyilmaz@gmail.com','45678901234')
INSERT INTO CUSTOMER VALUES ('Begüm','Tek','tekbegüm@gmail.com','12345678234')
INSERT INTO CUSTOMER VALUES ('Ece','Demir','ecedemir@gmail.com','12345678765')

INSERT INTO STORE VALUES ('Ýstanbul','Kadýköy','Göztepe','12')
INSERT INTO STORE VALUES ('Ýstanbul','Kadýköy','Bahariye','15')
INSERT INTO STORE VALUES ('Ýstanbul','Kadýköy','Caferaða','06')
INSERT INTO STORE VALUES ('Ýstanbul','Üsküdar','Baðlarbaþý','27')
INSERT INTO STORE VALUES ('Ýstanbul','Üsküdar','Libadiye','26')
INSERT INTO STORE VALUES ('Ýstanbul','Beþiktaþ','Akaretler','44')
INSERT INTO STORE VALUES ('Ýstanbul','Beþiktaþ','Ortaköy','43')
INSERT INTO STORE VALUES ('Ýstanbul','Mecidiyeköy','Fulya','32')
INSERT INTO STORE VALUES ('Ýstanbul','Eminönü','Merkez','42')
INSERT INTO STORE VALUES ('Ýstanbul','Kadýköy','Moda','17')

INSERT INTO pORDER VALUES (GETDATE(), GETDATE(), 1, 1)
INSERT INTO pORDER VALUES (GETDATE(), '2018-11-25', 1, 1)
INSERT INTO pORDER VALUES (GETDATE(), '2018-11-28', 2, 6)
INSERT INTO pORDER VALUES (GETDATE(), '2018-12-11', 3, 4)
INSERT INTO pORDER VALUES (GETDATE(), '2018-11-27', 2, 7)
INSERT INTO pORDER VALUES (GETDATE(), '2018-11-30', 3, 3)
INSERT INTO pORDER VALUES (GETDATE(), '2018-12-02', 4, 3)
INSERT INTO pORDER VALUES (GETDATE(), '2018-12-03', 4, 6)
INSERT INTO pORDER VALUES (GETDATE(), '2018-12-05', 6, 7)
INSERT INTO pORDER VALUES (GETDATE(), '2018-12-07', 7, 9)


INSERT INTO PACKAGE VALUES ('Pink Set', 'Loreal Paris', 8.0 , 1, 3)
INSERT INTO PACKAGE VALUES ('Travel Set', 'Nivea', 7.8 , 2, 5)
INSERT INTO PACKAGE VALUES ('Miraculous Set', 'Schwarzkopf', 8.1 , 6, 3)
INSERT INTO PACKAGE VALUES ('Pure Set', 'Maybelline', 8.1 , 3, 4)
INSERT INTO PACKAGE VALUES ('Face Mask Set', 'Bioderma', 8.5 , 8, 1)
INSERT INTO PACKAGE VALUES ('Brush Set', 'Nascita', 7.5 , 4, 2)
INSERT INTO PACKAGE VALUES ('Theatrical Makeup Set', 'Mac', 9.1 , 2, 7)
INSERT INTO PACKAGE VALUES ('Birthday Set', 'Benefit', 9.0 , 3, 9)
INSERT INTO PACKAGE VALUES ('Halloween Set', 'Sephora', 9.0 , 7, 8)
INSERT INTO PACKAGE VALUES ('New Year Set', 'Golden Rose', 6.2 , 6, 7)

INSERT INTO PRODUCT VALUES ('lipstick','Maybelline','Color code:21 , mate ', $5,3, null, 1,null)
INSERT INTO PRODUCT VALUES ('fondoten','Mac','Color code:1 , with E vitamin ', $20,1, 7, 7,null)
INSERT INTO PRODUCT VALUES ('mascara','Sephora',' volume ', $9,2, 9, 8,null)
INSERT INTO PRODUCT VALUES ('highlighter','Maybelline','silvery ', $8,1, null, 5,null)
INSERT INTO PRODUCT VALUES ('bronzer','wet&wild','Color code:3 , silvery ', $7,1, null, 6,null)
INSERT INTO PRODUCT VALUES ('shampoo','Urban','For hair shedding ', $8,7, null, 1,null)
INSERT INTO PRODUCT VALUES ('tonic','Bioderma','For acne and black spot ', $7,6, 5, 1,null)
INSERT INTO PRODUCT VALUES ('nail polish','Flormar','Color code:32 , mate ', $2,5, null, 4,null)
INSERT INTO PRODUCT VALUES ('makeup sponge','Mac',null, $2,4, null, 8,null)
INSERT INTO PRODUCT VALUES ('perfume','Estee Lauder','Vanilla misk ', $30,8, null, 8,null)


SELECT dbo.PACKAGE.name, dbo.PRODUCT.name AS Expr1, dbo.PRODUCT.brand, dbo.PRODUCT.description
FROM  dbo.PACKAGE INNER JOIN dbo.PRODUCT 
ON dbo.PACKAGE.id = dbo.PRODUCT.packageId

--Products in Packages

CREATE VIEW Package_Products AS
SELECT dbo.CATEGORY.name, dbo.PRODUCT.name AS ProductName, dbo.PRODUCT.brand,
dbo.PRODUCT.description, dbo.PACKAGE.name AS PackageName, dbo.PRODUCT.tag,
(SELECT COUNT(*) FROM dbo.PRODUCT
WHERE dbo.PRODUCT.packageId=dbo.PACKAGE.id) AS count
FROM   dbo.CATEGORY INNER JOIN
                  dbo.PRODUCT ON dbo.CATEGORY.id = dbo.PRODUCT.categoryId INNER JOIN
                  dbo.PACKAGE ON dbo.PRODUCT.packageId = dbo.PACKAGE.id


SELECT * FROM Package_Products

SELECT CATEGORY.name FROM CATEGORY

--Products in categories

--SELECT dbo.CATEGORY.name, dbo.PRODUCT.name AS Expr1, dbo.PRODUCT.brand, dbo.PRODUCT.description, dbo.PRODUCT.tag
--FROM  dbo.CATEGORY INNER JOIN
--                  dbo.PRODUCT ON dbo.CATEGORY.id = dbo.PRODUCT.categoryId

--View previous orders

CREATE VIEW Previos_Orders AS 
SELECT dbo.CUSTOMER.name, dbo.CUSTOMER.surname, dbo.pORDER.order_date, dbo.pORDER.delivery_date,
dbo.PRODUCT.name AS ProductName,dbo.PRODUCT.brand, dbo.PRODUCT.description, dbo.PRODUCT.tag, 
                  dbo.STORE.town, dbo.STORE.district, dbo.STORE.no
FROM     dbo.CUSTOMER INNER JOIN
                  dbo.pORDER ON dbo.CUSTOMER.id = dbo.pORDER.customerId INNER JOIN
                  dbo.PRODUCT ON dbo.pORDER.id = dbo.PRODUCT.orderId INNER JOIN
                  dbo.STORE ON dbo.PRODUCT.storeId = dbo.STORE.id
WHERE pORDER.delivery_date<GETDATE()

SELECT * FROM Previos_Orders

--View waiting orders

CREATE VIEW Waiting_Orders AS 
SELECT dbo.CUSTOMER.name, dbo.CUSTOMER.surname, dbo.pORDER.order_date, dbo.pORDER.delivery_date,
dbo.PRODUCT.name AS ProductName, dbo.PRODUCT.brand, dbo.PRODUCT.description, dbo.PRODUCT.tag, 
                  dbo.STORE.town, dbo.STORE.district, dbo.STORE.no
FROM     dbo.CUSTOMER INNER JOIN
                  dbo.pORDER ON dbo.CUSTOMER.id = dbo.pORDER.customerId INNER JOIN
                  dbo.PRODUCT ON dbo.pORDER.id = dbo.PRODUCT.orderId INNER JOIN
                  dbo.STORE ON dbo.PRODUCT.storeId = dbo.STORE.id
WHERE pORDER.delivery_date>GETDATE()

SELECT * FROM Waiting_Orders


CREATE VIEW Store_Product AS 
SELECT DISTINCT TOP 100 dbo.CATEGORY.name, dbo.PRODUCT.name AS ProductName, dbo.PRODUCT.brand,
dbo.PRODUCT.description, dbo.PRODUCT.tag, dbo.STORE.city, dbo.STORE.town, dbo.STORE.district, dbo.STORE.no 
FROM  dbo.CATEGORY INNER JOIN
                  dbo.PRODUCT ON dbo.CATEGORY.id = dbo.PRODUCT.categoryId INNER JOIN
                  dbo.STORE ON dbo.PRODUCT.storeId = dbo.STORE.id
ORDER BY dbo.STORE.town, dbo.STORE.district ASC

SELECT * FROM Store_Product


SELECT dbo.PACKAGE.name, dbo.PACKAGE.tag, dbo.PRODUCT.tag AS Expr1, dbo.PRODUCT.name AS Expr2, dbo.STORE.city, dbo.STORE.town, dbo.STORE.district, dbo.STORE.no
FROM  dbo.PACKAGE INNER JOIN dbo.PRODUCT ON dbo.PACKAGE.id = dbo.PRODUCT.packageId INNER JOIN dbo.STORE ON dbo.PRODUCT.storeId = dbo.STORE.id

--STORED PROCEDURE TO ADD PRODUCT

CREATE PROCEDURE addProduct
		@name varchar(50),
		@brand varchar(50),
		@description varchar(100),
		@tag real,
		@categoryId int,
		@packageId int,
		@storeId int,
		@orderId int
AS
BEGIN
INSERT INTO PRODUCT(name,brand,description,tag,categoryId,packageId,storeId,orderId)
VALUES (@name, @brand, @description, @tag, @categoryId, @packageId, @storeId, @orderId)
END
GO

exec addProduct
	@name = 'blusher',
	@brand = 'Sephora',
	@description = 'Powder Blusher, No:20',
	@tag = $6.99,
	@categoryId=1,
	@packageId=9,
	@storeId=4,
	@orderId=NULL

exec addProduct
	@name = 'NULL',
	@brand = 'NULL',
	@description = 'NULL',
	@tag = NULL,
	@categoryId=1,
	@packageId=NULL,
	@storeId=NULL,
	@orderId=NULL

--STORED PROCEDURE TO UPDATE PRODUCT

CREATE PROCEDURE updateProduct(
		@id int,
		@name varchar(50),
		@brand varchar(50),
		@description varchar(100),
		@tag real,
		@categoryId int,
		@packageId int,
		@storeId int,
		@orderId int
)
AS 
BEGIN 
UPDATE PRODUCT SET
name=@name , brand=@brand, description=@description, tag=@tag, categoryId=@categoryId, packageId=@packageId, storeId=@storeId, orderId=@orderId
WHERE id=@id
END

exec updateProduct @id=14,
			@name = 'headlight palette',
			@brand = 'Loreal Paris',
			@description = 'pink density, eye-catching colors',
			@tag = $9,
			@categoryId=1,
			@packageId=1,
			@storeId=3,
			@orderId=NULL

CREATE PROCEDURE orderProductByName AS
SELECT dbo.CATEGORY.name, dbo.PRODUCT.name AS ProductName, dbo.PRODUCT.brand, dbo.PRODUCT.description, dbo.PRODUCT.tag
FROM  dbo.CATEGORY INNER JOIN
                  dbo.PRODUCT ON dbo.CATEGORY.id = dbo.PRODUCT.categoryId
ORDER BY dbo.PRODUCT.name ASC

exec orderProductByName

CREATE PROCEDURE orderProductByTag AS 
SELECT dbo.CATEGORY.name, dbo.PRODUCT.name AS ProductName, dbo.PRODUCT.brand, dbo.PRODUCT.description, dbo.PRODUCT.tag
FROM  dbo.CATEGORY INNER JOIN
                  dbo.PRODUCT ON dbo.CATEGORY.id = dbo.PRODUCT.categoryId
WHERE dbo.CATEGORY.name='Face'
ORDER BY dbo.PRODUCT.tag ASC

exec orderProductByTag

CREATE TABLE PRODUCTLOG(
		  productName varchar(50),
		  productBrand varchar(50),
		  productDesc varchar(100),
		  productTag float(5),
		  ACTIONPERFORMED char(1),
		  ACTIONOCCURREDAT datetime2
)



CREATE TRIGGER insert_PRODUCTLOG ON PRODUCT
AFTER INSERT AS 
BEGIN
    
    INSERT INTO PRODUCTLOG (productName,productBrand,productDesc,productTag,ACTIONPERFORMED,ACTIONOCCURREDAT) 
    select i.name,i.brand,i.description,i.tag ,'I', GETDATE() FROM inserted i; --tuple table
    
END;

SELECT * FROM PRODUCT

INSERT INTO PRODUCT (name, brand,description,tag,categoryId) VALUES ('Mascara','Maybelline','Extra Black',$12,2)

SELECT * FROM PRODUCT

SELECT * FROM PRODUCTLOG

create TRIGGER delete_PRODUCTLOG ON PRODUCT
AFTER DELETE AS 
BEGIN
	DECLARE @hasRecords int;
	
	select @hasRecords=COUNT(*) from PRODUCT
    
      IF (@hasRecords) > 0
	BEGIN
   RAISERROR('You cannot delete corresponding course it has records in product table.',16, 1)
	ROLLBACK TRANSACTION --rollback(cancel) delete operation 
	END
	
	 IF (@hasRecords) = 0
	BEGIN
    INSERT INTO PRODUCTLOG (productName,productBrand,productDesc,productTag,ACTIONPERFORMED,ACTIONOCCURREDAT) 
    select i.name,i.brand,i.description,i.tag ,'D', GETDATE() FROM inserted i;
	END
    
END;

DELETE FROM PRODUCT WHERE name='Mascara';

DELETE FROM PRODUCT WHERE name='aaa' AND categoryId=2;

delete from PRODUCTLOG


























