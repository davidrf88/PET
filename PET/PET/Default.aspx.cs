using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Web.Profile;


namespace PET
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            PETEntities pe = new PETEntities();
          Username.Text =  pe.Usuarios.Select(x => x).First().aspnet_Users.UserName;
          
           
           
        }
    }
}
