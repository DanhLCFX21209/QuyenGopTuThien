create database asm1db;
use asm1db;

CREATE TABLE donation (
  id INT not null auto_increment PRIMARY KEY,
  code VARCHAR(255) default null,
  created varchar(255) default null,
  description VARCHAR(255) default null,
  end_date varchar(255) default null,
  money int default null,
  name VARCHAR(255) default null,
  organization_name varchar(255) default null,
  phone_number varchar(255) default null,
  start_date varchar(255) default null,
  status int default null
);
CREATE TABLE role (
  id int(11) not null auto_increment primary key,
  role_name VARCHAR(255) default null
);

create table user (
	id  int(11) not null auto_increment primary key,
    address varchar(225) default null,
    email varchar(225) default null,
    full_name varchar(225) default null,
    note varchar(255) default null,
    password varchar(255) default null,
    phone_number varchar(255) default null,
    status int default 0,
    user_name varchar(255) default null,
    created varchar(255)default null,
    role_id int(11) default null,
	FOREIGN KEY (role_id) REFERENCES role(id) 
);



CREATE TABLE user_donation (
  id int(11) not null auto_increment PRIMARY KEY,
  created varchar(255) default null,
  monney int(11) default null,
  name VARCHAR(255) default null,
  status int(11) default null,
  text varchar(255) default null,
  donation_id INT default null,
  user_id INT default null,
  FOREIGN KEY (donation_id) REFERENCES donation(id)
);
INSERT INTO donation (code, created, description, end_date, money, name,organization_name, phone_number, start_date, status) VALUES 
('D0001', '2023-05-13', 'Charity donation for children in need', '2023-06-30', 500000, 'Giúp trẻ em nghèo','Vì trẻ en', '0123456789', '2023-05-13', 1),
('D0002', '2023-05-10', 'Disaster relief for flood victims', '2023-06-30', 1000000, 'Giúp trể mồ côi','Hội tử thiện', '0987654321', '2023-05-10', 1),
('D0003', '2023-05-09', 'Support for local animal shelter', '2023-06-30', 2000000, 'giúp ngưới chất đọc mày de cam','Hội chữ thập đỏ', '0912345678', '2023-05-09', 0);

INSERT INTO role (role_name) VALUES 
('Admin'),
('User');

INSERT INTO user (address, email, full_name, note, password, phone_number, status, user_name, created, role_id) VALUES 
('123 Main St, Anytown, USA', 'john.smith@example.com', 'John Smith', 'This is a test user', 'password123', '0123456789', 1, 'jsmith', '2023-05-13', 1),
('456 Elm St, Anytown, USA', 'jane.doe@example.com', 'Jane Doe', 'This is another test user', 'password456', '0987654321', 1, 'jdoe', '2023-05-11', 2),
('789 Oak St, Anytown, USA', 'bob.johnson@example.com', 'Bob Johnson', 'This is a third test user', 'password789', '0912345678', 0, 'bjohnson', '2023-05-09', 2);

INSERT INTO user_donation (created, monney, name, status, text, donation_id, user_id) VALUES 
('2023-05-13', 500000, 'John Smith', 1, 'Thank you for your donation', 1, 1),
('2023-05-11', 1000000, 'Jane Doe', 1, 'Your donation is appreciated', 2, 2),
('2023-05-09', 2000000, 'Bob Johnson', 0, 'We are sorry that your donation could not be accepted', 3, 3); 

