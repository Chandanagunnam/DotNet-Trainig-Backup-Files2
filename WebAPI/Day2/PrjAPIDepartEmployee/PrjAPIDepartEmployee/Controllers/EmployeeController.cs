using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Routing;
using PrjAPIDepartEmployee.Models;

namespace PrjAPIDepartEmployee.Controllers
{
    public class EmployeeController : ApiController
    {
        DbSampleEntities db = new DbSampleEntities();
        

        //Route[("GetEmpOfDept")]
        public HttpResponseMessage Get(string deptname)
        {
            /*var did = (from d in db.DepartmentTables
                       where d.Dname==deptname
                       select d.Deptid).SingleOrDefault();

            var emp = (from e in db.EmployeeTables
                       where e.Deptid==did
                       select new
                       {
                           Name = e.Name,
                           Age = e.Age,
                           Gender = e.Gender,
                           mobile = e.mobile,
                           Salary = e.salary
                       }
                       ).ToList();*/

           var emp1 = (from e in db.EmployeeTables
                       join d in db.DepartmentTables
                       on e.Deptid equals d.Deptid
                        where d.Dname==deptname
                       select new
                       {
                           Name = e.Name,
                           Age = e.Age,
                           Gender = e.Gender,
                           Mobile = e.mobile,
                           Salary = e.salary,
                           Deptid = e.Deptid
                       }).ToList();

            return this.Request.CreateResponse(HttpStatusCode.OK,emp1);

        }
    }
}
