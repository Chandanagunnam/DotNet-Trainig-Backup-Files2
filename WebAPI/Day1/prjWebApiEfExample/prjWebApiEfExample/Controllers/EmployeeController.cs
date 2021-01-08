using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using prjWebApiEfExample.Models;

namespace prjWebApiEfExample.Controllers
{
    public class EmployeeController : ApiController
    {
        dbemployee873Entities db = new dbemployee873Entities();

        [Route("getemployee")]
        public HttpResponseMessage Get()
        {
            var Employees = db.EmployeeTables.ToList();
            if(Employees.Count >0)
            {
                return Request.CreateResponse(HttpStatusCode.OK, Employees);
            }
            else
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, "No data found");
            }
        }

        //get by gender

        public HttpResponseMessage Get(string gender ="All")
        {
            switch(gender.ToLower())
            {
                case "all":
                    return Request.CreateResponse(HttpStatusCode.OK,
                       db.EmployeeTables.ToList());
                case "male":
                    return Request.CreateResponse(HttpStatusCode.OK,
                        db.EmployeeTables.Where(e => e.gender.ToLower() == "m").ToList());
                case "female":
                    return Request.CreateResponse(HttpStatusCode.OK,
                        db.EmployeeTables.Where(e => e.gender.ToLower() == "f").ToList());
                default:
                    return Request.CreateErrorResponse(HttpStatusCode.BadRequest,
                        "Value fro gender must be Male or Female or All" + gender + "is valid");


            }

        }

        //PUT

        public HttpResponseMessage Put(int id, EmployeeTable empobj)
        {
            try
            {
                var entity = db.EmployeeTables.FirstOrDefault(e => e.Eid == id);
                if(entity == null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound,
                                           "Employee with Id" + id.ToString() + "not found to update");
                }

                else
                {
                    entity.Ename = empobj.Ename;
                    entity.Salary = empobj.Salary;
                    entity.gender = empobj.gender;

                    db.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK, entity);
                }
            }
            catch(Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        //Post

        public HttpResponseMessage Post([FromBody] EmployeeTable employeeTable)
        {
            try
            {
                db.EmployeeTables.Add(employeeTable);
                db.SaveChanges();
                var message= Request.CreateResponse(HttpStatusCode.Created, employeeTable);
                message.Headers.Location = new Uri(Request.RequestUri +
                    employeeTable.Eid.ToString());

                return message;

            }
            catch(Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }

        //Delete
        public HttpResponseMessage Delete(int id)
        {
            try
            {
                var entity = db.EmployeeTables.FirstOrDefault(e => e.Eid == id);
                if(entity == null)
                {
                    return Request.CreateErrorResponse(HttpStatusCode.NotFound, "Employee with Id=" + id.ToString() + "not found to delete");
                }
                else
                {
                    db.EmployeeTables.Remove(entity);
                    db.SaveChanges();
                    return Request.CreateResponse(HttpStatusCode.OK);
                }
            }

            catch (Exception ex)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ex);
            }
        }


    }
}
