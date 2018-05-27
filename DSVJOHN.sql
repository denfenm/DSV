drop database if exists dsv;
create database dsv;
use dsv;

create table Travel_Agencies(
travel_agency_id int(20) primary key,
travel_agency_details text  
);

create table Customers(
customer_id int(20),
customer_name varchar(30), -- improvement
-- customer_address_id int,
-- customer_contact_id int,
primary key (customer_id)
-- foreign key (customer_address_id) references Customers_Addresses(customer_address_id),
-- foreign key (customer_contact_id) references Customers_Contact(customer_contact_id)
);

create table Customers_Addresses(
address_id int(20),
customer_houseno int,
customer_street varchar(30),
customer_city varchar(30),
customer_zipcode int,
customer_country varchar(30),
customer_id int,
foreign key  (customer_id) references Customers(customer_id));

/* create table Customers_Addresses(
customer_address_id int,
customer_id int,
address_id int,
date_from date,
date_to date,
primary key (customer_address_id),
foreign key (customer_id) references Customers(customer_id),
foreign key (address_id) references Addresses(address_id));
*/

create table Contacts(
contact_id int(20) primary key,
customer_id int(20),
customer_contactnumber varchar(30),
customer_contactnumber2 varchar(30),
customer_officenumber varchar(30),
foreign key (customer_id) references Customers(customer_id)
);

create table Customers_Contact (
customer_contact_id int(20),
contact_id int(20),
customer_id int(20),
-- Imp date_from date,
-- Imp date_to date,
primary key (customer_contact_id),
foreign key (customer_id) references Customers(customer_id),
foreign key (contact_id) references Contacts(contact_id));

create table Ref_Booking_Outcomes (
outcome_code int(20) primary key,
outcome_description text);

create table Ref_Booking_Status (
status_code int(20) primary key,
status_description text);

create table Bookings(
booking_id int(20) primary key,
customer_id int(20),
outcome_code int(20),
status_code int(50),
travel_agency_id int(20),
date_of_booking date,
booking_details text,

foreign key (customer_id) references Customers(customer_id),
foreign key (outcome_code) references Ref_Booking_Outcomes(outcome_code),
foreign key (status_code) references Ref_Booking_Status(status_code),
foreign key (travel_agency_id) references Travel_Agencies(travel_agency_id)
);

create table Services(
service_id int(20) unique primary key,
service_details text
);

create table Service_Bookings(
booking_id int(20),
service_id int(20),
booking_start_date date,
booking_end_date date,
other_details text,
foreign key (booking_id) references Bookings(booking_id),
foreign key (service_id) references Services(service_id)
);

create table Airlines(
airline_id int(20),
airline_details text,
constraint airline_id foreign key (airline_id) references Services(service_id)
);

create table Cars(
car_id int(20),
car_details text,
constraint car_id foreign key (car_id) references Services(service_id)
);

create table Hotels(
hotel_id int(20),
hotel_details text,
constraint hotel_id foreign key (hotel_id) references Services(service_id)
);

create table Restaurants(
restaurant_id int(20),
restaurant_details text,
constraint restaurant_id foreign key (restaurant_id) references Services(service_id)
);


create table Payments(
payment_id int(20) primary key,
booking_id int(20),
payment_amount int(50),
payment_date date,
other_details text,

foreign key (booking_id) references Bookings(booking_id)
);

create table Staff_Information(
staff_id int primary key,
staff_first_name varchar(30),
staff_last_name varchar(30),
staff_contact_number int(30),
staff_position varchar(30),
staff_address_details varchar(30),
staff_salary int(30),

foreign key (staff_salary) references Staff_salary(staff_salary));



create table Sales_Staff(
sales_first_date date,
sales_end_date date,
discount_rate int(20),
customer_id int(20),
staff_id int(20),
payment_id int(20),
booking_id int(20),

foreign key (staff_id) references Staff_Information (staff_id),
foreign key (payment_id) references Payments (payment_id),
foreign key (booking_id) references Bookings (booking_id));

 -- sales period remove because it moved to sales (sales_start_date & sales_end_date).
