using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

namespace StudentManagementSystem.Models
{
    public class CommonFn
    {
        public class Commonfnx
        {
         //Error here
         SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SchoolDB"].ConnectionString);

            public void Query(string query)
            {
                if(con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand com = new SqlCommand(query, con);
                com.ExecuteNonQuery();
                con.Close();
            }
            public DataTable Fetch(string query)
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand com = new SqlCommand(query, con);
                SqlDataAdapter sqlData = new SqlDataAdapter(com);
                DataTable dt = new DataTable();
                sqlData.Fill(dt);
                return dt;
            }
        }
    }
}