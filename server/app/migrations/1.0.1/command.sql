CREATE DATABASE IF NOT EXISTS hospitaldb;

USE hospitaldb;

CREATE TABLE patients (
    id INT(40) NOT NULL AUTO_INCREMENT,
    name VARCHAR(40) NOT NULL,
    sex VARCHAR(30) NOT NULL,
    religion VARCHAR(30) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    address VARCHAR(30) NOT NULL,
    nik INT(30) NOT NULL,
    image_url VARCHAR(2000),
    PRIMARY KEY (id)
);



INSERT INTO patients (name, sex, religion, phone, address, nik, image_url) VALUES
('Adam Anderson', 'Male', 'Christian', '+1 123456789', '123 Main St', 123456789, 'https://randomuser.me/api/portraits/men/1.jpg'),
('Amy Adams', 'Female', 'Christian', '+1 987654321', '456 Elm St', 987654321, 'https://randomuser.me/api/portraits/women/2.jpg'),
('Alex Allen', 'Male', 'Jewish', '+1 555555555', '789 Oak St', 555555555, 'https://randomuser.me/api/portraits/men/3.jpg'),
('Ava Andrews', 'Female', 'Muslim', '+1 444444444', '321 Pine St', 444444444, 'https://randomuser.me/api/portraits/women/4.jpg'),
('Andrew Armstrong', 'Male', 'Buddhist', '+1 222222222', '654 Cedar St', 222222222, 'https://randomuser.me/api/portraits/men/5.jpg'),
('Benjamin Bennett', 'Male', 'Christian', '+1 777777777', '987 Walnut St', 777777777, 'https://randomuser.me/api/portraits/men/6.jpg'),
('Bella Bailey', 'Female', 'Christian', '+1 333333333', '654 Maple St', 333333333, 'https://randomuser.me/api/portraits/women/7.jpg'),
('Brandon Baker', 'Male', 'Hindu', '+1 888888888', '321 Oakwood St', 888888888, 'https://randomuser.me/api/portraits/men/8.jpg'),
('Caleb Clark', 'Male', 'Christian', '+1 666666666', '789 Elmwood St', 666666666, 'https://randomuser.me/api/portraits/men/9.jpg'),
('Charlotte Cooper', 'Female', 'Christian', '+1 444444444', '987 Pinecone St', 444444444, 'https://randomuser.me/api/portraits/women/10.jpg'),
('Cameron Campbell', 'Male', 'Sikh', '+1 555555555', '654 Birch St', 555555555, 'https://randomuser.me/api/portraits/men/11.jpg'),
('Claire Carter', 'Female', 'Christian', '+1 222222222', '321 Oak St', 222222222, 'https://randomuser.me/api/portraits/women/12.jpg'),
('Daniel Davis', 'Male', 'Christian', '+1 999999999', '789 Willow St', 999999999, 'https://randomuser.me/api/portraits/men/13.jpg'),
('Ella Edwards', 'Female', 'Christian', '+1 111111111', '987 Maplewood St', 111111111, 'https://randomuser.me/api/portraits/women/14.jpg'),
('Ethan Evans', 'Male', 'Christian', '+1 333333333', '654 Pine St', 333333333, 'https://randomuser.me/api/portraits/men/15.jpg'),
('Elizabeth Edwards', 'Female', 'Christian', '+1 555555555', '321 Cedarwood St', 555555555, 'https://randomuser.me/api/portraits/women/16.jpg'),
('Emily Evans', 'Female', 'Christian', '+1 777777777', '789 Birchwood St', 777777777, 'https://randomuser.me/api/portraits/women/17.jpg'),
('Gabriel Gray', 'Male', 'Christian', '+1 666666666', '987 Oakwood St', 666666666, 'https://randomuser.me/api/portraits/men/18.jpg'),
('Grace Green', 'Female', 'Christian', '+1 444444444', '654 Willowwood St', 444444444, 'https://randomuser.me/api/portraits/women/19.jpg'),
('George Gibson', 'Male', 'Christian', '+1 222222222', '321 Maplewood St', 222222222, 'https://randomuser.me/api/portraits/men/20.jpg'),
('Henry Harris', 'Male', 'Christian', '+1 888888888', '789 Pinewood St', 888888888, 'https://randomuser.me/api/portraits/men/21.jpg'),
('Hannah Hughes', 'Female', 'Christian', '+1 333333333', '987 Cedarwood St', 333333333, 'https://randomuser.me/api/portraits/women/22.jpg'),
('Isaac Ingram', 'Male', 'Christian', '+1 777777777', '654 Oak St', 777777777, 'https://randomuser.me/api/portraits/men/23.jpg'),
('Isabella Irwin', 'Female', 'Christian', '+1 555555555', '321 Pinecone St', 555555555, 'https://randomuser.me/api/portraits/women/24.jpg'),
('Jacob Johnson', 'Male', 'Christian', '+1 444444444', '789 Cedar St', 444444444, 'https://randomuser.me/api/portraits/men/25.jpg'),
('Jessica James', 'Female', 'Christian', '+1 222222222', '987 Oakwood St', 222222222, 'https://randomuser.me/api/portraits/women/26.jpg'),
('Jameson Jackson', 'Male', 'Christian', '+1 999999999', '654 Elmwood St', 999999999, 'https://randomuser.me/api/portraits/men/27.jpg'),
('Julia Jenkins', 'Female', 'Christian', '+1 333333333', '321 Pine St', 333333333, 'https://randomuser.me/api/portraits/women/28.jpg'),
('Liam Lewis', 'Male', 'Christian', '+1 555555555', '789 Cedarwood St', 555555555, 'https://randomuser.me/api/portraits/men/29.jpg'),
('Lily Long', 'Female', 'Christian', '+1 777777777', '987 Elm St', 777777777, 'https://randomuser.me/api/portraits/women/30.jpg'),
('Logan Lee', 'Male', 'Christian', '+1 666666666', '654 Pinecone St', 666666666, 'https://randomuser.me/api/portraits/men/31.jpg'),
('Oliver Olson', 'Male', 'Christian', '+1 444444444', '321 Birch St', 444444444, 'https://randomuser.me/api/portraits/men/32.jpg'),
('Olivia Owens', 'Female', 'Christian', '+1 222222222', '789 Oakwood St', 222222222, 'https://randomuser.me/api/portraits/women/33.jpg'),
('Noah Nelson', 'Male', 'Christian', '+1 888888888', '987 Willowwood St', 888888888, 'https://randomuser.me/api/portraits/men/34.jpg'),
('Nora Newton', 'Female', 'Christian', '+1 333333333', '654 Maplewood St', 333333333, 'https://randomuser.me/api/portraits/women/35.jpg'),
('Oscar OBrien', 'Male', 'Christian', '+1 555555555', '321 Pine St', 555555555, 'https://randomuser.me/api/portraits/men/36.jpg'),
('Sophia Stewart', 'Female', 'Christian', '+1 444444444', '789 Cedarwood St', 444444444, 'https://randomuser.me/api/portraits/women/37.jpg'),
('Samuel Smith', 'Male', 'Christian', '+1 222222222', '987 Oak St', 222222222, 'https://randomuser.me/api/portraits/men/38.jpg'),
('Scarlett Sanders', 'Female', 'Christian', '+1 777777777', '654 Elmwood St', 777777777, 'https://randomuser.me/api/portraits/women/39.jpg'),
('Thomas Thompson', 'Male', 'Christian', '+1 666666666', '321 Pine St', 666666666, 'https://randomuser.me/api/portraits/men/40.jpg'),
('Victoria Turner', 'Female', 'Christian', '+1 555555555', '789 Cedarwood St', 555555555, 'https://randomuser.me/api/portraits/women/41.jpg'),
('William White', 'Male', 'Christian', '+1 444444444', '987 Oakwood St', 444444444, 'https://randomuser.me/api/portraits/men/42.jpg'),
('Zoe Zimmerman', 'Female', 'Christian', '+1 222222222', '654 Elm St', 222222222, 'https://randomuser.me/api/portraits/women/43.jpg');
