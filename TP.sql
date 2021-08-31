CREATE DATABASE TP

Create table User_ (
Userid varchar(40),
Username varchar(40),
Userpass varchar(40),
Usermoney float,
Primary Key(Userid)
)
Create table Shop(
Shopid varchar(40),
Shopname nvarchar(40),
Shoprating float,
Shopcategory nvarchar(40),
Primary Key(Shopid)
)

Create table Product(
Shopid varchar(40),
Productid varchar(40),
ProductName nvarchar(40),
ProductValue float,
ProductDecrip nvarchar(200),
ProductQuantity int,
ProductImage varchar(200),
Primary Key(Productid),
FOREIGN KEY (Shopid) REFERENCES Shop(Shopid) ON UPDATE CASCADE ON DELETE CASCADE
)
Create table RateProduct(
Productid varchar(40),
Userid varchar(40),

Rating float,
Primary Key(Productid,Userid),
FOREIGN KEY (Productid) REFERENCES Product(Productid) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Userid) REFERENCES User_(Userid) ON UPDATE CASCADE ON DELETE CASCADE
)
Create table Order_(
Userid varchar(40),
Productid varchar(40),
Quantity int,
Value float,
Primary Key (Userid,Productid),
FOREIGN KEY (Userid) REFERENCES User_(Userid) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (Productid) REFERENCES Product(Productid) ON UPDATE CASCADE ON DELETE CASCADE
)
