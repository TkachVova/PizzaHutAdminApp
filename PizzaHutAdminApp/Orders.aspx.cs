using PizzaHutAdminApp.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PizzaHutAdminApp
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void OrdersGridView1RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName != "ChangeOrderStatus") return;
            int id = Convert.ToInt32(e.CommandArgument);

            var repo = new PizzaHutDbEntities();
            var order = repo.orders.FirstOrDefault(p => p.id == id);
            if (order.processing == true)
            {
                order.processing = false;
            }
            else
            {
                order.processing = true;
            }
            repo.SaveChanges();
            Response.Redirect(Request.RawUrl); 
        }
    }
}