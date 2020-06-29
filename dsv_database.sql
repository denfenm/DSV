drop database if exists dsv;
create database dsv;
use dsv;

create table Travel_Agencies(
travel_agency_id int(20) primary key,
travel_agency_details text(200)  
);

create table Customers(
customer_id int(20) primary key,
first_name varchar(30),  -- improvement
last_name varchar(30),
date_of_birth date,
find_out_details text(200)-- improvement
);
--
create table Customers_Addresses(
customer_address_id int(20) primary key,
customer_houseno varchar(30),
customer_street varchar(30),
customer_city varchar(30),
customer_zipcode int(30),
customer_state varchar(30),
customer_country varchar(30),
customer_id int(20),
foreign key (customer_id) references Customers(customer_id));


create table Customers_Contacts( 
contact_id int(20) primary key,
customer_id int(20),
customer_contactnumber varchar(30),
customer_contactnumber2 varchar(30),
customer_officenumber varchar(30),
customer_email varchar(30),
foreign key (customer_id) references Customers(customer_id)
);

create table Bookings(
booking_id int(20) primary key,
customer_id int(20),
booking_outcome varchar(20),
payment_status varchar(20),
travel_agency_id int(20),
date_of_booking date,
booking_details text(200),
foreign key (travel_agency_id) references Travel_Agencies(travel_agency_id),
foreign key (customer_id) references Customers(customer_id)
);

create table Services( --
service_id int(20) unique primary key,
service_details text(200)
);

create table Service_Bookings(
booking_id int(20),
service_id int(20),
booking_start_date date,
booking_end_date date,
other_details text(200),
foreign key (booking_id) references Bookings(booking_id),
foreign key (service_id) references Services(service_id)
);

create table Airlines(
airline_id int(20),
airline_details text(200),
constraint airline_id foreign key (airline_id) references Services(service_id)
);

create table Cars(
car_id int(20),
car_details text(200),
constraint car_id foreign key (car_id) references Services(service_id)
);

create table Hotels(
hotel_id int(20),
hotel_details text(200),
constraint hotel_id foreign key (hotel_id) references Services(service_id)
);

create table Restaurants(
restaurant_id int(20),
restaurant_details text(200),
constraint restaurant_id foreign key (restaurant_id) references Services(service_id)
);

create table Staff_Information(
staff_id int(20) primary key,
staff_first_name varchar(30),
staff_last_name varchar(30),
staff_contact_number varchar(50),
staff_position varchar(30),
staff_salary int(30),
staff_email varchar(30)
);

create table Staff_Information_Addresses(
staff_id int(20),
staff_houseno varchar(30),
staff_street varchar(30),
staff_city varchar(30),
staff_zipcode int(30),
staff_state varchar(30),
staff_country varchar(30),
staff_address_id int(30) primary key,
foreign key (staff_id) references Staff_Information(staff_id)
);

create table Invoice(
invoice_id int(20) primary key,
booking_id int(20),
customer_id int(20),
service_id int(20),
payment_amount int(20),
foreign key (customer_id) references Customers(customer_id),
foreign key (booking_id) references Bookings(booking_id),
foreign key (service_id) references Service_Bookings(service_id)
);

create table Payments(
payment_id int(20) primary key,
invoice_id int(20),
customer_id int(20),
payment_date date,
other_details text(200),
foreign key (invoice_id) references Invoice(invoice_id),
foreign key (customer_id) references Customers(customer_id)
);

create table Sales_Period(
sales_period_id int primary key,
sales_period_start_date date,
sales_period_end_date date
); 

create table Sales_Staff(
discount_rate int(20),
customer_id int(20),
staff_id int(20),
payment_id int(20),
booking_id int(20),
sales_period_id int(20),
foreign key (customer_id) references Customers(customer_id),
foreign key (staff_id) references Staff_Information (staff_id),
foreign key (payment_id) references Payments (payment_id),
foreign key (booking_id) references Bookings (booking_id),
foreign key (sales_period_id) references Sales_Period (sales_period_id)
);


insert into Travel_Agencies 
values
(1000, 'travelAgency1'),
(1001, 'travelAgency2'),
(1002, 'travelAgency3'),
(1003, 'travelAgency4'),
(1004, 'travelAgency5'),
(1005, 'travelAgency6'),
(1006, 'travelAgency7'),
(1007, 'travelAgency8'),
(1008, 'travelAgency9'),
(1009, 'travelAgency10'),
(1010, 'travelAgency11'),
(1011, 'travelAgency12'),
(1012, 'travelAgency13'),
(1013, 'travelAgency14'),
(1014, 'travelAgency15'),
(1015, 'travelAgency16'),
(1016, 'travelAgency17'),
(1017, 'travelAgency18'),
(1018, 'travelAgency19'),
(1019, 'travelAgency20');

