import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MustMatch } from '../mustmatch';
import { RegistrationModel } from '../models/registration-model';
import { RegistrationService } from '../services/registration.service';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { Adminservice } from '../services/admin.service';

@Component({
  selector: 'app-retailercrud',
  templateUrl: './retailercrud.component.html',
  styleUrls: ['./retailercrud.component.css']
})
export class RetailercrudComponent implements OnInit {
  registrationModel: RegistrationModel[];
  registerForm: FormGroup;
  registration: RegistrationModel = new RegistrationModel();
  deleteUserId: number;
  errorMessage;
  addUpdate: string = 'Add';
  submitted = false;
  constructor(private formBuilder: FormBuilder, private registrationService: RegistrationService,
              private modalService: NgbModal, private adminservice: Adminservice) { }

  ngOnInit(): void {
    this.GetRetailer();
    this.registerForm = this.formBuilder.group({
      firstName: ['', Validators.required],
      lastName: ['', Validators.required],
      gender: ['', Validators.required],
      mobileNo: ['', Validators.required],
      email: ['', [Validators.required, Validators.email]],
      password: ['', [Validators.required, Validators.minLength(6)]],
      confirmPassword: ['', Validators.required]
    },
      { validator: MustMatch('password', 'confirmPassword') }
    );
  }
  get f() { return this.registerForm.controls; }

  onSubmit(model) {
    debugger;
    this.submitted = true;
    if (this.registerForm.invalid) {
      return;
    }
    model.Role = 'Retailer';
    this.registrationService.Register(model).subscribe((response: any) => {
      this.submitted = false;
      alert('Retailer Registered Succesfully');
      this.registration = new RegistrationModel();
      if (response.IsValid) {

      }
    }
    ,
    (error) => {   
      console.error('Error caught of Retailercrud Component')
      this.errorMessage = error;
     // this.loading = false;

    }
    );

  }

  GetRetailer() {
    this.adminservice.GetRetailer().subscribe((data: any) => {
      this.registrationModel = data;
    },
    
    (error) => {   
      console.error('Error caught in GetRetailer of RetailerCrud Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }
  GetRetailerById(id) {
    debugger;
    this.adminservice.GetRetailerById(id).subscribe((response: any) => {
      this.addUpdate = 'Update';
      this.registration = response;
    },
    
    (error) => {   
      console.error('Error caught in GetRetailerbyId of RetailerCrud Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }
  DeleteConfirmation(id) {
    this.deleteUserId = id;
  }

  DeleteProduct() {
    debugger;
    this.adminservice.DeleteRetailer(this.deleteUserId).subscribe((response: any) => {
      this.GetRetailer();
      alert('Retailer Removed Successfully');
    },
    
    (error) => {   
      console.error('Error caught in DeleteProduct of RetailerCrud Component')
      this.errorMessage = error;
     // this.loading = false;

    });
  }
  openDeletePopup(contentdelete, id) {
    this.deleteUserId = id;
    this.modalService.open(contentdelete);
  }

}
