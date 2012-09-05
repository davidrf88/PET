using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using BLL;
namespace PET.Account
{
    public partial class Register : System.Web.UI.Page
    {
        BUsuario busuario = new BUsuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {

           bool exito = busuario.EnviarConfirmacion(RegisterUser.UserName,1,"","");
           if (!exito)
           { 
           
           
           }


            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/";
            }
            Response.Redirect(continueUrl);
        }

        protected void RegisterUser_CreatingUser(object sender, LoginCancelEventArgs e)
        {
           var c = ProfileBase.Properties;

            
           

          

           
         
            
        }

    }
}
