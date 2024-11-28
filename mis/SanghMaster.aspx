<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SanghMaster.aspx.cs" Inherits="mis_SanghMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">

        <div class="card-header catchy-title">
            Sangh Master 
 
        </div>
        <div class="card-body">
            <div class="row">


                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Sangh Name  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage="Sangh Name Not Filled" ControlToValidate="TxtSangh" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtSangh" runat="server" autocomplete="off" class="form-control" placeholder="Sangh Name"></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Sangh Code  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage="Sangh Name Not Filled" ControlToValidate="TxtSanghCode" ForeColor="Red" Display="None" runat="server"  ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtSanghCode" runat="server" autocomplete="off" CssClass="form-control"  placeholder="Sangh Code "></asp:TextBox>


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
                    <asp:Button CssClass="Alert-Save btn bg-gradient-success btn-border  w-lg" ClientIDMode="Static" OnClick="BtnSave_Click" runat="server" ID="BtnSave" type="button" Text="Save" ValidationGroup="Save" />
                    <a href="SanghMaster.aspx" class="  btn bg-gradient-danger btn-border w-lg">Clear</a>
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
                                <asp:TemplateField HeaderText="Sangh Name">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblSanghName" Text='<%# Eval("SanghName").ToString() %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Sangh Code">
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblSanghCode" Text='<%# Eval("SanghCode").ToString() %>'></asp:Label>
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
                                            CommandArgument='<%# Eval("ID") %>'
                                            CommandName="EditData">
                                        <i class="fa fa-pencil text-info"></i>
                                       
                                    </asp:LinkButton>
                                        <asp:LinkButton
                                            CssClass="btn"
                                            runat="server"
                                            CommandArgument='<%# Eval("ID") %>'
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

