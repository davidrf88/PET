using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Web.Security;

namespace PET.Account
{
    public partial class Login : System.Web.UI.Page
    {
        BUsuario busuario = new BUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        }

        protected void LoginUser_LoggedIn(object sender, EventArgs e)
        {
            try
            {
                busuario.ValidarEntrada(LoginUser.UserName);
            }
            catch (Exception ex)
            {
                FormsAuthentication.SignOut();
              //Mostrar el error de la exception
            }
            
        }

     
    }
}
