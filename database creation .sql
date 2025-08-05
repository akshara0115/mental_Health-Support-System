-- Create a new database
CREATE DATABASE MindCareDB;
USE MindCareDB;

-- Users table
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Age INT,
    Gender VARCHAR(10),
    Password VARCHAR(255)
);

-- Counselors table
CREATE TABLE Counselors (
    CounselorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    Specialization VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    Availability VARCHAR(100)
);

-- Appointments table
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    CounselorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    Status VARCHAR(50) DEFAULT 'Scheduled',
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CounselorID) REFERENCES Counselors(CounselorID)
);

-- Mood Tracker table
CREATE TABLE MoodTracker (
    MoodID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    MoodDate DATE,
    MoodLevel ENUM('Very Sad', 'Sad', 'Neutral', 'Happy', 'Very Happy'),
    Notes TEXT,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- Motivational Quotes table
CREATE TABLE Motivation (
    QuoteID INT PRIMARY KEY AUTO_INCREMENT,
    Quote TEXT,
    Author VARCHAR(100)
);
