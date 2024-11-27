<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ItemMaster.aspx.cs" Inherits="mis_ItemMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">

        <div class="card-header catchy-title">
            Item Master 
 
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Item Category  <span style="color: red">*</span></label>
                        <asp:RequiredFieldValidator ErrorMessage="Item Category Not Selected" ControlToValidate="DdlItemCat" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:DropDownList runat="server" ID="DdlItemCat" CssClass="form-control" autocomplete="off">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Value="Milk" Text="Milk" />
                            <asp:ListItem Value="Product" Text="Product" />

                        </asp:DropDownList>

                    </div>
                </div>


                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Item Name  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage="Item Name Not Filled" ControlToValidate="TxtItem" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtItem" runat="server" autocomplete="off" class="form-control" placeholder="Item Name"></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Item Code  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage="Item Name Not Filled" ControlToValidate="TxtItemCode" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtItemCode" runat="server" autocomplete="off" class="form-control" placeholder="Item Code "></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Active <span style="color: red">*</span></label>
                        <asp:CheckBox runat="server" Text="Is Active" ID="cbIsActive" CssClass="form-check" Checked="true" />

                    </div>
                </div>
            </div>



            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <asp:ValidationSummary runat="server" ValidationGroup="Save" ShowMessageBox="true" ShowSummary="false" />
                    <asp:Button CssClass="Alert-Save btn bg-gradient-success btn-border  w-lg" ClientIDMode="Static" runat="server" ID="BtnAdd" type="button" Text="Save" ValidationGroup="Save" />
                    <a href="EntryForm.aspx" class="  btn bg-gradient-danger btn-border w-lg">Clear</a>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

