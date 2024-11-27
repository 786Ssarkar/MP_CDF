<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EntryForm.aspx.cs" Inherits="mis_EntryForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">

        <div class="card-header catchy-title">
            Entry Form 
     
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Unit  <span style="color: red">*</span></label>
                        <asp:RequiredFieldValidator ErrorMessage="Unit Not Selected" ControlToValidate="DdlUnit" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:DropDownList runat="server" ID="DdlUnit" CssClass="form-control" autocomplete="off">
                            <asp:ListItem Text="--Select--" Value="" />
                         
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Year  <span style="color: red">*</span></label>
                        <asp:RequiredFieldValidator ErrorMessage="Year Not Selected" ControlToValidate="DdlYear" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:DropDownList runat="server" ID="DdlYear" CssClass="form-control" autocomplete="off">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="2010-11" Value="1" />
                            <asp:ListItem Text="2011-12" Value="2" />
                            <asp:ListItem Text="2012-13" Value="3" />
                            <asp:ListItem Text="2013-14" Value="4" />
                            <asp:ListItem Text="2014-15" Value="5" />
                            <asp:ListItem Text="2015-16" Value="6" />
                            <asp:ListItem Text="2016-17" Value="7" />
                            <asp:ListItem Text="2017-18" Value="8" />
                            <asp:ListItem Text="2018-19" Value="9" />
                            <asp:ListItem Text="2019-20" Value="10" />
                            <asp:ListItem Text="2020-21" Value="11" />
                            <asp:ListItem Text="2021-22" Value="12" />
                            <asp:ListItem Text="2022-23" Value="13" />
                            <asp:ListItem Text="2023-24" Value="14" />
                            <asp:ListItem Text="2024-25" Value="15" />
                            <asp:ListItem Text="2025-26" Value="16" />
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Month  <span style="color: red">*</span></label>
                        <asp:RequiredFieldValidator ErrorMessage="Month Not Selected" ControlToValidate="DdlMonth" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:DropDownList runat="server" ID="DdlMonth" CssClass="form-control" autocomplete="off">
                            <asp:ListItem Text="--Select--" Value="" />
                            <asp:ListItem Text="January" Value="1" />
                            <asp:ListItem Text="February" Value="2" />
                            <asp:ListItem Text="March" Value="3" />
                            <asp:ListItem Text="April" Value="4" />
                            <asp:ListItem Text="May" Value="5" />
                            <asp:ListItem Text="June" Value="6" />
                            <asp:ListItem Text="July" Value="7" />
                            <asp:ListItem Text="August" Value="8" />
                            <asp:ListItem Text="September" Value="9" />
                            <asp:ListItem Text="October" Value="10" />
                            <asp:ListItem Text="November" Value="11" />
                            <asp:ListItem Text="December" Value="12" />
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Product  <span style="color: red">*</span></label>
                        <asp:RequiredFieldValidator ErrorMessage="Product Not Selected" ControlToValidate="DdlProduct" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:DropDownList runat="server" ID="DdlProduct" CssClass="form-control" autocomplete="off">
                            <asp:ListItem Text="--Select--" Value="" />
                  
                        </asp:DropDownList>

                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Quantity  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage="Quantity Not Filled" ControlToValidate="TxtQuantity" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtQuantity" runat="server" autocomplete="off" class="form-control" TextMode="Number" placeholder="Quantity"></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Current Year Target  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage=" Current Year Target Not Filled" ControlToValidate="TxtTarget" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtTarget" runat="server" autocomplete="off" class="form-control" TextMode="Number" placeholder="Current Year Target "></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Cumulative Target  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage="Cumulative Target Not Filled" ControlToValidate="TxtCumulativeTarget" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtCumulativeTarget" runat="server" autocomplete="off" class="form-control" TextMode="Number" placeholder="Cumulative Target"></asp:TextBox>


                    </div>
                </div>       
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Cumulative Achievement  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage="Cumulative Achievement Not Filled" ControlToValidate="TxtCumulativeAchievement" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtCumulativeAchievement" runat="server" autocomplete="off" class="form-control" TextMode="Number" placeholder="Cumulative Achievement"></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Last Year Target  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage=">Last Year Target Not Filled" ControlToValidate="TxtLYTarget" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtLYTarget" runat="server" autocomplete="off" class="form-control" TextMode="Number" placeholder="Last Year Target"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <asp:ValidationSummary runat="server" ValidationGroup="Save" ShowMessageBox="true" ShowSummary="false" />
                    <asp:Button CssClass="Alert-Save btn bg-gradient-success btn-border  w-lg" ClientIDMode="Static" runat="server" ID="BtnSave" type="button" Text="Save" OnClick="BtnSave_Click" ValidationGroup="Save" />
                    <a href="EntryForm.aspx" class="  btn bg-gradient-danger btn-border w-lg">Clear</a>
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
            <asp:GridView runat="server" ID="GVInflow" AutoGenerateColumns="false" CssClass="table "  HeaderStyle-CssClass="text-dark">
                <Columns>
                    <asp:TemplateField HeaderText="Sr. No">
                        <ItemTemplate>
                            <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name of Unit">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblUnitName" Text='<%# Eval("UnitName").ToString() %>'></asp:Label>
                            <asp:HiddenField runat="server" ID="hfUnitID" Value='<%# Eval("UnitID").ToString() %>'></asp:HiddenField>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton runat="server"
                                CssClass='<%# ((Eval("VerifedStatus").ToString()!="Pending"))?"btn btn-success btn-sm disabled":"btn btn-info btn-sm " %>'
                                CommandArgument='<%# Eval("InflowId") %>'
                                Enabled='<%# ((Eval("VerifedStatus").ToString()!="Pending"))?false:true %>'
                                CommandName="EditData">
                                <i class="fa fa-pencil"></i>
                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                    <path d="M 18.414062 2 C 18.158062 2 17.902031 2.0979687 17.707031 2.2929688 L 15.707031 4.2929688 L 14.292969 5.7070312 L 3 17 L 3 21 L 7 21 L 21.707031 6.2929688 C 22.098031 5.9019687 22.098031 5.2689063 21.707031 4.8789062 L 19.121094 2.2929688 C 18.926094 2.0979687 18.670063 2 18.414062 2 z M 18.414062 4.4140625 L 19.585938 5.5859375 L 18.292969 6.8789062 L 17.121094 5.7070312 L 18.414062 4.4140625 z M 15.707031 7.1210938 L 16.878906 8.2929688 L 6.171875 19 L 5 19 L 5 17.828125 L 15.707031 7.1210938 z"></path>
                                </svg>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server"
                                CssClass='<%#((Eval("VerifedStatus").ToString()!="Pending"))?"btn btn-danger btn-sm disabled":"btn btn-danger btn-sm " %>'
                                CommandArgument='<%# Eval("InflowId") %>'
                                Enabled='<%# ((Eval("VerifedStatus").ToString()!="Pending"))?false:true %>'
                                CommandName="DeleteData">
                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="20" height="20" viewBox="0 0 24 24">
                                    <path d="M 10.806641 2 C 10.289641 2 9.7956875 2.2043125 9.4296875 2.5703125 L 9 3 L 4 3 A 1.0001 1.0001 0 1 0 4 5 L 20 5 A 1.0001 1.0001 0 1 0 20 3 L 15 3 L 14.570312 2.5703125 C 14.205312 2.2043125 13.710359 2 13.193359 2 L 10.806641 2 z M 4.3652344 7 L 5.8925781 20.263672 C 6.0245781 21.253672 6.877 22 7.875 22 L 16.123047 22 C 17.121047 22 17.974422 21.254859 18.107422 20.255859 L 19.634766 7 L 4.3652344 7 z"></path>
                                </svg>
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

