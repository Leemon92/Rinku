using Newtonsoft.Json.Linq;
using Rinku.Database;
using Rinku.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Rinku.Controllers
{
    public class HomeController : Controller
    {
        private readonly AppDbContext _dbCon = new AppDbContext();

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult Employes()
        {
            return View(new Employe());
        }

        public ActionResult Movements()
        {
            return View(new Movements());
        }

        //POST: Home/CreateEmploye
        [HttpPost]
        [ActionName("CreateEmploye")]
        public JsonResult CreateEmploye(Employe model)
        {
            if ((model.Name != null && model.Name != string.Empty) && model.idRol > 0)
            {
                var result = _dbCon.CreateEmploye(model);

                if(result.Trim().ToUpper() == "OK")
                   return Json(new { Result = "Success", Msg = "Employee was register.", modelStateIsValid = true });
                else
                    return Json(new { Result = "ERROR", Msg = "The employee couldn't register.", modelStateIsValid = false });
            }
            else
                return Json(new { Result = "ERROR", Msg = "Employe_Model_IsNullOrEmpty", modelStateIsValid = false });
        }

        //POST: Home/CreateMovement
        [HttpPost]
        [ActionName("CreateMovement")]
        public JsonResult CreateMovement(Movements model)
        {
            if (model.IDEmploye > 0)
            {
                var result = _dbCon.CreateMovement(model);

                if (result.Trim().ToUpper() == "OK")
                    return Json(new { Result = "Success", Msg = "Movement was register.", modelStateIsValid = true });
                else
                    return Json(new { Result = "ERROR", Msg = "The Movement couldn't register.", modelStateIsValid = false });
            }
            else
                return Json(new { Result = "ERROR", Msg = "Movement_Model_IsNullOrEmpty", modelStateIsValid = false });
        }

        //GET: Home/GetEmploye
        [HttpGet]
        [ActionName("GetEmploye")]
        public JsonResult GetEmploye()
        {
            return Json(_dbCon.GetEmploye(), JsonRequestBehavior.AllowGet);
        }

        //GET: Home/GetEmployeID
        [HttpGet]
        [ActionName("GetEmployeID")]
        public JsonResult GetEmployeID(Employe model)
        {
            return Json(_dbCon.GetEmployeID(Convert.ToInt32(model.Number)), JsonRequestBehavior.AllowGet);
        }
    }
}