insert into Customers 
values
(2000, 'John','Paul', '1990-01-29', 'friends and/or family'),
(2001, 'Lee', 'Tan Ming', '1991-02-25', 'friends and/or family'),
(2002, 'Kee', 'En Ming', '1980-03-31', 'television'),
(2003, 'Ali', 'Baba', '1997-04-05', 'radio'),
(2004, 'Jacob', 'Wong', '1996-02-01', 'magazines'),
(2005, 'Nicole', 'Leong', '1997-03-16', 'magazines'),
(2006, 'Zara', 'Basyirah', '1998-06-30', 'friends and/or family'),
(2007, 'Wee', 'Ling Yin', '1967-08-31', 'television'),
(2008, 'Natalie', 'Leong', '1998-08-19', 'friends and/or family'),
(2009, 'Chai', 'Ervin', '1999-05-06', 'friends and/or family'),
(2010, 'Sia', 'Ming Yang', '2000-04-24', 'magazines'),
(2011, 'Chew', 'Jia Jer', '1992-03-01', 'friends and/or family'),
(2012, 'Malia', 'Lee', '1978-06-09', 'television'),
(2013, 'Sasha', 'Obama', '1979-07-01', 'friends and/or family'),
(2014, 'Malia', 'Obama', '1980-08-01', 'friends and/or family'),
(2015, 'Barack', 'Obama', '1990-01-01', 'television'),
(2016, 'Denzel', 'Washington', '1989-02-01', 'friends and/or family'),
(2017, 'George', 'Washington', '1987-01-30', 'friends and/or family'),
(2018, 'Barbara', 'Bush', '1968-02-25', 'radio'),
(2019, 'George', 'Bush', '1978-04-26', 'radio'),
(2020, 'Baba', 'Bubu', '1989-09-11', 'television'),
(2021, 'Abu', 'Ali', '1987-10-11', 'magazines');

insert into Customers_Addresses 
values
(3000, '1', 'street1', 'Kuala Lumpur', 43000,'Wilayah Persekutuan', 'Malaysia', 2000),
(3001, '2', 'street2', 'Georgetown ', 43001,'Papparich state', 'Malaysia', 2001),
(3002, '3', 'street3', 'Kuala Lumpur', 43002,'Wilayah Persekutuan', 'Malaysia', 2002),
(3003, '4', 'street4', 'Sydney', 43032,'New South Wales', 'Australia', 2003),
(3004, '5', 'street5', 'Shinjuku', 57000,'Akibahara', 'Japan', 2004),
(3005, '1A', 'street6', 'Harajuku', 67000,'Kyoto', 'Japan', 2005),
(3006, '2', 'street7', 'Melbourne', 57100,'New Castle', 'Australia', 2006),
(3007, '3', 'street8', 'Perth', 43021,'I dontknow', 'Australia', 2007),
(3008, '19', 'street9', 'New York', 56000,'Maybe', 'USA', 2008),
(3009, '12', 'street10', 'Las Vegas', 67100,'Secuti', 'USA', 2009),
(3010, '13', 'street11', 'Los Angeles', 32000,'Sakata', 'USA', 2010),
(3011, '14', 'street12', 'Johor Bahru', 67004,'Johor', 'Malaysia', 2011),
(3012, '15', 'street13', 'Barcelona', 46200,'Spanish', 'Spain', 2012),
(3013, '20', 'street14', 'Madrid', 56700,'Spanish', 'Spain', 2013),
(3014, '21', 'street15', 'Stockholm', 23400,'Pakistan', 'Sweden', 2014),
(3015, '25', 'street16', 'Shibuya', 45600,'Koyoto', 'Japan', 2015),
(3016, '26', 'street17', 'Seoul', 67800,'Samsung', 'Korea', 2016),
(3017, '30', 'street18', 'Busan', 33400,'Samsung', 'Korea', 2017),
(3018, '31', 'street19', 'Paris', 44500,'Samsung', 'France', 2018),
(3019, '41', 'street20', 'London', 22200,'New Castle', 'UK', 2019),
(3020, '12', 'street21', 'London', 22201,'New Castle', 'UK', 2020),
(3021, '11', 'street22', 'What', 55020,'I dono', 'Malaysia', 2021);

insert into Customers_Contacts
values
(4000, 2000, '012-231231', null, '03-3023425','READ@YMAIL.COM'),
(4001, 2001, '016-432423', '016-43275648', '03-4612893','GEMO@LMAIL.COM'),
(4002, 2002, '013-231412', null, '03-4259783','TATA@GH.COM'),
(4003, 2003, '011-432435', null, '03-4623783','TETE@GAGA.COM'),
(4004, 2004, '010-432422', null, '03-6147238','YAU@TUTA.COM'),
(4005, 2005, '017-432434', '016-745323', '03-1452978','NICOLE@YUMAIL.COM'),
(4006, 2006, '012-752133', null, '03-5123431','FAROG@YUMAIL.COM'),
(4007, 2007, '019-643624', null, '03-5231603','CAOP@YMAIL.COM'),
(4008, 2008, '017-675795', null, '03-4132523','YAYA@YMAIL.COM'),
(4009, 2009, '012-523515', null, '03-5263198','JUNFA@YUMAIL.COM'),
(4010, 2010, '014-427392', null, '03-4139782','STEW@P.COM'),
(4011, 2011, '015-403627', '016-745376', '03-5441982','ERHU@PAD.COM'),
(4012, 2012, '016-648921', null, '03-8953423','LEEM@PAD.COM'),
(4013, 2013, '017-526891', null, '03-8932641','OBA@GAGA.COM'),
(4014, 2014, '014-562983', null, '03-3023425','BAMA@GAGA.COM'),
(4015, 2015, '013-641928', '016-756865', '03-7849233','OMBAK@TUTA.COM'),
(4016, 2016, '014-537192', null, '03-6423832','WASH@TUTA.COM'),
(4017, 2017, '016-469132', null, '03-4252563','TONTON@YUMAIL.COM'),
(4018, 2018, '016-523653', '016-466467', '03-5323332','PRES@YMAIL.COM'),
(4019, 2019, '014-412613', null, '03-4231352','NICEBUSH@YMAIL.COM'),
(4020, 2020, '013-223232', '013-323232', null,'BUBU@TUTA.COM'),
(4021, 2021 ,'012-222222', null, null,'AA@TUTA.COM');

