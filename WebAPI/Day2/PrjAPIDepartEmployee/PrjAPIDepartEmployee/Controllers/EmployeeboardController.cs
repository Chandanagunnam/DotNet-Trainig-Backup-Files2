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
    
    public class EmployeeboardController : ApiController
    {
        DbSampleEntities db = new DbSampleEntities();
        public HttpResponseMessage Get([FromUri]int? id)
        {
            
            float tax = 0;


            dynamic salary = db.EmployeeTables.Find(id).salary;

            if (salary > 0)
            {
                if ((salary*12) > 300000)
                {
                    tax = (salary * 12) / 10;
                }
                else
                {
                    tax = 0;
                }
            }
            return Request.CreateResponse(HttpStatusCode.OK, tax);
        }

        

       
    }
}
