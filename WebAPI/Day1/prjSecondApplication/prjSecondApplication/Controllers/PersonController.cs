using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using prjSecondApplication.Models;

namespace prjSecondApplication.Controllers
{
    public class PersonController : ApiController
    {

        static List<Person> personlist = new List<Person>()

        {
            new Person {ID =1,Name="Gopika",City="Panaji"},
            new Person {ID =2,Name="Raashi",City="Patna"},
            new Person {ID =3,Name="Ahem",City="Varanasi" }

        };

        //@model
        //Get:api/person
        [Route("persondetails")]
        public IEnumerable<Person> Get()
        {
            return personlist;
        }

        //Http call by get id
        public IHttpActionResult GetPerson(int id)
        {
            Person person = personlist.Find(p => p.ID == id);
            return Ok(person);
        }

        //POSt api/person
        public void Post([FromBody]Person person)
        {
            personlist.Add(person);
        }



    }
}