insert into Bookings
values
(12000, 2000, 'cancelled', 'unpaid', 1000, '2015-01-02', 'details1'),
(12001, 2001, 'approved', 'paid', null, '2015-02-03', 'details2'),
(12002, 2002, 'cancelled', 'unpaid', 1002, '2015-04-05', 'details3'),
(12003, 2003, 'approved', 'paid', null, '2015-05-06', 'details4'),
(12004, 2004, 'cancelled', 'unpaid', 1003, '2015-12-31', 'details5'),
(12005, 2005, 'approved', 'paid', null, '2015-12-31', 'details6'),
(12006, 2006, 'cancelled', 'paid', null, '2016-01-02', 'details7'),
(12007, 2007, 'approved', 'unpaid', 1007, '2016-02-03', 'details8'),
(12008, 2008, 'approved', 'paid', null, '2016-03-05', 'details9'),
(12009, 2009, 'approved', 'unpaid', 1002, '2016-04-30', 'details10'),
(12010, 2010, 'cancelled', 'paid', null, '2016-05-29', 'details11'),
(12011, 2011, 'approved', 'unpaid', 1011, '2016-06-28', 'details12'),
(12012, 2012, 'approved', 'paid', null, '2017-01-02', 'details13'),
(12013, 2013, 'cancelled', 'paid', null, '2017-02-03', 'details14'),
(12014, 2014, 'approved', 'unpaid', 1011, '2017-03-05', 'details15'),
(12015, 2015, 'approved', 'paid', null, '2017-05-01', 'details16'),
(12016, 2016, 'cancelled', 'paid', null, '2017-05-02', 'details17'),
(12017, 2017, 'approved', 'unpaid', 1017, '2017-06-28', 'details18'),
(12018, 2018, 'approved', 'paid', null, '2017-08-31', 'details19'),
(12019, 2019, 'approved', 'unpaid', null, '2017-12-31', 'details20'),
(12020, 2020, 'cancelled', 'paid', null, '2015-02-02', 'details21'),
(12021, 2021, 'approved', 'paid', null, '2015-03-31', 'details22'),
(12022, 2013, 'approved', 'paid', null, '2015-08-27', 'details23'),
(12023, 2014, 'cancelled', 'paid', null, '2016-03-20', 'details24'),
(12024, 2002, 'approved', 'paid', null, '2016-08-19', 'details25'),
(12025, 2003, 'cancelled', 'paid', null, '2016-09-01', 'details26'),
(12026, 2004, 'approved', 'paid', null, '2017-01-11', 'details27'),
(12027, 2012, 'approved', 'paid', null, '2017-03-02', 'details28'),
(12028, 2015, 'cancelled', 'paid', null, '2017-04-20', 'details29');

insert into Services
values
(6000, 'airlines'),
(6003, 'airlines'),
(6004, 'airlines'),
(6005, 'airlines'),
(6006, 'airlines'),
(6007, 'airlines'),
(6008, 'airlines'),
(6009, 'airlines'),
(6010, 'airlines'),
(6011, 'airlines'),
(6012, 'airlines'),
(6013, 'airlines'),
(6014, 'airlines'),
(6015, 'airlines'),
(6016, 'airlines'),
(6017, 'airlines'),
(6018, 'airlines'),
(6019, 'airlines'),
(7000, 'cars'),
(7001, 'cars'),
(7002, 'cars'),
(7003, 'cars'),
(7004, 'cars'),
(7005, 'cars'),
(7006, 'cars'),
(7007, 'cars'),
(7008, 'cars'),
(7009, 'cars'),
(7010, 'cars'),
(7011, 'cars'),
(7012, 'cars'),
(7013, 'cars'),
(7014, 'cars'),
(7015, 'cars'),
(7016, 'cars'),
(7017, 'cars'),
(7018, 'cars'),
(7019, 'cars'),
(8000, 'hotels'),
(8001, 'hotels'),
(8002, 'hotels'),
(8003, 'hotels'),
(8004, 'hotels'),
(8005, 'hotels'),
(8006, 'hotels'),
(8007, 'hotels'),
(8008, 'hotels'),
(8009, 'hotels'),
(8010, 'hotels'),
(8011, 'hotels'),
(8012, 'hotels'),
(8013, 'hotels'),
(8014, 'hotels'),
(8015, 'hotels'),
(8016, 'hotels'),
(8017, 'hotels'),
(8018, 'hotels'),
(8019, 'hotels'),
(9000, 'restaurant'),
(9001, 'restaurant'),
(9002, 'restaurant'),
(9003, 'restaurant'),
(9004, 'restaurant'),
(9005, 'restaurant'),
(9006, 'restaurant'),
(9007, 'restaurant'),
(9008, 'restaurant'),
(9009, 'restaurant'),
(9010, 'restaurant'),
(9011, 'restaurant'),
(9012, 'restaurant'),
(9013, 'restaurant'),
(9014, 'restaurant'),
(9015, 'restaurant'),
(9016, 'restaurant'),
(9017, 'restaurant'),
(9018, 'restaurant'),
(9019, 'restaurant');

