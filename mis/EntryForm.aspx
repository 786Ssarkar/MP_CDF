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
                            <asp:ListItem Value="BPL" Text="Bhopal" />
                            <asp:ListItem Value="IND" Text="Indore" />
                            <asp:ListItem Value="UJN" Text="Ujjain" />
                            <asp:ListItem Value="BK" Text="Bundelkhand" />
                            <asp:ListItem Value="JBP" Text="Jabalpur" />
                            <asp:ListItem Value="GWL" Text="Gwalior" />
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

                        <asp:TextBox ID="TxtTarget" runat="server" autocomplete="off" class="form-control" TextMode="Number" placeholder="Target"></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Enter Cumulative Target  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage="Cumulative Target Not Filled" ControlToValidate="TxtCumulativeTarget" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtCumulativeTarget" runat="server" autocomplete="off" class="form-control" TextMode="Number" placeholder="Target"></asp:TextBox>


                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">Last Year Target  <span style="color: red">*</span></label>

                        <asp:RequiredFieldValidator ErrorMessage=">Last Year Target Not Filled" ControlToValidate="TxtLYTarget" ForeColor="Red" Display="None" runat="server" ValidationGroup="Save" Font-Size="Small" SetFocusOnError="true" />

                        <asp:TextBox ID="TxtLYTarget" runat="server" autocomplete="off" class="form-control" TextMode="Number" placeholder="Target"></asp:TextBox>


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

