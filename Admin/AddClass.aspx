<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddClass.aspx.cs" Inherits="StudentManagementSystem.Admin.AddClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-color:#ffffff; width:100%; height:720px;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <h3 class="text-center">Class Page</h3>
         
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <label for ="txtClass">Class Name</label>
                <asp:TextBox ID="txtClass" runat="server" CssClass="form-control" placeholder="Enter Class Name" required></asp:TextBox>
            </div>
        </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-mid-3 col-mid-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#213448" Text="Add Class" OnClick="btnAdd_Click" />
            </div>
        </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered" DataKeynames="ClassId" AutoGenerateColumns="False" 
            EmptyDataText="No Record to display!" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" AllowPaging="true" PageSize="4" HeaderStyle-CssClass="gv-header">
            <Columns>
                <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="true" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="Class">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtClassEdit" runat="server" Text='<%# Eval("ClassName") %>' CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                         <asp:Label ID="lblClassName" runat="server" Text='<%# Eval("ClassName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:CommandField CausesValidation="False" HeaderText="Operation" ShowEditButton="True" />
            </Columns>
        </asp:GridView>
            </div>
        </div>
    </div>
</div>

</asp:Content>
