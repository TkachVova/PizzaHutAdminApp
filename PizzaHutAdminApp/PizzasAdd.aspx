<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PizzasAdd.aspx.cs" Inherits="PizzaHutAdminApp.PizzasAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
   <div class="content-wrapper main-content clear-fix">
    <h2>Add new pizzas</h2>
    <asp:EntityDataSource ID="PizzasEntityDataSource" runat="server" ConnectionString="name=PizzaHutDbEntities" DefaultContainerName="PizzaHutDbEntities" EnableFlattening="False" EnableInsert="True" EntitySetName="pizzas">

    </asp:EntityDataSource>
    
       <asp:DetailsView ID="PizzasDetailsView" runat="server" Height="50px" Width="125px" DataSourceID="PizzasEntityDataSource" DataKeyNames="id" AutoGenerateRows="False"
           DefaultMode="Insert">
           <Fields>
               <asp:BoundField DataField="name" HeaderText="name" SortExpression="name"></asp:BoundField>
               <asp:BoundField DataField="ingridients" HeaderText="ingridients" SortExpression="ingridients"></asp:BoundField>
               <asp:BoundField DataField="price" HeaderText="price" SortExpression="price"></asp:BoundField>
               <asp:CommandField ShowInsertButton="True"></asp:CommandField>
           </Fields>
       </asp:DetailsView>
   </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