insert into Service_Bookings
values
(12000, 6000, '2015-01-02', '2015-01-04', 'details 1'),
(12000, 7008, '2015-01-02', '2015-01-03', 'details 2'),
(12000, 8003, '2015-01-02', '2015-01-04', 'details 5'),
(12001, 6003, '2015-02-03', '2015-02-06', 'details 2'),
(12001, 7000, '2015-02-03', '2015-02-06', 'details 5'),
(12001, 8006, '2015-02-03', '2015-02-06', 'details 2'),
(12002, 6010, '2015-04-05', '2015-04-09', 'details 3'),
(12002, 8006, '2015-04-05', '2015-04-09', 'details 10'),
(12002, 9000, '2015-04-05', '2015-04-09', 'details 7'),
(12003, 6015, '2015-05-06', '2015-05-10', 'details 4'),
(12003, 7012, '2015-05-06', '2015-05-10', 'details 11'),
(12004, 6013, '2015-12-31', '2016-01-02', 'details 5'),
(12004, 7001, '2015-12-31', '2016-01-02', 'details 10'),
(12004, 8014, '2015-12-31', '2016-01-02', 'details 13'),
(12004, 9019, '2015-12-31', '2016-01-02', 'details 20'),
(12005, 6017, '2015-12-31', '2016-01-05', 'details 6'),
(12005, 8006, '2015-12-31', '2016-01-05', 'details 15'),
(12005, 9019, '2015-12-31', '2016-01-05', 'details 17'),
(12006, 6019, '2016-01-02', '2016-01-04', 'details 7'),
(12006, 7012, '2016-01-02', '2016-01-04', 'details 4'),
(12007, 7000, '2016-02-03', '2016-02-08', 'details 8'), 
(12007, 6000, '2016-02-03', '2016-02-08', 'details 10'), 
(12007, 8014, '2016-02-03', '2016-02-08', 'details 1'), 
(12007, 9019, '2016-02-03', '2016-02-08', 'details 3'), 
(12008, 7001, '2016-03-05', '2016-03-10', 'details 9'),
(12008, 6003, '2016-03-05', '2016-03-10', 'details 13'),
(12009, 6000, '2016-04-30', '2016-05-1', 'details 10'),
(12009, 7008, '2016-04-30', '2016-05-1', 'details 2'),
(12009, 8014, '2016-04-30', '2016-05-1', 'details 4'),
(12009, 9000, '2016-04-30', '2016-05-1', 'details 19'),
(12010, 6015, '2016-05-29', '2016-05-31', 'details 11'),
(12010, 8014, '2016-05-29', '2016-05-31', 'details 13'),
(12010, 9002, '2016-05-29', '2016-05-31', 'details 1'),
(12011, 7012, '2016-06-28', '2016-06-30', 'details 19'),
(12012, 8003, '2017-01-02', '2017-01-04', 'details 13'),
(12012, 6000, '2017-01-02', '2017-01-04', 'details 3'),
(12012, 7012, '2017-01-02', '2017-01-04', 'details 7'),
(12012, 6015, '2017-01-02', '2017-01-04', 'details 13'),
(12013, 8006, '2017-02-03', '2017-02-06', 'details 14'),
(12013, 9019, '2017-02-03', '2017-02-06', 'details 2'),
(12014, 8014, '2017-03-05', '2017-03-07', 'details 15'),
(12015, 6017, '2017-05-01', '2017-05-04', 'details 16'),
(12015, 8006, '2017-05-01', '2017-05-04', 'details 2'),
(12015, 9000, '2017-05-01', '2017-05-04', 'details 11'),
(12016, 9000, '2017-05-02', '2017-05-05', 'details 17'),
(12017, 9002, '2017-06-28', '2017-06-30', 'details 18'),
(12017, 6010, '2017-06-28', '2017-06-30', 'details 1'),
(12018, 7000, '2017-08-31', '2017-08-31', 'details 19'),
(12018, 9017, '2017-08-31', '2017-08-31', 'details 14'),
(12019, 9019, '2017-12-31', '2017-12-31', 'details 20'),
(12020, 6000, '2017-01-01', '2017-01-01', 'details 21'),
(12021, 7000, '2017-02-02', '2017-02-02', 'details 22'),
(12022, 8001, '2017-03-03', '2017-03-03', 'details 24'),
(12023, 7005, '2017-04-04', '2017-04-04', 'details 25'),
(12024, 9005, '2017-05-05', '2017-05-05', 'details 26'),
(12025, 9006, '2017-06-06', '2017-06-06', 'details 27'),
(12026, 7008, '2017-07-07', '2017-07-07', 'details 28'),
(12027, 7001, '2017-08-08', '2017-08-08', 'details 29'),
(12028, 6004, '2017-09-09', '2017-09-09', 'details 30');

insert into Airlines
values
(6000, 'airlines1'),
(6003, 'airlines4'),
(6010, 'airlines11'),
(6013, 'airlines14'),
(6015, 'airlines16'),
(6017, 'airlines18'),
(6019, 'airlines20');

insert into Cars
values
(7000, 'car1'),
(7001, 'car2'),
(7008, 'car9'),
(7012, 'car13');

insert into Hotels
values
(8003, 'hotel4'),
(8006, 'hotel7'),
(8014, 'hotel15');

insert into Restaurants
values 
(9000, 'restaurant1'),
(9002, 'restaurant3'),
(9019, 'restaurant19'),
(9017, 'restaurant17');

