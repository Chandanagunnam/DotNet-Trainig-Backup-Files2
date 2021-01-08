using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Cryptography.X509Certificates;
using System.Web.Http;
using prjSecondApplication.Models;

namespace prjSecondApplication.Controllers
{
    public class CountryController : ApiController
    {
        [Route("countrylist")]
        public HttpResponseMessage Get()
        {
            //list of countries

            List<Country> Countries = new List<Country>();

            Country country = new Country();

            country.ID = 1;
            country.CountryName = "India";
            country.Capital = "New Delhi";
            Countries.Add(country);

            //Countries to the response body
            HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, Countries);
            return response;
        }

        public IHttpActionResult Get(int id)
        {
            List<Country> Countries = new List<Country>();

            Country country = new Country();

            country.ID = 1;
            country.CountryName = "UK";
            country.Capital = "London";
            Countries.Add(country);

            //findinng country based on provided id
            var result = Countries.FirstOrDefault(x => x.ID == id);

            if(result == null)
            {
                //Create a 404 (Not Found) response
                return NotFound();
            }
            else
            {
                //Create a 200(OK) response that contains the country
                return Ok(result);
            }

        }
    }
}
