using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mis_SanghMaster : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            obj.FillGrid(grddata, "Usp_GetAllDugdhSanghs", Connstr, divAlert);
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
                    ds = obj.ByProcedure("usp_AddSangh", new[] {
                        "SanghName",
                        "SanghCode",
                        "IsActive",
                        "CreatedByIp"}, new[] {
                        TxtSangh.Text,                         
                        TxtSanghCode.Text,
                        ((cbIsActive.Checked)?"1":"0" )
                        ,Request.ServerVariables["REMOTE_ADDR"].ToString() }, Connstr);
                }
                else if (BtnSave.Text == "Update")
                {
                    ds = obj.ByProcedure("usp_UpdateSangh", new[] {
                    "ID",
                    "SanghName",               
                    "SanghCode",
                    "IsActive"
                    ,"UpdatedByIp"}, new[] {
                    ViewState["ID"].ToString(),
                    TxtSangh.Text,                     
                    TxtSanghCode.Text,
                    ((cbIsActive.Checked)?"1":"0" )
                    ,Request.ServerVariables["REMOTE_ADDR"].ToString() }, Connstr);


                }
                if (ds != null)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                        {
                            obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");

                            cbIsActive.Checked = true;
                            TxtSangh.Text = "";
                            TxtSanghCode.Text = "";
                            TxtSanghCode.Enabled = false;
                            obj.FillGrid(grddata, "Usp_GetAllDugdhSanghs", Connstr, divAlert);
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
                Label lblSanghName = (Label)row.FindControl("lblSanghName");
                Label lblSanghCode = (Label)row.FindControl("lblSanghCode");
                Label lblIsActive = (Label)row.FindControl("lblIsActive");
                TxtSangh.Text = lblSanghName.Text;

                TxtSanghCode.Text = lblSanghCode.Text;
                
                TxtSanghCode.Enabled = false;
                cbIsActive.Checked = Convert.ToBoolean(lblIsActive.Text);



                ViewState["ID"] = e.CommandArgument;
                BtnSave.Text = "Update";
            }
            else if (e.CommandName == "DeleteData")
            {

                DataSet ds = obj.ByProcedure("usp_DeleteSangh", new[] { "ID", "DeletedByIp" }, new[] { e.CommandArgument.ToString(), Request.ServerVariables["REMOTE_ADDR"] }, Connstr);
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.FillGrid(grddata, "Usp_GetAllDugdhSanghs", Connstr, divAlert);
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