/*create table Sales_Period(
sales_period_id int primary key,
sales_period_start_date date,
sales_period_end_date date,
discount_rate int,
payment_id int,
foreign key (payment_id) references Payments(payment_id)); 

-- 
create table Expenses(
-- expenses_id int primary key,
staff_salary int,
house_expenses int,
car_expenses int,
airline_expenses int,
hotel_expenses int,
maintenance int,
Years year,
foreign key (staff_salary) references Staff_salary(staff_salary)); 
*/
/*select Years, (payment_amount - (staff_salary + house_expenses+ car_expenses + airline_expenses+ hotel_expenses+ maintenance))
as Projections
from Payments, Expenses;
*/
-- select  payment_id - TotalExpenses 
-- as Projections
--  from Payments, Expenses;
create table Loss (
discount_rate int(20),
payment_amount int(20),
payment_date date,
outcome_code int(20),
status_code int(20),
foreign key (outcome_code) references booking_id (outcome_code),
foreign key (status_code) references bookind_id (status_code),
foreign key (discount_rate) references Staff_Sales (discount_rate),
foreign key (payment_amount) references Payments (payment_amount),
foreign key (payment_date) references Payments (payment_date));

create table Profit (
payment_amount int(50),
payment_date date,
outcome_code int(20),
status_code int(20),
foreign key (outcome_code) references booking_id (outcome_code),
foreign key (status_code) references bookind_id (status_code),
foreign key (payment_amount) references Payments (payment_amount),
foreign key (payment_date) references Payments (payment_date));

insert into Services 
values
(901, 'Airline1'),
(902, 'Airline2'),
(903, 'Airline3'),
(904, 'Airline4'),
(905, 'Airline5'),
(906, 'Airline6'),
(907, 'Airline7'),
(908, 'Airline8'),
(909, 'Airline9'),
(910, 'Airline10'),
(911, 'Airline11'),
(912, 'Airline12'),
(913, 'Airline13'),
(914, 'Airline14'),
(915, 'Airline15'),
(916, 'Airline16'),
(917, 'Airline17'),
(918, 'Airline18'),
(919, 'Airline19'),
(920, 'Airline20');


insert into Airlines 
values 
(901, 'Airlines1'),
(902, 'Airlines2'),
(903, 'Airlines3'),
(904, 'Airlines4'),
(905, 'Airlines5'),
(906, 'Airlines6'),
(907, 'Airlines7'),
(908, 'Airlines8'),
(909, 'Airlines9'),
(910, 'Airlines10'),
(911, 'Airlines11'),
(912, 'Airlines12'),
(913, 'Airlines13'),
(914, 'Airlines14'),
(915, 'Airlines15'),
(916, 'Airlines16'),
(917, 'Airlines17'),
(918, 'Airlines18'),
(919, 'Airlines19'),
(920, 'Airlines20');

insert into Travel_agencies
values
(701, 'TravelAgency1'),
(702, 'TravelAgency2'),
(703, 'TravelAgency3'),
(704, 'TravelAgency4'),
(705, 'TravelAgency5'),
(706, 'TravelAgency6'),
(707, 'TravelAgency7'),
(708, 'TravelAgency8'),
(709, 'TravelAgency9'),
(710, 'TravelAgency10'),
(711, 'TravelAgency11'),
(712, 'TravelAgency12'),
(713, 'TravelAgency13'),
(714, 'TravelAgency14'),
(715, 'TravelAgency15'),
(716, 'TravelAgency16'),
(717, 'TravelAgency17'),
(718, 'TravelAgency18'),
(719, 'TravelAgency19'),
(720, 'TravelAgency20');


