using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mis_ItemMaster : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            obj.FillGrid(grddata, "usp_GetItems", Connstr, divAlert);
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
                    ds = obj.ByProcedure("usp_AddItem", new[] {
                        "ItemName",
                        "ItemCategory",
                        "ItemCode",
                        "IsActive",
                        "CreatedByIp"}, new[] {
                        TxtItem.Text,
                        DdlItemCat.SelectedValue ,
                        TxtItemCode.Text,
                        ((cbIsActive.Checked)?"1":"0" )
                        ,Request.ServerVariables["REMOTE_ADDR"].ToString() }, Connstr);
                }
                else if (BtnSave.Text == "Update")
                {
                    ds = obj.ByProcedure("usp_UpdateItem", new[] {
                    "ItemID",
                    "ItemName",
                    "ItemCategory",
                    "ItemCode",
                    "IsActive"
                    ,"UpdatedByIp"}, new[] {
                    ViewState["ItemID"].ToString(),
                    TxtItem.Text,
                    DdlItemCat.SelectedValue ,
                    TxtItemCode.Text,
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
                            DdlItemCat.ClearSelection();
                            cbIsActive.Checked=true;                           
                            TxtItem.Text = "";
                            TxtItemCode.Text = "";
                            TxtItemCode.Enabled = true;
                            obj.FillGrid(grddata, "usp_GetItems", Connstr, divAlert);
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
                Label lblItemName = (Label)row.FindControl("lblItemName");
                Label lblItemCode = (Label)row.FindControl("lblItemCode");
                Label lblItemCategory = (Label)row.FindControl("lblItemCategory");
                Label lblIsActive = (Label)row.FindControl("lblIsActive");


                TxtItem.Text = lblItemName.Text;
                DdlItemCat.ClearSelection();
                DdlItemCat.Items.FindByValue(lblItemCategory.Text).Selected = true;
                TxtItemCode.Text = lblItemCode.Text;
                TxtItemCode.Enabled = false;
                cbIsActive.Checked = Convert.ToBoolean(lblIsActive.Text);



                ViewState["ItemID"] = e.CommandArgument;
                BtnSave.Text = "Update";
            }
            else if (e.CommandName == "DeleteData")
            {

                DataSet ds = obj.ByProcedure("usp_DeleteItem", new[] { "ItemID", "DeletedByIp" }, new[] { e.CommandArgument.ToString(), Request.ServerVariables["REMOTE_ADDR"] }, Connstr);
                if (ds.Tables.Count > 0)
                {
                    if (Convert.ToBoolean(ds.Tables[0].Rows[0]["status"]))
                    {
                        obj.alertmsg(Convert.ToString(ds.Tables[0].Rows[0]["msg"]), divAlert, "bg-success");
                        obj.FillGrid(grddata, "usp_GetItems", Connstr, divAlert);
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