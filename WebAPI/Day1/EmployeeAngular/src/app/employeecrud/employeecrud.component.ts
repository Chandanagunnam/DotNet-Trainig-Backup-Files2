import { Component, OnInit } from '@angular/core';
import { Employee } from 'src/models/employee.model';
import { EmployeeService } from 'src/Services/employeeService';

@Component({
  selector: 'app-employeecrud',
  templateUrl: './employeecrud.component.html',
  styleUrls: ['./employeecrud.component.css']
})
export class EmployeecrudComponent implements OnInit {

  empdetails:any=[];
  constructor(private empservice:EmployeeService) { }

  ngOnInit() {
   this.fetchEmployee();
  }

  fetchEmployee()
  {
    //debugger;
    this.empdetails=this.empservice.getEmployee().subscribe( (data)=>{this.empdetails=data;console.log(data)})
    console.log(this.empdetails);
  }
}