insert into Customers
values
(601, 'Zara Basyani'),
(602, 'Natalie \'The nut\' Leong'),
(603, 'Jim'),
(604, 'Tim'),
(605, 'Lim'),
(606, 'Dan'),
(607, 'Jake'),
(608, 'Joe'),
(609, 'Moe'),
(610, 'Will'),
(611, 'Ron'),
(612, 'Bill'),
(613, 'Jason'),
(614, 'Marie'),
(615, 'Anne'),
(616, 'Jude'),
(617, 'Eric'),
(618, 'Ralph'),
(619, 'Leo'),
(620, 'Bennedict');

insert into Customers_Addresses
values
(501, 20, 'Jalan Sampan', 'Selangor', 5340, 'Malaysia', 601),
(502, 15, 'Jalan Impan', 'Selangor', 2340, 'Malaysia', 602),
(503, 11, 'Jalan Upin', 'Selangor', 5340, 'Malaysia', 603),
(504, 22, 'Jalan Impin', 'Selangor', 5340, 'Malaysia', 604),
(505, 16, 'Jalan Ipin', 'Selangor', 5240, 'Malaysia', 605),
(506, 19, 'Jalan Sampan', 'Selangor', 5340, 'Malaysia', 606),
(507, 21, 'Jalan Ipin', 'Selangor', 5240, 'Malaysia', 607),
(508, 23, 'Jalan Upin', 'Selangor', 5340, 'Malaysia', 608),
(509, 15, 'Jalan Sampan', 'Selangor', 5240, 'Malaysia', 609),
(510, 12, 'Jalan Impan', 'Selangor', 5340, 'Malaysia', 610),
(511, 27, 'Jalan Laman', 'Selangor', 5340, 'Malaysia', 611),
(512, 20, 'Jalan Sampan', 'Selangor', 5340, 'Malaysia', 612),
(513, 17, 'Jalan Ipin', 'Selangor', 5340, 'Malaysia', 613),
(514, 14, 'Jalan Sampan', 'Selangor', 5240, 'Malaysia', 614),
(515, 24, 'Jalan Limpin', 'Selangor', 5340, 'Malaysia', 615),
(516, 12, 'Jalan Laman', 'Selangor', 5340, 'Malaysia', 616),
(517, 30, 'Jalan Sampan', 'Selangor', 5240, 'Malaysia', 617),
(518, 21, 'Jalan Sampan', 'Selangor', 5340, 'Malaysia', 618),
(519, 29, 'Jalan Impin', 'Selangor', 5240, 'Malaysia', 619),
(520, 18, 'Jalan Upin', 'Selangor', 5240, 'Malaysia', 620);


insert into Contacts
value
(401, 601, '012-231231', null, '03-3023425'),
(402, 602, '016-432423', '016-43275648', '03-4612893'),
(403, 603, '013-231412', null, '03-4259783'),
(404, 604, '011-432435', null, '03-4623783'),
(405, 605, '010-432422', null, '03-6147238'),
(406, 606, '017-432434', '016-745323', '03-1452978'),
(407, 607, '012-752133', null, '03-5123431'),
(408, 608, '019-643624', null, '03-5231603'),
(409, 609, '017-675795', null, '03-4132523'),
(410, 610, '012-523515', null, '03-5263198'),
(411, 611, '014-427392', null, '03-4139782'),
(412, 612, '015-403627', '016-745376', '03-5441982'),
(413, 613, '016-648921', null, '03-8953423'),
(414, 614, '017-526891', null, '03-8932641'),
(415, 615, '014-562983', null, '03-3023425'),
(416, 616, '013-641928', '016-756865', '03-7849233'),
(417, 617, '014-537192', null, '03-6423832'),
(418, 618, '016-469132', null, '03-4252563'),
(419, 619, '016-523653', '016-466467', '03-5323332'),
(420, 620, '014-412613', null, '03-4231352');


