using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

public partial class mis_Report : System.Web.UI.Page
{
    string Connstr = ConfigurationManager.ConnectionStrings["Conndb"].ConnectionString;
    Code obj = new Code();
    protected void Page_Load(object sender, EventArgs e)
    {
        divAlert.InnerHtml = "";
        if (!IsPostBack)
        {
            Fillddl(DdlProduct, "GetItemsByCategory");
            Fillddl(DdlUnit, "Usp_GetDugdhSangh");
            obj.FillGrid(grddata, "Usp_RptFormData", Connstr, divAlert);
        }

    }
    public void Fillddl(DropDownList ddl, string proc)
    {
        try
        {
            ddl.DataSource = null;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("--All--", ""));
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
                ddl.Items.Insert(0, new ListItem("--All--", ""));
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


    protected void BtnSearch_Click(object sender, EventArgs e)
    {
        obj.FillGrid(grddata, "Usp_RptFormData", Connstr, divAlert,
            new[] { "@SanghCode", "@ItemCode", "@CurrentYear", "@CurrentMonth" },
            new[] { DdlUnit.SelectedValue.ToString(), DdlProduct.SelectedValue.ToString(), DdlYear.SelectedValue.ToString(), DdlMonth.SelectedValue.ToString() }  
            );
    }
}