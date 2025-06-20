using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static StudentManagementSystem.Models.CommonFn;
using System.Data;

namespace StudentManagementSystem.Admin
{
    public partial class AddClass : System.Web.UI.Page
    {
        Commonfnx cf = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
            }
        }
        private void GetClass()
        {
            DataTable dt = cf.Fetch("Select Row_NUMBER () over(order by (Select 1)) as [Sr.no], ClassId, Classname from Class");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = cf.Fetch("Select * From Class where Classname = '" + txtClass.Text.Trim() + "' ");
                if(dt.Rows.Count == 0) 
                {
                    string query = "Insert into Class values('" + txtClass.Text.Trim() + "')";
                    cf.Query(query);
                    lblMsg.Text = "Added Succesfully";
                    lblMsg.CssClass = "alert alert-success";
                    txtClass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblMsg.Text = "Already in Record.";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetClass();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow grid = GridView1.Rows[e.RowIndex];
                int cId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string ClassName = (grid.FindControl("txtClassEdit") as TextBox).Text;
                cf.Query("Update Class set ClassName = '" + ClassName + "' where ClassId ='" + cId + "'");
                lblMsg.Text = "Class Updated Succesfully!";
                lblMsg.CssClass = "alert alert-success";
                GridView1.EditIndex = -1;
                GetClass();
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }

       
    }
}