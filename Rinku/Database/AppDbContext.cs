using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Web.Mvc;
using Rinku.Models;
using System.Data;
using System.Web.Script.Serialization;

namespace Rinku.Database
{
    public class AppDbContext
    {
        private readonly string _dbCon = System.Configuration.ConfigurationManager.ConnectionStrings["dbCon"].ConnectionString;
        JavaScriptSerializer serializer = new JavaScriptSerializer();

        public string CreateEmploye(Employe model)
        {
            string result = string.Empty;
            SqlConnection sqlCon = new SqlConnection(_dbCon);
            SqlCommand sqlCmd = new SqlCommand();

            try
            {
                if (sqlCmd.Parameters.Count > 0)
                    sqlCmd.Parameters.Clear();

                sqlCmd.Connection = sqlCon;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCmd.CommandText = "sp_CreateEmployee";
                sqlCmd.Parameters.Add("@idRol", System.Data.SqlDbType.Int);
                sqlCmd.Parameters.Add("@name", System.Data.SqlDbType.VarChar);
                sqlCmd.Parameters["@idRol"].Value = model.idRol;
                sqlCmd.Parameters["@name"].Value = model.Name;
                sqlCon.Open();

                int employeeNo = Convert.ToInt32(sqlCmd.ExecuteScalar());

                sqlCon.Close();
                result = (employeeNo > 0 ? "OK" : string.Empty);
            }
            catch (Exception ex)
            {
                sqlCon.Close();
                result = ex.Message.ToString();
            }
            return result;
        }

        public string CreateMovement(Movements model)
        {
            string result = string.Empty;
            SqlConnection sqlCon = new SqlConnection(_dbCon);
            SqlCommand sqlCmd = new SqlCommand();

            try
            {
                if (sqlCmd.Parameters.Count > 0)
                    sqlCmd.Parameters.Clear();

                sqlCmd.Connection = sqlCon;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCmd.CommandText = "sp_CreateMovement";
                sqlCmd.Parameters.Add("@pIDEmployee", System.Data.SqlDbType.Int);
                sqlCmd.Parameters.Add("@pIDMonth", System.Data.SqlDbType.Int);
                sqlCmd.Parameters.Add("@pQtyShip", System.Data.SqlDbType.Decimal);
                sqlCmd.Parameters["@pIDEmployee"].Value = model.IDEmploye;
                sqlCmd.Parameters["@pIDMonth"].Value = model.IDMonth;
                sqlCmd.Parameters["@pQtyShip"].Value = model.QtyShip;

                sqlCon.Open();

                int moveNo = Convert.ToInt32(sqlCmd.ExecuteScalar());

                sqlCon.Close();
                result = (moveNo > 0 ? "OK" : string.Empty);
            }
            catch (Exception ex)
            {
                sqlCon.Close();
                result = ex.Message.ToString();
            }
            return result;
        }

        public string GetEmploye()
        {
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;

            DataTable dtResult = new DataTable();
            SqlConnection sqlCon = new SqlConnection(_dbCon);
            SqlCommand sqlCmd = new SqlCommand();

            try
            {
                if (sqlCmd.Parameters.Count > 0)
                    sqlCmd.Parameters.Clear();

                sqlCmd.Connection = sqlCon;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCmd.CommandText = "sp_GetEmployee";
                sqlCon.Open();
                dtResult.Load(sqlCmd.ExecuteReader());
                sqlCon.Close();

                foreach (DataRow dr in dtResult.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dtResult.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
            }
            catch (Exception ex)
            {
                sqlCon.Close();
                return string.Empty;
            }
            return serializer.Serialize(rows);
        }

        public string GetEmployeID(int EmployeId)
        {
            List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
            Dictionary<string, object> row;

            DataTable dtResult = new DataTable();
            SqlConnection sqlCon = new SqlConnection(_dbCon);
            SqlCommand sqlCmd = new SqlCommand();

            try
            {
                if (sqlCmd.Parameters.Count > 0)
                    sqlCmd.Parameters.Clear();

                sqlCmd.Connection = sqlCon;
                sqlCmd.CommandType = System.Data.CommandType.StoredProcedure;
                sqlCmd.CommandText = "sp_GetEmployeeID";
                sqlCmd.Parameters.Add("@IDEmployee", System.Data.SqlDbType.Int);
                sqlCmd.Parameters["@IDEmployee"].Value = EmployeId;
                sqlCon.Open();
                dtResult.Load(sqlCmd.ExecuteReader());
                sqlCon.Close();

                foreach (DataRow dr in dtResult.Rows)
                {
                    row = new Dictionary<string, object>();
                    foreach (DataColumn col in dtResult.Columns)
                    {
                        row.Add(col.ColumnName, dr[col]);
                    }
                    rows.Add(row);
                }
            }
            catch (Exception ex)
            {
                sqlCon.Close();
                return string.Empty;
            }
            return serializer.Serialize(rows);
        }
    }
}