insert into Customers_Contact
value
(301,401,601),
(302,402,602),
(303,403,603),
(304,404,604),
(305,405,605),
(306,406,606),
(307,407,607),
(308,408,608),
(309,409,609),
(310,410,610),
(311,411,611),
(312,412,612),
(313,413,613),
(314,414,614),
(315,415,615),
(316,416,616),
(317,417,617),
(318,418,618),
(319,419,619),
(320,420,620);

insert into Ref_Booking_Outcomes
value
(201, 'Paid'),
(202, 'Pending');

insert into Ref_Booking_Status
value
(101, 'Approved'),
(102, 'Cancelled');

insert into Bookings
value
(1001, 601, 201, 101, 701, '2018/3/4', 'awesome!'),
(1002, 602, 202, 102, 702, '2018/3/4', 'awesome!'),
(1003, 603, 203, 103, 703, '2018/3/4', 'awesome!'),
(1004, 604, 204, 104, 704, '2018/3/4', 'awesome!'),
(1005, 605, 205, 105, 705, '2018/3/4', 'awesome!'),
(1006, 606, 206, 106, 706, '2018/3/4', 'awesome!'),
(1007, 607, 207, 107, 707, '2018/3/4', 'awesome!'),
(1008, 608, 208, 108, 708, '2018/3/4', 'awesome!'),
(1009, 609, 209, 109, 709, '2018/3/4', 'awesome!'),
(1010, 610, 210, 110, 710, '2018/3/4', 'awesome!'),
(1011, 611, 211, 111, 711, '2018/3/4', 'awesome!'),
(1012, 612, 212, 112, 712, '2018/3/4', 'awesome!'),
(1013, 613, 213, 113, 713, '2018/3/4', 'awesome!'),
(1014, 614, 214, 114, 714, '2018/3/4', 'awesome!'),
(1015, 615, 215, 115, 715, '2018/3/4', 'awesome!'),
(1016, 616, 216, 116, 716, '2018/3/4', 'awesome!'),
(1017, 617, 217, 117, 717, '2018/3/4', 'awesome!'),
(1018, 618, 218, 118, 718, '2018/3/4', 'awesome!'),
(1019, 619, 219, 119, 719, '2018/3/4', 'awesome!'),
(1020, 620, 220, 120, 720, '2018/3/4', 'awesome!');

insert into Service_Bookings
value
(2001, 901, '2018/3/4', '2018/3/8', 'Awesome!'),
(2002, 902, '2018/3/4', '2018/3/8', null),
(2003, 903, '2018/3/4', '2018/3/8', null),
(2004, 904, '2018/3/4', '2018/3/8', null),
(2005, 905, '2018/3/4', '2018/3/8', null),
(2006, 906, '2018/3/4', '2018/3/8', null),
(2007, 907, '2018/3/4', '2018/3/8', null),
(2008, 908, '2018/3/4', '2018/3/8', null),
(2009, 909, '2018/3/4', '2018/3/8', null),
(2010, 910, '2018/3/4', '2018/3/8', null),
(2011, 911, '2018/3/4', '2018/3/8', null),
(2012, 912, '2018/3/4', '2018/3/8', null),
(2013, 913, '2018/3/4', '2018/3/8', null),
(2014, 914, '2018/3/4', '2018/3/8', null),
(2015, 915, '2018/3/4', '2018/3/8', null),
(2016, 916, '2018/3/4', '2018/3/8', null),
(2017, 917, '2018/3/4', '2018/3/8', null),
(2018, 918, '2018/3/4', '2018/3/8', null),
(2019, 919, '2018/3/4', '2018/3/8', null),
(2020, 920, '2018/3/4', '2018/3/8', null);

