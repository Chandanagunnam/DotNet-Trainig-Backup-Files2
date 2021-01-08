import { Component, OnInit } from '@angular/core';
import { Department } from 'src/models/department.model';
import { DepartmentService } from 'src/Services/departmentService';
import { NgForm} from '@angular/forms';
@Component({
  selector: 'app-departmentcrud',
  templateUrl: './departmentcrud.component.html',
  styleUrls: ['./departmentcrud.component.css']
})
export class DepartmentcrudComponent implements OnInit {

  constructor(private deptservice: DepartmentService) { }

  ngOnInit() {
    this.fetchDept();
  }
  //Get Method
  departments;
  fetchDept() {
    this.deptservice.getDept().subscribe((data) => {
      this.departments = data;
      console.log(data)
    })

  }
  //POST Method
  //dept is of the type any object
  dept: any = {};
  result;
  addDept() {
    console.log(this.dept);
    this.deptservice.insertDept(this.dept).subscribe((data) => { this.result = data; })
    window.alert("Data Added!!!");
    //to see the changed data  without  reloading the page
    this.fetchDept();
  }
  //Delete department
  removeDept(id) {
    this.deptservice.deleteDept(id).subscribe((data)=>{this.result=data;})
    window.alert("Data Deleted!!!");
  }
//Fetching particular department details
  getparticulardept(id)
  {
   // debugger;
   this.deptservice.getdeptbyid(id).subscribe((data)=>{ this.dept=data;})
 
  }

  //pass the updated record to database
  //You can also pass form 
  //updateparticularDept1(deptform:NgForm){}
  updateparticularDept(dept:Department)
  {
    console.log(dept);
    this.deptservice.updateDept(dept).subscribe((data)=>{this.result=data;})
    window.alert("Record Updated!!!");
  }
}
