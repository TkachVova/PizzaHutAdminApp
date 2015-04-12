<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="PizzaHutAdminApp.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <div class="content-wrapper main-content clear-fix">
    <h2>Orders</h2>
    <asp:EntityDataSource ID="OrdersDataSource1" runat="server" ConnectionString="name=PizzaHutDbEntities" DefaultContainerName="PizzaHutDbEntities" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="orders">
    </asp:EntityDataSource>
    
    <asp:GridView ID="OrdersGridView1" runat="server" DataSourceID="OrdersDataSource1" AutoGenerateColumns="False" DataKeyNames="id" AllowPaging="True" AllowSorting="True"
        OnRowCommand="OrdersGridView1RowCommand" SelectedRowStyle-BackColor="LightGray" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <Columns>
            <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id"></asp:BoundField>
            <asp:CheckBoxField DataField="processing" HeaderText="Order Completed " SortExpression="processing"></asp:CheckBoxField>
            <asp:BoundField DataField="customerId" HeaderText=" Customer Id " SortExpression="customerId" ReadOnly="True"></asp:BoundField>
            <asp:TemplateField HeaderText=" Order price" SortExpression="fullprice">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("fullprice") %>' ID="TextBox1"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("fullprice") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="deliveryAddress" SortExpression="deliveryAddress">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("deliveryAddress") %>' ID="TextBox2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("deliveryAddress") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="orderTime" SortExpression="orderTime">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("orderTime") %>' ID="TextBox3"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("orderTime") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>


            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="ChangeOrderStatus" runat="server"
                        CommandName="ChangeOrderStatus"
                        CommandArgument='<%# Eval("id") %>'
                        Text="Change order status" />
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

    <asp:EntityDataSource ID="OrderDetails" runat="server" ConnectionString="name=PizzaHutDbEntities" DefaultContainerName="PizzaHutDbEntities" EnableFlattening="False" 
      EntitySetName="orders" Select="it.[id], it.[fullprice], it.[deliveryAddress]" Where="it.[id]=@id">
        <WhereParameters>
            <asp:ControlParameter ControlID="OrdersGridView1"
                Name="id" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <h2>Orders details (to see press select in Orders grit) </h2>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="OrderDetails" AutoGenerateRows="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></EditRowStyle>
        <Fields>
            <asp:BoundField DataField="id" HeaderText="Order id" ReadOnly="True" SortExpression="id"></asp:BoundField>
            <asp:BoundField DataField="fullprice" HeaderText="Order price" ReadOnly="True" SortExpression="fullprice"></asp:BoundField>
            <asp:BoundField DataField="deliveryAddress" HeaderText="Delivery address" ReadOnly="True" SortExpression="deliveryAddress"></asp:BoundField>
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>
    </asp:DetailsView>
    <asp:EntityDataSource ID="CustomerDataSource1" runat="server" ConnectionString="name=PizzaHutDbEntities" DefaultContainerName="PizzaHutDbEntities" 
        EnableFlattening="False" EntitySetName="customers" Where="it.[id]=@customerId">
        <WhereParameters>
            <asp:ControlParameter ControlID="OrdersGridView1"
                Name="customerId" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:DetailsView ID="DetailsView2" runat="server" Height="50px" Width="200px" DataSourceID="CustomerDataSource1" AutoGenerateRows="False" DataKeyNames="id" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <EditRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></EditRowStyle>
        <Fields>
            <asp:BoundField DataField="name" HeaderText="Customer's name" SortExpression="name"></asp:BoundField>
            <asp:BoundField DataField="phone" HeaderText="Customer's phone" SortExpression="phone"></asp:BoundField>
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>
    </asp:DetailsView>
    <asp:EntityDataSource ID="PizzasInCartDataSource1" runat="server" ConnectionString="name=PizzaHutDbEntities" DefaultContainerName="PizzaHutDbEntities" EnableFlattening="False"
        CommandText="SELECT DISTINCT p.name, p.price, ci.quantity 
                     FROM cartItems AS ci 
                     INNER JOIN pizzas AS p 
                     ON p.id = ci.pizzaId
                     WHERE ci.orderId = @id" >
        <CommandParameters>
            <asp:ControlParameter ControlID="OrdersGridView1"
                Name="id" PropertyName="SelectedValue"
                Type="Int32" />
        </CommandParameters>
    </asp:EntityDataSource>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="PizzasInCartDataSource1" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="Pizza name" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="quantity" HeaderText="Pizza quantity" ReadOnly="True"></asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="Price" ReadOnly="True"></asp:BoundField>
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