insert into Airlines
value
(3001, 'Deets!'),
(3002, 'Deets!'),
(3003, 'Deets!'),
(3004, 'Deets!'),
(3005, 'Deets!'),
(3006, 'Deets!'),
(3007, 'Deets!'),
(3008, 'Deets!'),
(3009, 'Deets!'),
(3010, 'Deets!'),
(3011, 'Deets!'),
(3012, 'Deets!'),
(3013, 'Deets!'),
(3014, 'Deets!'),
(3015, 'Deets!'),
(3016, 'Deets!'),
(3017, 'Deets!'),
(3018, 'Deets!'),
(3019, 'Deets!'),
(3020, 'Deets!');

insert into Cars
value
(4001, 'Honda'),
(4002, 'Honda'),
(4003, 'Honda'),
(4004, 'Honda'),
(4005, 'Honda'),
(4006, 'Honda'),
(4007, 'Honda'),
(4008, 'Honda'),
(4009, 'Honda'),
(4010, 'Toyota'),
(4011, 'Toyota'),
(4012, 'Toyota'),
(4013, 'Toyota'),
(4014, 'Toyota'),
(4015, 'Toyota'),
(4016, 'Toyota'),
(4017, 'Toyota'),
(4018, 'Toyota'),
(4019, 'Toyota'),
(4020, 'Toyota');



insert into Hotels
value
(5001, 'Hyatt'),
(5002, 'Hyatt'),
(5003, 'Hyatt'),
(5004, 'Hyatt'),
(5005, 'Hyatt'),
(5006, 'Hyatt'),
(5007, 'Hyatt'),
(5008, 'Hyatt'),
(5009, 'Hyatt'),
(5010, 'Hyatt'),
(5011, 'Hilton'),
(5012, 'Hilton'),
(5013, 'Hilton'),
(5014, 'Hilton'),
(5015, 'Hilton'),
(5016, 'Hilton'),
(5017, 'Hilton'),
(5018, 'Hilton'),
(5019, 'Hilton'),
(5020, 'Hilton');

insert into Restaurants
value
(6001, 'McD'),
(6002, 'McD'),
(6003, 'McD'),
(6004, 'McD'),
(6005, 'McD'),
(6006, 'McD'),
(6007, 'McD'),
(6008, 'McD'),
(6009, 'McD'),
(6010, 'McD'),
(6011, 'KFC'),
(6012, 'KFC'),
(6013, 'KFC'),
(6014, 'KFC'),
(6015, 'KFC'),
(6016, 'KFC'),
(6017, 'KFC'),
(6018, 'KFC'),
(6019, 'KFC'),
(6020, 'KFC');


insert into Payments
value
(7001, 1001, 5001, '2018/2/4', 'lorem ipsum'),
(7002, 1002, 5002, '2018/2/4', 'lorem ipsum'),
(7003, 1003, 5003, '2018/2/4', 'lorem ipsum'),
(7004, 1004, 5004, '2018/2/4', 'lorem ipsum'),
(7005, 1005, 5005, '2018/2/4', 'lorem ipsum'),
(7006, 1006, 5006, '2018/2/4', 'lorem ipsum'),
(7007, 1007, 5007, '2018/2/4', 'lorem ipsum'),
(7008, 1008, 5008, '2018/2/4', 'lorem ipsum'),
(7009, 1009, 5009, '2018/2/4', 'lorem ipsum'),
(7010, 1010, 5010, '2018/2/4', 'lorem ipsum'),
(7011, 1011, 5011, '2018/2/4', 'lorem ipsum'),
(7012, 1012, 5012, '2018/2/4', 'lorem ipsum'),
(7013, 1013, 5013, '2018/2/4', 'lorem ipsum'),
(7014, 1014, 5014, '2018/2/4', 'lorem ipsum'),
(7015, 1015, 5015, '2018/2/4', 'lorem ipsum'),
(7016, 1016, 5016, '2018/2/4', 'lorem ipsum'),
(7017, 1017, 5017, '2018/2/4', 'lorem ipsum'),
(7018, 1018, 5018, '2018/2/4', 'lorem ipsum'),
(7019, 1019, 5019, '2018/2/4', 'lorem ipsum'),
(7020, 1020, 5020, '2018/2/4', 'lorem ipsum');

