import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import{HttpClientModule} from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { EmployeeService } from 'src/Services/employeeService';
import { EmployeecrudComponent } from './employeecrud/employeecrud.component';
import { DepartmentcrudComponent } from './departmentcrud/departmentcrud.component';
import{FormsModule} from '@angular/forms'

@NgModule({
  declarations: [
    AppComponent,
    EmployeecrudComponent,
    DepartmentcrudComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,HttpClientModule,FormsModule
  ],
  providers: [EmployeeService],
  bootstrap: [AppComponent]
})
export class AppModule { }
