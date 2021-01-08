using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.Mvc;
using MVCClient.Models;


namespace MVCClient.Controllers
{
    public class DepartmentconsumingController : Controller
    {
        // GET: Departmentconsuming
        public ActionResult GetDept()
        {
            IEnumerable<DepartmentVM> DepartmentTables = null;
            using(var client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:44353/api/");
                //Called Member default GET All records
                //GetAsync to send a GET request
                //PutAsync to send a PUT request

                var responseTask = client.GetAsync("Departments");
                responseTask.Wait();

                //To store result of web api response
                var result = responseTask.Result;

                //If success received
                if(result.IsSuccessStatusCode)
                {
                    var readTask = result.Content.ReadAsAsync<IList<DepartmentVM>>();
                    readTask.Wait();

                    DepartmentTables = readTask.Result;
                }
                else
                {
                    //Error response received
                    DepartmentTables = Enumerable.Empty<DepartmentVM>();
                    ModelState.AddModelError(string.Empty, "Server error try after some time");
                }
            }
            return View(DepartmentTables);
        }
    }
}