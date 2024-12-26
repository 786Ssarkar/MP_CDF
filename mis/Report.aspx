<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="mis_Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div runat="server" id="divAlert" clientidmode="Static"></div>
    <div class="card">
        <div class="card-header catchy-title">
            Report Filters     

        </div>
        <div class="card-body">
            <div class="row align-items-end">
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Unit  <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlUnit" CssClass="form-control select2" autocomplete="off">
                            <asp:ListItem Text="--All--" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Year  <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlYear" CssClass="form-select select2" autocomplete="off">
                            <asp:ListItem Text="--All--" Value="" />
                            <asp:ListItem Text="2010-11" Value="2010-11" />
                            <asp:ListItem Text="2011-12" Value="2011-12" />
                            <asp:ListItem Text="2012-13" Value="2012-13" />
                            <asp:ListItem Text="2013-14" Value="2013-14" />
                            <asp:ListItem Text="2014-15" Value="2014-15" />
                            <asp:ListItem Text="2015-16" Value="2015-16" />
                            <asp:ListItem Text="2016-17" Value="2016-17" />
                            <asp:ListItem Text="2017-18" Value="2017-18" />
                            <asp:ListItem Text="2018-19" Value="2018-19" />
                            <asp:ListItem Text="2019-20" Value="2019-20" />
                            <asp:ListItem Text="2020-21" Value="2020-21" />
                            <asp:ListItem Text="2021-22" Value="2021-22" />
                            <asp:ListItem Text="2022-23" Value="2022-23" />
                            <asp:ListItem Text="2023-24" Value="2023-24" />
                            <asp:ListItem Text="2024-25" Value="2024-25" />
                            <asp:ListItem Text="2025-26" Value="2025-26" />
                        </asp:DropDownList>

                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-dark text-lg">
                            Select Month  <span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="DdlMonth" CssClass="form-control select2" autocomplete="off">
                            <asp:ListItem Text="--All--" Value="" />
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
                        <asp:DropDownList runat="server" ID="DdlProduct" CssClass="form-control select2" autocomplete="off">
                            <asp:ListItem Text="--All--" Value="" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-md-12 text-center">
                    <hr />
                    <asp:Button CssClass="btn bg-gradient-success btn-border  w-lg" ClientIDMode="Static" runat="server" ID="BtnSearch" type="button" Text="Search" OnClick="BtnSearch_Click" />
                    <a href="Report.aspx" class=" btn bg-gradient-danger btn-border w-lg">Clear</a>
                </div>
            </div>
        </div>
    </div>
    <div class="card mt-4">
        <div class="card-header ">
            <div class="row">
                <div class="col-md-6">
                    <h3 class="catchy-title">Details     </h3>

                </div>
                <div class="col-md-6">
                    <div id="DvExport" >
                        <a class="btn btn-outline-primary btn-border py-1 fs-6 mb-0 me-3" role="button" id="btnPdf">
                            <i class="fa fa-file-pdf"></i>
                        </a>
                        <a class="btn btn-outline-primary btn-border py-1 fs-6 mb-0" role="button" id="btnExcel">
                            <i class="fa fa-file-excel"></i>
                        </a>

                    </div>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="table-responsive ">
                            <asp:GridView runat="server" ID="grddata" AutoGenerateColumns="false" CssClass="table text-wrap Datatable" HeaderStyle-CssClass="text-dark">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sr. No">
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# Container.DisplayIndex+1 %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sangh Name ">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblSanghName" Text='<%# Eval("SanghName").ToString() %>'></asp:Label>
                                            <asp:HiddenField runat="server" ID="hfSanghCode" Value='<%# Eval("SanghCode").ToString() %>'></asp:HiddenField>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Item Name">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblItemName" Text='<%# Eval("ItemName").ToString() %>'></asp:Label>
                                            <asp:HiddenField runat="server" ID="hfItemCode" Value='<%# Eval("ItemCode").ToString() %>'></asp:HiddenField>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Year">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCurrentYear" Text='<%# Eval("CurrentYear").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Month">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCurrentMonth" Text='<%# Eval("CurrentMonth").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Current Qty">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCurntQty" Text='<%# Eval("CurntQty").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Current Target">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCurntTarget" Text='<%# Eval("CurntTarget").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cumulative Target">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCumulative" Text='<%# Eval("Cumulative").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Cumulative Achievement">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblCumulativeAchievement" Text='<%# Eval("CumulativeAchievement").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Achievement %">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblAchievement" Text='<%# Eval("Achievement").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Last Year Target ">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblLYTarget" Text='<%# Eval("LYTarget").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Growth %">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblGrowth" Text='<%# Eval("Growth").ToString() %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            $(DvExport).insertBefore('.dt-layout-end .dt-search')
            $('#btnExcel').click(function () {
                PrintinExcel()

            });

            $('#btnPdf').click(function () {
                PrintinPDF()
            });
        });

    </script>
</asp:Content>

