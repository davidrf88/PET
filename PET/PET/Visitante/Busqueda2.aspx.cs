using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace PET.Visitante
{
    public partial class Busqueda2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            List<string> strl = new List<string>() { "dog.jpg", "dog2.jpg", "dog3.jpg", "dog.jpg" };
            Repeater.DataSource = strl;
            Repeater.DataBind();
        }
    }
}