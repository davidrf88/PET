using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PET.Visitante
{
    public partial class Busqueda : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            List<string> strl = new List<string>(){"unaaa","asa","aasa","asasa"};
            Repeater.DataSource = strl;
            Repeater.DataBind();

        }
    }
}