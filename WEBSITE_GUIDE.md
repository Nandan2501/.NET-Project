# Transpo — Full Website Path, Architecture & Database Guide

This single reference file explains the complete structure, URLs/paths, role flows, and database (`TranspoDB`) schema & data flow of the **Transpo** ASP.NET Web Forms website (`WebApplication3`).

---

## 1. Tech Stack & Core Files

- **Framework:** ASP.NET Web Forms (.NET Framework `4.7.2`)
- **Database:** SQL Server LocalDB `(localdb)\MSSQLLocalDB` — Database: `TranspoDB`
- **Project Root:** `C:\Users\Sandiyo\source\repos\Nandan2501\.NET-Project\WebApplication3\`
- **Connection String:** Defined in `WebApplication3\Web.config` (`name="TranspoDB"`).
- **Database Access Layer:** `WebApplication3\DbHelper.cs` (centralized SQL helpers, auth validation, user/app settings, fare calculation).
- **Shared Layout & Auth Guard:** `WebApplication3\Site.Master` & `Site.Master.cs`:
  - Redirects unauthenticated visitors (`Session["UserId"] == null`) to `/Login.aspx`.
  - Enforces folder-level role access (`/Admin/*` for `Admin`, `/Driver/*` for `Driver`).
  - Builds the sidebar navigation dynamically per role (`Customer`, `Driver`, `Admin`).
- **Schema Script:** `TranspoDB.sql` (synced in both repo root and `WebApplication3\`).

---

## 2. Folder Structure

```text
.NET-Project/
├── TranspoDB.sql                  # Full SQL Server schema script (13 tables)
├── WEBSITE_GUIDE.md               # This complete website & database guide
└── WebApplication3/
    ├── Web.config                 # Connection string (TranspoDB), default doc (Login.aspx)
    ├── DbHelper.cs                # All SQL query/command/auth/settings helpers
    ├── Site.Master(.cs)           # Sidebar navigation, topbar user info, role guard, logout
    ├── CSS/                       # style.css + auth page stylesheets (Login, Register, FPass, VCode, ResetPass)
    ├── Images/                    # Static UI images (profile.jpg, auth/banner images)
    ├── Uploads/                   # Runtime uploaded files (Profiles/, Licenses/, VehicleDocs/, Company/)
    ├── *.aspx                     # Public Auth + Customer Portal pages (19 pages)
    ├── Admin/*.aspx               # Admin Portal pages (10 pages)
    └── Driver/*.aspx              # Driver Portal pages (7 pages)
```

---

## 3. Authentication & Login Accounts

Default entry page: `/Login.aspx` (configured in `Web.config`). Users can log in with either **Email** or **Phone**.

| Role | Name | Email | Phone | Password | Status | Redirects To |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| **Admin** | Admin User | `admin@transpo.com` | `9876543200` | `123456` | Active | `/Admin/Dashboard.aspx` |
| **Driver** | Yashrajsinh | `driver@transpo.com` | `9327468707` | `123456` | Active | `/Driver/dashboard.aspx` |
| **Driver** | abhay | `abhay@transpo.com` | `9327468701` | `123456` | Active | `/Driver/dashboard.aspx` |
| **Driver** | mevada divyesh | `divyesh@transpo.com` | `8320246901` | `123456` | Active | `/Driver/dashboard.aspx` |
| **Driver** | brijbrijjjjj | `brij@transpo.com` | `8596454691` | `123456` | Active | `/Driver/dashboard.aspx` |
| **Customer** | Nandan Nasit | `customer@transpo.com` | `9876543210` | `123456` | Active | `/Dashboard.aspx` |
| **Customer** | yash | `yashop78@gmail.com` | `+91 93274 68707` | `123456` | Active | `/Dashboard.aspx` |
| **Customer** | vijay | `vijayop788@gmail.com` | `+91 83202 46902` | `123456` | Active | `/Dashboard.aspx` |
| **Customer** | himil | `himilbhaya45@gmail.com` | `+91 85964 54698` | `123456` | Active | `/Dashboard.aspx` |
| **Customer** | ramesh | `ramesh554@gmail.com` | `+91 78455 36589` | `123456` | Active | `/Dashboard.aspx` |
| **Customer** | raju | `rajubhau4558@gmail.com` | `+91 96589 65896` | `123456` | Inactive | *(Blocked until activated)* |
| **Customer** | viram | `viramviro789@gmail.com` | `+91 96587 25698` | `123456` | Active | `/Dashboard.aspx` |

---

## 4. Complete Website Paths & Database Operations

### A. Public / Auth Pages (5 pages)
| URL Path | File | Reads From DB | Writes To DB |
| :--- | :--- | :--- | :--- |
| `/Login.aspx` | `Login.aspx` | `Users`, `Drivers` | — *(sets Session keys)* |
| `/Register.aspx` | `Register.aspx` | `Users` (duplicate email check) | `Users` (`Role = 'Customer'`) |
| `/FPass.aspx` | `FPass.aspx` | `Users` | `PasswordResetCodes` |
| `/VCode.aspx` | `VCode.aspx` | `PasswordResetCodes` | `PasswordResetCodes` (`IsUsed = 1`) |
| `/ResetPass.aspx` | `ResetPass.aspx` | — | `Users` (`PasswordHash`) |

### B. Customer Portal (14 pages)
| URL Path | File | Reads From DB | Writes To DB |
| :--- | :--- | :--- | :--- |
| `/Dashboard.aspx` | `Dashboard.aspx` | `Users`, `Bookings`, `Payments` | — |
| `/BookTransportation.aspx` | `BookTransportation.aspx` | `Addresses` (saved quick-fill dropdown) | — *(stores Step 1 in Session)* |
| `/BT2.aspx` | `BT2.aspx` | — | — *(stores Step 2 load details in Session)* |
| `/BT3.aspx` | `BT3.aspx` | `Drivers`, `Vehicles` | `Bookings`, `BookingLoadDetails`, `Payments`, `TripMilestones`, `DriverEarnings` |
| `/ConfirmBook.aspx` | `ConfirmBook.aspx` | `Bookings`, `BookingLoadDetails`, `Payments` | — |
| `/Bookings.aspx` | `Bookings.aspx` | `Bookings`, `Payments` (filterable by status) | `Bookings`, `Payments`, `TripMilestones` *(on Cancel)* |
| `/BookDetails.aspx?id=...` | `BookDetails.aspx` | `Bookings`, `Payments`, `BookingLoadDetails`, `Users`, `Vehicles`, `Drivers` | `Payments` *(on Pay Now)* |
| `/Payments.aspx` | `Payments.aspx` | `Payments`, `Bookings` | `Payments` *(on Pay Now)* |
| `/AddressBook.aspx` | `AddressBook.aspx` | `Addresses`, `Users` | `Addresses` *(Delete)* |
| `/AddAddress.aspx` | `AddAddress.aspx` | `Addresses`, `Users` | `Addresses` *(Insert / Update + Default toggle)* |
| `/Profile.aspx` | `Profile.aspx` | `Users`, `Addresses` | — |
| `/EditProfile.aspx` | `EditProfile.aspx` | `Users`, `Addresses` | `Users` (incl. `ProfilePhoto`), `Addresses` |
| `/ChangePassword.aspx` | `ChangePassword.aspx` | `Users` | `Users` (`PasswordHash`) |

### C. Admin Portal (10 pages)
| URL Path | File | Reads From DB | Writes To DB |
| :--- | :--- | :--- | :--- |
| `/Admin/Dashboard.aspx` | `Admin/Dashboard.aspx` | `Bookings`, `Payments`, `Vehicles`, `Drivers`, `Users` | — |
| `/Admin/TripDetails.aspx?id=...` | `Admin/TripDetails.aspx` | `Bookings`, `Users`, `Drivers`, `Vehicles`, `Payments`, `TripMilestones` | `Bookings`, `Payments`, `TripMilestones`, `DriverEarnings` |
| `/Admin/Vehicle.aspx` | `Admin/Vehicle.aspx` | `Vehicles`, `Drivers`, `Users` | `Vehicles`, `VehicleDocuments` *(Delete / Mark Inactive)* |
| `/Admin/AddVehicle.aspx?id=...` | `Admin/AddVehicle.aspx` | `Drivers`, `Users`, `Vehicles` | `Vehicles` *(Insert / Update)* |
| `/Admin/Drivers.aspx` | `Admin/Drivers.aspx` | `Drivers`, `Users`, `Vehicles` | `Drivers` *(Toggle `Active` / `On Leave`)* |
| `/Admin/AddDriver.aspx?id=...` | `Admin/AddDriver.aspx` | `Drivers`, `Users`, `Addresses` | `Users`, `Drivers` (incl. license upload), `Addresses` |
| `/Admin/Customers.aspx` | `Admin/Customers.aspx` | `Users`, `Addresses` | `Users`, `Addresses` *(Add Customer / Toggle `Active` or `Inactive`)* |
| `/Admin/Payment.aspx` | `Admin/Payment.aspx` | `Payments`, `Bookings`, `Users` | `Payments` *(Mark Paid / Refund)* |
| `/Admin/Reports.aspx` | `Admin/Reports.aspx` | `Bookings`, `Payments`, `Vehicles`, `Drivers`, `Users` | — |
| `/Admin/Settings.aspx` | `Admin/Settings.aspx` | `AppSettings` | `AppSettings` (company profile & logo path) |

### D. Driver Portal (7 pages)
| URL Path | File | Reads From DB | Writes To DB |
| :--- | :--- | :--- | :--- |
| `/Driver/dashboard.aspx` | `Driver/dashboard.aspx` | `Users`, `Bookings`, `DriverEarnings` | — |
| `/Driver/trips.aspx` | `Driver/trips.aspx` | `Bookings`, `DriverEarnings` (status filter tabs) | `Bookings`, `TripMilestones`, `DriverEarnings` *(Start / Complete)* |
| `/Driver/ActiveTrip.aspx?id=...` | `Driver/ActiveTrip.aspx` | `Bookings`, `BookingLoadDetails`, `Users` | `Bookings`, `TripMilestones`, `DriverEarnings` *(Start / Complete)* |
| `/Driver/MyEarnings.aspx` | `Driver/MyEarnings.aspx` | `DriverEarnings`, `Bookings` | `DriverEarnings` *(Withdraw Available Balance -> `Paid`)* |
| `/Driver/MyVehicle.aspx` | `Driver/MyVehicle.aspx` | `Vehicles`, `VehicleDocuments` | `VehicleDocuments` *(Upload new document)* |
| `/Driver/Profile.aspx` | `Driver/Profile.aspx` | `Users`, `Drivers`, `Vehicles`, `Addresses`, `Bookings` | `Users` (incl. photo), `Drivers`, `Addresses` |
| `/Driver/Settings.aspx` | `Driver/Settings.aspx` | `UserSettings`, `Users` | `UserSettings` (`Language`, `TimeZone`), `Users` (`PasswordHash`) |

---

## 5. `TranspoDB` Database Schema & Current Data

There are **13 tables** in `TranspoDB`:

| Table | Purpose | Key Columns & Relationships | Seeded Rows |
| :--- | :--- | :--- | :---: |
| `Users` | All accounts (`Customer`, `Driver`, `Admin`) | `UserId` (PK), `FullName`, `Email` (UQ), `Phone`, `PasswordHash`, `Role`, `DateOfBirth`, `ProfilePhoto`, `AccountStatus` | 12 |
| `Addresses` | Customer/Driver saved addresses | `AddressId` (PK), `UserId` (FK→`Users`), `AddressTitle`, `FullAddress`, `City`, `State`, `PostalCode`, `Country`, `ContactPhone`, `AddressType`, `IsDefault` | 10 |
| `Drivers` | Driver license & performance profile | `DriverId` (PK), `UserId` (FK→`Users`), `LicenseNumber` (UQ), `LicenseExpiry`, `VerificationStatus`, `Rating`, `LicenseDocumentPath`, `EmergencyContact`, `JoinDate` | 4 |
| `Vehicles` | Fleet trucks & driver assignment | `VehicleId` (PK), `VehicleName`, `VehicleType`, `RegistrationNumber` (UQ), `CapacityKg`, `DriverId` (FK→`Drivers`), `VehicleStatus`, `VehicleAge`, `AadharStatus`, `Notes`, `InsuranceExpiry`, `PucExpiry` | 4 |
| `Bookings` | Transportation orders & trips | `BookingId` (PK), `BookingNumber` (UQ), `CustomerId` (FK→`Users`), `DriverId` (FK→`Drivers`), `VehicleId` (FK→`Vehicles`), `PickupAddress/City`, `DropAddress/City`, `VehicleType`, `PreferredDate`, `DistanceKm`, `BaseFare`, `TollsTaxes`, `BookingStatus` (`Pending`, `Confirmed`, `Ongoing`, `Completed`, `Cancelled`) | 4 |
| `BookingLoadDetails` | Cargo weight, packages & dimensions | `LoadDetailId` (PK), `BookingId` (FK→`Bookings`, UQ), `LoadType`, `WeightKg`, `PackageCount`, `LengthCm`, `WidthCm`, `HeightCm`, `SpecialHandling` | 4 |
| `Payments` | Customer billing & payment status | `PaymentId` (PK), `BookingId` (FK→`Bookings`), `Amount`, `PaymentMethod`, `TransactionReference`, `PaymentStatus` (`Pending`, `Paid`, `Failed`, `Refunded`), `PaidAt` | 4 |
| `TripMilestones` | Pickup & drop tracking checkpoints | `MilestoneId` (PK), `BookingId` (FK→`Bookings`), `LocationName`, `MilestoneType` (`Pickup`/`Drop`), `ExpectedTime`, `ActualTime`, `MilestoneStatus` | 8 |
| `VehicleDocuments` | License, Insurance, PUC, RC uploads | `DocumentId` (PK), `VehicleId` (FK→`Vehicles`), `DocumentType`, `DocumentPath`, `ExpiryDate`, `VerificationStatus` | 6 |
| `DriverEarnings` | Driver trip payouts & balance | `EarningId` (PK), `DriverId` (FK→`Drivers`), `BookingId` (FK→`Bookings`), `GrossAmount`, `Commission`, `NetAmount` (computed), `PayoutStatus`, `TransactionRef`, `Description`, `PaidAt` | 3 |
| `UserSettings` | Per-user preferences | `SettingId` (PK), `UserId` (FK→`Users`), `SettingKey`, `SettingValue` | 2 |
| `AppSettings` | Global company profile & logo | `SettingId` (PK), `SettingKey` (UQ), `SettingValue`, `UpdatedAt` | 7 |
| `PasswordResetCodes` | OTP reset codes (`1234` flow) | `ResetId` (PK), `UserId` (FK→`Users`), `CodeHash`, `ExpiresAt`, `IsUsed` | 0 |

---

## 6. End-to-End Business Flow

```text
1. Customer Books & Pays Full Amount (/BookTransportation.aspx -> BT2.aspx -> BT3.aspx -> ConfirmBook.aspx)
   ├── Inserts Bookings (DriverId = NULL, BookingStatus = 'Pending' — open for drivers)
   ├── Inserts BookingLoadDetails (load type, weight, packages, L×W×H, handling)
   ├── Inserts Payments (PaymentStatus = 'Paid', full Amount upfront)
   └── Inserts TripMilestones (Pickup & Drop = Pending)

2. Driver Views Open Trips & Confirms (/Driver/dashboard.aspx or /Driver/trips.aspx)
   ├── Sees Pickup City -> Drop City, Load Details, and 50%/50% Driver Payout
   ├── Clicks "Confirm Trip" -> DriverId assigned, BookingStatus = 'Confirmed'
   └── Goes to pickup & clicks "Arrived at Pickup" -> Pickup milestone = 'DriverArrived'

3. Customer Confirms Driver Arrival (/Bookings.aspx or /BookDetails.aspx)
   └── Clicks "Confirm Driver Arrived" -> BookingStatus = 'Ongoing', Pickup = 'Completed'
       └── 1st Half (50% of driver share) credited to DriverEarnings (PayoutStatus = 'Paid')

4. Driver Delivers & Customer Confirms Completion
   ├── Driver clicks "Mark Delivered" (/Driver/trips.aspx or /Driver/ActiveTrip.aspx) -> Drop = 'DriverDelivered'
   └── Customer clicks "Confirm Trip Completed" (/Bookings.aspx or /BookDetails.aspx) -> BookingStatus = 'Completed'
       └── 2nd Half (50% of driver share) credited to DriverEarnings (PayoutStatus = 'Paid')

5. Admin Oversees Platform (/Admin/*)
   ├── Views KPIs & recent bookings on /Admin/Dashboard.aspx & /Admin/Reports.aspx
   ├── Reassigns Driver/Vehicle or changes Booking/Payment status on /Admin/TripDetails.aspx
   ├── Manages Fleet (/Admin/Vehicle.aspx), Drivers (/Admin/Drivers.aspx), Customers (/Admin/Customers.aspx)
   └── Reconciles Payments (/Admin/Payment.aspx) & Company Info (/Admin/Settings.aspx)
```

---

## 7. Running Locally

1. Ensure SQL Server LocalDB (`(localdb)\MSSQLLocalDB`) has `TranspoDB` running (run `TranspoDB.sql` if setting up on a new machine).
2. Open `WebApplication3.sln` in Visual Studio and press **F5**, or run IIS Express directly:
   ```powershell
   & "C:\Program Files\IIS Express\iisexpress.exe" /path:"C:\Users\Sandiyo\source\repos\Nandan2501\.NET-Project\WebApplication3" /port:54205
   ```
3. Open `http://localhost:54205/Login.aspx`.
