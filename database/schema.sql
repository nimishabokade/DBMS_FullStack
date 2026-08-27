CREATE DATABASE IF NOT EXISTS FreelancerHub;

USE FreelancerHub;


-- 1. CUSTOMER TABLE
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(10),
    Password VARCHAR(255) NOT NULL,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- 2. FREELANCER TABLE
CREATE TABLE Freelancer (
    FreelancerID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
    Background VARCHAR(500),
    Experience INT,
    HourlyRate DECIMAL(10,2),
    Availability VARCHAR(20),
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP
);


-- 3. SKILLS TABLE
CREATE TABLE Skills (
    SkillID INT PRIMARY KEY,
    FreelancerID INT NOT NULL,
    SkillName VARCHAR(50) NOT NULL,

    FOREIGN KEY (FreelancerID)
        REFERENCES Freelancer(FreelancerID)
);


-- 4. PORTFOLIO TABLE
CREATE TABLE Portfolio (
    PortfolioID INT PRIMARY KEY,
    FreelancerID INT NOT NULL,
    ProjectTitle VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    ProjectLink VARCHAR(255),

    FOREIGN KEY (FreelancerID)
        REFERENCES Freelancer(FreelancerID)
);


-- 5. REVIEW TABLE
CREATE TABLE Review (
    ReviewID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    FreelancerID INT NOT NULL,
    Rating INT NOT NULL,
    Comment VARCHAR(500),
    ReviewDate DATE,

    FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID),

    FOREIGN KEY (FreelancerID)
        REFERENCES Freelancer(FreelancerID)
);


-- 6. MESSAGE TABLE
CREATE TABLE Message (
    MessageID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    FreelancerID INT NOT NULL,
    SenderType VARCHAR(20) NOT NULL,
    MessageText VARCHAR(1000) NOT NULL,
    SentAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    IsRead BOOLEAN DEFAULT FALSE,

    FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID),

    FOREIGN KEY (FreelancerID)
        REFERENCES Freelancer(FreelancerID)
);


-- 7. NOTIFICATION TABLE
CREATE TABLE Notification (
    NotificationID INT PRIMARY KEY,
    CustomerID INT,
    FreelancerID INT,
    Message VARCHAR(255) NOT NULL,
    Type VARCHAR(50),
    IsRead BOOLEAN DEFAULT FALSE,
    CreatedAt DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (CustomerID)
        REFERENCES Customer(CustomerID),

    FOREIGN KEY (FreelancerID)
        REFERENCES Freelancer(FreelancerID)
);