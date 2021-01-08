ALTER PROCEDURE RegisterUser
@FirstName VARCHAR(20),
@LastName VARCHAR(20),
@Email VARCHAR(50),
@MobileNumber NVARCHAR(15),
@Password VARCHAR(20),
@Role VARCHAR(10),
@Status VARCHAR(10),
@Gender VARCHAR(1),
@CreatedOn Datetime
AS
INSERT INTO UserTable(FirstName, LastName, Email, MobileNumber, Password, Role, Status, Gender, CreatedOn) 
VALUES (@FirstName, @LastName, @Email, @MobileNumber, @Password, @Role, @Status, @Gender, @CreatedOn)