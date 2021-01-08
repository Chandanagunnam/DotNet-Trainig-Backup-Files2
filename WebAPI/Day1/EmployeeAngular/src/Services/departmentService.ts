import { HttpClient } from '@angular/common/http';

import { Injectable } from '@angular/core';
import { Department } from 'src/models/department.model';
@Injectable({ providedIn: "root" })
export class DepartmentService {
    constructor(private http: HttpClient) {

    }

    readonly uri = "http://localhost:61316/api/Departments/";
    getDept() {
        return this.http.get(this.uri);
    }

    insertDept(dept) {
        return this.http.post(this.uri, dept);
    }

    // to pass id as url parameter
    deleteDept(id) {
        return this.http.delete(this.uri + id);
    }
    //Update
    //Put
    public putDept(department: Department) {
        return this.http.put(this.uri + department.deptid, department)

    }

    // To perform edit operation we need to fetch the particular data first

    //get by id 
public getdeptbyid(id)
{
    //debugger;
    return this.http.get(this.uri+id);
}
//updating the particular record
public updateDept(department:Department)
{
    return this.http.put(this.uri+department.deptid,department)

}
}