insert into Staff_Information
value
(8001, 'Elon', 'Musk', 012534643, 'clerk', '5th street', 2000),
(8002, 'Elon', 'Dusk', 012534643, 'clerk', '7th street', 2000),
(8003, 'Elon', 'Rusk', 012534643, 'clerk', '4th street', 2000),
(8004, 'Eton', 'Husk', 012534643, 'clerk', '5th street', 2000),
(8005, 'Eron', 'Tusk', 012534643, 'clerk', '8th street', 2000),
(8006, 'Elon', 'Wusk', 012534643, 'clerk', '9th street', 2000),
(8007, 'Emon', 'Busk', 012534643, 'clerk', '3rd street', 2000),
(8008, 'Elon', 'Nusk', 012534643, 'clerk', '5th street', 2000),
(8009, 'Elon', 'Lusk', 012534643, 'clerk', '3rd street', 2000),
(8010, 'Elon', 'Dusk', 012534643, 'manager', '5th street', 5000),
(8011, 'Elon', 'Wusk', 012534643, 'manager', '9th street', 5000),
(8012, 'Exon', 'Wusk', 012534643, 'manager', '4th street', 6000),
(8013, 'Eson', 'Husk', 012534643, 'manager', '5th street', 5000),
(8014, 'Edon', 'Dusk', 012534643, 'manager', '7th street', 6000),
(8015, 'Egon', 'musk', 012534643, 'manager', '8th street', 7000),
(8016, 'Efon', 'Dusk', 012534643, 'manager', '6th street', 5000),
(8017, 'Ekon', 'Dusk', 012534643, 'clerk', '6th street', 2000),
(8018, 'Eyon', 'Wusk', 012534643, 'clerk', '4th street', 2000),
(8019, 'Ewon', 'Husk', 012534643, 'clerk', '9th street', 2000),
(8020, 'Efon', 'Wusk', 012534643, 'clerk', '8th street', 2000);


insert into Sales_Staff
value
('2018/2/4','2018/3/8', 10, 601,8001,7001,1001),
('2018/2/4','2018/3/8', 10, 602,8002,7002,1002),
('2018/2/4','2018/3/8', 10, 603,8003,7003,1003),
('2018/2/4','2018/3/8', 10, 604,8004,7004,1004),
('2018/2/4','2018/3/8', 15, 605,8005,7005,1005),
('2018/2/4','2018/3/8', 15, 606,8006,7006,1006),
('2018/2/4','2018/3/8', 15, 607,8007,7007,1007),
('2018/2/4','2018/3/8', 15, 608,8008,7008,1008),
('2018/2/4','2018/3/8', 10, 609,8009,7009,1009),
('2018/2/4','2018/3/8', 10, 610,8010,7010,1010),
('2018/2/4','2018/3/8', 15, 611,8011,7011,1011),
('2018/2/4','2018/3/8', 15, 612,8012,7012,1012),
('2018/2/4','2018/3/8', 10, 613,8013,7013,1013),
('2018/2/4','2018/3/8', 10, 614,8014,7014,1014),
('2018/2/4','2018/3/8', 10, 615,8015,7015,1015),
('2018/2/4','2018/3/8', 15, 616,8016,7016,1016),
('2018/2/4','2018/3/8', 15, 617,8017,7017,1017),
('2018/2/4','2018/3/8', 15, 618,8018,7018,1018),
('2018/2/4','2018/3/8', 15, 619,8019,7019,1019),
('2018/2/4','2018/3/8', 10, 620,8020,7020,1020);

