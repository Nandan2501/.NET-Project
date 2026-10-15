SET ANSI_NULLS ON;
SET QUOTED_IDENTIFIER ON;
GO

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'TranspoDB')
BEGIN
    CREATE DATABASE TranspoDB;
END
GO

USE TranspoDB;
GO

-- 1. USERS: Customer, Driver, Admin
IF OBJECT_ID('dbo.Users', 'U') IS NULL
CREATE TABLE Users (
    UserId INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(150) NOT NULL UNIQUE,
    Phone NVARCHAR(20),
    PasswordHash NVARCHAR(255) NOT NULL,
    Role NVARCHAR(20) NOT NULL DEFAULT 'Customer'
        CHECK (Role IN ('Customer', 'Driver', 'Admin')),
    DateOfBirth DATE NULL,
    ProfilePhoto NVARCHAR(500) NULL,
    AccountStatus NVARCHAR(20) NOT NULL DEFAULT 'Active',
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO

-- 2. ADDRESSES: Address Book
IF OBJECT_ID('dbo.Addresses', 'U') IS NULL
CREATE TABLE Addresses (
    AddressId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    AddressTitle NVARCHAR(50),
    FullAddress NVARCHAR(300) NOT NULL,
    City NVARCHAR(100),
    State NVARCHAR(100),
    PostalCode NVARCHAR(15),
    IsDefault BIT NOT NULL DEFAULT 0,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO

-- 3. DRIVERS: Driver-specific details
IF OBJECT_ID('dbo.Drivers', 'U') IS NULL
CREATE TABLE Drivers (
    DriverId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL UNIQUE,
    LicenseNumber NVARCHAR(50) NOT NULL UNIQUE,
    LicenseExpiry DATE NULL,
    VerificationStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending',
    Rating DECIMAL(3,2) NULL,
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO

-- 4. VEHICLES: Admin and Driver vehicle pages
IF OBJECT_ID('dbo.Vehicles', 'U') IS NULL
CREATE TABLE Vehicles (
    VehicleId INT IDENTITY(1,1) PRIMARY KEY,
    VehicleName NVARCHAR(100) NOT NULL,
    VehicleType NVARCHAR(50) NOT NULL,
    RegistrationNumber NVARCHAR(30) NOT NULL UNIQUE,
    CapacityKg DECIMAL(10,2) NULL,
    DriverId INT NULL,
    VehicleStatus NVARCHAR(20) NOT NULL DEFAULT 'Available',
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    FOREIGN KEY (DriverId) REFERENCES Drivers(DriverId)
);
GO

-- 5. BOOKINGS: Customer bookings and trips
IF OBJECT_ID('dbo.Bookings', 'U') IS NULL
CREATE TABLE Bookings (
    BookingId INT IDENTITY(1,1) PRIMARY KEY,
    BookingNumber NVARCHAR(30) NOT NULL UNIQUE,
    CustomerId INT NOT NULL,
    DriverId INT NULL,
    VehicleId INT NULL,
    PickupAddress NVARCHAR(300) NOT NULL,
    PickupCity NVARCHAR(100),
    DropAddress NVARCHAR(300) NOT NULL,
    DropCity NVARCHAR(100),
    VehicleType NVARCHAR(50),
    PreferredDate DATETIME2 NOT NULL,
    Instructions NVARCHAR(1000) NULL,
    BookingStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (BookingStatus IN
        ('Pending', 'Confirmed', 'Ongoing', 'Completed', 'Cancelled')),
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (CustomerId) REFERENCES Users(UserId),
    FOREIGN KEY (DriverId) REFERENCES Drivers(DriverId),
    FOREIGN KEY (VehicleId) REFERENCES Vehicles(VehicleId)
);
GO

-- 6. BOOKING LOAD DETAILS: LoadDetails.aspx
IF OBJECT_ID('dbo.BookingLoadDetails', 'U') IS NULL
CREATE TABLE BookingLoadDetails (
    LoadDetailId INT IDENTITY(1,1) PRIMARY KEY,
    BookingId INT NOT NULL UNIQUE,
    LoadType NVARCHAR(100),
    WeightKg DECIMAL(10,2),
    PackageCount INT,
    LengthCm DECIMAL(10,2),
    WidthCm DECIMAL(10,2),
    HeightCm DECIMAL(10,2),
    SpecialHandling NVARCHAR(500),

    FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId)
);
GO

-- 7. PAYMENTS: Customer and Admin payment pages
IF OBJECT_ID('dbo.Payments', 'U') IS NULL
CREATE TABLE Payments (
    PaymentId INT IDENTITY(1,1) PRIMARY KEY,
    BookingId INT NOT NULL,
    Amount DECIMAL(12,2) NOT NULL,
    PaymentMethod NVARCHAR(50),
    TransactionReference NVARCHAR(100),
    PaymentStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (PaymentStatus IN
        ('Pending', 'Paid', 'Failed', 'Refunded')),
    PaidAt DATETIME2 NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId)
);
GO

-- 8. TRIP MILESTONES: Active Trip and tracking
IF OBJECT_ID('dbo.TripMilestones', 'U') IS NULL
CREATE TABLE TripMilestones (
    MilestoneId INT IDENTITY(1,1) PRIMARY KEY,
    BookingId INT NOT NULL,
    LocationName NVARCHAR(200) NOT NULL,
    MilestoneType NVARCHAR(30),
    ExpectedTime DATETIME2 NULL,
    ActualTime DATETIME2 NULL,
    MilestoneStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending',
    Latitude DECIMAL(10,7) NULL,
    Longitude DECIMAL(10,7) NULL,

    FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId)
);
GO

