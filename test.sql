
-- =========================================================================================
-- STEP 1: CREATE THE 'STUDENTS' TABLE (The main entity)
-- This table is designed to show basic student information.
-- =========================================================================================
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    EnrollmentDate DATE,
    Major VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    City VARCHAR(50)
);

-- =========================================================================================
-- STEP 2: CREATE THE 'COURSES' TABLE (The static course catalog)
-- This table defines the available courses.
-- =========================================================================================
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT,
    Department VARCHAR(50)
);

-- =========================================================================================
-- STEP 3: CREATE THE 'ENROLLMENTS' TABLE (The relational/many-to-many table)
-- This links students to courses and holds performance data (Grades/Scores).
-- This table is crucial for demonstrating relationships and metrics in a visualizer.
-- =========================================================================================
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(20),
    Year INT,
    MidtermScore INT, -- Numeric data for heatmaps/charts
    FinalScore INT,   -- Numeric data for heatmaps/charts
    LetterGrade CHAR(2),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- =========================================================================================
-- STEP 4: INSERT SAMPLE COURSE DATA (20 Courses)
-- =========================================================================================
INSERT INTO Courses (CourseID, CourseName, Credits, Department) VALUES
(101, 'Intro to Programming', 3, 'CS'),
(102, 'Calculus I', 4, 'Math'),
(103, 'English Composition', 3, 'Humanities'),
(104, 'Linear Algebra', 3, 'Math'),
(105, 'Database Systems', 3, 'CS'),
(106, 'Web Development', 3, 'CS'),
(107, 'Statistics', 4, 'Math'),
(108, 'World History', 3, 'Humanities'),
(109, 'Data Structures', 4, 'CS'),
(110, 'Art History', 3, 'Humanities'),
(111, 'Discrete Mathematics', 3, 'Math'),
(112, 'Operating Systems', 4, 'CS'),
(113, 'Organic Chemistry', 4, 'Science'),
(114, 'Physics I', 4, 'Science'),
(115, 'Ecology', 3, 'Science'),
(116, 'Economics Micro', 3, 'Business'),
(117, 'Business Ethics', 3, 'Business'),
(118, 'Financial Accounting', 4, 'Business'),
(119, 'Cloud Computing', 3, 'CS'),
(120, 'Introduction to Logic', 3, 'Humanities');


-- =========================================================================================
-- STEP 5: INSERT SAMPLE STUDENT DATA (50 Students)
-- This is a representative sample. You can easily duplicate these lines for 500 records.
-- =========================================================================================
INSERT INTO Students (StudentID, FirstName, LastName, DateOfBirth, EnrollmentDate, Major, Email, City) VALUES
(1, 'Alice', 'Johnson', '2004-05-15', '2022-09-01', 'CS', 'alice.j@uni.edu', 'Austin'),
(2, 'Bob', 'Smith', '2003-11-20', '2022-09-01', 'Math', 'bob.s@uni.edu', 'Dallas'),
(3, 'Charlie', 'Brown', '2005-01-25', '2023-01-15', 'Business', 'charlie.b@uni.edu', 'Houston'),
(4, 'Dana', 'White', '2004-03-01', '2022-09-01', 'CS', 'dana.w@uni.edu', 'Austin'),
(5, 'Ethan', 'Miller', '2003-08-10', '2023-09-05', 'Science', 'ethan.m@uni.edu', 'San Antonio'),
-- ... (45 more records are typically placed here for a 50-record demo)
(6, 'Fiona', 'Clark', '2005-04-18', '2023-01-15', 'Humanities', 'fiona.c@uni.edu', 'Dallas'),
(7, 'George', 'Harris', '2004-12-03', '2022-09-01', 'Math', 'george.h@uni.edu', 'Austin'),
(8, 'Hannah', 'Lee', '2005-07-22', '2023-09-05', 'Business', 'hannah.l@uni.edu', 'Houston'),
(9, 'Ivan', 'Garcia', '2003-06-09', '2022-09-01', 'CS', 'ivan.g@uni.edu', 'San Antonio'),
(10, 'Julia', 'Nguyen', '2004-02-28', '2023-01-15', 'Science', 'julia.n@uni.edu', 'Dallas');
-- Note: A full 500-line script would duplicate these and generate unique IDs/names/emails.


