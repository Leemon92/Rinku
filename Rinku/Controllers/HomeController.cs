using Newtonsoft.Json;
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

        #region WRITE
        //POST: Home/CreateEmploye
        [HttpPost]
        [ActionName("CreateEmploye")]
        public JsonResult CreateEmploye(Employe model)
        {
            if (ModelState.IsValid && (model.Name != null && model.Name != string.Empty) && model.idRol > 0)
            {
                var result = _dbCon.CreateEmploye(model);
                JObject json = JObject.Parse(result.Replace("[", "").Replace("]", ""));

                if (json.Count > 0)
                {
                    foreach (var key in json.Properties())
                    {
                        if (key.Name == "Result")
                        {
                            try
                            {
                                int operationResult = Convert.ToInt32(key.Value.ToString());

                                switch (operationResult)
                                {
                                    case 0:
                                        return Json(new { Result = "No_Result", Msg = ("The information can't be registered."), modelStateIsValid = true });
                                    case -101:
                                        return Json(new { Result = "No_Exists", Msg = ("The employee " + model.Name.ToString() + " already exists."), modelStateIsValid = true });
                                    default:
                                        return Json(new { Result = "Success", Msg = ("The emplye " + model.Name.ToString() + " was registered sucessfully."), modelStateIsValid = true });
                                }
                            }
                            catch (Exception x)
                            {
                                return Json(new { Result = "DB_Error", Msg = key.Value.ToString(), modelStateIsValid = true });
                            }
                        }
                        else if (key.Name == "Exception") 
                        {
                            return Json(new { Result = "Exception", Msg = key.Value.ToString(), modelStateIsValid = true });
                        }
                    }
                    return Json(new { Result = "", Msg = "", modelStateIsValid = true });
                }
                else
                    return Json(new { Result = "No_Result", Msg = ("The information can't be created. " + result), modelStateIsValid = true });
            }
            else
                return Json(new { Result = "ERROR", Msg = "Employe_Model_IsNullOrEmpty_Or_Invalid", modelStateIsValid = false });
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

        //POST: Home/UpdEmploye
        [HttpPost]
        [ActionName("UpdEmploye")]
        public JsonResult UpdEmploye(Employe model)
        {
            if (ModelState.IsValid && (model.Name != null && model.Name != string.Empty) && model.idRol > 0 && model.Number > 0)
            {
                var result = _dbCon.UpdtEmploye(model);
                JObject json = JObject.Parse(result.Replace("[","").Replace("]",""));

                if (json.Count > 0)
                {
                    foreach (var key in json.Properties())
                    {
                        if (key.Name == "Result")
                        {
                            try
                            {
                                int operationResult = Convert.ToInt32(key.Value.ToString());

                                switch (operationResult)
                                {
                                    case 0:
                                        return Json(new { Result = "No_Result", Msg = ("The information can't be updated."), modelStateIsValid = true });
                                    case -101:
                                        return Json(new { Result = "No_Exists", Msg = ("The information of to employee " + model.Name.ToString() + " doesn't exists."), modelStateIsValid = true });
                                    default:
                                        return Json(new { Result = "Success", Msg = ("The information was updated to employee " + model.Name.ToString()), modelStateIsValid = true });
                                }
                            }
                            catch (Exception x)
                            {
                                return Json(new { Result = "DB_Error", Msg = key.Value.ToString(), modelStateIsValid = true });
                            }
                        }
                        else if (key.Name == "Exception")
                        {
                            return Json(new { Result = "Exception", Msg = key.Value.ToString(), modelStateIsValid = true });
                        }
                    }
                    return Json(new { Result = "", Msg = "", modelStateIsValid = true });
                }
                else
                    return Json(new { Result = "No_Result", Msg = ("The information can't be updated. " + result), modelStateIsValid = true });
            }
            else
                return Json(new { Result = "ERROR", Msg = "Employe_Model_IsNullOrEmpty_Or_Invalid", modelStateIsValid = false });
        }
        #endregion

        #region READ
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
        #endregion
    }
}