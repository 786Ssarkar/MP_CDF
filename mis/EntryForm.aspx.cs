using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IdentityModel.Protocols.WSTrust;
using System.Activities.Expressions;

public partial class mis_EntryForm : System.Web.UI.Page

{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fillddl(DdlProduct, "GetItemsByCategory");
            Fillddl(DdlUnit, "Usp_GetDugdhSangh");
        }
    }
    public void Fillddl(DropDownList ddl, string proc)
    {
        try
        {
            ddl.DataSource = null;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("--Select--", ""));
            SqlDataAdapter adpt = new SqlDataAdapter(proc, Connstr);
            adpt.SelectCommand.CommandType = CommandType.StoredProcedure;

            DataSet ds = new DataSet();
            adpt.Fill(ds);
            if (ds.Tables.Count > 1)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    ddl.DataSource = ds.Tables[0];
                    ddl.DataTextField = "Name";
                    ddl.DataValueField = "Id";
                    ddl.DataBind();

                }
                ddl.Items.Insert(0, new ListItem("--Select--", ""));
            }
            else if (ds.Tables.Count > 0)
            {
                if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                {
                    obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-warning");
                }
            }
            else
            {
                obj.alertmsg("Somthing went wrong", divAlert, "bg-warning");
            }
        }
        catch (Exception ex)
        {
            obj.alertmsg(ex.Message, divAlert, "bg-danger");
        }
    }


    protected void BtnSave_Click(object sender, EventArgs e)
    {
        try
        {
            DataSet ds = obj.ByProcedure("usp_AddFormData",
                new[] {
                 "SanghCode"
                 ,"ItemCode"
                 ,"CurrentYear"
                 ,"CurrentMonth"
                 ,"CurntQty"
                 ,"CurntTarget"
                 ,"Cumulative"
                 ,"LYTarget"
                 ,"CumulativeAchievement"
                 ,"CreatedByIp"},
                 new[] {
                    DdlUnit.SelectedValue
                    ,DdlProduct.SelectedValue
                    ,DdlYear.SelectedValue
                    ,DdlMonth.SelectedValue
                    ,TxtQuantity.Text
                    ,TxtTarget.Text
                    ,TxtCumulativeTarget.Text
                    ,TxtLYTarget.Text
                    ,TxtCumulativeAchievement.Text
                    ,Request.ServerVariables["REMOTE_ADDR"].ToString() }
                 , Connstr
                );
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        DdlUnit.ClearSelection();
                        DdlProduct.ClearSelection();
                        DdlYear.ClearSelection();
                        DdlMonth.ClearSelection();
                        TxtQuantity.Text = "";
                        TxtTarget.Text = "";
                        TxtCumulativeTarget.Text = "";
                        TxtCumulativeAchievement.Text = "";
                        TxtLYTarget.Text = "";
                    }
                    else
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-warning");
                    }
                }

            }

        }
        catch (Exception ex)
        {
            obj.alertmsg(ex.Message, divAlert, "bg-danger");

        }

    }



}