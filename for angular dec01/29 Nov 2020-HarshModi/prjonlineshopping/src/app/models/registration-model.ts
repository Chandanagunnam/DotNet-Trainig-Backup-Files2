export class RegistrationModel {
    constructor() {
        this.Id = null;
        this.UserID = null;
        this.FirstName = '';
        this.LastName = '';
        this.Gender = '';
        this.MobileNumber = '';
        this.Email = '';
        this.Password = '';
        this.ConfirmPassword = '';
        this.Role = 'User';
        this.Status = '';
        this.CreatedOn = null;
    }
    Id: number;
    UserID: number;
    FirstName: string;
    LastName: string;
    Gender: string;
    MobileNumber: string;
    Email: string;
    Password: string;
    ConfirmPassword: string;
    Role: string;
    Status: string;
    CreatedOn: Date;
}
