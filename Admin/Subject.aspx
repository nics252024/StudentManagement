 <%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="StudentManagementSystem.Admin.Subject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="background-color: #ffffff; width:100%; height:720px;">
    <div class="container p-md-4 p-sm-4">
        <div>
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
            
        </div>
        <h3 class="text-center">New Subjects</h3>
         
        <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
            <div class="col-md-6">
                <label for ="ddlClass">Class</label>
                <asp:DropDownList ID="ddl" runat="server" CssClass="form-control"></asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfv" runat="server" ErrorMessage="Class is Required." ControlToValidate="ddl" 
                    Display="Dynamic" ForeColor="Red" InitialValue="Select Class" SetFocusOnError="True"> </asp:RequiredFieldValidator>
            </div>

        <div class="col-md-6">
            <label for ="txtSubjects">Subjects</label>
            <asp:TextBox ID="txtsbjcts" runat="server" CssClass="form-control" placeholder="Enter Subjects" required> </asp:TextBox>
        </div>
      </div>

        <div class="row mb-3 mr-lg-5 ml-lg-5">
            <div class="col-mid-3 col-mid-offset-2 mb-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#213448" Text="Add Subject" OnClick="btnAdd_Click"/>
            </div>
        </div>
       
        <div class="row mb-3 mr-lg-5 ml-lg-5">
                <div class="col-md-8">
                    <asp:GridView ID="gv1" runat="server" CssClass="table table-hover table-bordered" EmptyDataText="No record display" 
                        AutoGenerateColumns="False" AllowPaging="True" PageSize="4" OnPageIndexChanging="gv1_PageIndexChanging" DataKeyNames="SubId"
                        OnRowCancelingEdit="gv1_RowCancelingEdit" OnRowEditing="gv1_RowEditing" 
                        OnRowUpdating="gv1_RowUpdating" Width="766px" HeaderStyle-CssClass="gv-header">
                        <Columns>
                            <asp:BoundField DataField="Sr.No" HeaderText="Sr.No" ReadOnly="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlClassName" runat="server" DataSourceID="SqlDataSource1" DataTextField="Classname" DataValueField="ClassId" SelectedValue='<%# Eval("ClassId") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SchoolDB %>" SelectCommand="SELECT * FROM [Class]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Classname") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subjects">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtSubjects" runat="server" Text='<%# Eval("SubName") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblsubs" runat="server" Text='<%# Eval("SubName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="false" HeaderText="Operation" ShowEditButton="True">
                            <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField> 
                        </Columns>
                  </asp:GridView>
            </div>
        </div>
    </div>
</div>
</asp:Content>
