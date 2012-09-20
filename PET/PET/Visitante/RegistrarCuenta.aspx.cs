using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Configuration;
using System.Data.SqlClient;

namespace PET.Visitante
{
    public partial class RegistrarCuenta : System.Web.UI.Page
    {
        public BUsuario busuario = new BUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void BRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                busuario.CrearUsuario(txtUsuario.Text, txtCorreo.Text, txtPassword.Text,true);
                HDDPassword.Value = txtPassword.Text;
                LError.Text = "";
                IError.Visible = false;
                PComenzar.Visible = false;
                PFinalizar.Visible = false;
                PConfirmar.Visible = true;
                LUsuario.Text = txtUsuario.Text.Trim();
                LCorreo.Text = txtCorreo.Text.Trim();
            }
            catch (Exception ex)
            {
                IError.Visible = true;
                if (ex.Message.StartsWith("MENSAJEERROR"))
                { LError.Text = ex.Message.Replace("MENSAJEERROR", ""); }
                else
                { LError.Text = "Ha ocurrido un error inesperado!" ; }
            }
        }

        protected void BCancelar_Click(object sender, EventArgs e)
        {

            PComenzar.Visible = true;
            PConfirmar.Visible = false;
            LUsuario.Text = "";
            LCorreo.Text = "";
            LErrorVerdadero.Text = "";
        }

        protected void BRegistrarVerdadero_Click(object sender, EventArgs e)
        {
            if (HDDCaptcha.Value != "1")
            { LErrorVerdadero.Text = "Vuelve a intentar!"; return; }

            try
            {
                busuario.CrearUsuario(txtUsuario.Text, txtCorreo.Text, HDDPassword.Value.ToString(), false);
                LError.Text = "";
                PComenzar.Visible = false;
                PConfirmar.Visible = false;
                PFinalizar.Visible = true;
                LUsuario.Text = txtUsuario.Text.Trim();
                LCorreo.Text = txtCorreo.Text.Trim();
            }
            catch (Exception ex)
            {
                if (ex.Message.StartsWith("MENSAJEERROR"))
                { LErrorVerdadero.Text = ex.Message.Replace("MENSAJEERROR", ""); }
                else
                { LErrorVerdadero.Text = "Ha ocurrido un error inesperado!"; }
            }


        }

       
       
      

       

       
    }
}