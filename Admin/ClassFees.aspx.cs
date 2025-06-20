using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static StudentManagementSystem.Models.CommonFn;

namespace StudentManagementSystem.Admin
{
    public partial class ClassFees : System.Web.UI.Page
    {
        Commonfnx cf = new Commonfnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
                GetFees();
            }
        }

        private void GetClass()
        {
            DataTable dt = cf.Fetch("Select * from Class");
            ddl.DataSource = dt;
            ddl.DataTextField = "ClassName";
            ddl.DataValueField = ("ClassId");
            ddl.DataBind();
            ddl.Items.Insert(0, "Select Class");


        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string classVal = ddl.SelectedItem.Value;
                DataTable dt = cf.Fetch("Select * From Fees where ClassId = '" + ddl.SelectedItem.Value + "' ");
                if (dt.Rows.Count == 0)
                {
                    string query = "Insert into Fees values('"+ddl.SelectedItem.Value + "', '" + txtFA.Text.Trim() + "')";
                    cf.Query(query);
                    lblMsg.Text = "Added Succesfully";
                    lblMsg.CssClass = "alert alert-success";
                    ddl.SelectedIndex = 0;
                    txtFA.Text = string.Empty;
                    GetFees();
                }
                else
                {
                    lblMsg.Text = "Entered Fees already exists for <b> '"+ classVal+"'</b>!";
                    lblMsg.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }

        private void GetFees()
        {
            DataTable dt = cf.Fetch(@"Select Row_NUMBER() over(Order by (Select 1)) as [Sr.No], f.FeesId, f.ClassId,c.Classname, f.FeesAmount from Fees f inner join Class c on c.ClassId = f.ClassId");
            gv1.DataSource = dt;
            gv1.DataBind();
        }

        protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv1.PageIndex = e.NewPageIndex;
            GetFees();

        }

        protected void gv1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv1.EditIndex = -1;
            GetFees();
        }

        protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int feesId = Convert.ToInt32(gv1.DataKeys[e.RowIndex].Values[0]);
                cf.Query("Delete from Fees where FeesId = '"+feesId+"' ");
                lblMsg.Text = "Fees Deleted Succesfully!";
                lblMsg.CssClass = "alert alert-success";
                gv1.EditIndex = -1;
                GetFees();  
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }

        protected void gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv1.EditIndex = e.NewEditIndex ;
            GetFees();
        }

        protected void gv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = gv1.Rows[e.RowIndex];
                int feesId = Convert.ToInt32(gv1.DataKeys[e.RowIndex].Values[0]);
                string feeAmount = (row.FindControl("txtfeesamount") as TextBox).Text;
                cf.Query("Update Fees set FeesAmount = '"+feeAmount.Trim()+"' where FeesId = '"+feesId+"' ");
                lblMsg.Text = "Fees Updated Succesfully!";
                lblMsg.CssClass = "alert alert-success";
                gv1.EditIndex = -1;
                GetFees();
                

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "'); </script>");
            }
        }
    }
}