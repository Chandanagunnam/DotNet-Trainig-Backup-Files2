import { HttpClient } from '@angular/common/http';

import{Injectable} from '@angular/core'

@Injectable({providedIn:"root"})
export class EmployeeService
{

    constructor(private http:HttpClient)
        {

        }

    getEmployee()
      {
          let data;
         // debugger;
         return data=this.http.get("http://localhost:61316/getemployee");
         console.log(data);
      }  
}