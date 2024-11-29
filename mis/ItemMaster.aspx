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

                        <asp:RequiredFieldValidator ErrorMessage="Item Code Not Filled" ControlToValidate="TxtItemCode" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtItemCode" runat="server" autocomplete="off" CssClass="form-control" placeholder="Item Code "></asp:TextBox>


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
                    <asp:Button CssClass="Alert-Save btn bg-gradient-success btn-border  w-lg" ClientIDMode="Static" runat="server" ID="BtnSave" type="button" Text="Save" OnClick="BtnSave_Click" ValidationGroup="Save" />
                    <a href="ItemMaster.aspx" class="  btn bg-gradient-danger btn-border w-lg">Clear</a>
                </div>
            </div>
        </div>
    </div>

        <div class="card mt-4">

        <div class="card-header catchy-title">
            Details
     
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-lg-12">

                    <div class="table-responsive ">


                        <asp:GridView runat="server" ID="grddata" AutoGenerateColumns="false" CssClass="table" OnRowCommand="grddata_RowCommand" HeaderStyle-CssClass="text-dark">
                            <Columns>
                                <asp:TemplateField HeaderText="Sr. No">
                                    <ItemTemplate>
                                        <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Name">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Code">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblItemCode" Text='<%# Eval("ItemCode").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Category">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblItemCategory" Text='<%# Eval("ItemCategory").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Is Active">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblIsActive" Text='<%# Eval("IsActive").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server"
                                            CssClass="btn"
                                            CommandArgument='<%# Eval("ItemID") %>'
                                            CommandName="EditData">
                                            <i class="fa fa-pencil text-info"></i>
                                           <%-- <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                                <path d="M 18.414062 2 C 18.158062 2 17.902031 2.0979687 17.707031 2.2929688 L 15.707031 4.2929688 L 14.292969 5.7070312 L 3 17 L 3 21 L 7 21 L 21.707031 6.2929688 C 22.098031 5.9019687 22.098031 5.2689063 21.707031 4.8789062 L 19.121094 2.2929688 C 18.926094 2.0979687 18.670063 2 18.414062 2 z M 18.414062 4.4140625 L 19.585938 5.5859375 L 18.292969 6.8789062 L 17.121094 5.7070312 L 18.414062 4.4140625 z M 15.707031 7.1210938 L 16.878906 8.2929688 L 6.171875 19 L 5 19 L 5 17.828125 L 15.707031 7.1210938 z"></path>
                                            </svg>--%>
                                        </asp:LinkButton>
                                        <asp:LinkButton
                                            CssClass="btn"    
                                            runat="server"
                                            CommandArgument='<%# Eval("ItemID") %>'
                                            CommandName="DeleteData">
                                             <i class="fa fa-trash text-danger"></i>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