-- 9. VEHICLE DOCUMENTS
IF OBJECT_ID('dbo.VehicleDocuments', 'U') IS NULL
CREATE TABLE VehicleDocuments (
    DocumentId INT IDENTITY(1,1) PRIMARY KEY,
    VehicleId INT NOT NULL,
    DocumentType NVARCHAR(50) NOT NULL,
    DocumentPath NVARCHAR(500) NOT NULL,
    ExpiryDate DATE NULL,
    VerificationStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending',

    FOREIGN KEY (VehicleId) REFERENCES Vehicles(VehicleId)
);
GO

-- 10. DRIVER EARNINGS
IF OBJECT_ID('dbo.DriverEarnings', 'U') IS NULL
CREATE TABLE DriverEarnings (
    EarningId INT IDENTITY(1,1) PRIMARY KEY,
    DriverId INT NOT NULL,
    BookingId INT NOT NULL,
    GrossAmount DECIMAL(12,2) NOT NULL,
    Commission DECIMAL(12,2) NOT NULL DEFAULT 0,
    NetAmount AS (GrossAmount - Commission) PERSISTED,
    PayoutStatus NVARCHAR(20) NOT NULL DEFAULT 'Pending',
    EarnedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    PaidAt DATETIME2 NULL,

    FOREIGN KEY (DriverId) REFERENCES Drivers(DriverId),
    FOREIGN KEY (BookingId) REFERENCES Bookings(BookingId)
);
GO

-- 11. USER SETTINGS
IF OBJECT_ID('dbo.UserSettings', 'U') IS NULL
CREATE TABLE UserSettings (
    SettingId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    SettingKey NVARCHAR(100) NOT NULL,
    SettingValue NVARCHAR(500) NULL,

    CONSTRAINT UQ_UserSetting UNIQUE (UserId, SettingKey),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO

-- 12. PASSWORD RESET AND VERIFICATION CODES
IF OBJECT_ID('dbo.PasswordResetCodes', 'U') IS NULL
CREATE TABLE PasswordResetCodes (
    ResetId INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    CodeHash NVARCHAR(255) NOT NULL,
    ExpiresAt DATETIME2 NOT NULL,
    IsUsed BIT NOT NULL DEFAULT 0,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),

    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);
GO

-- 13. APPLICATION-WIDE ADMIN SETTINGS
IF OBJECT_ID('dbo.AppSettings', 'U') IS NULL
CREATE TABLE AppSettings (
    SettingId INT IDENTITY(1,1) PRIMARY KEY,
    SettingKey NVARCHAR(100) NOT NULL UNIQUE,
    SettingValue NVARCHAR(1000) NULL,
    UpdatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME()
);
GO
