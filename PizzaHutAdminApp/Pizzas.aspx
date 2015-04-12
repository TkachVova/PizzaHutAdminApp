<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Pizzas.aspx.cs" Inherits="PizzaHutAdminApp.Pizzas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <div class="content-wrapper main-content clear-fix">
    <h2>Pizza List</h2>
    <asp:EntityDataSource ID="PizzasDataSource1" runat="server" ConnectionString="name=PizzaHutDbEntities" DefaultContainerName="PizzaHutDbEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="pizzas">

    </asp:EntityDataSource>
    <asp:GridView ID="PizzasGridView1" runat="server" DataSourceID="PizzasDataSource1" AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True" AllowSorting="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True"></asp:CommandField>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id"></asp:BoundField>
            <asp:TemplateField HeaderText="name" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("name") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("name") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ingridients" SortExpression="ingridients">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("ingridients") %>' ID="TextBox2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("ingridients") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="price" SortExpression="price">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("price") %>' ID="TextBox3"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("price") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
    </asp:GridView>

    </div>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