insert into Staff_Information
values
(11000, 'Abu', 'Lee', '011-111111', 'staff_position1',1000,'LCA@DSV.COM'),
(11001, 'Gariel', 'Wong', '011-111112', 'staff_position2', 2000, 'WG@DSV.COM'),
(11002, 'Justin', 'Foley', '011-111113', 'staff_position3',3000, 'BH@DSV.COM' ),
(11003, 'Hannah', 'Baker', '011-111114', 'staff_position4',1000,'HB@DSV.COM'),
(11004, 'Clay', 'Jensen',  '011-111115', 'staff_position1',2500, 'JC@DSV.COM'),
(11005, 'Jessica', 'Davies', '011-111116', 'staff_position4', 5000, 'DJ@DSV.COM'),
(11006, 'Sam', 'Smith', '011-111117', 'staff_position3', 3000,'SS@DSV.COM'),
(11007, 'Jamie', 'Addams', '011-111118', 'staff_position2',4000,'AJ@DSV.COM'),
(11008, 'Garrett', 'Buttler', '011-111119', 'staff_position1',2000,'BG@DSV.COM'),
(11009, 'Simmie', 'Lim', '011-111120', 'staff_position5',4000,'LS@DSV.COM'),
(11010, 'Sammie', 'Lim', '011-111121', 'staff_position5', 4000,'LSA@DSV.COM'),
(11011, 'Dennis', 'Leong', '011-111122', 'staff_position2', 4000,'LD@DSV.COM'),
(11012, 'Zara', 'Basyirah', '011-111123', 'staff_position1', 1000,'BZ@DSV.COM'),
(11013, 'Minnie', 'Mouse', '011-111124', 'staff_position2',  4000,'MM@DSV.COM'),
(11014, 'Mickey', 'Mouse', '011-111125', 'staff_position1',  3000,'MCM@DSV.COM'),
(11015, 'Goofy', 'Dog', '011-111126', 'staff_position3', 900,'DG@DSV.COM'),
(11016, 'Donald', 'Duck', '011-111127', 'staff_position2', 1000,'DD@DSV.COM'),
(11017, 'Jeffrey', 'Cheah', '011-111128', 'staff_position1', 800,'CJ@DSV.COM'),
(11018, 'Tony', 'Fernandes', '011-111129', 'staff_position4', 4000,'FT@DSV.COM'),
(11019, 'Falken', 'Cheah', '011-111130', 'staff_position1', 4000,'CF@DSV.COM');

insert into Staff_Information_Addresses
values
(11000, '1A', 'Putra Permai', 'Subang Jaya', 667456,'Selangor','Malaysia', 2345),
(11001, '3', 'Jade Hills', 'Beijing' , 89876,'Dingdon','China', 2000),
(11002, '3B', 'Jade', 'Bandar Sunway', 98086,'Selangor','Malaysia', 3000),
(11003, '11-3A', 'Steven Hills', 'Sydney', 55546,'New South Wales','Australia', 5567),
(11004, '77', '123ABC','Peking', 43543,'DongDong','China', 6678),
(11005, '73A', 'Datok Saya', 'Jusco', 76577,'Selangor','Malaysia', 9988),
(11006, '67', 'Putra Bistari', 'Jaya Jusco', 43546,'Selangor','Malaysia', 4535),
(11007, '55', 'Putra Indah', 'AEON', 3432488,'Selangor','Malaysia', 4536),
(11008, '8', '10/2B Putra Bistari', 'Kayangan', 9090888,'Selangor','Malaysia',6345),
(11009, '90', 'Pocong 10', 'Koyong', 43432,'Kelantan','Malaysia', 6346),
(11010, '123A', 'Seksyen 14', 'Koyong', 132356,'Kelantan','Malaysia', 9346),
(11011, '51', '5/6 Usj 5', 'Koyong', 876487,'Kelantan','Malaysia', 7890),
(11012, '23-16G', '4/2A Usj 4', 'Kajang', 434535,'Selangor','Malaysia', 9080),
(11013, '56', '5/3H Usj 13', 'Putra Heights', 43543,'Selangor','Malaysia', 9111),
(11014, '9', 'MiMiMo OP', 'Lolock', 22343,'Surabaya','Indonesia', 7796),
(11015, '8', 'Tan Cheng Lock', 'Kota Bharu', 234439,'Kelantan','Malaysia', 7896),
(11016, '12', 'jalan Abdul Abu', 'Gelang Patah',29832,'Johor','Malaysia', 8888),
(11017, '65', 'Apa dia','Gelang Patah',128329,'Johor','Malaysia', 9999),
(11018, '45', 'ByeBye Zone', 'Putra Heights',132190,'Selangor','Malaysia', 8999),
(11019, '2', '4/5K Abababa 7', 'Lovisa',46182,'Perlis','Malaysia', 9806);

