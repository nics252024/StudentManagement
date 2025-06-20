<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ClassFees.aspx.cs" Inherits="StudentManagementSystem.Admin.ClassFees" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-color: #ffffff; width:100%; height:720px;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
            
        </div>
        <h3 class="text-center">Fees</h3>
         
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <label for ="ddlClass">Class</label>
                <asp:DropDownList ID="ddl" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="Class is Required." ControlToValidate="ddl" 
                    Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"> </asp:RequiredFieldValidator>
            </div>

        <div class="col-md-6">
            <label for ="txtFeesAmount">Fees (Annual)</label>
            <asp:TextBox ID="txtFA" runat="server" CssClass="form-control" placeholder="Enter Fees Amount" TextMode="Number" required> </asp:TextBox>
        </div>
      </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-mid-3 col-mid-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#213448" Text="Add Fees" OnClick="btnAdd_Click"/>
            </div>
        </div>
       
        <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-8">
                    <asp:GridView ID="gv1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record display" 
                        AutoGenerateColumns="false" AllowPaging="true" PageSize="4" OnPageIndexChanging="gv1_PageIndexChanging" DataKeyNames="FeesId"
                        OnRowCancelingEdit="gv1_RowCancelingEdit" OnRowDeleting="gv1_RowDeleting" OnRowEditing="gv1_RowEditing" 
                        OnRowUpdating="gv1_RowUpdating" HeaderStyle-CssClass="gv-header">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ClassName" HeaderText="Class" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Fees(Annual)">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtfeesamount" runat="server" Text='<%# Eval("FeesAmount") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblfa" runat="server" Text='<%# Eval("FeesAmount") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowDeleteButton="True" ShowEditButton="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField> 
                        </Columns>
                  </asp:GridView>
            </div>
        </div>
    </div>
</div>
</asp:Content>
