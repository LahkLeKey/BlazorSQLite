-- SQLite Commands.

-- Basic User Table
CREATE TABLE "Users" (
	"UUID"	TEXT NOT NULL UNIQUE,
	"Username"	TEXT NOT NULL UNIQUE,
	"Email"	TEXT NOT NULL UNIQUE,
	"PasswordHash"	TEXT NOT NULL,
	PRIMARY KEY("UUID")
);

-- Add Sample User to the User Table
INSERT INTO Users (UUID, Username, Email, PasswordHash)
VALUES (
	"31fb866b-6c92-4af6-a597-ce88306cd4ac", -- UUID
	"LahkLeKey", -- Username
	"LahkLeKey@gmail.com", -- Email
	"placeholder" -- PasswordHash
);

-- Change Password of User with UUID 31fb866b-6c92-4af6-a597-ce88306cd4ac
UPDATE Users SET PasswordHash = "changeme" WHERE UUID = "31fb866b-6c92-4af6-a597-ce88306cd4ac"

-- Delete Sample User from the User Table
DELETE FROM Users WHERE UUID = "31fb866b-6c92-4af6-a597-ce88306cd4ac"

-- Setup SQLite3 AUTOINCREMENT table
-- Note : This should automatically happen when you create a table with AUTOINCREMENT
CREATE TABLE "sqlite_sequence" (
	"name",
	"seq"	
);

-- Basic Logs Table
CREATE TABLE "Logs" (
	"Index"	INTEGER NOT NULL UNIQUE,
	"Content"	TEXT NOT NULL,
	"UserUUID"	TEXT NOT NULL,
	PRIMARY KEY("Index" AUTOINCREMENT),
	FOREIGN KEY("UserUUID") REFERENCES Users(UUID)
);

-- Add Sample Log to the Logs Table
INSERT INTO Logs (Content, UserUUID)
VALUES (
	"This is a sample log", -- Content
	"31fb866b-6c92-4af6-a597-ce88306cd4ac" -- UserUUID
);

-- Select all Logs from the Logs Table that belong to User with UUID 31fb866b-6c92-4af6-a597-ce88306cd4ac
SELECT * FROM Logs WHERE UserUUID = "31fb866b-6c92-4af6-a597-ce88306cd4ac"