insert into Invoice
values
(14001, 12000, 2000, 6000, 6000),
(14002, 12000, 2000, 7008, 1000),
(14003, 12000, 2000, 8003, 800),
(14004, 12001, 2001, 6003, 600),
(14005, 12001, 2001, 7000, 700),
(14006, 12001, 2001, 8006, 800),
(14007, 12002, 2002, 6010, 600),
(14008, 12002, 2002, 8006, 80 ),
(14009, 12002, 2002, 9000, 800),
(14010, 12003, 2003, 6015, 674),
(14011, 12003, 2003, 7012, 7939),
(14012, 12004, 2004, 7001, 44),
(14013, 12004, 2004, 8014, 231),
(14014, 12004, 2004, 9019, 673),
(14015, 12004, 2004, 6013, 317),
(14016, 12005, 2005, 6017, 2626),
(14017, 12005, 2005, 8006, 3616),
(14018, 12005, 2005, 9019, 221),
(14019, 12006, 2006, 6019, 4829),
(14020, 12006, 2006, 7012, 223),
(14021, 12007, 2007, 7000, 842),
(14022, 12007, 2007, 6000, 281),
(14023, 12007, 2007, 8014, 3216),
(14024, 12007, 2007, 9019, 231),
(14025, 12008, 2008, 7001, 417),
(14026, 12008, 2008, 6003, 3232),
(14027, 12009, 2009, 6000, 121),
(14028, 12009, 2009, 7008, 3213),
(14029, 12009, 2009, 8014, 431),
(14030, 12009, 2009, 9000, 321),
(14031, 12010, 2010, 6015, 219),
(14032, 12010, 2010, 8014, 99),
(14033, 12010, 2010, 9002, 321),
(14034, 12011, 2011, 7012, 3123),
(14035, 12012, 2012, 8003, 31),
(14036, 12012, 2012, 6000, 565),
(14037, 12012, 2012, 7012, 31),
(14038, 12012, 2012, 6015, 322),
(14039, 12013, 2013, 8006, 321),
(14040, 12013, 2013, 9019, 55),
(14041, 12014, 2014, 8014, 369),
(14042, 12015, 2015, 6017, 322),
(14043, 12015, 2015, 8006, 328),
(14044, 12015, 2015, 9000, 99),
(14045, 12016, 2016, 9000, 100),
(14046, 12017, 2017, 9002, 326),
(14047, 12017, 2017, 6010, 312),
(14048, 12018, 2018, 7000, 329),
(14049, 12018, 2018, 9017, 49),
(14050, 12019, 2019, 9019, 3257),
(14051, 12020, 2020, 6000, 100),
(14052, 12021, 2021, 7000, 220),
(14053, 12022, 2013, 8001, 202),
(14054, 12023, 2014, 7005, 303),
(14055, 12024, 2002, 9005, 304),
(14056, 12025, 2003, 9006, 505),
(14057, 12026, 2004, 7008, 606),
(14058, 12027, 2012, 7001, 707),
(14059, 12028, 2015, 6004, 808);

insert into Payments
values
(10000, 14001, 2000, '2015-02-03', 'otherdetails1'),
(10001, 14003, 2000, '2015-05-06', 'otherdetails2'),
(10002, 14005, 2001, '2015-12-31', 'otherdetails3'),
(10003, 14006, 2001, '2016-01-02', 'otherdetails4'),
(10004, 14008, 2002, '2016-03-05', 'otherdetails5'),
(10005, 14010, 2003, '2016-05-29', 'otherdetails6'),
(10006, 14012, 2004, '2017-01-02', 'otherdetails7'),
(10007, 14013, 2004, '2017-02-03', 'otherdetails8'),
(10008, 14015, 2004, '2017-05-01', 'otherdetails9'),
(10009, 14016, 2005, '2017-05-02', 'otherdetails10'),
(10010, 14018, 2005, '2017-08-31', 'otherdetails11'),
(10011, 14020, 2006, '2015-02-02', 'otherdetails12'),
(10012, 14021, 2007, '2015-03-31', 'otherdetails13'),
(10013, 14022, 2007, '2015-08-27', 'otherdetails14'),
(10014, 14023, 2007, '2016-03-20', 'otherdetails15'),
(10015, 14024, 2007, '2016-08-19', 'otherdetails16'),
(10016, 14025, 2008, '2016-09-01', 'otherdetails17'),
(10017, 14026, 2009, '2017-01-11', 'otherdetails18'),
(10018, 14027, 2009, '2017-03-02', 'otherdetails19'),
(10019, 14028, 2009, '2017-04-20', 'otherdetails20'),
(10020, 14051, 2020, '2015-02-03', 'otherdetails21'),
(10021, 14054, 2014, '2016-03-21', 'otherdetails22'),
(10022, 14056, 2003, '2016-09-02', 'otherdetails23'),
(10023, 14059, 2015, '2017-04-21', 'otherdetails24');

insert into Sales_Period
values
(13000, '2015-01-01', '2015-02-11'),
(13001, '2015-02-01', '2015-03-11'),
(13002, '2015-03-01', '2015-04-11'),
(13003, '2015-04-01', '2015-05-11'),
(13004, '2015-05-01', '2015-06-11'),
(13005, '2015-06-01', '2015-07-11'),
(13006, '2016-01-01', '2016-02-11'),
(13007, '2016-02-01', '2016-03-11'),
(13008, '2016-02-01', '2016-04-11'),
(13009, '2016-02-01', '2016-05-11'),
(13010, '2016-02-01', '2016-06-11'),
(13011, '2016-02-01', '2016-07-11'),
(13012, '2017-01-01', '2016-02-11'),
(13013, '2017-02-01', '2015-03-11'),
(13014, '2017-03-01', '2015-04-11'),
(13015, '2017-04-01', '2015-05-11'),
(13016, '2017-05-01', '2015-06-11'),
(13017, '2017-06-01', '2015-07-11'),
(13018, '2017-07-01', '2015-08-11'),
(13019, '2017-08-01', '2015-09-11'),
(13020, '2017-09-01', '2015-10-11');

insert into Sales_Staff
values
(10, 2001, 11000, 10000, 12001, 13000),
(null, 2003, 11005, 10001, 12003, null),
(10, 2005, 11011, 10002, 12005, 13005),
(20, 2006, 11018, 10003, 12006, 13010),
(30, 2008, 11001, 10004, 12008, 13018),
(10, 2010, 11002, 10005, 12010, 13001),
(null, 2012, 11005, 10006, 12012, null),
(10, 2013, 11000, 10007, 12013, 13010),
(null, 2015, 11011, 10008, 12015, null),
(20, 2016, 11018, 10009, 12016, 13000),
(10, 2018, 11003, 10010, 12018, 13008),
(null, 2020, 11005, 10011, 12020, null),
(10, 2021, 11001, 10012, 12021, 13018),
(20, 2013, 11002, 10013, 12022, 13002),
(null, 2004, 11005, 10014, 12023, 13001),
(10, 2002, 11000, 10015, 12024, 13005),
(null, 2003, 11001, 10016, 12025, null),
(null, 2004, 11011, 10017, 12026, null),
(10, 2012, 11018, 10018, 12027, 13002),
(null, 2015, 11000, 10019, 12028, 13010);

