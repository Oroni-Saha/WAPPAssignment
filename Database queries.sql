/* Users table */
CREATE TABLE dbo.Users (
    UserID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL,
    DateRegistered DATETIME NOT NULL DEFAULT GETDATE(),
    ProfileImage NVARCHAR(255) NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Active',
    CONSTRAINT CK_Users_Role CHECK (Role IN ('Student', 'Admin')),
    CONSTRAINT CK_Users_Status CHECK (Status IN ('Active', 'Inactive'))
);
GO
/* Courses table */
CREATE TABLE dbo.Courses (
    CourseID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Category NVARCHAR(50) NULL,
    DifficultyLevel NVARCHAR(50) NULL,
    CreatedByUserID INT NULL,
    DateCreated DATETIME NOT NULL DEFAULT GETDATE(),
    Status NVARCHAR(20) NOT NULL DEFAULT 'Published',
    CONSTRAINT CK_Courses_Status CHECK (Status IN ('Published', 'Draft', 'Archived')),
    CONSTRAINT FK_Courses_Users FOREIGN KEY (CreatedByUserID)
        REFERENCES dbo.Users(UserID)
        ON DELETE SET NULL
);
GO
/* Modules table */
CREATE TABLE dbo.Modules (
    ModuleID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    CourseID INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    ModuleOrder INT NULL,
    CONSTRAINT FK_Modules_Courses FOREIGN KEY (CourseID)
        REFERENCES dbo.Courses(CourseID)
        ON DELETE CASCADE
);
GO
/* Learning materials table */
CREATE TABLE dbo.LearningMaterials (
    MaterialID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ModuleID INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    ContentType NVARCHAR(20) NULL,
    FileURL NVARCHAR(255) NULL,
    Description NVARCHAR(MAX) NULL,
    DateUploaded DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_LearningMaterials_Modules FOREIGN KEY (ModuleID)
        REFERENCES dbo.Modules(ModuleID)
        ON DELETE CASCADE
);
GO
/* Quizzes table */
CREATE TABLE dbo.Quizzes (
    QuizID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    ModuleID INT NOT NULL,
    Title NVARCHAR(100) NOT NULL,
    TotalMarks INT NULL DEFAULT 0,
    TimeLimit INT NULL,
    DateCreated DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Quizzes_Modules FOREIGN KEY (ModuleID)
        REFERENCES dbo.Modules(ModuleID)
        ON DELETE CASCADE
);
GO
/* Questions table */
CREATE TABLE dbo.Questions (
    QuestionID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    QuizID INT NOT NULL,
    QuestionText NVARCHAR(MAX) NOT NULL,
    QuestionType NVARCHAR(30) NOT NULL DEFAULT 'MCQ',
    OptionA NVARCHAR(255) NULL,
    OptionB NVARCHAR(255) NULL,
    OptionC NVARCHAR(255) NULL,
    OptionD NVARCHAR(255) NULL,
    CorrectAnswer NVARCHAR(255) NULL,
    Marks INT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Questions_Quizzes FOREIGN KEY (QuizID)
        REFERENCES dbo.Quizzes(QuizID)
        ON DELETE CASCADE
);
GO

/* Quiz attempts table  */
CREATE TABLE dbo.QuizAttempts (
    AttemptID INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    Score INT NOT NULL,
    TotalQuestions INT NOT NULL,
    AttemptDate DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_QuizAttempts_Users FOREIGN KEY (UserID)
        REFERENCES dbo.Users(UserID)
        ON DELETE CASCADE
);
GO
/* Seed users */
INSERT INTO dbo.Users (FullName, Email, PasswordHash, Role, Status)
VALUES
('Admin User', 'admin@codemaster.com', 'admin123', 'Admin', 'Active'),
('Student User', 'student@codemaster.com', 'student123', 'Student', 'Active');
GO
/* Seed course, module, and quiz. */
INSERT INTO dbo.Courses (Title, Description, Category, DifficultyLevel, CreatedByUserID, Status)
VALUES
('HTML Basics', 'Learn the basic structure and tags used in HTML.', 'Web Development', 'Beginner', 1, 'Published'),
('CSS Fundamentals', 'Learn how to style web pages using CSS.', 'Web Development', 'Beginner', 1, 'Published');
GO
INSERT INTO dbo.Modules (CourseID, Title, Description, ModuleOrder)
VALUES
(1, 'Introduction to HTML', 'Basic HTML concepts and elements.', 1),
(2, 'Introduction to CSS', 'Basic CSS styling concepts.', 1);
GO
INSERT INTO dbo.Quizzes (ModuleID, Title, TotalMarks, TimeLimit)
VALUES
(1, 'HTML Quiz', 3, 10);
GO
/* Seed questions for the admin Manage Quizzes page */
INSERT INTO dbo.Questions (QuizID, QuestionText, OptionA, OptionB, OptionC, OptionD, CorrectAnswer, Marks)
VALUES
(1, 'What does HTML stand for?', 'Hyper Text Markup Language', 'High Text Machine Language', 'Hyperlink Text Makeup Language', 'Home Tool Markup Language', 'Hyper Text Markup Language', 1),
(1, 'Which HTML tag is used for a paragraph?', 'div', 'p', 'h1', 'span', 'p', 1),
(1, 'Which HTML tag is used to show an image?', 'image', 'src', 'img', 'pic', 'img', 1);
GO
INSERT INTO dbo.QuizAttempts (UserID, Score, TotalQuestions, AttemptDate)
VALUES (2, 2, 3, GETDATE());
GO



