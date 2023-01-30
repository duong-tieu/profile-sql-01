create database CakeStore;
use CakeStore;

create table cake(
Name_Cake varchar(40),
id        varchar(15) not null,
size      char, 
price     double,
quantity   int,
unique(Name_Cake,id),
primary key (Name_Cake)
);

insert into cake(Name_Cake, id,size, price,quantity)
values
("bánh kem dâu", "ck1234", "A", 270000.0, 3),
("bánh kem kiwi", "ck1235", "B", 240000.0, 2),
("bánh kem dâu tằm", "ck1236", "C", 280000.0, 3),
("bánh kem việt quất", "ck1237", "B", 230000.0, 5),
("bánh bông lan trứng muối", "ck1254", "A", 340000.0, 10),
("bánh rau câu ngũ vị", "ck2231", "A", 280000.0, 8),
("bánh gato yến mạch", "ck1144", "A", 270000.0, 10);

update cake set price = 300000.0 and quantity = 10 where Name_Cake = "bánh kem dâu";
delete from cake where Name_Cake = "bánh kem dâu";

select Name_Cake, quantity from cake
group by Name_Cake
having quantity > 3
order by Name_Cake desc;


create table Customer(
Name_Customer varchar(30) not null,
phone varchar(10),
address varchar(35),
unique(Name_Customer),
primary key (Name_Customer)
);
alter table customer add constraint pk_customer primary key customer(NameC);

insert into customer(Name_Customer, phone,address)
values
("Trần Thanh Tùng", "0987345986","đường Nguyễn Văn Trị"),
("Trần Đức Thành", "0983245986","đường Nguyễn Văn Trội"),
("Nguyễn Thanh ", "0824653243","27/1 Phan Văn Trị"),
("Lê Đức Bảo", "0958732599","Hà Nội"),
("Trần Đức Bo", "0724324986","Thành phố Hồ Chí Minh");

select phone, address from customer
where phone in ("0987345986") or address in ("Hà Nội");
 
select address from customer
where address > all ( select address from customer having address = "đường Nguyễn Văn Trị");


drop table cake;
drop table customer;
drop database cakestore;

select * from Customer 
having address = "Hà Nội";

create table Invoice(
Invoice_Id varchar(30),
CustomerName varchar(30),
phone_Customer varchar(10),
NameofCake varchar(40) not null,
Total double,
primary key (Invoice_Id)
-- foreign key (CustomerName) references customer(Name_Customer),
-- foreign key (NameofCake) references cake(Cake_Name)
);

alter table invoice add constraint fk_customer foreign key (CustomerName) references customer(Name_Customer);
alter table invoice add constraint fk_cake foreign key (NameofCake) references cake(Name_Cake);
alter table invoice drop constraint fk_cake;


select * from invoice;
select * from cake;