create view LossCancelled as
select distinct b.booking_id, p.payment_date, i.payment_amount, b.booking_outcome, b.payment_status
from Payments p, Bookings b, Sales_Staff s, Invoice i
where b.booking_outcome in ('cancelled') 
and b.payment_status in ('paid') 
and s.discount_rate is null
and i.invoice_id = p.invoice_id
and i.booking_id = b.booking_id
and i.booking_id = s.booking_id
order by year(payment_date) asc;
select * from LossCancelled;
drop table if exists LossDiscount;

create view LossDiscount as
select b.booking_id, p.payment_date, round((i.payment_amount*(100/(100-s.discount_rate))-i.payment_amount), 2)as payment_amount,
 b.booking_outcome, b.payment_status, s.discount_rate
from Payments p, Bookings b, Sales_Staff s, Invoice i
where b.booking_outcome in ('approved')
and b.payment_status in ('paid')
and s.discount_rate is not null
and b.booking_id = i.booking_id
and i.invoice_id = p.invoice_id
and i.booking_id = s.booking_id
order by year(payment_date) asc;

create view Loss as
select year(payment_date)payment_date, sum(payment_amount) as totalLoss
from(
select payment_date,payment_amount
from LossCancelled 
union all
select payment_date,payment_amount
from LossDiscount 
)t
group by year(payment_date);


create view Income as
select sum(i.payment_amount) as totalIncome, year(p.payment_date)payment_date
from Payments p, Bookings b, Invoice i
where b.booking_id = i.booking_id
and i.invoice_id = p.invoice_id
and b.booking_outcome in ('approved')
and b.payment_status in ('paid')
group by year (p.payment_date) asc;

select * from Income;

create table Projections as
select l.payment_date
from Loss l;

alter table Projections
add column revenue int(20); -- 4

delimiter //
create procedure projections()
begin
    declare counter int default 0;
	declare i_date year;
    declare l_date year;
	declare income int;
    declare loss int;
    declare cursors cursor for select i.payment_date, l.payment_date, totalIncome, totalLoss from Income i, Loss l;
    declare continue handler for not found set counter = 1;
    
    open cursors;
    repeat
    fetch cursors into i_date, l_date, income, loss;
    update Projections
    set revenue = income - loss
    where payment_date = i_date
    and payment_date = l_date; 
until counter
end repeat;	
end //
delimiter ;

call projections();
select * from Projections;

-- a
select customer_id, booking_id, date_of_booking
from Bookings
where month(date_of_booking) between 1 and 12 
and year(date_of_booking) = 2017;

-- b
select count(booking_id) as number_of_booking
from Bookings
where year(date_of_booking) between 2015 and 2017; 

-- c
select count(customer_id) as paid_booking_staff 
from Bookings b
where travel_agency_id is null
and payment_status in ('paid')
and year(date_of_booking) = 2017;

-- d
select s.staff_id, concat(ss.staff_first_name, ' ', ss.staff_last_name)as fullName, count(s.payment_id) as highest_sales
from Payments p, Sales_Staff s, Staff_Information ss
where (p.payment_id=s.payment_id)
and year(p.payment_date) = 2017
and ss.staff_id = s.staff_id
group by staff_id
having count(s.payment_id) = (
select max(st)
from (
select s.staff_id ,count(s.staff_id)st
from Payments p, Sales_Staff s
where year(p.payment_date) = 2017
and (s.payment_id = p.payment_id)
group by staff_id)t
);

-- e.
select h.hotel_details as hotelName
from Hotels h, Service_Bookings s
where (h.hotel_id=s.service_id)
group by h.hotel_details;

-- f
select a.customer_id, concat(c.first_name, ' ', c.last_name)as fullName, a.customer_city as Town
from Customers_Addresses a, Customers c
where a.customer_id = c.customer_id;

-- question g.
select cc.customer_id,
    concat(c.first_name, ' ', c.last_name)as fullName,
    cc.customer_contactnumber,
    cc.customer_contactnumber2,
    cc.customer_officenumber
from Customers_Contacts cc, Customers c
where cc.customer_id = c.customer_id;

-- report
select customer_country as Country, count(customer_country)AS CustomerCounts, sum(i.payment_amount)
from Customers_Addresses ca, Bookings b
join invoice i
on i.customer_id = b.customer_id
where b.customer_id = ca.customer_id
and b.booking_outcome = 'approved'
and b.payment_status = 'paid'
group by customer_country;

-- report
drop view if exists service_all;
drop procedure if exists year1;
drop procedure if exists year2;
drop procedure if exists percentage_change;
drop table if exists temp1;
drop table if exists temp2;
drop table if exists master_temp;
create view service_all as 
select car_details as service_name, car_id as service_id from Cars
union all 
select airline_details as service_name, airline_id as service_id  from Airlines
union all 
select hotel_details as service_name, hotel_id as service_id from Hotels
union all 
select restaurant_details as service_name, restaurant_id as service_id  from Restaurants;

delimiter //
create procedure year1(in param1 int(100))
begin
create temporary table temp1  as
select s.service_id, d.service_name, ifnull(count(s.booking_id), 0)booking_count_year1
from service_bookings s
left outer join service_all d
on d.service_id = s.service_id
where year(s.booking_start_date) = param1
group by service_id
order by service_id asc;
commit;
end //
delimiter ;

