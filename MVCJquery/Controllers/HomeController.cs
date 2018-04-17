using MVCJquery.Models;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace MVCJquery.Controllers
{
    public class HomeController : Controller
    {
        MVCTutorialEntities db = new MVCTutorialEntities();

        public ActionResult Index()
        {
            List<tblDepartament> DepList = db.tblDepartaments.ToList();
            ViewBag.ListOfDepartament = new SelectList(DepList, "DepartamentId", "DepartamentName");

            return View();
        }

        public JsonResult GetStudentList()
        {
            List<StudentViewModel> StudentList = db.tblStudents.Where(x => x.IsDelete == false).Select(x => new StudentViewModel
            {
                StudentId = x.StudentId,
                StudentName = x.StudentName,
                Email = x.Email,
                DepartamentName = x.tblDepartament.DepartamentName
            }).ToList();

            //Prueba 123

            //Otros cambios

            return Json(StudentList, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStudentById(int StudentId)
        {
            tblStudent model = db.tblStudents.Where(x => x.StudentId == StudentId).SingleOrDefault();
            string value = string.Empty;
            value = JsonConvert.SerializeObject(model, Formatting.Indented, new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            });

            return Json(value, JsonRequestBehavior.AllowGet);
        }
    }
}