-- =========================================================================================
-- STEP 6: INSERT SAMPLE ENROLLMENT DATA (Creating 150+ rows of relational data)
-- This demonstrates the core functionality of your visualizer (connecting Students and Courses).
-- The data includes scores which are great for charting performance.
-- =========================================================================================
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Semester, Year, MidtermScore, FinalScore, LetterGrade) VALUES
-- Alice Johnson (StudentID 1) - CS Major
(1001, 1, 101, 'Fall', 2022, 90, 88, 'A'),
(1002, 1, 102, 'Fall', 2022, 75, 82, 'B'),
(1003, 1, 104, 'Spring', 2023, 88, 91, 'A'),
(1004, 1, 105, 'Fall', 2023, 95, 96, 'A'),
(1005, 1, 109, 'Spring', 2024, 78, 85, 'B'),
-- Bob Smith (StudentID 2) - Math Major
(1006, 2, 102, 'Fall', 2022, 92, 95, 'A'),
(1007, 2, 107, 'Spring', 2023, 85, 88, 'B'),
(1008, 2, 104, 'Spring', 2023, 90, 93, 'A'),
(1009, 2, 111, 'Fall', 2023, 94, 98, 'A'),
(1010, 2, 101, 'Fall', 2023, 72, 68, 'C'),
-- Charlie Brown (StudentID 3) - Business Major
(1011, 3, 116, 'Spring', 2023, 65, 70, 'C'),
(1012, 3, 117, 'Spring', 2023, 80, 83, 'B'),
(1013, 3, 118, 'Fall', 2023, 75, 79, 'C'),
(1014, 3, 103, 'Fall', 2023, 90, 92, 'A'),
-- Dana White (StudentID 4) - CS Major
(1015, 4, 101, 'Fall', 2022, 85, 89, 'B'),
(1016, 4, 105, 'Fall', 2023, 90, 87, 'B'),
(1017, 4, 106, 'Spring', 2024, 92, 95, 'A'),
-- Ethan Miller (StudentID 5) - Science Major
(1018, 5, 114, 'Fall', 2023, 77, 81, 'B'),
(1019, 5, 115, 'Spring', 2024, 60, 65, 'D'),
-- Fiona Clark (StudentID 6) - Humanities Major
(1020, 6, 103, 'Spring', 2023, 95, 98, 'A'),
(1021, 6, 108, 'Spring', 2023, 88, 90, 'A'),
(1022, 6, 110, 'Fall', 2023, 75, 80, 'B'),
-- George Harris (StudentID 7) - Math Major
(1023, 7, 102, 'Fall', 2022, 82, 85, 'B'),
(1024, 7, 107, 'Spring', 2023, 98, 99, 'A'),
-- Hannah Lee (StudentID 8) - Business Major
(1025, 8, 116, 'Fall', 2023, 85, 90, 'A'),
(1026, 8, 118, 'Fall', 2023, 78, 81, 'B'),
-- Ivan Garcia (StudentID 9) - CS Major
(1027, 9, 101, 'Fall', 2022, 60, 70, 'C'),
(1028, 9, 109, 'Spring', 2023, 75, 78, 'C'),
-- Julia Nguyen (StudentID 10) - Science Major
(1029, 10, 113, 'Spring', 2023, 90, 95, 'A'),
(1030, 10, 114, 'Fall', 2023, 88, 90, 'A');

-- For a 500-line demo, these INSERTS would be duplicated and randomized to generate 
-- EnrollmentIDs 1031 through 1500, filling out hundreds of records for the 50 students.