insert into Loss
value
(10, 5001, '2018/2/4', 'pending', 'cancelled'),
(10, 5002, '2018/2/4', 'pending', 'cancelled'),
(10, 5003, '2018/2/4', 'pending', 'cancelled'),
(10, 5004, '2018/2/4', 'pending', 'cancelled'),
(10, 5005, '2018/2/4', 'pending', 'cancelled'),
(10, 5006, '2018/2/4', 'pending', 'cancelled'),
(10, 5006, '2018/2/4', 'pending', 'cancelled'),
(10, 5007, '2018/2/4', 'pending', 'cancelled'),
(10, 5008, '2018/2/4', 'pending', 'cancelled'),
(10, 5009, '2018/2/4', 'pending', 'cancelled'),
(10, 5010, '2018/2/4', 'pending', 'cancelled'),
(10, 5011, '2018/2/4', 'pending', 'cancelled'),
(10, 5012, '2018/2/4', 'pending', 'cancelled'),
(10, 5013, '2018/2/4', 'pending', 'cancelled'),
(10, 5014, '2018/2/4', 'pending', 'cancelled'),
(10, 5015, '2018/2/4', 'pending', 'cancelled'),
(10, 5016, '2018/2/4', 'pending', 'cancelled'),
(10, 5017, '2018/2/4', 'pending', 'cancelled'),
(10, 5018, '2018/2/4', 'pending', 'cancelled'),
(10, 5019, '2018/2/4', 'pending', 'cancelled'),
(10, 5020, '2018/2/4', 'pending', 'cancelled');

insert into Profit
value
(300, '2018/2/4', 'paid', 'approved'),
(301, '2018/2/4', 'paid', 'approved'),
(302, '2018/2/4', 'paid', 'approved'),
(303, '2018/2/4', 'paid', 'approved'),
(304, '2018/2/4', 'paid', 'approved'),
(305, '2018/2/4', 'paid', 'approved'),
(306, '2018/2/4', 'paid', 'approved'),
(307, '2018/2/4', 'paid', 'approved'),
(308, '2018/2/4', 'paid', 'approved'),
(309, '2018/2/4', 'paid', 'approved'),
(310, '2018/2/4', 'paid', 'approved'),
(311, '2018/2/4', 'paid', 'approved'),
(312, '2018/2/4', 'paid', 'approved'),
(313, '2018/2/4', 'paid', 'approved'),
(314, '2018/2/4', 'paid', 'approved'),
(315, '2018/2/4', 'paid', 'approved'),
(316, '2018/2/4', 'paid', 'approved'),
(317, '2018/2/4', 'paid', 'approved'),
(318, '2018/2/4', 'paid', 'approved'),
(319, '2018/2/4', 'paid', 'approved'),
(320, '2018/2/4', 'paid', 'approved');




select * 
from Services;
-- insert into 

select distinct Loss,
sum (payment_amount) 
from Loss 
as LossCancelled
where outcome_code in (-- put where outcomecode=paid)
and status_code in (-- put where outcomecode=cancelled)
and discount_rate is null
order by year (payment_date) asc;

select distinct Loss,
sum ((100-discountrate)/100)*(payment_amount) 
from Loss 
as LossDiscount
where outcome_code in (-- put where outcomecode=paid)
and status_code in (-- put where outcomecode=Approved)
and discount_rate is not null
order by year (payment_date) asc;

select distinct Profit,
sum (payment_amount) 
from Profit
as Income
where outcome_code in (-- put where outcomecode=paid)
and status_code in (-- put where outcomecode=Approved)
order by year (payment_date) asc;

create table Projections
select (Income-(LossDiscount + LossCancelled)) as Revenue ,  year (payment_date)
from Income , Loss;



insert into Airlines  values  (801, 'Airlines1'), (802, 'Airlines2'), (802, 'Airlines2'), (802, 'Airlines2'), (802, 'Airlines2'), (802, 'Airlines2'), (802, 'Airlines2'),  insert into Travel_agencies values (701, 'lorem ipsum'), (702, 'jewish ipsum')
