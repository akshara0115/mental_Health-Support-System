-- Insert counselors
INSERT INTO Counselors (Name, Specialization, Email, Phone, Availability)
VALUES 
('Dr. Nisha Rao', 'Stress Management', 'nisha@mindcare.com', '9876500001', 'Mon-Fri 9am-3pm'),
('Dr. Harsh Vardhan', 'Youth Counseling', 'harsh@mindcare.com', '9876599992', 'Tue-Fri 11am-5pm');

-- Insert motivational quotes
INSERT INTO Motivation (Quote, Author)
VALUES 
('Healing is not linear.', 'Unknown'),
('Breathe. It’s just a bad day, not a bad life.', 'Anonymous');

-- Insert users
INSERT INTO Users (Name, Email, Age, Gender, Password)
VALUES
('Ananya Iyer', 'ananya@user.com', 23, 'Female', 'secure123'),
('Rishi Mehta', 'rishi@user.com', 29, 'Male', 'rishi@2025');

-- Insert mood entries
INSERT INTO MoodTracker (UserID, MoodDate, MoodLevel, Notes)
VALUES
(1, '2025-08-05', 'Neutral', 'Slept okay, feeling meh'),
(2, '2025-08-05', 'Happy', 'Good session today');

-- Insert appointment
INSERT INTO Appointments (UserID, CounselorID, AppointmentDate, AppointmentTime)
VALUES
(1, 1, '2025-08-07', '10:30:00'),
(2, 2, '2025-08-08', '14:00:00');
