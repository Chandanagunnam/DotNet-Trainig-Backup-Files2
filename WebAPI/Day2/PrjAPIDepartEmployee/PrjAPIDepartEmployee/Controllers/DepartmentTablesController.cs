using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using PrjAPIDepartEmployee.Models;

namespace PrjAPIDepartEmployee.Controllers
{
    public class DepartmentTablesController : ApiController
    {
        private DbSampleEntities db = new DbSampleEntities();

        // GET: api/DepartmentTables
        public IQueryable<DepartmentTable> GetDepartmentTables()
        {
            return db.DepartmentTables;
        }

        // GET: api/DepartmentTables/5
        [ResponseType(typeof(DepartmentTable))]
        public IHttpActionResult GetDepartmentTable(int id)
        {
            DepartmentTable departmentTable = db.DepartmentTables.Find(id);
            if (departmentTable == null)
            {
                return NotFound();
            }

            return Ok(departmentTable);
        }

        // PUT: api/DepartmentTables/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutDepartmentTable(int id, DepartmentTable departmentTable)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != departmentTable.Deptid)
            {
                return BadRequest();
            }

            db.Entry(departmentTable).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DepartmentTableExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/DepartmentTables
        [ResponseType(typeof(DepartmentTable))]
        public IHttpActionResult PostDepartmentTable(DepartmentTable departmentTable)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.DepartmentTables.Add(departmentTable);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (DepartmentTableExists(departmentTable.Deptid))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = departmentTable.Deptid }, departmentTable);
        }

        // DELETE: api/DepartmentTables/5
        [ResponseType(typeof(DepartmentTable))]
        public IHttpActionResult DeleteDepartmentTable(int id)
        {
            DepartmentTable departmentTable = db.DepartmentTables.Find(id);
            if (departmentTable == null)
            {
                return NotFound();
            }

            db.DepartmentTables.Remove(departmentTable);
            db.SaveChanges();

            return Ok(departmentTable);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool DepartmentTableExists(int id)
        {
            return db.DepartmentTables.Count(e => e.Deptid == id) > 0;
        }
    }
}