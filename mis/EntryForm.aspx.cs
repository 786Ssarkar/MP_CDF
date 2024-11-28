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
using System.Globalization;

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
            obj.FillGrid(grddata, "Usp_GetFormData", Connstr, divAlert);
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
            if (IsValid)
            {
                DataSet ds = new DataSet();
                if (BtnSave.Text == "Save")
                {
                    ds = obj.ByProcedure("usp_AddFormData", new[] {
                 "SanghCode"
                 ,"ItemCode"
                 ,"CurrentYear"
                 ,"CurrentMonth"
                 ,"CurntQty"
                 ,"CurntTarget"
                 ,"Cumulative"
                 ,"LYTarget"
                 ,"CumulativeAchievement"
                 ,"CreatedByIp"}, new[] {
                    DdlUnit.SelectedValue
                    ,DdlProduct.SelectedValue
                    ,DdlYear.SelectedValue
                    ,DdlMonth.SelectedValue
                    ,TxtQuantity.Text
                    ,TxtTarget.Text
                    ,TxtCumulativeTarget.Text
                    ,TxtLYTarget.Text
                    ,TxtCumulativeAchievement.Text
                    ,Request.ServerVariables["REMOTE_ADDR"].ToString() }, Connstr);

                }
                else if (BtnSave.Text == "Update")
                {
                    ds = obj.ByProcedure("usp_UpdateFormData", new[] {
                  "Id"
                 ,"SanghCode"
                 ,"ItemCode"
                 ,"CurrentYear"
                 ,"CurrentMonth"
                 ,"CurntQty"
                 ,"CurntTarget"
                 ,"Cumulative"
                 ,"LYTarget"
                 ,"CumulativeAchievement"
                 ,"UpdatedByIp"}, new[] {
                     ViewState["Id"].ToString(),
                    DdlUnit.SelectedValue
                    ,DdlProduct.SelectedValue
                    ,DdlYear.SelectedValue
                    ,DdlMonth.SelectedValue
                    ,TxtQuantity.Text
                    ,TxtTarget.Text
                    ,TxtCumulativeTarget.Text
                    ,TxtLYTarget.Text
                    ,TxtCumulativeAchievement.Text
                    ,Request.ServerVariables["REMOTE_ADDR"].ToString() }, Connstr);


                }
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
                            obj.FillGrid(grddata, "Usp_GetFormData", Connstr, divAlert);
                            BtnSave.Text = "Save";
                        }
                        else
                        {
                            obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-warning");
                        }
                    }

                }
            }
            else
            {
                throw new ArgumentException("Page is not  Valid.");
            }

        }
        catch (Exception ex)
        {
            obj.alertmsg(ex.Message, divAlert, "bg-danger");

        }

    }

    protected void grddata_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName == "EditData")
            {
                GridViewRow row = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;
                HiddenField hfSanghCode = (HiddenField)row.FindControl("hfSanghCode");
                HiddenField hfItemCode = (HiddenField)row.FindControl("hfItemCode");
                Label lblCurrentYear = (Label)row.FindControl("lblCurrentYear");
                Label lblCurrentMonth = (Label)row.FindControl("lblCurrentMonth");
                Label lblCurntQty = (Label)row.FindControl("lblCurntQty");
                Label lblCurntTarget = (Label)row.FindControl("lblCurntTarget");
                Label lblCumulative = (Label)row.FindControl("lblCumulative");
                Label lblCumulativeAchievement = (Label)row.FindControl("lblCumulativeAchievement");
                Label lblLYTarget = (Label)row.FindControl("lblLYTarget");
                DdlUnit.ClearSelection();
                DdlUnit.Items.FindByValue(hfSanghCode.Value).Selected = true;
                DdlProduct.ClearSelection();
                DdlProduct.Items.FindByValue(hfItemCode.Value).Selected = true;
                DdlYear.ClearSelection();
                DdlYear.Items.FindByValue(lblCurrentYear.Text).Selected = true;
                DdlMonth.ClearSelection();
                DdlMonth.Items.FindByText(lblCurrentMonth.Text).Selected = true;
                TxtQuantity.Text = lblCurntQty.Text;
                TxtTarget.Text = lblCurntTarget.Text;
                TxtCumulativeTarget.Text = lblCumulative.Text;
                TxtLYTarget.Text = lblLYTarget.Text;
                TxtCumulativeAchievement.Text = lblCumulativeAchievement.Text;

                ViewState["Id"] = e.CommandArgument;
                BtnSave.Text = "Update";
            }
            else if (e.CommandName == "DeleteData")
            {

                DataSet ds = obj.ByProcedure("usp_DeleteFormData", new[] { "Id", "DeletedByIp" }, new[] { e.CommandArgument.ToString(), Request.ServerVariables["REMOTE_ADDR"] }, Connstr);
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.FillGrid(grddata, "Usp_GetFormData", Connstr, divAlert);
                    }
                    else
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-danger");
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