delimiter //
create procedure year2(in param1 int(100))
begin
  create temporary table temp2  as
select s.service_id, d.service_name, ifnull(count(s.booking_id), 0)booking_count_year2
from service_bookings s
left outer join service_all d
on d.service_id = s.service_id
where year(s.booking_start_date) = param1
group by service_id
order by service_id asc;
commit;

end //
delimiter ;

delimiter //
create procedure percentage_change(in param1 int(100),in param2 int(100))
begin
   call year1(param1);
   call year2(param2);
   
create temporary table master_temp as 
select a.service_id, a.service_name, ifnull(a.booking_count_year1,0), ifnull(b.booking_count_year2,0), 
ifnull(round((((a.booking_count_year1 - b.booking_count_year2)/a.booking_count_year1)*100),2),0) as percentage_change
from temp1 a
left join temp2 b
on b.booking_count_year2 and a.service_id = b.service_id
group by service_name
order by service_name;
commit;
end //
delimiter ;

call percentage_change(2016,2017);
select*from master_temp;

-- report
select ss.sales_period_id, count(ss.sales_period_id), sp.sales_period_start_date, sp.sales_period_end_date
from Sales_Period sp, Sales_Staff ss
where (ss.sales_period_id = sp.sales_period_id) 
group by sales_period_id
order by count(sales_period_id) desc; 

-- report 
select c.last_name, cc.customer_email, ca.customer_city, ca.customer_country, ca.customer_zipcode
from customers c, customers_addresses ca, Customers_Contacts cc
join bookings b
where b.payment_status = 'paid'
and b.booking_outcome = 'approved'
and (b.customer_id = c.customer_id)
and (c.customer_id = ca.customer_id)
and (ca.customer_id = cc.customer_id)
order by last_name asc;

-- report
select find_out_details, count(find_out_details) from Customers c, Bookings b
where b.customer_id = c.customer_id
and b.payment_status = 'paid'
group by find_out_details
order by count(find_out_details) asc;

drop procedure if exists check_staff_information;
drop procedure if exists check_invoice;
drop procedure if exists check_sales_staff;
drop trigger if exists staff_information_before_insert;
drop trigger if exists staff_information_before_update ;
drop trigger if exists sales_staff_before_update;
drop trigger if exists sales_staff_before_insert ;
drop trigger if exists invoice_before_update ;
drop trigger if exists  invoice_before_insert;

delimiter //
create procedure check_staff_information (
		in staff_salary int(30)
        )
begin
	if staff_salary < 0  
    or staff_salary > 6000
    then
		signal sqlstate '45000'
			set message_text = 'check constraint on staff_information.staff_salary failed ababa';

		end if;
end //
delimiter ;

-- call check_staff_information(6500);

delimiter //

create procedure check_sales_staff (
        in discount_rate int(30)
        )
begin
        
	if discount_rate < 0
    or discount_rate > 50
	then 
		signal sqlstate '45000'
			set message_text = 'check constraint on sales_staff.discount_rate failed';
	
		end if;
            
end //
delimiter ;

-- call check_sales_staff(60);

delimiter //
create procedure check_payments(
        in payment_amount int(30)
        )
begin

	if payment_amount < 0
    then
		signal sqlstate '45000'
			set message_text = 'check constraint on payments.payment_amount';
            
		end if;
end //
delimiter ;
-- call check_payments(-1);

delimiter //

create procedure check_invoice(
        in payment_amount int(30)
        )
begin

	if payment_amount < 0
    then
		signal sqlstate '45000'
			set message_text = 'check constraint on invoice.payment_amount';
            
		end if;
end //
delimiter ;

call check_invoice(0); 

delimiter //
create trigger staff_information_before_update 
before update on staff_information
for each row
begin
	call check_staff_information(new.staff_salary);
end //
delimiter ;

delimiter //
create trigger staff_information_before_insert 
before insert on staff_information
for each row
begin
	call check_staff_information(new.staff_salary);
end //
delimiter ;


delimiter //
create trigger sales_staff_before_update 
before update on sales_staff
for each row
begin
	call check_sales_staff(new.discount_rate);
end //
delimiter ;

delimiter //
create trigger sales_staff_before_insert 
before insert on sales_staff
for each row
begin
	call check_sales_staff(new.discount_rate);
end //
delimiter ;

delimiter //
create trigger invoice_before_update 
before update on invoice
for each row
begin
	call check_invoice(new.payment_amount);
end //
delimiter ;

delimiter //
create trigger invoice_before_insert 
before insert on invoice
for each row
begin
	call check_invoice(new.payment_amount);
end //
delimiter ;

-- report
alter table Staff_Information
add staff_sales_salary_raised int(20),
add salary_projection int(20);

delimiter //
create procedure staff_salary_raise(in percentage_change double, in projection_years int)
begin 
	declare counter int default 0;
    declare ss_id int;
    declare salary int;
    declare cursors cursor for select ss.staff_id, staff_salary from Staff_Information s, Sales_Staff ss; -- , staff_address_details
    declare continue handler for not found set counter = 1;
    
    open cursors;
    repeat
		fetch cursors into ss_id, salary;
        update Staff_Information
        set staff_sales_salary_raised = salary * (1+percentage_change),
         salary_projection = salary * (1 + percentage_change) * 12 * projection_years
        where staff_id = ss_id
        and staff_salary = salary;
        until counter
        end repeat;
end //
delimiter ;

select * from Staff_information;
call staff_salary_raise(0.8, 2);
select * from Staff_information;





        
        
        
        
    
	
